# Load necessary libraries
library(quantmod)
library(forecast)
library(lubridate)
library(tseries)

# Fetch Apple stock data for the last 5 years
getSymbols("AAPL", src = "yahoo", from = "2019-01-01", to = "2024-01-01")

# view data 
View(AAPL)

# Extract the closing prices
applestock <- Cl(AAPL)

# Ensure the data is a numeric vector
appleprices <- as.numeric(applestock)

# Convert to a time series object
myts <- ts(appleprices, start = decimal_date(ymd("2019-01-01")), frequency = 365.25)

# Plotting the closing prices
plot(myts, xlab ="Date", ylab ="Closing Price", main ="Apple Stock Closing Prices", col.main ="orange")

# Time Series Decomposition
decomposed <- stl(myts, s.window = "periodic")
plot(decomposed)

# ACF and PACF plots
par(mfrow = c(2, 1))
acf(myts, main = "ACF of Apple Stock Closing Prices")
pacf(myts, main = "PACF of Apple Stock Closing Prices")
par(mfrow = c(1, 1))

# Histogram of the closing prices
hist(appleprices, breaks = 50, main = "Histogram of Apple Stock Closing Prices", xlab = "Price", col = "blue")

# Fit an ARIMA model
model <- auto.arima(myts)
summary(model)

# ACF and PACF of residuals
acf(model$residuals, main = "ACF of Residuals")
pacf(model$residuals, main = "PACF of Residuals")

# Histogram of residuals
hist(model$residuals, col = "red", xlab = "Residuals", main = "Histogram of Residuals", freq = FALSE)
lines(density(model$residuals))

# Forecasting the next 12 months
forecasted <- forecast(model, h = 365)
plot(forecasted, xlab = "Date", ylab = "Closing Price", main = "Apple Stock Price Forecast", col.main = "darkgreen")



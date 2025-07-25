# 📈 Apple Stock Price Forecasting

This project performs time series analysis and ARIMA forecasting on Apple Inc. (AAPL) stock prices using R. The data is sourced directly from Yahoo Finance.

---

## 🔧 Tools Used

<p align="left">
  <a href="https://www.r-project.org/" target="_blank" rel="noreferrer">
    <img src="https://img.icons8.com/color/512/r-project.png" alt="R" width="40" height="40"/>
  </a>
</p>

---

## ✅ Project Workflow

- 📥 **Data Collection**: Fetch historical stock prices of Apple (AAPL) using the `quantmod` package.
- 📊 **Time Series Analysis**: Convert closing prices into a time series object and decompose the components.
- 🔍 **Modeling**: Apply ARIMA model using `auto.arima()` to fit the data.
- 🔮 **Forecasting**: Predict future stock prices and visualize forecasts.

---

## 📦 Requirements

Make sure you have R installed, then run the following to install required packages:

```r
install.packages(c("quantmod", "forecast", "tseries", "lubridate"))



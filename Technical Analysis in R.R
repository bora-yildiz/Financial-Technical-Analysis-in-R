
library(rvest)
library(pbapply)
library(TTR)
library(dygraphs)
library(lubridate)
library(tidyquant)
library(timetk)

getSymbols("TKNSA.IS",src="yahoo",from="2020-01-01", to="2021-03-15")%>%get() # from google finance 
DF <- TKNSA.IS
tail(DF)

#Technical Analysis
chartSeries(to.daily(DF, theme = "black"))
chartSeries(to.hourly(DF, theme = "black"))
addMACD() 
addBBands() 
addRSI()
addVolatility()
zoomChart("last 3 months")

# 4 week
chartSeries(DF, subset="last 4 weeks", type="candles")
addMACD()
addRSI()

# 4 week
chartSeries(DF, subset="last 8 weeks", type="candles")
addMACD()
addRSI()

# 4 week
chartSeries(DF, subset="last 12 weeks", type="candles")
addMACD()
addRSI()

# 4 week
chartSeries(DF)
chartSeries(DF,TA=c(addVo(),addBBands()))
chartSeries(DF,TA=c(addVo(),addBBands(),addRSI()))

#Checking Time Series
candleChart(to.hourly(DF),up.col='green',dn.col='red')
candleChart(to.minutes30(DF),up.col='green',dn.col='red')
candleChart(to.hourly(DF),up.col='green',dn.col='red')
candleChart(to.daily(DF),up.col='green',dn.col='red')
candleChart(to.weekly(DF),up.col='green',dn.col='red')
candleChart(to.monthly(DF),up.col='green',dn.col='red')
candleChart(to.yearly(DF),up.col='green',dn.col='red')
# Add multi-coloring and change background to white 
candleChart(DF,multi.col=TRUE,theme="white")



#Technical Analysis of the currency ratios
getSymbols("TRY/USD",src="oanda") 
chartSeries(TRYUSD,name="Platinum (.oz) in TRY$USD") 

getSymbols("TRY/EUR",src="oanda") 
chartSeries(TRYEUR,name="Platinum (.oz) in TRY/EUR") 


getSymbols("EUR/USD",src="oanda") 
chartSeries(EURUSD,name="Platinum (.oz) in EUR$USD") 

?chartSeries()




require(quantmod)
getSymbols("ISGYO.IS", src="yahoo")
chartSeries(DF, subset="last 20 weeks", type="candles")
addMACD()

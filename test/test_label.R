library(WindR)
library(WindAdapter)
library(ggplot2)
library(xts)
library(MyUtils)
library(dplyr)
library(MyPlot)

a = w.getWsd("000300.SH","pe_ttm",use.name = T)["2012::"]
b = w.getWsd("000905.SH", "pe_ttm",use.name = T)["2012::"]

period = "2005::"

digits = 2
date_breaks = waiver()


df.xts = cbind(a,b)

ggplot.xts(cbind(b,b*1.05))


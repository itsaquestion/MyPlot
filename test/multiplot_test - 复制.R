library(WindR)
library(WindAdapter)
library(ggplot2)
library(xts)
library(MyUtils)
library(dplyr)
library(MyPlot)

a = w.getWsd("000001.SH","pe_ttm")
b = w.getPrice("000300.SH")

period = "2005::"

mplot(ggPlotMeanSd(a[period],l3 = T) + ggtitle("БъЬт"),
      ggplot(b[period]))

mplot(a,
      b,
      period = "2000::")


p1 = ggplot(a["2005::"])
p2 = ggplot(b["2005::"])
plots = list(p1, p2)

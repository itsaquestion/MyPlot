library(WindR)
library(WindAdapter)
library(ggplot2)
library(xts)
library(MyUtils)
library(dplyr)

a = w.getPrice("000001.SH")
b = w.getPrice("000300.SH")

mplot(ggplot(a) + gghline(2000),
      ggplot(b))

mplot(a,
      b,
      period = "2000::")





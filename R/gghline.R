library(directlabels)
ggvline = function(x = 0, col = "gray50", ...) {
  geom_vline(xintercept = x, col = col, ...)
}

gghline = function(y = 0, col = "gray50", ...) {
  geom_hline(yintercept = y, col = col, ...)
}

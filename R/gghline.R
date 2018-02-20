library(directlabels)
ggvline = function(x = 0,...){
  geom_vline(xintercept = x,...)
}

gghline = function(y = 0,...){
  geom_hline(yintercept = y,...)
}

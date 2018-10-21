#' @export
mytheme = theme_bw() +
  theme(axis.line.x = element_line(color="black"),axis.line.y = element_line(color="black")) +
  theme(legend.title=element_blank()) +
  theme(legend.position="bottom") +
  theme(plot.margin = unit(c(1,1,0,0), "cm"))

#' @export
mytheme_right = mytheme +
  theme(legend.position="right") +
  theme(plot.margin = unit(c(1,0,0.5,0.5),"cm"))

#' @export
mytheme_none = mytheme + theme(legend.position="none") +
  theme(plot.margin = unit(c(0.5,1,0.5,0.5),"cm"))

#' @export
ggNoLegend = theme(legend.position="none")

makeDfWithParams = function(fun, params, x_points) {
  params = tibble::as.tibble(params)
  df = MyUtils::rowMap(params, function(pp) {
    y_points = do.call(fun, c(list(x = x_points), as.list(pp)))

    p_names = names(params)

    params_str = ""
    if (ncol(pp) > 1) {
      for (i in 1:ncol(pp)) {
        part = paste(p_names[i], pp[i], sep = '=')
        if (i == 1) {
          params_str = part

        } else {
          params_str = paste(params_str, part, sep = ',')
        }
      }
    } else {
      params_str = paste(pp)
    }

    #params_str = glue('${params_str}$')
    data.frame(x = x_points, y = y_points, params = params_str)
  })
  df
}

#' plotFunctions 
#'
#' @param fun function to plot
#' @param params the function params
#' @param n dots
#' @param x range of x
#' @param size line width
#' @param end_spaces make some space for label at the end of lines
#'
#' @return ggplot object
#' @export
#'
#' @examples
#'
#' CRRA = function(x, theta){
#'   if (theta == 1) {
#'     return(log(x))
#'   }
#'   (x ^ (1 - theta) - 1) / (1 - theta)
#' }
#' params = data.frame(theta = c(0, 0.5, 1, 2, 4))
#' plotFunctions(CRRA, params, x = c(0.1, 5), size = 0.6, end_spaces = 0.05) +
#'   ggtitle("CRRA") + ylim(-1, 4) + MyPlot::gghline(0)
#'
plotFunctions = function(fun, params = NULL, n = 101, x = c(1, 5),
                          size = 0.5, end_spaces = 0) {


  x_points = seq(x[1], x[2], length.out = n)


  if (is.null(params)) {
    df = data.frame(x = x_points, y = fun(x_points), params = "")
  } else {
    df = makeDfWithParams(fun, params, x_points)
  }

  ggplot(df, aes(x = x, y = y, group = params, color = params)) +
  #scale_y_continuous(limits = c(min.value - pc.v, max.value + pc.v)) +
  geom_line(size = size) + xlim(c(x[1], x[2] + (x[2] - x[1]) * end_spaces)) +
    geom_dl(aes(label = (params), color = params),
            method = list(dl.trans(x = x + 0.1), "last.qp")) +
    theme_bw() + MyPlot::ggNoLegend +
    theme(panel.border = element_blank(), axis.line = element_line()) +
    theme(plot.margin = unit(c(0.5, 0.5, 0, 0), "cm")) +
    coord_fixed(ratio = 1)

}

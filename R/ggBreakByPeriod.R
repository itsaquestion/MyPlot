#' ggBreakByPeriod
#'
#' @param x
#' @param period
#' @param number
#'
#' @return
#' @export
#'
#' @examples
ggBreakByPeriod = function(x, period = 12, number = 1){
  n = length(x)
  scale_x_discrete(breaks=x[(1:n) %% period == number])
}


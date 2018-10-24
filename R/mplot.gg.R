#' mplot.gg
#'
#' @param use.one.x
#' @param theme
#'
#' @return
#' @export
#'
#' @examples
mplot.gg = function(..., use.one.x = T) {
	# 坐标轴对齐，只有1列
	# ... 参数是ggplot对象
  plots = list(...)
  mplot.list(plots,use.one.x = use.one.x)
}

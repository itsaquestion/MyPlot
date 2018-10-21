#' first.labels
#'
#' @return
#' @export
#' @import directlabels
#' @examples
first.labels = function() {geom_dl(aes(label=variable),method=list("first.polygons"))}

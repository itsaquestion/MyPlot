#' ggXTextAngle
#'
#' @param angle
#' @param hjust
#'
#' @return
#' @export
#'
#' @examples
ggXTextAngle = function(angle=45,hjust = 1){
  theme(axis.text.x = element_text(angle = angle,hjust = hjust))
}


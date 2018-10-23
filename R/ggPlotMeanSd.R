#' ggPlotMeanSd
#'
#' @param df_xts
#' @param l1
#' @param l2
#' @param l3
#' @param mean_col
#' @param mean_size
#' @param sd_col
#'
#' @return
#' @export
#'
#' @examples
ggPlotMeanSd = function(df_xts, l1 = T, l2 = T, l3 = F,
                        mean_col = "black", mean_size = 0.8,
                        sd_col = "grey70") {

  df_mean = mean_cut(df_xts)
  df_sd = sd_cut(df_xts)
  p = ggplot(df_xts) +
        theme(panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank()) +
        gghline(df_mean, col = mean_col, size = mean_size)

  if (l1) {
    p = p + gghline(df_mean + df_sd, sd_col) +
        gghline(df_mean - df_sd, sd_col)
  }

  if (l2) {
    p = p + gghline(df_mean + 2 * df_sd, sd_col) +
        gghline(df_mean - 2 * df_sd, sd_col)
  }

  if (l3) {
    p = p + gghline(df_mean + 3 * df_sd, sd_col) +
        gghline(df_mean - 3 * df_sd, sd_col)
  }
  p
}
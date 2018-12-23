#' ggplot.xts
#'
#' @param df.xts
#' @param digits
#' @param date_breaks
#' @import ggplot2
#' @import directlabels
#' @return
#' @export
#'
#' @examples
ggplot.xts = function(df.xts,
                      digits = 2,
                      date_breaks = waiver(),
                      theme = mytheme_right) {

  df = data.frame(date = index(df.xts), df.xts)

  # 加一列last_value，用于directlabels显示最新值
  df2 = reshape2::melt(df, "date") %>%
    group_by(variable) %>%
    mutate(last_value = round(last(value), digits))

  # 左右留空
  first.date = min(df$date)
  last.date = max(df$date)
  pc.d = round((last.date - first.date) / 20, 0)

  # 上下留空
  max.value = max(df2$value)
  min.value = min(df2$value)
  pc.v = (max.value - min.value) / 20

  p = ggplot(df2, aes(x = date, y = (value), group = variable, color = variable)) +
  #scale_y_continuous(limits = c(min.value - pc.v, max.value + pc.v)) +
      geom_line(size = 0.8) + ylab("") + xlab("") +
      geom_dl(aes(label = last_value, color = variable), method = list(dl.trans(x = x + 0.1), "last.qp"))

  if("POSIXct" %in% class(df2$date)){
    p = p + scale_x_datetime(limits = c(first.date - pc.d, last.date + pc.d), date_breaks = date_breaks)
  }
  if("Date" %in% class(df2$date)){
    p = p + scale_x_date(limits = c(first.date - pc.d, last.date + pc.d), date_breaks = date_breaks)
  }
  p + theme

}

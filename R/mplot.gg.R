# 坐标轴对齐，只有1列
# ... 参数是ggplot对象
mplot.gg = function(..., use.one.x = T, theme = mytheme_right){
  plots = list(...)
  mplot.list(plots,use.one.x = use.one.x,theme = theme)
}

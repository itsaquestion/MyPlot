ggplot.xts = function(df.xts,digits = 2 , date_breaks = waiver()){

  df = data.frame(date=index(df.xts),df.xts)
  df2 = reshape2::melt(df,"date")

  first.date = min(df$date)
  last.date = max(df$date)
  pc.d = round((last.date - first.date)  / 20,0)

  max.value = max(df2$value)
  min.value = min(df2$value)
  pc.v = (max.value - min.value) / 20

  if("POSIXct" %in% class(index(df.xts))){

    #df2$date = (format(df2$date, "%H:%M:%S"))
    p = ggplot(df2,aes(x=date,y=(value),group=variable,color=variable)) +
      scale_x_time(limits = c(first.date - pc.d, last.date + pc.d)) +
      scale_y_continuous(limits = c(min.value - pc.v, max.value + pc.v)) +
      geom_line(size=0.8) + ylab("") + xlab("") +
      geom_text(aes(label=ifelse(date==last(date),round(value,digits),"")),vjust=0.1,hjust=-0.2)
  }else{
    p = ggplot(df2,aes(x=date,y=(value),group=variable,color=variable)) +
      scale_x_date(limits = c(first.date - pc.d, last.date + pc.d), date_breaks=date_breaks) +
      scale_y_continuous(limits = c(min.value - pc.v, max.value + pc.v)) +
      geom_line(size=0.8) + ylab("") + xlab("") +
      geom_text(aes(label=ifelse(date==last(date),round(value,digits),"")),vjust=0.1,hjust=-0.2)
  }

  p + mytheme_right

}

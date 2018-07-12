mplot = function(x,...){
  UseMethod("mplot",x)
}


# mplot�ĺ��Ĳ���
mplot.list = function(plots,use.one.x=F,theme = mytheme_right){
  numPlots = length(plots)

  tmp.plots = NULL


  for(i in 1:numPlots){

    if(use.one.x){
      axisTheme = theme + theme(axis.title.x = element_blank(), axis.text.x = element_blank())
    }else{
      axisTheme = theme
    }

    top.margin = 0.5
    right.margin = 0.5
    bottom.margin = 0.2

    if(plots[[1]]$theme$legend.position == "right"){
      right.margin = 0.1
    }
    if(plots[[1]]$theme$legend.position == "bottom"){
      #bottom.margin = -0.5
    }

    top.theme = axisTheme +
      theme(plot.margin = unit(c(top.margin,right.margin,bottom.margin,bottom.margin), "cm"))

    mid.theme = axisTheme +
      theme(plot.margin = unit(c(0,right.margin,bottom.margin,bottom.margin), "cm"))

    bottom.theme = theme(plot.margin = unit(c(0,right.margin,bottom.margin,bottom.margin), "cm"))

    if(i == 1){
      # top plot
      gp = ggplotGrob(plots[[i]] + top.theme)

    }else if( i!= numPlots ){
      # middles
      gp = ggplotGrob(plots[[i]] + mid.theme)

    }else{
      # bottom one
      gp = ggplotGrob(plots[[i]] + bottom.theme)
    }


    if( i == 1){
      tmp.plots =gp
    }else{
      tmp.plots= rbind(tmp.plots,gp,size="last")
    }
  }

  grid::grid.newpage()
  grid::grid.draw(tmp.plots)
}


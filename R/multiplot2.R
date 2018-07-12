# 坐标轴对齐，只有1列
# ... 参数是ggplot对象
multiplot2 = function(..., use.one.x = T){
  plots = list(...)
  numPlots = length(plots)

  tmp.plots = NULL

  for(i in 1:numPlots){


    if(use.one.x){

      right.margin = 0.5
      bottom.margin = 0.2
      if(plots[[1]]$theme$legend.position == "right"){
        right.margin = 0.1
      }
      if(plots[[1]]$theme$legend.position == "bottom"){
        #bottom.margin = -0.5
      }

      if(i == 1){
        gp = ggplotGrob(plots[[i]] + #ggtitle(titles[i]) +
                          theme(axis.title.x = element_blank(), axis.text.x = element_blank()) +
                          theme(plot.margin = unit(c(0.5,right.margin,bottom.margin,0.2), "cm")))

      }else if( i!= numPlots ){
        gp = ggplotGrob(plots[[i]] + #ggtitle(titles[i]) +
                          theme(axis.title.x = element_blank(), axis.text.x = element_blank()) +
                          theme(plot.margin = unit(c(0,right.margin,bottom.margin,0.2), "cm")))

      }else{
        gp = ggplotGrob(plots[[i]] + #ggtitle(titles[i]) +
                          theme(plot.margin = unit(c(0,right.margin,bottom.margin,0.2), "cm")))
      }
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

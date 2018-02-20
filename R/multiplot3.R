multiplot3 = function(..., period = "::",theme = mytheme_right, titles = NULL,
                      use.one.x = T){
  data.list = list(...)


  for(i in 1:length(data.list)){
    data.list[[i]] = (data.list[[i]])[period]
  }

  # find out the fatest start date and lastest end date
  start.date = Inf
  end.date = -Inf

  for(i in 1:length(data.list)){
    tmp.sd = first(index(data.list[[i]]))
    if(tmp.sd < start.date){start.date = tmp.sd}

    tmp.ed = last(index(data.list[[i]]))
    if(tmp.ed > end.date){end.date = tmp.ed}
  }

  # make starts and ends the same
  for(i in 1:length(data.list)){
    tmp.sd = first(index(data.list[[i]]))
    if(tmp.sd > start.date){
      tmp.data = xts(t(rep(NA,ncol(data.list[[i]]))),order.by = start.date)
      names(tmp.data) = names(data.list[[i]])
      data.list[[i]] = rbind(tmp.data,data.list[[i]])
    }

    tmp.ed = last(index(data.list[[i]]))
    if(tmp.ed < end.date){
      tmp.data = xts(t(rep(NA,ncol(data.list[[i]]))),order.by = end.date)
      names(tmp.data) = names(data.list[[i]])
      data.list[[i]] = rbind(data.list[[i]],tmp.data)
    }

  }

  # add theme and titles
  i = 1
  plots = lapply(data.list, function(data){
    ret = ggplot(data[period]) + theme
    if(!is.null(titles)){
      if(!is.na(titles[i])){
        #print("asdf")
        ret = ret + ggtitle(titles[i])
      }
    }
    i <<- i + 1
    ret
  })

  # do draw
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


mplot = multiplot3

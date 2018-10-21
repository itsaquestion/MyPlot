#' plotACF
#'
#' @param y
#' @param lag.max
#' @param breaks
#'
#' @return
#' @export
#'
#' @examples
plotACF = function(y,lag.max = 20, breaks = 1){
  ggplot_acf = function(x){
    df = data.frame(lag = x$lag,acf = x$acf)

    ylab.string = "ACF"
    if(x$type == "partial"){
      ylab.string = "Partial ACF"

      df = rbind(data.frame(lag=0,acf=0),df)

    }else{

      df[1,] = data.frame(lag=0,acf=0)
      #df = df[-1,]
    }
    #print(df)
    ggplot(df,mapping=aes(x= lag, y=acf)) +
      geom_bar(stat = "identity", position = "identity") +
      mytheme + ylab(ylab.string) +
      scale_x_continuous(breaks = seq(min(df$lag), max(df$lag), by = breaks)) +
      gghline(0.2,col="blue") + gghline(-0.2,col="blue") +
      theme(panel.grid.minor = element_blank()) + ylim(-1,1)
  }

  multiplot2(ggplot_acf(acf(y, plot=F,lag.max=lag.max)),
             ggplot_acf(pacf(y, plot=F,lag.max=lag.max)))
}

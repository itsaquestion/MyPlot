#' ggplotDF
#'
#' @param df
#' @param x.var
#'
#' @return
#' @export
#' @import reshape2
#'
#' @examples
ggplotDF = function(df, x.var = NULL){
  index.name = "x"
  if(is.null(x.var)){
    ## no x.var, use first col of df
    index.name = names(df)[1]

    df = data.frame(df)

  }else{
    if(is.null(names(x.var))){
      x.var = data.frame(x = x.var)
    }else{
      index.name = names(x.var)
    }

    df = data.frame(x.var,df)
  }
  df.m = reshape2::melt(df,id.var = index.name)
  ggplot(df.m,aes_string(x=index.name ,y = "value",group = "variable",
                         color = "variable"))
}

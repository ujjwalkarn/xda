Plot<-function(df,dep.var,range=1:4){
  
  if(max(range) > 7) { stop("Please provide a lower range")}
  cols<-df[, !names(df) %in% dep.var] 
  n=floor(max(range)/2)
  
  par(mfrow=c(n,2))
  
    
  for (i in 1:(n*2)){
  plot(cols[,i],df[[dep.var]],xlab=names(cols[i]),ylab=dep.var)
  }
}
  
# Test
# Plot(iris,'Species')
# Plot(mtcars,'mpg')
# 
# Plot(mtcars,'mpg',1:7)
# 
# Plot(mtcars,'mpg',1:6)
# Plot(mtcars,'mpg',1:8)

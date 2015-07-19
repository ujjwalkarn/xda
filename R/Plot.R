#'Plots all variables of a data frame against the specified dependant variable  
#'@param df name of the data frame
#'@param dep.var name the dependant variable
#'@param range specify which variables to plot using numeric range (default is 'all' which plots all variables) 
#'@return returns multiple plots
#'@examples
#'data(iris)
#'Plot(iris,'Species')
#'@export

Plot<-function(df,dep.var,range='all'){
  
  if(!dep.var %in% names(df)) stop("Dependant Variable not in dataset")
                          
  cols<-df[, !names(df) %in% dep.var] 
  n <- ncol(cols)
  
  if (!(class(range) %in% c("integer","numeric")) && range!='all'){stop("Please provide 'all' or numeric range")}
    
  if (class(range) %in% c("integer","numeric")){
    if(min(range) < 1) { stop("Please provide a minimum value of range as 1")}
    if(length(range) > n) { stop("Please provide correct range")}}
  
    
  if (range[1]=='all'){
    n4 <- ifelse(n%%4==0,floor(n/4),floor(n/4)+1)
    for (k in 1:n4){
      par(mfrow=c(2,2))
      for (i in ((k-1)*4+1):(4*k)){
        if (i<=n) plot(cols[,i],df[[dep.var]],xlab=names(cols[i]),ylab=dep.var)
       }
      mtext(bquote("Figure Number"== ~ .(k)), outer=TRUE, line=-3)
    }}
  else{
    l=length(range)
    l4 <- ifelse(l%%4==0,floor(l/4),floor(l/4)+1)
    for (k in 1:l4){
      par(mfrow=c(2,2))
      for (i in (range[1]+(k-1)*4):(range[4]+(k-1)*4)){
        if (i<=n && i<=range[length(range)]) plot(cols[,i],df[[dep.var]],xlab=names(cols[i]),ylab=dep.var)
      }
      mtext(bquote("Figure Number"== ~ .(k)), outer=TRUE, line=-3)
    }}   
  }

# Test
# Plot(iris,'Species')
# Plot(mtcars,'mpg')
# 
# Plot(mtcars,'mpg',1:7)
# 
# Plot(mtcars,'mpg',1:6)
# Plot(mtcars,'mpg',1:8)



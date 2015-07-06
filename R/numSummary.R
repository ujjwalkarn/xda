#'Automatically detects numeric variables and gives a comprehensive summary 
#'@param df- name of your data frame
#'@return Returns the summary data frame
#'@examples
#'data(iris)
#'numSummary(iris)
#'@export
numSummary<-function(df){
  num=c()
  char=c()
  for (var in 1:ncol(df)) {if (class(df[,var])=="numeric") {num  <- c(num,names(df[var]))
  } else if (class(df[,var])=="factor" || class(df[,var])=="character") {char  <- c(char,names(df[var]))
  }}
  
  dfnum<-subset(df,select=num)
  dfchar<-subset(df,select=char)
  
  D <- sapply(dfnum, function(x) as.numeric(x,na.rm=TRUE))
  DD<-as.data.frame(D)
  
  options(digits = 3)
  n<-as.data.frame(sapply(DD, function(x) sum(!is.na(x)) ))
  mean<-as.data.frame(sapply(DD, function(x) mean(x,na.rm=TRUE) ))
  sd<-as.data.frame(sapply(DD, function(x) sd(x,na.rm=TRUE) ))
  median<-as.data.frame(sapply(DD, function(x) median(x,na.rm=TRUE)))
  max<-as.data.frame(sapply(DD, function(x) max(x,na.rm=TRUE)))
  min<-as.data.frame(sapply(DD, function(x) min(x,na.rm=TRUE)))
  
  d2<-as.data.frame(cbind(n,mean,sd,median,max,min))
  colnames(d2)<-c("n","mean","sd","median","max","min")
  
  
  
  #mode computation
  Mode <- function(x) {
    ux <- unique(x)
    ux[which.max(tabulate(match(x, ux)))]
  }
  mode<-sapply(dfnum, function(x) Mode(x) )
  mode<-as.data.frame(mode)
  
  n1<-nrow(dfnum)
  c1<-ncol(dfnum)
  numb<-rep(n1,c1)
  numb<-data.frame(numb)
  
  #missing value computation
  miss<-sapply(dfnum, function(x) sum(is.na(x)) )
  miss<-as.data.frame(miss)
  d3<-cbind(d2,mode,miss)
  missPer<-(miss/n1)*100
  d3<-cbind(d3,missPer)
  colnames(d3)[ncol(d3)]<-"miss%"
  
  #percentile value computation
  q<-sapply(DD, function(x) quantile(x, c(.01,.05,.25,.5,.75,.90,.95, .99),na.rm=TRUE) )
  q<-as.data.frame(q)
  q<-t(q)
  d3<-cbind(d3,q)
  
  
  return(d3)
}
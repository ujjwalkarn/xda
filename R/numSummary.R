#'Automatically detects numeric variables and gives a comprehensive summary 
#'@param df name of your data frame
#'@return Returns the summary data frame
#'@examples
#'data(iris)
#'numSummary(iris)
#'@export

numSummary <- function(df){
  
  num       <- vector(mode = "character")
  char      <- vector(mode = "character")
  for (var in 1:ncol(df)) {
    if (class(df[[var]])=="numeric" || class(df[[var]])=="integer") {
      num   <- c(num,names(df[var]))
    }else if (class(df[[var]])=="factor" || class(df[[var]])=="character") {
      char  <- c(char,names(df[var]))
    }
  }
  
  dfnum     <- subset(df,select=num)
  D         <- sapply(dfnum, function(x) as.numeric(x,na.rm=TRUE))
  DD        <- as.data.frame(D)
  
  #kurtosis computation
  kurtosis <- function(x,na.rm = TRUE){
    if(na.rm){
      x     <- x[which(!is.na(x))]
    }
    x_mean  <- mean(x)
    x_count <- length(x)
    s2      <- sum((x-x_mean)^2)
    s4      <- sum((x-x_mean)^4)
    m2      <- s2/x_count
    m4      <- s4/x_count
    res     <- ((m4 / m2^2 - 3) + 3) * (1 - 1 / x_count)^2 - 3
  }
  
  #skewness calculation
  skewness <- function(x,na.rm = TRUE){
    if(na.rm){
      x     <- x[which(!is.na(x))]
    }
    x_mean  <- mean(x)
    x_count <- length(x)
    s2      <- sum((x-x_mean)^2)
    s3      <- sum((x-x_mean)^3)
    m2      <- s2/x_count
    m3      <- s3/x_count
    res     <- (m3 / m2^(3.0/2)) * (1 - 1 / x_count)^(3.0/2)
  }
  
  options(digits = 3)
  n                   <- sapply(DD, function(x) sum(!is.na(x)))
  mean                <- sapply(DD, function(x) mean(x,na.rm=TRUE))
  sd                  <- sapply(DD, function(x) sd(x,na.rm=TRUE))
  max                 <- sapply(DD, function(x) max(x,na.rm=TRUE))
  min                 <- sapply(DD, function(x) min(x,na.rm=TRUE))
  range               <- max - min
  nzero               <- sapply(DD, function(x) length(which(x == 0)))
  nunique             <- sapply(DD, function(x) length(unique(x)))
  outliersummary      <- t(sapply(DD, function(x) {
                                                        iqr          <- IQR(x,na.rm = TRUE,type = 4)
                                                        lowerbound   <- quantile(x,0.25,na.rm=TRUE)-(1.5*iqr)
                                                        upperbound   <- quantile(x,0.75,na.rm=TRUE)+(1.5*iqr)
                                                        noofoutliers <- length  (which(x > upperbound | x <lowerbound))
                                                        return(c(iqr,lowerbound,upperbound,noofoutliers))
                                                      }))
  kurtosis_val        <- sapply(DD, function(x) kurtosis(x))
  skewness_val        <- sapply(DD, function(x) skewness(x))
  d2                  <- cbind.data.frame(n,mean,sd,max,min,range,nunique,nzero,outliersummary,kurtosis_val,skewness_val)
  colnames(d2)        <- c("n","mean","sd","max","min","range","nunique","nzeros","iqr","lowerbound","upperbound","noutlier","kurtosis","skewness")
  
  #mode computation
  Mode <- function(x) {
    ux      <- unique(x)
    ux[which.max(tabulate(match(x, ux)))]
  }
  mode      <- sapply(dfnum, function(x) Mode(x) )
  mode      <- as.data.frame(mode)
  
  n1        <- nrow(dfnum)
  c1        <- ncol(dfnum)
  numb      <- rep(n1,c1)
  numb      <- data.frame(numb)
  
  #missing value computation
  miss      <- sapply(dfnum, function(x) sum(is.na(x)) )
  miss      <- as.data.frame(miss)
  d3        <- cbind(d2,mode,miss)
  missPer   <- (miss/n1)*100
  d3        <- cbind(d3,missPer)
  colnames(d3)[ncol(d3)] <- "miss%"
  
  #percentile value computation
  q         <- sapply(DD, function(x) quantile(x, c(.01,.05,.25,.5,.75,.95, .99),na.rm=TRUE) )

  q         <- as.data.frame(q)
  q         <- t(q)
  d3        <- cbind(d3,q)
  
  return(d3)
}

bivariate <- function(df,dep.var,indep.var,n.bins=4,na.rm=TRUE){
  
  c.dep.var   <- dep.var
  c.indep.var <- indep.var
  cols        <- which(!c(c.dep.var,c.indep.var) %in% names(df))
  
  if(length(cols)){
    stop(paste0(paste0(names(df)[cols],collapse=",")," column(s) not present"))
  }
  
  df        <- df[,c(c.dep.var,c.indep.var)]
  
  class_var <- sapply(X = c(c.dep.var,c.indep.var),
                      FUN = function(x){class(df[[x]])})
  
  if((class_var[[1]] %in% c("integer","numeric")) & 
       (class_var[[2]] %in% c("integer","numeric"))){
    
    n.bins             <- min(n.bins,
                              length(na.omit(unique(df[[c.indep.var]]))))
    n.newvar           <- cut(x      = df[[c.indep.var]],
                              breaks = n.bins)
    df.result          <- data.frame(levels(n.newvar),sapply(X   = c("min","max","mean"),
                                                             FUN = function(x){sprintf(fmt = "%.02f",
                                                                                       tapply(X    = df[[c.dep.var]],
                                                                                              INDEX = n.newvar, 
                                                                                              FUN   = x, 
                                                                                              na.rm = na.rm))}))
    
    
    colnames(df.result) <- c(paste0("bin_",c.indep.var),
                            sapply(X   = c("min","max","mean"),
                                   FUN = function(x){paste0(x,"_",c.dep.var)}))
    
    return(df.result)
  }else if((class_var[[1]] %in% c("factor","character")) &
             (class_var[[2]] %in% c("factor","character"))){
    
    df.result          <- NULL
    c.indep.level      <- unique(df[[c.indep.var]])
    c.dep.level        <- unique(df[[c.dep.var]])
    
    for(tempi in c.indep.level){
      temp <- tempi
      for(tempj in c.dep.level){
        count <- length(which(df[[c.indep.var]] == tempi & df[[c.dep.var]] == tempj))
        temp  <- cbind(temp,count)
      }
      df.result<-rbind.data.frame(df.result,temp)
    }
    
    colnames(df.result) <- c(c.indep.var,as.character(c.dep.level))
    
    return(df.result)
  }else if((class_var[[1]] %in% c("factor","character")) & 
             (class_var[[2]] %in% c("integer","numeric"))){
    n.bins             <- min(n.bins,
                              length(na.omit(unique(df[[c.indep.var]]))))
    
    df[,'bin']         <- cut(x =     df[[c.indep.var]],
                              breaks = n.bins)
    df.result          <- NULL
    c.indep.level      <- unique(df[['bin']])
    c.dep.level        <- unique(df[[c.dep.var]])
    
    for(tempi in c.indep.level){
      temp      <- tempi
      for(tempj in c.dep.level){
        count   <- length(which(df[['bin']] == tempi & df[[c.dep.var]] == tempj))
        temp    <- cbind(temp,count)
      }
      df.result <- rbind.data.frame(df.result,temp)
    }
    
    colnames(df.result) <- c(paste0("bin_",c.indep.var),as.character(c.dep.level))
    
    return(df.result)
  }else if((class_var[[1]] %in% c("integer","numeric")) &
             (class_var[[2]] %in% c("factor","character"))){
    
    n.newvar            <- df[[c.indep.var]]
    df.result           <- data.frame(unique(n.newvar),sapply(X = c("min","max","mean"),
                                                              FUN = function(x){sprintf(fmt="%.02f",
                                                                                        tapply(X     = df[[c.dep.var]],
                                                                                               INDEX = n.newvar, 
                                                                                               FUN   = x, 
                                                                                               na.rm = na.rm))}))
    colnames(df.result) <- c(c.indep.var,
                             sapply(X   = c("min","max","mean"),
                                    FUN = function(x){paste0(x,"_",c.dep.var)}))
    return(df.result)
  }
  
}

# #sample data
# test<-data.frame(a=sample(x = 1:100,
#                              size = 25,
#                              replace = TRUE),
#                     b=sample(x = 10:20,
#                              size=25,
#                              replace = TRUE))
# 
# test2<-data.frame(b=sample(x = c('north','south'),
#                           size = 25,
#                           replace = TRUE),
#                  a=sample(x = c('food/drug','supercenter','supermarket','superstore','supercombo'),
#                           size=25,
#                           replace = TRUE))
# 
# bivariate(df=test,dep.var='b',
#           indep.var='a',
#           n.bins=4,
#           na.rm=TRUE)
# 
# bivariate(df=test2,dep.var='b',
#                  indep.var='a',
#                  n.bins=4,
#                  na.rm=TRUE)
# 
# bivariate(df=iris,
#           dep.var='Species',
#           indep.var='Petal.Width',
#           n.bins=3,
#           na.rm=TRUE)
# 
# bivariate(df=mtcars,
#           dep.var='mpg',
#           indep.var='hp',
#           na.rm=TRUE)

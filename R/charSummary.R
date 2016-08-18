#'Automatically detects character/factor variables and gives a comprehensive summary 
#'@param df name of your data frame
#'@return Returns the summary data frame
#'@examples
#'data(iris)
#'charSummary(iris)
#'@export

charSummary <- function(df){
  
  num        <- vector(mode = "character")
  char       <- vector(mode = "character")
  for (var in 1:ncol(df)) {
    if (class(df[[var]]) == "numeric") {
      num    <- c(num, names(df[var]))
    }else if (class(df[[var]]) == "factor" || class(df[[var]]) == "character") {
      char   <- c(char, names(df[var]))
    }
  }
  
  if (length(char)!=0){
    dfchar   <- subset(df, select=char)
    E        <- sapply(dfchar, function(x) as.character(x))
    EE       <- as.data.frame(E)
    n        <- as.data.frame(sapply(EE, function(x) sum(!is.na(x))))
    n        <- data.frame(n)
    colnames(n) <- "n"
    
    n1       <- nrow(df)

    #missing value computation
    miss     <- sapply(EE, function(x) sum(is.na(x)))
    miss     <- as.data.frame(miss)
    g3       <- cbind(n, miss)
    perc     <- (miss/n1)*100
    m3       <- cbind(g3, perc)
    colnames(m3)[ncol(m3)] <- "miss%"
    
    #top-5 level count
    topfivelevel <- function(x){
     tbl_x             <- table(x)
     topfive           <- sort(tbl_x, decreasing = TRUE)[1:ifelse(length(tbl_x) >= 5, yes = 5, no = length(tbl_x))]
     topfivelevelcount <- paste0(names(topfive), ":", topfive)
    }
    
    unique     <- sapply(EE, function(x) length(unique(x)))
    unique_val <- sapply(EE, function(x) paste0(topfivelevel(x), collapse = ", "))
    m4         <- cbind.data.frame(m3, unique, "top5levels:count" = unique_val)
    
    return(m4)
  }
}

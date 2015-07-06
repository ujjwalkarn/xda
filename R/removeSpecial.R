#'Replaces special characters in your data frame to NA
#'@param df- name of your data frame
#'@param vec- vector containing the special characters you want to replace with NA
#'@return Returns the modified data frame
#'@examples
#'data(iris)
#'iris[1,2]<-"?"
#'iris[2,2]<-"@@"
#'iris[3,2]<-"???"
#'iris<-removeSpecial(iris,c("@@","???"))
#'head(iris)  
#'@export
removeSpecial<-function(df,vec){
  df[ df == "NaN" ] = NA
  df[ df == "<NA>" ] = NA
  df[ df == "?" ] = NA
  df[ df == "@" ] = NA
  df[ df== "" ] = NA
  df[ df == " " ] = NA
  df[ df == "N/A" ] = NA
  for (i in 1:length(vec)){df[ df == vec[i] ] = 
                           NA}
  return(df)
}




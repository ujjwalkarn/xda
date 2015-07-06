# xda
R package for exploratory data analysis

This package contains several functions to perform initial analysis on any data frame. 

-`r numSummary(mydata)` function automatically detects all numeric columns in the data frame `r mydata` provides summary statistics for all numeric columns
-`r charSummary(mydata)` function automatically detects all character columns in the data frame `r mydata` provides summary statistics for all numeric columns
-`r removeSpecial()` replaces all special characters from the data frame `r mydata` 

To install the package, `r devtools` package needs to be installed first. To install `r devtools`, please follow instructions [here](https://github.com/hadley/devtools).

Then, use the following commands to install `r xda`:

```
library(devtools)
install_github("ujwlkarn/xda")
```

Test whether the package was successfully installed:

```
library(xda)
numSummary(iris)
charSummary(iris)
```

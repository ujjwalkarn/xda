# xda
R package for exploratory data analysis
---------------------------------------

This package contains several functions to perform initial analysis on any dataframe. 

- `numSummary(mydata)` function automatically detects all numeric columns in the dataframe `mydata` and provides summary statistics for all numeric columns
- `charSummary(mydata)` function automatically detects all character columns in the dataframe `mydata` and provides summary statistics for all numeric columns
- `removeSpecial()` replaces all special characters in the dataframe `mydata` with `NA` 

More functions to be added soon.

To install the `xda` package, `devtools` package needs to be installed first. To install `devtools`, please follow instructions [here](https://github.com/hadley/devtools).

Then, use the following commands to install `xda`:

```
library(devtools)
install_github("ujwlkarn/xda")
```

Test whether the `xda` package was successfully installed:
```
library(xda)
numSummary(iris)
charSummary(iris)
```

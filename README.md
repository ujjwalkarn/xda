# xda
R package for exploratory data analysis
---------------------------------------

This package contains several functions to perform initial analysis on any dataframe. 

- `numSummary(mydata)` function automatically detects all numeric columns in the dataframe `mydata` and provides their summary statistics 
- `charSummary(mydata)` function automatically detects all character columns in the dataframe `mydata` and provides their summary statistics 
- `removeSpecial(mydata)` replaces all special characters in the dataframe `mydata` with `NA` 

More functions to be added soon.

Installation
------------
To install the `xda` package, `devtools` package needs to be installed first. To install `devtools`, please follow instructions [here](https://github.com/hadley/devtools).

Then, use the following commands to install `xda`:

```s
library(devtools)
install_github("ujwlkarn/xda")
```

Usage
-----
```s
library(xda)

#to view a comprehensive summary for all numeric columns in the iris dataset
numSummary(iris)

#to view a comprehensive summary for all character columns in the iris dataset
charSummary(iris)
```
Please refer to the documentation of each function to understand how to use it. 
For example, to see the documenation for the `numSummary()` function, use `?numSummary`.


# xda
R package for exploratory data analysis
---------------------------------------
This package contains several tools to perform exploratory analysis on any input dataset. It includes custom functions for plotting the data as well as performing different kinds of analyses such as univariate, bivariate and multivariate investigation which is the first step of any predictive modeling pipeline. The package is constantly under development and more functionalities will be added soon.

The functions currently included in the package are mentioned below:

- `numSummary(mydata)` function automatically detects all numeric columns in the dataframe `mydata` and provides their summary statistics 
- `charSummary(mydata)` function automatically detects all character columns in the dataframe `mydata` and provides their summary statistics 
- `Plot(mydata, dep.var)` plots all independent variables in the dataframe `mydata` against the dependant variable specified by the `dep.var` parameter 
- `removeSpecial(mydata, vec)` replaces all special characters (specified by vector `vec`) in the dataframe `mydata` with `NA` 
- `bivariate(mydata, dep.var, indep.var)` performs bivariate analysis between dependent variable `dep.var` and independent variable `indep.var` in the dataframe `mydata`

More functions to be added soon.

Installation
------------
To install the `xda` package, `devtools` package needs to be installed first. To install `devtools`, please follow instructions [here](https://github.com/hadley/devtools).

Then, use the following commands to install `xda`:

```s
library(devtools)
install_github("ujjwalkarn/xda")
```

Usage
-----
```s
library(xda)

#to view a comprehensive summary for all numeric columns in the iris dataset
numSummary(iris)
#n= total number of rows for that variable
#miss = number of rows with missing value
#miss% = percentage of total rows with missing values ((n*100)/miss)
#%5 = 5th percentile value, etc.
```
![numSummary(iris) Output](/images/numSummary.png?raw=true)

```s
#to view a comprehensive summary for all character columns in the iris dataset
charSummary(iris)
```
![ncharSummary(iris) Output](/images/charSummary.png?raw=true)


```s
#to perform bivariate analysis between 'Species` and `Sepal.Length` in the iris dataset
bivariate(iris,'Species','Sepal.Length')
```
![bivariate(iris,'Species','Sepal.Length') Output](/images/bivariate.png?raw=true)

```s
# to plot all other variables against the 'Petal.Length' variable in the iris dataset
Plot(iris,'Petal.Length')
```
![Plot(iris,'Petal.Length') Output](/images/Plot1.png?raw=true)
![Plot(iris,'Petal.Length') Output](/images/Plot2.png?raw=true)


Please refer to the documentation of each function to understand how to use it. 
For example, to see the documenation for the `numSummary()` function, use `?numSummary`.


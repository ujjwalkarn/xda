# xda
R package for exploratory data analysis
---------------------------------------
This package contains several tools to perform initial exploratory analysis on any input dataset. It includes custom functions for plotting the data as well as performing different kinds of analyses such as univariate, bivariate and multivariate investigation which is the first step of any predictive modeling pipeline. This package can be used to get a good sense of any dataset before jumping on to building predictive models.

The package is constantly under development and more functionalities will be added soon. Pull requests to add more functions are welcome!

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
For all examples below, the [popular iris dataset](https://en.wikipedia.org/wiki/Iris_flower_data_set) has been used. The data set consists of 50 samples from each of three species of Iris (Iris setosa, Iris virginica and Iris versicolor).

```s
library(xda)

## to view a comprehensive summary for all numeric columns in the iris dataset

numSummary(iris)

## n = total number of rows for that variable
## miss = number of rows with missing value
## miss% = percentage of total rows with missing values ((miss/n)*100)
## 5% = 5th percentile value of that variable (value below which 5 percent of the observations may be found)
## the percentile values are helpful in detecting outliers
```
![numSummary(iris) Output](/images/numSummary.png?raw=true)

```s
## to view a comprehensive summary for all character columns in the iris dataset

charSummary(iris)

## n = total number of rows for that variable
## miss = number of rows with missing value
## miss% = percentage of total rows with missing values ((n/miss)*100)
## unique = number of unique levels of that variable
## note that there is only one character column (Species) in the iris dataset
```
![ncharSummary(iris) Output](/images/charSummary.png?raw=true)


```s
## to perform bivariate analysis between 'Species' and 'Sepal.Length' in the iris dataset

bivariate(iris,'Species','Sepal.Length')

## bin_Sepal.Length = 'Sepal.Length' variable has been binned into 4 equal intervals (original range is [4.3,7.9])
## for each interval of 'Sepal.Length', the number of samples from each category of 'Species' is shown 
## i.e. 39 of the 50 samples of Setosa have Sepal.Length is in the range (4.3,5.2], and so on. 
## the number of intervals (4 in this case) can be customized (see documentation)
```
![bivariate(iris,'Species','Sepal.Length') Output](/images/bivariate.png?raw=true)

```s
## to plot all other variables against the 'Petal.Length' variable in the iris dataset

Plot(iris,'Petal.Length')

```
![Plot(iris,'Petal.Length') Output](/images/Plot1.png?raw=true)
![Plot(iris,'Petal.Length') Output](/images/Plot2.png?raw=true)


Please refer to the documentation of each function to understand how to use it. 
For example, to see the documenation for the `numSummary()` function, use `?numSummary`.


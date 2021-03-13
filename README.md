
<!-- README.md is generated from README.Rmd. Please edit that file -->

RSimplerEDA - A Package to Simplify Common Plotting for Exploratory Data Analysis in R
======================================================================================

<!-- badges: start -->

[![R-CMD-check](https://github.com/UBC-MDS/RSimplerEDA/workflows/R-CMD-check/badge.svg)](https://github.com/UBC-MDS/RSimplerEDA/actions)[![codecov](https://codecov.io/gh/UBC-MDS/RSimplerEDA/branch/master/graph/badge.svg?token=VHC4UWQ7CB)](https://codecov.io/gh/UBC-MDS/RSimplerEDA)
<!-- badges: end -->

Overview
--------

Exploratory Data analysis (EDA) is an important step in any data
analysis. However, carrying out EDA with the ggplot2 package requires a
lot of coding effort. Moreover, it assumes a basic knowledge of
functions and grammar of graphics syntax that are appropriate for
visualizing categorical and numerical variables. The RSimplerEDA package
addresses this issue by providing functions that are tailored to produce
categorical, numerical and correlation plots using a single line of
code. Furthermore, the package provides customization capability for the
plots based on specific user needs (theme, title, font, size and etc.).
The users are able to spend more time on analyzing the data set and less
time configuring ggplot plot settings.

Package positioning
-------------------

There are a number of packages that already provide similar
functionality in the R Ecosystem, such as
[DataExplorer](https://www.rdocumentation.org/packages/DataExplorer/versions/0.8.1),
and
[SmartEDA](https://www.rdocumentation.org/packages/SmartEDA/versions/0.3.6).
However, most of them are not easily customizable. Our RSimplerEda
package is light-weighted with focus in 3 common EDA plots and allows
flexibility from plot types, color scheme, to plot titles.

Functions
---------

1.  `corr_map`: Plot a correlation map with the given dataframe object
    and a character vector with numerical features. Users are allowed to
    set multiple arguments regarding the setting of the correlation plot
    including method to calculate the correlation, color schemes, plot
    width, height, and plot title.

2.  `numerical_eda:` This function takes in a data frame object, two
    numeric columns, and produces either a scatter or line plot to
    visualize the relationship between the two numerical features. Users
    can optionally change default arguments for plot-type, color, title,
    size of text, color-scheme, and toggle log transformation for the x
    and y axis.

3.  `categorical_eda:` This function takes in a data frame object and
    one categorical feature, to produce a histogram plot that visualizes
    the distribution of the feature. Users can also choose to plot the
    density graph of the feature by specifying in plot\_type. The
    function also offers customization on color, plot title, font size,
    color-scheme, plot size, opacity level, and facet factor.

Installation
------------

You can install the development version from
[GitHub](https://github.com/) with:

    # install.packages("devtools")
    devtools::install_github("UBC-MDS/RSimplerEDA")

Dependencies
------------

-   ggplot2 &gt;= 3.3.3
-   dplyr &gt;=1.0.3
-   stringr &gt;= 1.4.0
-   tibble &gt;=3.0.4
-   tidyr &gt;= 1.1.2
-   ggthemes &gt;= 4.2.0
-   assertthat &gt;= 0.2.1
-   rlang &gt;= 0.4.10
-   palmerpenguins &gt;= 0.1.0
-   magrittr &gt;= 2.0.1

Example
-------

This is a basic example which shows you how to solve a common problem:

    library(RSimplerEDA)
    ## basic example code

Contributors
------------

### Development Lead

| Contributor Name | GitHub Username                               |
|------------------|-----------------------------------------------|
| Cheuk (Chuck) Ho | [ChuckHo777](https://github.com/ChuckHo777)   |
| Deepak Sidhu     | [deepaksidhu](https://github.com/deepaksidhu) |
| Nicholas Wu      | [nichowu](https://github.com/nichowu)         |

We welcome and recognize all contributions. Please find the guide for
contribution in [Contributing
Document](https://github.com/UBC-MDS/RSimplerEDA/blob/master/.github/CONTRIBUTING.md).

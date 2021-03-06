
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RSimplerEDA - A Package to Simplify Common Plotting for Exploratory Data Analysis in R

<!-- badges: start -->

[![R-CMD-check](https://github.com/UBC-MDS/RSimplerEDA/workflows/R-CMD-check/badge.svg)![codecov](https://codecov.io/gh/UBC-MDS/RSimplerEDA/branch/master/graph/badge.svg?token=VHC4UWQ7CB)](https://github.com/UBC-MDS/RSimplerEDA/actions)

<!-- badges: end -->

## Overview

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

## Package positioning

There are a number of packages that already provide similar
functionality in the R Ecosystem, such as
[DataExplorer](https://www.rdocumentation.org/packages/DataExplorer/versions/0.8.1),
and
[SmartEDA](https://www.rdocumentation.org/packages/SmartEDA/versions/0.3.6).
However, most of them are not easily customizable. Our RSimplerEda
package is light-weighted with focus in 3 common EDA plots and allows
flexibility from plot types, color scheme, to plot titles.

## Functions

1.  `corr_map`: Plot a correlation map with the given dataframe object
    and a character vector with numerical features. Users are allowed to
    set multiple arguments regarding the setting of the correlation plot
    including method to calculate the correlation, color schemes, and
    plot title.

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

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/RSimplerEDA")
```

## Dependencies

  - ggplot2 \>= 3.3.3
  - dplyr \>=1.0.3
  - stringr \>= 1.4.0
  - tibble \>=3.0.4
  - tidyr \>= 1.1.2
  - ggthemes \>= 4.2.0
  - assertthat \>= 0.2.1
  - rlang \>= 0.4.10
  - palmerpenguins \>= 0.1.0
  - magrittr \>= 2.0.1

## Example

These basic examplse which shows you how to use the function:

``` r
library(RSimplerEDA)
library(magrittr)
library(palmerpenguins)
penguins_drop_na <- penguins %>% tidyr::drop_na()
```

### 1\. The Correlation Map

``` r
corr_map(penguins_drop_na,  #Please make sure there is no NA in the given data
         c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"))
```

<img src="man/figures/README-corr_map-1.png" width="100%" />

### 2\. Visualize the Relationship between Numeric Variables

``` r

numerical_eda(penguins, 
              body_mass_g, 
              bill_length_mm, 
              plot_type = "scatter",  # also support Line Plot with "line"
              color = species, 
              title = "Body mass (grams) vs Bill Length (mm)")
```

<img src="man/figures/README-numerical_eda-1.png" width="100%" />

### 3\. Visualize the Distribution of a Categorical Variable

``` r

categorical_eda(penguins, 
                xval = body_mass_g, 
                plot_type = "histogram",  # also support Density Plot with "density"
                color=island, 
                facet_factor = "island", 
                facet_col = 1, 
                title="Distribution of Body Mass of Penguins from Each Island", 
                font_size = 8)
```

<img src="man/figures/README-categorical_eda_histogram-1.png" width="100%" />

## Documentation

Please find the detail documentation in the
[vignette](https://ubc-mds.github.io/RSimplerEDA/articles/RSimplerEDA-vignette.html).

## Contributors

### Development Lead

| Contributor Name | GitHub Username                               |
| ---------------- | --------------------------------------------- |
| Cheuk (Chuck) Ho | [ChuckHo777](https://github.com/ChuckHo777)   |
| Deepak Sidhu     | [deepaksidhu](https://github.com/deepaksidhu) |
| Nicholas Wu      | [nichowu](https://github.com/nichowu)         |

We welcome and recognize all contributions. Please find the guide for
contribution in [Contributing
Document](https://github.com/UBC-MDS/RSimplerEDA/blob/master/.github/CONTRIBUTING.md).

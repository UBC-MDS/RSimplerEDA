% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/corr_map.R
\name{corr_map}
\alias{corr_map}
\title{Title Correlation Map Plotting Function}
\usage{
corr_map(
  data,
  features,
  corr_method = "pearson",
  color_scheme = "RdYlGn",
  title = "Correlation Map"
)
}
\arguments{
\item{data}{A tibble or dataframe}

\item{features}{A character vector. It contains names of numerical features
in string for correlation map plotting. It should contain at least
2 numerical features.}

\item{corr_method}{An optional character variable. The method to calculate
correlation between features. The default is "Pearson",
two other supported methods are "'kendall' and 'spearman'.}

\item{color_scheme}{An optional character variable. The color scheme for
the correlation map. The default is "BrBG". Other diverging color schemes
can be "PiYG", "PRGn", "PuOr", etc.
Other proper diverging color scheme reference can be found in
https://ggplot2.tidyverse.org/reference/scale_brewer.html}

\item{title}{An optional character variable. The title of the correlation
map. The default is "Correlation Map".}
}
\value{
corr_map A ggplot object. The correlation map plot.
}
\description{
Plot a correlation map with the given tibble or dataframe object and
a character vector of numerical features. Users are allowed to set multiple
arguments regarding the setting of the correlation plot including
correlation
method, color schemes, plot width, height, and plot title.
}
\examples{
df <- mtcars
corr_map(df, c('hp', 'disp', 'cyl', 'qsec'))
}

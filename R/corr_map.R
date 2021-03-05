
#' Correlation Map Plotting Function
#'
#' Plot a correlation map with the given tibble or dataframe object and a character vecotr of numerical features.
#' Users are allowed to set multiple arguments regarding the setting of the correlation plot
#' including correlation method, color schemes, plot width, height, and plot title.
#' @param data A tibble or dataframe
#' @param features A character vector. It contains names of numerical features in string for correlation map plotting.
#' It should contain at least 2 numerical features.
#' @param corr_method An optional character variable. The method to calculate correlation between features.
#'The default is "Pearson", two other supported methods are "'kendall' and 'spearman'.
#' @param color_scheme An optional character variable. The color scheme for the correlation map.
#' The default is "BrBG". Other diverging color schemes can be "PiYG", "PRGn", "PuOr", etc.
#' Other proper diverging color scheme reference can be found in https://ggplot2.tidyverse.org/reference/scale_brewer.html
#' @param plot_width An optional integer variable. The width of the plot. The default is 450.
#' @param plot_height An optional integer variable. The height of the plot. The default is 450.
#' @param title A optional character variable. The title of the correlation map. The default is "Correlation Map".
#'
#' @return corr_map A ggplot object. The correlation map plot.
#' @export
#'
#' @import tibble
#' @import dplyr
#' @import tidyr
#' @import ggplot2
#'
#' @examples
#' df <- data(mtcars)
#' corr_map <- corr_map(df, c("Horsepower", "Displacement", "Cylinders", "Acceleration"))
#'
corr_map <- function(data,
                  features,
                  corr_method='pearson',
                  color_scheme='BrBG',
                  plot_width=450,
                  plot_height=450,
                  title="Correlation Map") {
        corr_map
}


#' Correlation Map Plotting Function
#'
#' Plot a correlation map with the given dataframe object and a str vecotr of numerical features.
#' Users are allowed to set multiple arguments regarding the setting of the correlation plot
#' including correlation method, color schemes, plot width, height, and plot title.
#' @param data A tibble.
#' @param features A character vector. It contains names of numerical feature in str for correlation map plotting. It should contain at least 2 features.
#' @param corr_method A character string. The method to calculate correlation between features. The default is "Pearson", two other supported methods are "'kendall' and 'spearman'.
#' @param color_scheme A character string. The method to calculate correlation between features. The default is "Pearson", two other supported methods are "'kendall' and 'spearman'.
#' @param plot_width An integer. The width of the plot
#' @param plot_height An integer. The heiht of the plot
#' @param title A character string. The title of the correlation map
#'
#' @return corr A ggplot object. Tue correlation map plot.
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
                  color_scheme='blueorange',
                  plot_width=450,
                  plot_height=450,
                  title="Correlation Map") {
        corr_map
}

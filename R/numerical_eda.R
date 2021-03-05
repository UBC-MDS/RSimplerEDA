#' Numerical Plotting Function
#'
#' This function takes in a data frame object, two numeric columns,
#' and produces either a scatter or line plot to visualize the relationship
#' between the two numerical features. Users can optionally change default
#' arguments for plot-type, color, title, size of text, color-scheme, and
#' toggle log transformation for the x and y axis.
#'
#' @param data A tibble or data frame object.
#' @param xval A character variable used to represent the x-axis.
#' @param yval A  variable used to represent the y-axis.
#' @param plot_type An optional character variable used to represent
#' the graphical relationship between xval and yval,
#' options are scatter or line plot.
#' @param color An optional character variable used to group the data
#' points in different colors.
#' @param title An optional character variable used to set the title of the plot.
#' @param font_size An optional integer variable used to set the font size.
#' @param color_scheme An optional character variable used to set the color scheme
#' @param plot_height An optional integer variable used to specify plot height
#' @param plot_width An optional integer variable used to specify plot width
#' @param x_transform An optional logical, whether a log transformation occurs
#' on the x-axis.
#' @param y_transform An optional logical, whether a log transformation occurs
#' on the y-axis.
#'
#' @return numerical_plot ggplot2 object
#' @export
#'
#' @import tibble
#' @import dplyr
#' @import tidyr
#' @import ggplot2
#'
#' @examples
#'
#' df <- data(mtcars)
#' numerical_plot <- categorical_eda(
#'   data = df,
#'   xval = "Horsepower",
#'   yval = "Acceleration",
#'   color = "Origin",
#'   title = "Horsepower vs Acceleration",
#'   font_size = 12
#' )
numerical_eda <- function(data,
                          xval = NULL,
                          yval = NULL,
                          plot_type = "scatter",
                          color = NULL,
                          title = NULL,
                          font_size = 10,
                          color_scheme = "Tableau 20",
                          plot_height = 400,
                          plot_width = 300,
                          x_transform = FALSE,
                          y_transform = FALSE) {
  numerical_plot
}

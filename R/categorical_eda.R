#' Categorical variable plotting
#' 
#' This function takes in a dataframe object and one categorical
#' feature, to produce a histogram plot that visualizes the
#' distribution of the feature. User can also choose to plot density
#' graph of the feature by specifying in plot_type. 
#' The function also offers customization on color, plot title, 
#' font size, color-scheme, plot size and other common configurations.
#'
#' @param data A tibble or a dataframe 
#' @param xval A character variable used to represent the x-axis.
#' @param plot_type An optional character variable used to specify plot type. 
#' options include "histogram" and "density".
#' @param color An optional character variable used to set the color variable of
#'  the plot
#' @param title An optional character variable used to set the title of the plot
#' @param font_size An optional integer variable used to set the font size
#' @param color_scheme An optional character variable used to set the color 
#' shceme
#' @param plot_height An optional integer variable used to specify plot height
#' @param plot_width An optional integer variable used to specify plot width
#' @param opacity An optional integer variable used to specify density fill 
#' opacity for the density plot
#' @param facet_factor An optional character variable used to specify facet factor
#' @param facet_col An optional numeric variable used to specify numer of facet 
#' columns
#' 
#' @return A ggplot2 object, either a histogram or a density plot
#' @export 
#' 
#' @import tibble
#' @import dplyr
#' @import tidyr
#' @import ggplot2
#' 
#' @examples 
#' 
#' cars <- data(mtcars)
#' categorical_plot <- categorical_eda(data = cars, 
#'                                     xval = "Origin", 
#'                                     color = "Horsepower", 
#'                                     title = "Histogram of Origin in Different Levells of Horsepower",
#'                                     plot_height = 100,
#'                                     plot_weight = 200,
#'                                     facet_factor = "Origin",
#'                                     facet_col = 2)
#' 
#' 
categorical_eda <- function(data, 
                            xval,
                            plot_type "histogram",
                            color = NULL,
                            title = NULL,
                            font_size = 10,
                            color_scheme = "Tableau 20",
                            plot_height = 150,
                            plot_width = 200,
                            opacity = 0.6,
                            facet_factor = NULL,
                            facet_col = NULL) {
                    
    return (categorical_plot)
}
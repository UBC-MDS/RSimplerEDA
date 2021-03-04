#' Categorical variable plotting
#' 
#' This function takes in a data frame object and one categorical
#' feature, to produce a histogram plot that visualizes the
#' distribution of the feature. User can also choose to plot density
#' graph of the feature by specifing in plot_type. 
#' The function also offers customization on color, plot title, 
#' font size, color-scheme, plot size and other common configurations.
#'
#' @param data A dataframe 
#' @param xval A string variable used to represent the x-axis.
#' @param yval An optional string variable used to represent the y-axis
#' @param plot_type An optional string variable used to specify plot type. 
#' options include "histogram" and "density".
#' @param color An optional string variable used to set the color of the plot
#' @param title An optional string variable used to set the title of the plot
#' @param font_size An optional integer variable used to set the font size
#' @param color_scheme An optional string variable used to set the color shceme
#' @param plot_height An optional integer variable used to specify plot height
#' @param plot_width An optional integer variable used to specify plot width
#' @param opacity An optional integer variable used to specify density fill 
#' opacity for the density plot
#' @param facet An optional string variable used to specify facet factor
#'
#' @return A ggplot2 object
#' @export 
#' 
#' @examples 
#' 
#' df <- data(mtcars)
#' categorical_plot <- categorical_eda(data = df, 
#'                                     xval = "Origin", 
#'                                     color = "Horsepower", 
#'                                     title = "Histogram of Origin in Different Levells of Horsepower",
#'                                     plot_height = 100,
#'                                     plot_weight = 200,
#'                                     facet = "Country")
#' 
#' 
categorical_eda <- function(data, 
                            xval = NULL,
                            yval = NULL,
                            plot_type "histogram",
                            color = NULL,
                            title = NULL,
                            font_size = 10,
                            color_scheme = "Tableau 20",
                            plot_height = 150,
                            plot_width = 200,
                            opacity = 0.6,
                            facet = NULL) {
    
}
#' Title Correlation Map Plotting Function
#'
#' Plot a correlation map with the given tibble or dataframe object and
#' a character vector of numerical features. Users are allowed to set multiple
#' arguments regarding the setting of the correlation plot including correlation
#' method, color schemes, plot width, height, and plot title.
#' @param data A tibble or dataframe
#' @param features A character vector. It contains names of numerical features
#' in string for correlation map plotting. It should contain at least
#' 2 numerical features.
#' @param corr_method An optional character variable. The method to calculate
#' correlation between features. The default is "Pearson",
#' two other supported methods are "'kendall' and 'spearman'.
#' @param color_scheme An optional character variable. The color scheme for
#' the correlation map. The default is "BrBG". Other diverging color schemes
#' can be "PiYG", "PRGn", "PuOr", etc.
#' Other proper diverging color scheme reference can be found in
#' https://ggplot2.tidyverse.org/reference/scale_brewer.html
#' @param plot_width An optional integer variable. The width of the plot.
#' The default is 450.
#' @param plot_height An optional integer variable. The height of the plot.
#' The default is 450.
#' @param title An optional character variable. The title of the correlation map.
#' The default is "Correlation Map".
#'
#' @return corr_map A ggplot object. The correlation map plot.
#'
#' @export
#'
#'
#' @examples
#' df <- data(mtcars)
#' corr_map <- corr_map(df, c('hp', 'disp', 'cyl', 'qsec'))
#'
corr_map <- function(data,
                  features,
                  corr_method='pearson',
                  color_scheme='RdYlGn',
                  plot_width=450,
                  plot_height=450,
                  title="Correlation Map") {

    # Subset the dataframe with selected numeric features and drop NA
    df <- data[features]
    df <- tidyr::drop_na(df)

    # Test the dataframe input on whether it's a dataframe or tibble
    if (!is.data.frame(data) | tibble::is_tibble(data))
        stop("The input `data` should either be a dataframe or tibble")

    # Test the input 'features' is a vector of characters
    if (!is.character(features) | !is.vector(features)) {
        stop("The value of the argument `features` should be a vector of characters")
    }

    # Test the input 'features' has at least 2 elements
    if (length(features) < 2) {
        stop("There should be at least 2 features in the `features` vector")
    }

    # Test if the columns in features exist in the dataframe.
    # if (!all(features %in% colnames(data))) {
    #     stop("The given numeric features should exist in the data")
    # }

    # Test if corr_method one of the 3 supported methods - 'pearson', 'kendall', 'spearman'.
    if (!corr_method %in% c("pearson", "kendall", "spearman'")) {
        stop("The correlation method should be 'pearson', 'kendall',
            or 'spearman'.")
    }

    # Test the input `color_scheme` is character type
    if (!is.character(color_scheme)) {
        stop("The color scheme should be given as a char")
    }

    # Test the input `plot_width` is integer type
    if (!is.numeric(plot_width)) {
        stop("The plot_width should be given as numericloa")
    }

    # Test the input `plot_height` is integer type
    if (!is.numeric(plot_height)) {
        stop("The plot_height should be given as numeric")
    }


    # Test the input `title` is character type
    if (!is.character(title)) {
        stop("The title should be given as a char")
    }





    # Test colums to check if columns provided are numeric
    if (!all(sapply(df, is.numeric)))
        stop("All `features` should be numeric")



    # Calculate the correlation with the specified method
    corr_cal <- round(stats::cor(df, method = corr_method),2)

    # Convert it into tidy data format for plotting
    corr_df <- data.frame(corr_cal) %>%
        rownames_to_column(var ="x") %>%
        tidyr::pivot_longer(!x, names_to = "y", values_to = "corr")

    # Set the size of the plot --Trial
    options(repr.plot.width = 20, repr.plot.height = 20)

    # Plot the correlation heatmap
    corr_map <- ggplot2::ggplot(data = corr_df,
                                ggplot2::aes(x = x, y = y, fill = corr)) +
                ggplot2::geom_tile(alpha=0.7) +
                labs(x = "",
                     y = "",
                     fill = "Correlation",
                     title = title) +
                scale_fill_distiller(palette = color_scheme,
                                     direction = 1,
                                     limits = c(-1,1)) +
                theme(panel.grid.major = element_blank(),
                      panel.grid.minor = element_blank(),
                      plot.title = element_text(size=18,
                                                face="bold",
                                                margin = margin(10, 0, 10, 0)),
                      text =  element_text(size = 14))
    corr_map
}

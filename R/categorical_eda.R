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
#' @param xval A variable used to represent the x-axis.
#' @param plot_type An optional character variable used to specify plot type.
#' Options include "histogram" and "density".
#' @param color A character variable used to set the color variable of
#'  the plot
#' @param title An optional character variable used to set
#' the title of the plot
#' @param font_size An optional integer variable used to set the font size
#' @param color_scheme An optional character variable used to set the color
#' shceme
#' @param opacity An optional integer variable used to specify density fill
#' opacity for the density plot
#' @param facet_factor An optional character variable used to
#' specify facet factor
#' @param facet_col An optional numeric variable used to specify
#' number of facet
#' columns
#'
#' @return A ggplot2 object, either a histogram or a density plot
#' @export
#'
#' @import tibble
#' @import dplyr
#' @import tidyr
#' @import ggplot2
#' @import palmerpenguins
#'
#' @examples
#' library(palmerpenguins)
#'
#' categorical_plot <- categorical_eda(
#'   data = penguins,
#'   xval = body_mass_g,
#'   color = island,
#'   title = "Histogram of Body Mass in Different Sex",
#'   facet_factor = "island",
#'   facet_col = 1
#' )
categorical_eda <- function(data,
                            xval,
                            plot_type = "histogram",
                            color = NULL,
                            title = NULL,
                            font_size = 10,
                            color_scheme = "Tableau 20",
                            opacity = 0.6,
                            facet_factor = NULL,
                            facet_col = NULL) {
  quoted_xval <- rlang::enquo(xval)
  quoted_color <- rlang::enquo(color)

  if (!is.data.frame(data)) {
    stop("Input Data is not a data frame")
  }

  if (!(rlang::as_label(quoted_xval) %in% colnames(data))) {
    stop("xval must be a column of the input data")
  }

  if (!is.element(plot_type, c("histogram", "density"))) {
    stop("plot_type should be either histogram or density")
  }

  if (opacity > 1 || opacity < 0) {
    stop("opacity must be in range (0, 1)")
  }

  if (!(rlang::as_label(quoted_color) %in% colnames(data))) {
    stop("color must be a feature of the input data")
  }


  if (!is.null(facet_factor)) {
    if (plot_type == "histogram") {
      categorical_plot <- ggplot2::ggplot(data, ggplot2::aes(x = {{ xval }}, fill = {{ color }})) +
        ggplot2::geom_histogram(stat = "count") +
        ggplot2::ggtitle(title) +
        ggplot2::theme(text = ggplot2::element_text(size = font_size)) +
        ggplot2::facet_wrap(data[[facet_factor]], ncol = facet_col) +
        ggplot2::scale_fill_brewer(palette = "Dark2")
    } else {
      categorical_plot <- ggplot2::ggplot(data, ggplot2::aes(x = {{ xval }}, fill = {{ color }})) +
        ggplot2::geom_density(alpha = opacity) +
        ggplot2::ggtitle(title) +
        ggplot2::theme(text = ggplot2::element_text(size = font_size)) +
        ggplot2::facet_wrap(data[[facet_factor]], ncol = facet_col) +
        ggplot2::scale_fill_brewer(palette = "Dark2")
    }
  }
  else {
    if (plot_type == "histogram") {
      categorical_plot <- ggplot2::ggplot(data, ggplot2::aes(x = {{ xval }}, fill = {{ color }})) +
        ggplot2::geom_histogram(stat = "count") +
        ggplot2::ggtitle(title) +
        ggplot2::theme(text = ggplot2::element_text(size = font_size)) +
        ggplot2::scale_fill_brewer(palette = "Dark2")
    } else {
      categorical_plot <- ggplot2::ggplot(data, ggplot2::aes(x = {{ xval }}, fill = {{ color }})) +
        ggplot2::geom_density(alpha = opacity) +
        ggplot2::ggtitle(title) +
        ggplot2::theme(text = ggplot2::element_text(size = font_size)) +
        ggplot2::scale_fill_brewer(palette = "Dark2")
    }
  }
  return(categorical_plot)
}

#' Numerical Plotting Function
#'
#' This function takes in a tibble or dataframe object, two numeric columns,
#' and produces either a scatter or line plot to visualize the relationship
#' between the two numerical features. Users can optionally change default
#' arguments for plot-type, color, title, size of text, color-scheme, and
#' toggle log transformation for the x and y axis.
#'
#' @param data A tibble or data frame object.
#' @param xval A numeric variable used to represent the x-axis.
#' @param yval A numeric variable used to represent the y-axis.
#' @param color A character variable used to group the data
#' points in different colors.
#' @param title An optional character variable used to set the title and axis.
#' @param plot_type An optional character variable used to represent
#' the graphical relationship between xval and yval,
#' options are "scatter" or "line" plot.
#' @param font_size An optional integer variable used to set the font size.
#' @param color_scheme An optional character variable used to set the color
#' scheme
#' @param x_transform An optional logical, whether a log transformation occurs
#' on the x-axis.
#' @param y_transform An optional logical, whether a log transformation occurs
#' on the y-axis.
#'
#' @return numerical_plot A ggplot2 object. The numerical plot.
#' @export
#'
#' @import tibble
#' @import dplyr
#' @import tidyr
#' @import ggplot2
#' @import stringr
#' @import ggthemes
#' @importFrom assertthat is.string
#' @import rlang
#'
#' @examples
#'
#' df <- iris
#' numerical_plot <- numerical_eda(
#'   data = df,
#'   xval = Petal.Length,
#'   yval = Petal.Width,
#'   color = Species,
#'   title = "Petal.Length vs Petal.Width",
#'   font_size = 12
#' )
numerical_eda <- function(data,
                          xval,
                          yval,
                          color,
                          title = NULL,
                          plot_type = "scatter",
                          font_size = 10,
                          color_scheme = "Tableau 10",
                          x_transform = FALSE,
                          y_transform = FALSE) {
  # Creating a copy of data to prevent in any kind of overwriting
  df <- data
  # quoting column name to be checked in if
  quoted_col <- rlang::enquo(color)
  quoted_xval <- rlang::enquo(xval)
  quoted_yval <- rlang::enquo(yval)


  # Title is not specified give specific title
  if (is.null(title)) {
    title <- paste(as_label(quoted_xval), "vs", as_label(quoted_yval), plot_type, "plot")
  }

  # Defensive programming checks

  # Check the input dataframe is a dataframe
  if (!is.data.frame(df)) {
    stop("The value of the argument 'dataframe' should be of type  'data.frame' or 'tibble'.")
  }

  # Check if xval is in the dataframe
  if (!(rlang::as_label(quoted_xval) %in% colnames(df))) {
    stop("Column xval is not in the dataframe")
  }

  # Check if yval is in the dataframe
  if (!(rlang::as_label(quoted_yval) %in% colnames(df))) {
    stop("Column yval is not in the dataframe")
  }

  # Check if color is in the dataframe
  if (!(rlang::as_label(quoted_col) %in% colnames(df))) {
    stop("Column color is not in the dataframe")
  }

  # Check if color is a character variable
  if (!is.factor(data %>% pull({{ color }}))) {
    stop("Please specify a column categorical factor for color")
  }

  # Check if xval is a numeric variable
  if (!is.numeric(data %>% pull({{ xval }}))) {
    stop("Please specify a numerical column for xval")
  }

  # Check if yval is a numeric variable
  if (!is.numeric(data %>% pull({{ yval }}))) {
    stop("Please specify a numerical column for yval")
  }

  # Check if title is string
  if (!assertthat::is.string(title)) {
    stop("Column title must be a string")
  }

  # Check if plot_type is string
  if (!assertthat::is.string(plot_type)) {
    stop("plot_type input must be a string, either 'line' or 'scatter'")
  }

  # Check if x_transform is boolean
  if (!is.logical(x_transform)) {
    stop("Column x_transform must be a logical")
  }

  # Check if y_transform is boolean
  if (!is.logical(y_transform)) {
    stop("Column y_transform must be a logical")
  }

  # Check plot_type must either be either 'scatter' or 'line'
  if (!(plot_type %in% c("scatter", "line"))) {
    stop(" plot_type must either be either 'scatter' or 'line'")
  }

    # check it font_size input is an integer
  if (!is.double(font_size)) {
    stop("font_size input must be a single positive integer")
  }

  # Check if color_scheme is string
  if (!assertthat::is.string(color_scheme)) {
    stop("Input color_scheme must be a string")
  }

  # Log transformation of X and Y axis
  if (x_transform == TRUE) {
    if ((sum(df %>% dplyr::pull({{ xval }}) < 0)) > 0) {
      stop("Can't take log of negative xval values")
    }
    else {
      xval <- log(df %>% dplyr::pull({{ xval }}))
    }
  }

  if (y_transform == TRUE) {
    if ((sum(df %>% dplyr::pull({{ yval }}) < 0)) > 0) {
      stop("Can't take log of negative yval values")
    }

    else {
      yval <- log(df %>% dplyr::pull({{ yval }}))
    }
  }

  # function code plot_type either "scatter" or "line"
  if (plot_type == "scatter") {
    ggplot2::ggplot(data) +
      aes(
        x = {{ xval }},
        y = {{ yval }},
        color = {{ color }},
      ) +
      ggplot2::geom_point() +
      labs(title = title, x = quoted_xval, y = quoted_yval, color = quoted_col) +
      ggthemes::scale_color_tableau(palette = color_scheme) +
      theme(text = element_text(size = font_size))
  } else {
    ggplot2::ggplot(data) +
      aes(
        x = {{ xval }},
        y = {{ yval }},
        color = {{ color }},
      ) +
      ggplot2::geom_line() +
      labs(title = title, x = quoted_xval, y = quoted_yval, color = quoted_col) +
      ggthemes::scale_color_tableau(palette = color_scheme) +
      theme(text = element_text(size = font_size))
  }
}

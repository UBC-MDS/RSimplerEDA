library(palmerpenguins)

categorial_plot_histogram_facet <- categorical_eda(
  penguins,
  xval = body_mass_g,
  color = island,
  facet_factor = "island",
  facet_col = 1
)
categorial_plot_histogram <- categorical_eda(
    penguins,
    xval = body_mass_g,
    color = island,
)
categorial_plot_density_facet <- categorical_eda(
    penguins,
    xval = body_mass_g,
    plot_type="density",
    color = island,
    facet_factor = "island",
    facet_col = 1
)
categorial_plot_density <- categorical_eda(
    penguins,
    xval = body_mass_g,
    plot_type="density",
    color = island
)

#' Tests the categorical_eda function when plotting facetted histogram
#'
#' @return None. the function will not throw an error
#' if the tests fail.
#'
#' @examples
#' test_histogram_plot_facet()
test_histogram_plot_facet <- function() {
  test_that("Plot should use geom_histogram and map body_mass_g to x-axis,
          and island to fill, and plot is facetted", {
              expect_true("GeomBar" %in% c(class(categorial_plot_histogram_facet$layers[[1]]$geom)))
              expect_true("body_mass_g" == rlang::get_expr(categorial_plot_histogram_facet$mapping$x))
              expect_true("island" == rlang::get_expr(categorial_plot_histogram_facet$mapping$fill))
              expect_true("FacetWrap" %in% class(rlang::get_expr(categorial_plot_histogram_facet$facet)))
  })
}

test_histogram_plot_facet()

#' Tests the categorical_eda function when plotting histogram without facetting
#'
#' @return None. the function will not throw an error
#' if the tests fail.
#'
#' @examples
#' test_histogram_plot()
test_histogram_plot <- function() {
  test_that("Plot should use geom_histogram and map body_mass_g to x-axis,
          and island to fill", {
            expect_true("GeomBar" %in% c(class(categorial_plot_histogram$layers[[1]]$geom)))
            expect_true("body_mass_g" == rlang::get_expr(categorial_plot_histogram$mapping$x))
            expect_true("island" == rlang::get_expr(categorial_plot_histogram$mapping$fill))
          })
}

test_histogram_plot()

#' Tests the categorical_eda function when plotting facetted density plot
#'
#' @return None. the function will not throw an error
#' if the tests fail.
#'
#' @examples
#' test_density_plot_facet()
test_density_plot_facet <- function(){
    test_that("Plot should use geom_density and map body_mass_g to x-axis,
          and island to fill, and plot is facetted", {
              expect_true("GeomDensity" %in% c(class(categorial_plot_density_facet$layers[[1]]$geom)))
              expect_true("body_mass_g" == rlang::get_expr(categorial_plot_density_facet$mapping$x))
              expect_true("island" == rlang::get_expr(categorial_plot_density_facet$mapping$fill))
              expect_true("density" == rlang::get_expr(categorial_plot_density_facet$labels$y))
              expect_true("FacetWrap" %in% class(rlang::get_expr(categorial_plot_density_facet$facet)))
          })
}
test_density_plot_facet()


#' Tests the categorical_eda function when plotting density plot without facetting
#'
#' @return None. the function will not throw an error
#' if the tests fail.
#'
#' @examples
#' test_density_plot()
test_density_plot <- function() {
  test_that("Plot should use geom_histogram and map body_mass_g to x-axis,
          and island to fill", {
            expect_true("GeomDensity" %in% c(class(categorial_plot_density$layers[[1]]$geom)))
            expect_true("body_mass_g" == rlang::get_expr(categorial_plot_density$mapping$x))
            expect_true("island" == rlang::get_expr(categorial_plot_density$mapping$fill))
            expect_true("density" == rlang::get_expr(categorial_plot_density$labels$y))
          })
}

test_density_plot()


#' Tests the exception handling in categorical_eda function
#'
#' @return None. the function will not throw an error
#' if the tests fail.
#'
#' @examples
#' test_exceptions()
test_exceptions <- function(){
  test_that("Function should throw an error", {
    expect_error(categorical_eda(c(penguins), xval = body_mass_g, color = island, facet_factor = "island", facet_col = 1))
    expect_error(categorical_eda(penguins, xval = body_type, color = island, facet_factor = "island", facet_col = 1))
    expect_error(categorical_eda(penguins, xval = body_mass_g, plot_type="line", color = island))
    expect_error(categorical_eda(penguins, xval = body_mass_g, plot_type="density", color = island, opacity=6))
    expect_error(categorical_eda(penguins, xval = body_mass_g, color = food, facet_factor = "island", facet_col = 1))
    }
    )
}

test_exceptions()

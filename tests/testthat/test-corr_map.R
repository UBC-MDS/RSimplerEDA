#' Tests the corr map function output
#'
#' @return None.
#' the function shouldn't prompt error
#' @examples
#' test_corr_map()
test_corr_map <- function() {
    # set test data for testing
    test_data <- mtcars
    features <- c('hp', 'disp', 'cyl', 'qsec')
    c_map <- corr_map(test_data, features, title = "Correlation Map")

    # Test the plot type is correct.
    test_that("The output plot object should be a ggplot object.", {
        expect_true(is.ggplot(c_map))
    })
    # Test the plot type is correct.
    test_that("The plot should be GeomTile.", {
        expect_true("GeomTile" %in% c(class(c_map$layers[[1]]$geom)))
        expect_true("Geom" %in% c(class(c_map$layers[[1]]$geom)))
    })
    # Tests the plot uses the features x, y, corr in the subset dataframe as x-axis, y-axis and fill respectively.
    test_that('Plot should map x, y and corr columns to x-axis, y-axis and fill respectively.', {
        expect_true('x'  == rlang::get_expr(c_map$mapping$x))
        expect_true('y' == rlang::get_expr(c_map$mapping$y))
        expect_true('corr' == rlang::get_expr(c_map$mapping$fill))
    })
    # Tests the plot uses use the right color and title.
    test_that('The title and color scheme should be same as input.', {
        expect_null(rlang::get_expr(c_map$colour))
        expect_true("Correlation Map" == rlang::get_expr(c_map$labels$title))
    })
}

test_corr_map()



#' Tests if proper error message is prompted for exception handling.
#'
#' @return None.
#' the function shouldn't prompt error
#' @examples
#' test_corr_map_error_msg()
test_corr_map_error_msg <- function() {
    # set test data for testing
    test_data <- mtcars
    features <- c('hp', 'disp', 'cyl', 'qsec')
    str_data <- test_data %>% dplyr::mutate(cyl = as.character(cyl))

    # Tests on error msg for data not being dataframe or tibble
    test_that("Show right error for data not being dataframe or tibble.", {
        expect_error(corr_map("test", features))
        expect_error(corr_map(123, features))
        expect_error(corr_map(list(mtcars), features))

    })

    # Test on error msg for given `features` not being a char vector
    test_that(
        "Show right error for given feature not being a char vector.", {
            expect_error(corr_map(test_data, c(TRUE, 3)))
            expect_error(corr_map(test_data, c("ab", 3)))
            expect_error(corr_map(test_data, 3))
        })

    # Test on error msg for given `features` has at at least 2 elements
    test_that(
        "Show right error for given feature has less than 2 elements.", {
            expect_error(corr_map(test_data, c('hp')))
        })

    # Test on error msg for not given the right correlation calculation method.
    test_that(
        "Show right error when correlation method is not one one of the 3 supported methods - 'pearson', 'kendall', 'spearman'", {
            expect_error(corr_map(test_data, features, corr_method = "abc"))
            expect_error(corr_map(test_data, features, corr_method = 123))
        })

    # Test on error msg for the feature/column in given `features` is not numeric
    test_that(
        "Show right error for 1 or more given features is not numeric", {
            expect_error(corr_map(str_data, features))
        })

    # Tests on error msg for given `color_scheme` argument that is not inputted as a char
    test_that("Show right error if inputted color_scheme is not as a char.", {
        expect_error(corr_map(test_data, features, color_scheme = list("test_color")))
        expect_error(corr_map(test_data, features, color_scheme = list(1,2)))
        expect_error(corr_map(test_data, features, color_scheme = 123))
    })

    # Tests on error msg for given `title` argument that is not inputted as a char
    test_that("Show right error for the incorrect type of input for title arugment.", {
        expect_error(corr_map(test_data, features, title =list("test_color")))
        expect_error(corr_map(test_data, features, title =123))
        expect_error(corr_map(test_data, features, title =TRUE))
    })

}

test_corr_map_error_msg()

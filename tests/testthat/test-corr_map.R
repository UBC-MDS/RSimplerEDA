#' Tests the corr map function output
#'
#' @return None.
#' the function shouldn't prompt error

#' @examples
#' test_corr_map()

test_corr_map <- function() {
    # set test data for testing
    test_data <- mtcars %>%  tidyr::drop_na()
    features <- c('hp', 'disp', 'cyl', 'qsec')
    c_map <- corr_map(test_data, features, title = "Correlation Map")

    # Test the plot ojbect type is correct.
    test_that("The output plot object should be a ggplot object.", {
        expect_true(is.ggplot(c_map))
    })

    # Test the plot geom type is correct.
    test_that("The plot should be GeomTile.", {
        expect_true("GeomTile" %in% c(class(c_map$layers[[1]]$geom)))
        expect_true("Geom" %in% c(class(c_map$layers[[1]]$geom)))
    })

    # Test the plot for mapping the right variables to x-axis, y-axis and fill respectively
    test_that('Plot should map x, y, corr in the subset dataframe to x-axis, y-axis and fill respectively', {
        expect_true('x'  == rlang::get_expr(c_map$mapping$x))
        expect_true('y' == rlang::get_expr(c_map$mapping$y))
        expect_true('corr' == rlang::get_expr(c_map$mapping$fill))
    })

    # Tests whether the plot uses the right color and title.
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
    test_data <- mtcars %>% tidyr::drop_na()
    features <- c('hp', 'disp', 'cyl', 'qsec')
    str_data <- test_data %>% dplyr::mutate(cyl = as.character(cyl)) %>%  tidyr::drop_na()

    # tests for exception handling

    test_that("Show right error if the given data not being dataframe or tibble.", {
        expect_error(corr_map("test", features))
        expect_error(corr_map(123, features))
        expect_error(corr_map(list(mtcars), features))

    })

    test_that(
        "Show right error if the given feature is not a char vector.", {
            expect_error(corr_map(test_data, c(TRUE, 3)))
            expect_error(corr_map(test_data, c("ab", 3)))
            expect_error(corr_map(test_data, 3))
        })

    test_that(
        "Show right error if the given feature has less than 2 elements.", {
            expect_error(corr_map(test_data, c('hp')))
        })

    test_that(
        "Show right error if the given correlation method is not one of the 3 supported methods - 'pearson', 'kendall', 'spearman'", {
            expect_error(corr_map(test_data, features, corr_method = "abc"))
            expect_error(corr_map(test_data, features, corr_method = 123))
        })

    test_that(
        "Show right error if one or more columns in the given features is not numeric", {
            expect_error(corr_map(str_data, features))
        })


    test_that("Show right error if color_scheme input  is not as a char.", {
        expect_error(corr_map(test_data, features, color_scheme = list("test_color")))
        expect_error(corr_map(test_data, features, color_scheme = list(1,2)))
        expect_error(corr_map(test_data, features, color_scheme = 123))
    })

    test_that("Show right error if title arugment input is not as a char.", {
        expect_error(corr_map(test_data, features, title =list("test_color")))
        expect_error(corr_map(test_data, features, title =123))
        expect_error(corr_map(test_data, features, title =TRUE))
    })

}

test_corr_map_error_msg()

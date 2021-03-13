test_corr_map <- function() {
    # set test data for testing
    test_data <- mtcars
    features <- c('hp', 'disp', 'cyl', 'qsec')
    c_map <- corr_map(test_data, features)
    # Test the plot type is correct.
    test_that("The output plot object should be a ggplot object.", {
        expect_true(is.ggplot(c_map))
    })
    # Test the plot type is correct.
    test_that("The plot should be a bar chart and without y mapping.", {
        expect_true("GeomTile" %in% c(class(c_map$layers[[1]]$geom)))
    })
    # Tests the plot uses the features in both x-axis and y-axis.
    test_that('Plot should map Var1 to x-axis, and Var2 to y-axis.', {
        expect_true('x'  == rlang::get_expr(c_map$mapping$x))
        expect_true('y' == rlang::get_expr(c_map$mapping$y))
    })
    # Tests the plot uses the features in both x-axis and y-axis.
    test_that('The title and color scheme should be same as input.', {
        expect_null(rlang::get_expr(c_map$colour))
        expect_true("Correlation Map" == rlang::get_expr(c_map$labels$title))
    })
}
test_corr_map()
test_corr_map_error_msg <- function() {
    # set test data for testing
    test_data <- mtcars
    features <- c('hp', 'disp', 'cyl', 'qsec')
    c_map <- corr_map(test_data, features)
    # Tests on error msg for data not being dataframe or tibble
    test_that("Show right error for data not being dataframe or tibble.", {
        expect_error(corr_map("test", features))
    })
    # Test on error msg for given `features` not being a char vector
    test_that(
        "Show right error for given feature not being a char vector.", {
            expect_error(corr_map(test_data, c(TRUE, 3)))
        })
    # Test on error msg for given `features` has at at least 2 elements
    test_that(
        "Show right error for given feature has less than 2 elements.", {
            expect_error(corr_map(test_data, c('hp')))
        })
    # Test on error msg for the feature/column in given `features` is not found in the given data
    test_that(
        "Show right error for 1 or more given features is not found in the given dataha.", {
            expect_error(corr_map(test_data, c("test", "test2")))
        })
    # Tests on error msg for corr_method being not one of the 3 supported methods - 'pearson', 'kendall', 'spearman'.
    test_that("Show right error if inputted color_scheme is not as a char.", {
        expect_error(corr_map("test", features, color_scheme = "test_color"))
    })
    # Tests on error msg for given `color_scheme` argument that is not inputted as a char
    test_that("Show right error for the incorrect type of input for color_scheme arugment.", {
        expect_error(corr_map("test", features, corr_method = "test_method"))
    })
    # Tests on error msg for given `plot_width` argument that is not inputted as a numeric
    test_that("Show right error for the incorrect type of input for plot_width arugment.", {
        expect_error(corr_map("test", features, plot_width = "test_width"))
    })
    # Tests on error msg for given `plot_height` argument that is not inputted as a numeric
    test_that("Show right error for the incorrect type of input for plot_height arugment.", {
        expect_error(corr_map("test", features, plot_height = FALSE))
    })
}

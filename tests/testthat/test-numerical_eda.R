test_numerical <- function() {
    # Unit test for scatter plot with no transformations
    test_that("Plot should use geom_point as the mark.", {
        plot <- numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10)
        expect_true("GeomPoint" %in% c(class(plot$layers[[1]]$geom)))
        expect_true("Geom" %in% c(class(plot$layers[[1]]$geom)))
    })

    test_that("Plot should correctly map the x and y variables.", {
        plot <- numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10)
        expect_true("Petal.Length" == rlang::get_expr(plot$mapping$x))
        expect_true("Petal.Width" == rlang::get_expr(plot$mapping$y))
        expect_true("Petal.Length" == rlang::get_expr(plot$labels$x))
        expect_true("Petal.Width" == rlang::get_expr(plot$labels$y))
    })

    test_that("Plot should correctly map the color and title variable.", {
        plot <- numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10)
        expect_true("Species" == rlang::get_expr(plot$mapping$colour))
        expect_true("Scatter plot" == rlang::get_expr(plot$labels$title))
    })

    # Unit test for line plot with no transformations
    test_that("Plot should use geom_line and correctly map variables to the correct axis.", {
        plot <- numerical_eda(iris, xval = Sepal.Length, yval = Sepal.Width, color = Species, plot_type = "line", font_size = 10)
        expect_true("GeomLine" %in% c(class(plot$layers[[1]]$geom)))
        expect_true("GeomPath" %in% c(class(plot$layers[[1]]$geom)))
        expect_true("Geom" %in% c(class(plot$layers[[1]]$geom)))
    })

    test_that("Plot should correctly map variables to x and y axis.", {
        plot <- numerical_eda(iris, xval = Sepal.Length, yval = Sepal.Width, color = Species, plot_type = "line", font_size = 10)
        expect_true("Sepal.Length" == rlang::get_expr(plot$mapping$x))
        expect_true("Sepal.Width" == rlang::get_expr(plot$mapping$y))
        expect_true("Sepal.Length" == rlang::get_expr(plot$labels$x))
        expect_true("Sepal.Width" == rlang::get_expr(plot$labels$y))
    })

    test_that("Plot should correctly map the title and color variable.", {
        plot <- numerical_eda(iris, xval = Sepal.Length, yval = Sepal.Width, color = Species, plot_type = "line", font_size = 10)
        expect_true("Species" == rlang::get_expr(plot$mapping$colour))
        expect_true("Sepal.Length vs Sepal.Width line plot" == rlang::get_expr(plot$labels$title))
    })

    # Unit test for scatter plot with  log transormations on x and y axis
    test_that("Plot should use geom_point as the mark.", {
        plot <- numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10, x_transform = TRUE, y_transform = TRUE)
        expect_true("GeomPoint" %in% c(class(plot$layers[[1]]$geom)))
        expect_true("Geom" %in% c(class(plot$layers[[1]]$geom)))
    })

    test_that( "Plot should correctly map variables to x and y axis.", {
        plot <- numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10, x_transform = TRUE, y_transform = TRUE)
        expect_true("Petal.Length" == rlang::get_expr(plot$labels$x))
        expect_true("Petal.Width" == rlang::get_expr(plot$labels$y))
    })

    test_that("Plot should correctly map the title and color variable.", {
        plot <- numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10, x_transform = TRUE, y_transform = TRUE)
        expect_true("Species" == rlang::get_expr(plot$mapping$colour))
        expect_true("Scatter plot" == rlang::get_expr(plot$labels$title))
    })

    test_that("Plot variables should have correct value after transformation.", {
        plot <- numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10, x_transform = TRUE, y_transform = TRUE)
        expect_null(plot$scales$scales[[1]]$range$range)
        expect_equal(log(iris$Petal.Length), rlang::get_expr(plot$mapping$x))
        expect_equal(log(iris$Petal.Width), rlang::get_expr(plot$mapping$y))
    })

    # Unit test for line plot with  log transormations on x and y axis
    test_that("Plot should use geom_point and correctly map variables to the correct axis.", {
        plot <- numerical_eda(iris, xval = Sepal.Length, yval = Sepal.Width, color = Species, title = "Line plot", plot_type = "line", font_size = 10, x_transform = TRUE, y_transform = TRUE)
        expect_true("GeomLine" %in% c(class(plot$layers[[1]]$geom)))
        expect_true("GeomPath" %in% c(class(plot$layers[[1]]$geom)))
        expect_true("Geom" %in% c(class(plot$layers[[1]]$geom)))
    })

    test_that( "Plot should correctly map variables to x and y axis.", {
        plot <- numerical_eda(iris, xval = Sepal.Length, yval = Sepal.Width, color = Species, title = "Line plot", plot_type = "line", font_size = 10, x_transform = TRUE, y_transform = TRUE)
        expect_true("Sepal.Length" == rlang::get_expr(plot$labels$x))
        expect_true("Sepal.Width" == rlang::get_expr(plot$labels$y))
    })

    test_that("Plot should correctly map the title and color variable.", {
        plot <- numerical_eda(iris, xval = Sepal.Length, yval = Sepal.Width, color = Species, title = "Line plot", plot_type = "line", font_size = 10, x_transform = TRUE, y_transform = TRUE)
        expect_true("Species" == rlang::get_expr(plot$mapping$colour))
        expect_true("Line plot" == rlang::get_expr(plot$labels$title))
    })

    test_that("Plot variables should have correct value after transformation.", {
        plot <- numerical_eda(iris, xval = Sepal.Length, yval = Sepal.Width, color = Species, title = "Line plot", plot_type = "line", font_size = 10, x_transform = TRUE, y_transform = TRUE)
        expect_null(plot$scales$scales[[1]]$range$range)
        expect_equal(log(iris$Sepal.Length), rlang::get_expr(plot$mapping$x))
        expect_equal(log(iris$Sepal.Width), rlang::get_expr(plot$mapping$y))
    })

}
test_numerical()

test_defensive <- function(){
    test_that("Function should throw an error if the data argument is not a data frame object", {
        expect_error(numerical_eda(list(iris), xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10))
        expect_error(numerical_eda(c(iris), xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10))
    })

    test_that("Function should throw an error if xval or yval is not in the dataframe, and on whether they are numerical variable", {
        expect_error(numerical_eda(iris, xval = Petal, yval = Sepal, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10))
        expect_error(numerical_eda(iris, xval = Petal, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10))
        expect_error(numerical_eda(iris, xval = Petal.Length, yval = Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10))

        expect_error(numerical_eda(iris, xval = Species, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10))
        expect_error(numerical_eda(iris, xval = Petal.Length, yval = Species, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10))
    })

    test_that("Function should throw an error if color is not in the dataframe, or if it is not a categorical variable", {
        expect_error(numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Origin, title = "Scatter plot", plot_type = "scatter", font_size = 10))
        expect_error(numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Sepal.Length, title = "Scatter plot", plot_type = "scatter", font_size = 10))
    })

    test_that("Function should throw an error if title, plot_type, color_scheme is not a string", {
        expect_error(numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = 10, plot_type = "scatter", font_size = 10))
        expect_error(numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Species", plot_type = c(1, 2), font_size = 10))
        expect_error(numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = 10, plot_type = "histogram", font_size = 10))
        expect_error(numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Plotting function", plot_type = "histogram", font_size = 10, color_scheme = c("Tableau 10")))
    })
    test_that("Function should throw an error if x_transform and y_transform are not logical", {
        expect_error(numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10, x_transform = "TRUE"))
        expect_error(numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10, y_transform = "TRUE"))
    })


    test_that("Function should throw an error if font_size is not of double precision", {
        expect_error(numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = "ten"))
        expect_error(numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = list(1)))
        expect_error(numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = data.frame(c(1, 2, 3))))
    })

    test_that("Function should throw an error if color_scheme is not a string", {
        expect_error(numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10, color_scheme = blue, x_transform = TRUE))
        expect_error(numerical_eda(iris, xval = Petal.Length, yval = Petal.Width, color = Species, title = "Scatter plot", plot_type = "scatter", font_size = 10, color_scheme =10,  y_transform = TRUE))
    })

    test_negativeX <- dplyr::tibble(x = c(1, 2, -2), y = c(1, 2, 3), color = factor(c("red", "green", "blue")))
    test_negativeY <- dplyr::tibble(x = c(1, 2, 2), y = c(1, 2, -3), color = factor(c("red", "green", "blue")))
    test_that("Function should throw an error if xval and yval have negative values when doing log transformation", {
        expect_error(numerical_eda(test_negativeX, xval = x, yval = y, color = color, title = "plot", plot_type = "scatter", font_size = 10, x_transform = TRUE))
        expect_error(numerical_eda(test_negativeY, xval = x, yval = y, color = color, title = "plot", plot_type = "scatter", font_size = 10, y_transform = TRUE))
    })
}
test_defensive()

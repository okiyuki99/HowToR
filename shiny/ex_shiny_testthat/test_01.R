library(shinytest)
library(testthat)

testthat::context("Test Shiny app")

# open Shiny app and PhantomJS
app <- shinytest::ShinyDriver$new(path = "./shiny/ex_shiny_testthat")

testthat::test_that("output is correct", {
  # set num_input to 30
  app$setInputs(num_input = 30)
  # get text_out
  output <- app$getValue(name = "text_out")
  # test
  expect_equal(output, "The square of the number n is: n² = 900")  
})

# stop the Shiny app
app$stop()

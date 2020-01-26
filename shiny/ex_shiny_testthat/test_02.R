library(shinytest)
library(testthat)

context("Test Shiny app")

# open Shiny app and PhantomJS
app <- ShinyDriver$new(path = "./shiny/ex_shiny_testthat")

test_that("inputs_list is exported correctly", {
  # multiple inputs
  app$setInputs(num_input = 1)
  app$setInputs(num_input = 7)
  app$setInputs(num_input = 42)
  
  # get exported variable inputs_list
  exported_list <- app$getAllValues()$export$inputs_list
  
  # test (0 was the initial value)
  expect_equal(exported_list, c(0, 1, 7, 42))  
})

test_that("Notifications include correct text", {
  # identify HTML widget with XPath
  popup <- app$findElement(xpath = "//*[@id=\"shiny-notification-panel\"]")
  
  # test notification text
  testthat::expect_equal(popup$getText(), "×\n0\n×\n1\n×\n49\n×\n1764")
})

# stop the Shiny app
app$stop()

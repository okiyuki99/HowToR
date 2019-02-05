# Shiny Module
library(shiny)

irisPlotUI <- function(id, cols){
  ns <- NS(id)
  tagList(
    selectInput(ns('col'), '列：', cols),
    plotOutput(ns('plot'))
  )
}

irisPlot <- function(input, output, session, main){
  output$plot <- renderPlot({
    hist(iris[, input$col], main = main)
  }) 
}

ui <- fluidPage(
  irisPlotUI('petal', c('Petal.Length', 'Petal.Width')),
  irisPlotUI('sepal', c('Sepal.Length', 'Sepal.Width'))
)

server <- function(input, output, session) {
  callModule(irisPlot, "petal", "Petal Plot")
  callModule(irisPlot, "sepal", "Sepal Plot")
}

shinyApp(ui, server)
# No Shiny Module
library(shiny)

ui <- fluidPage(
  selectInput('petal_col', '列：', c('Petal.Length', 'Petal.Width')),
  plotOutput('petal_plot'),
  selectInput('sepal_col', '列：', c('Sepal.Length', 'Sepal.Width')),
  plotOutput('sepal_plot')
)

server <- function(input, output, session) {
  output$petal_plot <- renderPlot({
    hist(iris[, input$petal_col])
  }) 
  output$sepal_plot <- renderPlot({
    hist(iris[, input$sepal_col])
  }) 
}

shinyApp(ui, server)
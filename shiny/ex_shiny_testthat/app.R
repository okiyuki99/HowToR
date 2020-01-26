library(shiny)

# same ui as above
ui <- fluidRow(title = 'Minimal app',
               numericInput("num_input", "Please insert a number n:", 0),
               textOutput('text_out')
)

server <- function(input, output, session) {
  result <- reactive(input$num_input ^ 2)
  output$text_out <- renderText(
    paste("The square of the number n is: n² =", result())
  )
  # initialising the exported list
  inputs_list <- c()
  observeEvent(input$num_input, {
    # new input will be added to inputs_list
    inputs_list <<- c(inputs_list, input$num_input)
    # show notification
    showNotification(HTML(result()), duration = NULL)
  })
  # export inputs_list
  exportTestValues(inputs_list = {inputs_list})
}

shinyApp(ui, server)

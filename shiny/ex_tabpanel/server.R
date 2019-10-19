library(shiny)

shinyServer(function(input, output) {
  
  observe({
    if(input$tabs == "A"){
      output$text <- renderText({paste0("You are viewing tab \"", input$tabs, "\"")})
    }else if(input$tabs == "B"){
      output$text <- renderText({paste0("You are viewing tab \"", input$tabs, " dayo\"")})
    }
  })
  
})
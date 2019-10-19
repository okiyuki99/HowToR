library(shiny)

shinyServer(function(input, output) {
  
  observe({ 
    
    if(input$tabs == "report_1") {
      print("tab = report_1")
    } else if(input$tabs == "report_2"){
      print("tab = report_2")
    } else {
      print("tab = section_2")
    }
    
  })
  
})
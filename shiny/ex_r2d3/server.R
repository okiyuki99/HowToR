# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$d3_barchart <- renderD3({
    data <- runif(5, 0, input$bar_max)
    print(data)
    r2d3(
      data,
      script = "js/barchart.js"
    )
  })
   
  output$d3_calender <- renderD3({
    r2d3(
      data = read.csv("js/dji-latest.csv"), d3_version = 4, container = "div", options = list(start = 2006, end = 2011), 
      script = "js/calendar.js")
  })
  
})

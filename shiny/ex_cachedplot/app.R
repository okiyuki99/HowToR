# Ref. https://shiny.rstudio.com/articles/plot-caching.html 
shinyApp(
  
  fluidPage(
    sidebarLayout(
      sidebarPanel(
        sliderInput("n", "Number of points", 4, 32, value = 8, step = 4)
      ),
      mainPanel(plotOutput("plot"))
    )
  ),
  
  function(input, output, session) {
    output$plot <- renderCachedPlot(
      {
        Sys.sleep(2)  # Add an artificial delay
        
        rownums <- seq_len(input$n)
        plot(cars$speed[rownums], cars$dist[rownums],
             xlim = range(cars$speed), ylim = range(cars$dist))
        #p <- plot_ly(data = cars[rownums,], x = ~speed, y = ~dist, type = 'scatter', mode = 'markers')
        #p
      },
      cacheKeyExpr = {input$n }
    )
  }
)
library(shiny)
library(billboarder)

ui <- fluidPage(
  billboarderOutput(outputId = "Indo1"),
  billboarderOutput(outputId = "Indo2")
)

server <- function(input, output, session) {
  
  data(Indometh)
  Indometh_wide <- Indometh %>% tidyr::spread(Subject, conc)
  
  output$Indo1 <- renderBillboarder({
    billboarder(data = Indometh_wide) %>%
      bb_linechart() %>%
      bb_y_grid(show = T) %>%
      bb_legend(position = "inset") %>%
      bb_zoom(
        enabled = list(type = "drag"),
        resetButton = list(text = "Unzoom")
      ) %>%
      bb_title(text = "Indometh1", position = "center") %>%
      bb_y_axis(
        tick = list(format = htmlwidgets::JS("d3.format(',')"))
      ) %>% 
      bb_tooltip(
        linked = list(name = "tooltip-test"),
        format = list(value = htmlwidgets::JS("d3.format(',')"))
      )
  })
  
  output$Indo2 <- renderBillboarder({
    billboarder(data = Indometh_wide) %>%
      bb_linechart() %>%
      bb_y_grid(show = T) %>%
      bb_legend(position = "inset") %>%
      bb_zoom(
        enabled = list(type = "drag"),
        resetButton = list(text = "Unzoom")
      ) %>%
      bb_title(text = "Indometh2", position = "center") %>%
      bb_y_axis(
        tick = list(format = htmlwidgets::JS("d3.format(',')"))
      ) %>% 
      bb_tooltip(
        linked = list(name = "tooltip-test"),
        format = list(value = htmlwidgets::JS("d3.format(',')"))
      )
  })
}

shinyApp(ui = ui, server = server)
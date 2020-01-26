library(shiny)
library(DT)
library(shinyBS) #install.packages("shinyBS")

shinyApp(
  ui <- fluidPage(
    DT::dataTableOutput("data"),
    bsModal("modalnew", "Assessment", "select_button", size = "small",
            textAreaInput("text", label = h3("Enter Assessment") , value = "",        width = "100%", height = "200px", resize = "none"),
            actionButton("Enter", "Enter")
    )
    
  ),
  
  server <- function(input, output,session) {
    
    shinyInput <- function(FUN, len, id, ...) {
      inputs <- character(len)
      for (i in seq_len(len)) {
        inputs[i] <- as.character(FUN(paste0(id, i), ...))
      }
      inputs
    }
    
    df <- reactiveValues(data = data.frame(
      Assessment = shinyInput(actionButton, 10, 'button_', label = "Assessment", onclick = 'Shiny.onInputChange(\"select_button\",  this.id)' ),
      Value1 = 1:10,
      Value2 = c("A", "B", "C", "D", "E"),
      stringsAsFactors = FALSE,
      row.names = 1:10
    ))
    
    output$data <- DT::renderDataTable(
      df$data, server = FALSE, escape = FALSE, selection = 'none'
    )
    
    observeEvent(input$select_button, {
      s <- as.numeric(strsplit(input$select_button, "_")[[1]][2])
      toggleModal(session, "modalnew", toggle = "close")
    })   
  })
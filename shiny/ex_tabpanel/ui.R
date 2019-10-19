library(shiny)    

shinyUI(basicPage( 
  
  textOutput("text"),
  tabsetPanel(id = "tabs",
              tabPanel("Tab A", value = "A", "This is Tab A content"),
              tabPanel("Tab B", value = "B", "Here's some content for tab B.")
  )
  
))
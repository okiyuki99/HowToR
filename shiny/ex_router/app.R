library(shiny)
library(shiny.router)

# This creates UI for each page.
page <- function(title, content) {
  div(
    titlePanel(title),
    p(content),
    uiOutput("power_of_input")
  )
}

# Part of both sample pages.
home_page <- page("Home page", "This is the home page!")
side_page <- page("Side page", "This is the side page!")

# Callbacks on the server side for the sample pages
home_server <- function(input, output, session) {
  output$power_of_input <- renderUI({
    HTML(paste(
      "I display <strong>square</strong> of input and pass result to <code>output$power_of_input</code>: ", 
      as.numeric(input$int) ^ 2))
  })
}

side_server <- function(input, output, session) {
  output$power_of_input <- renderUI({
    HTML(paste(
      "I display <strong>cube</strong> of input and <strong>also</strong> pass result to <code>output$power_of_input</code>: ", 
      as.numeric(input$int) ^ 3))
  })
}

# Create routing. We provide routing path, a UI as well as a server-side callback for each page.
router <- make_router(
  route("home", home_page, home_server),
  route("side", side_page, side_server)
)

# Create output for our router in main UI of Shiny app.
ui <- shinyUI(fluidPage(
  shiny::sliderInput("int", "Choose integer:", -10, 10, 1, 1),
  router_ui()
))

# Plug router into Shiny server.
server <- shinyServer(function(input, output, session) {
  router(input, output, session)
})

# Run server in a standard way.
shinyApp(ui, server)

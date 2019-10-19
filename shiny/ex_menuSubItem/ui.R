library(shiny)    
library(shinydashboard)

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Shiny"),
    dashboardSidebar(
      sidebarMenu(id = "tabs",
                  menuItem("Section_1", tabName = "section_1", icon = icon("align-justify"), 
                           startExpanded = TRUE, selected = TRUE,
                           menuSubItem("Subsection 1", tabName = "report_1", selected = TRUE),
                           menuSubItem("Subsection 2", tabName = "report_2")),
                  menuItem("Section_2", tabName = "section_2", icon = icon("align-justify"))
                  
      )
    ),
    
    dashboardBody(
      
      tabItems(
        tabItem("report_1", h1(id = "a", "a")),
        tabItem("report_2", h1(id = "b", "b")),
        tabItem("section_2", h1(id = "c", "c")))
    )
  )
)
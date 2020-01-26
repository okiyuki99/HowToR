shinyUI(
  dashboardPage(
    title = "r2d3 Gallary",
    dashboardHeader(
      title = "r2d3 Gallary", titleWidth = 250
    ),
    dashboardSidebar(
      collapsed = F,
      width = 250,
      sidebarMenu(
        id = "menu",
        menuItem("barchart", icon = icon("globe"), tabName = "tab_barchart"),
        menuItem("calender", icon = icon("globe"), tabName = "tab_calender"),
        sliderInput("bar_max", label = "Max:", min = 0.1, max = 1.0, value = 0.2, step = 0.1)
      )
    ),
    dashboardBody(
      tabItems(
        
        # ----------------------------------------------
        # barchart
        # ----------------------------------------------
        tabItem(tabName = "tab_barchart",
          fluidRow(
            d3Output("d3_barchart")
          )  
        ),
        
        # ----------------------------------------------
        # calender
        # ----------------------------------------------
        tabItem(tabName = "tab_calender",
          fluidRow(
            d3Output("d3_calender")
          )  
        )
      )
    )
  )
)
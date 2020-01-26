library(shiny)
library(bs4Dash)

shiny::shinyApp(
  ui = bs4DashPage(
    old_school = FALSE,
    sidebar_collapsed = TRUE,
    controlbar_collapsed = TRUE,
    title = "Basic Dashboard",
    navbar = bs4DashNavbar(
      skin = "light",
      status = "white",
      border = TRUE,
      sidebarIcon = "bars",
      controlbarIcon = "th",
      fixed = FALSE,
      leftUi = bs4DropdownMenu(
        show = TRUE,
        align = "left",
        status = "warning", 
        menuIcon = "envelope-open",
        src = NULL
      ),
      rightUi = bs4DropdownMenu(
        show = FALSE,
        status = "danger",
        src = "https://www.google.fr",
        bs4DropdownMenuItem(
          text = "message 1",
          date = "today"
        ),
        bs4DropdownMenuItem(
          text = "message 2",
          date = "yesterday"
        )
      )
    ),
    sidebar = bs4DashSidebar(
      skin = "light",
      status = "primary",
      title = "bs4Dash",
      brandColor = "primary",
      url = "https://www.google.fr",
      src = "https://adminlte.io/themes/AdminLTE/dist/img/user2-160x160.jpg",
      elevation = 3,
      opacity = 0.8,
      bs4SidebarUserPanel(
        img = "https://image.flaticon.com/icons/svg/1149/1149168.svg", 
        text = "Welcome Onboard!"
      ),
      bs4SidebarMenu(
        bs4SidebarHeader("Header 1"),
        bs4SidebarMenuItem(
          "Item 1",
          tabName = "item1",
          icon = "sliders"
        ),
        bs4SidebarMenuItem(
          "Item 2",
          tabName = "item2",
          icon = "id-card"
        )
      )
    ),
    controlbar = bs4DashControlbar(
      skin = "light",
      title = "My right sidebar",
      sliderInput(
        inputId = "obs", 
        label = "Number of observations:",
        min = 0, 
        max = 1000, 
        value = 500
      ),
      column(
        width = 12,
        align = "center",
        radioButtons(
          inputId = "dist", 
          label = "Distribution type:",
          c("Normal" = "norm",
            "Uniform" = "unif",
            "Log-normal" = "lnorm",
            "Exponential" = "exp")
        )
      )
    ),
    footer = bs4DashFooter(
      copyrights = a(
        href = "https://twitter.com/divadnojnarg", 
        target = "_blank", "@DivadNojnarg"
      ),
      right_text = "2018"
    ),
    body = bs4DashBody(
      bs4TabItems(
        bs4TabItem(
          tabName = "item1",
          fluidRow(
            lapply(1:3, FUN = function(i) {
              bs4Sortable(
                width = 4,
                p(class = "text-center", paste("Column", i)),
                lapply(1:2, FUN = function(j) {
                  bs4Card(
                    title = paste0("I am the ", j,"-th card of the ", i, "-th column"), 
                    width = 12,
                    "Click on my header"
                  )
                })
              )
            })
          )
        ),
        bs4TabItem(
          tabName = "item2",
          bs4Card(
            title = "Card with messages",
            width = 9,
            userMessages(
              width = 12,
              status = "success",
              userMessage(
                author = "Alexander Pierce",
                date = "20 Jan 2:00 pm",
                src = "https://adminlte.io/themes/AdminLTE/dist/img/user1-128x128.jpg",
                side = NULL,
                "Is this template really for free? That's unbelievable!"
              ),
              userMessage(
                author = "Dana Pierce",
                date = "21 Jan 4:00 pm",
                src = "https://adminlte.io/themes/AdminLTE/dist/img/user5-128x128.jpg",
                side = "right",
                "Indeed, that's unbelievable!"
              )
            )
          )
        )
      )
    )
  ),
  server = function(input, output) {}
)
library(shiny)
library(shinydashboard)

shinyUI(dashboardPage(
  dashboardHeader(title ="Fisherman Dilemma", titleWidth = 450),
  dashboardSidebar(width = 150, sidebarMenu(menuItem("Graph", 
                                        tabName = "graphtab", 
                                        icon = icon("bar-chart")
  ), 
  menuItem("Background", tabName = "texttab", icon = icon("book")
  )
  )),
  
  dashboardBody(
      tabItem(tabName = "graphtab",
              fluidRow(
                box(sliderInput("T",
                                HTML("Fisher A: amount of fish per hour"),
                                min = 1,
                                max = 20,
                                value = 12,
                                step = 1,
                                width=125), 
                    
                    sliderInput("m",
                                HTML("Fisher A: amount of externatiy"),
                                min = 0,
                                max = 1,
                                value = 0.5,
                                step=0.1,
                                round = FALSE,
                                width=125),
                    sliderInput("Q",
                                HTML("Fisher B: amount of fish per hour"),
                                min = 1,
                                max = 20,
                                value = 12,
                                step = 1,
                                width=125), 
                    
                    sliderInput("s",
                                HTML("Fisher B: amount of externatiy"),
                                min = 0,
                                max = 1,
                                value = 0.5,
                                step=0.1,
                                round = FALSE,
                                width=125),
                    width=3
                ),
                box(plotOutput("BestResponse"), width=9)
                )
      )
    

    )
  )
)
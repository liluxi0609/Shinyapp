library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Feasibility frontier with points for comparison & discussion"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("A",
                  HTML("efficiency of study"),
                  min = 0,
                  max = 1,
                  value = 0.5,
                  step = 0.1,
                  round=FALSE)
      
    ),
    
    mainPanel(
      plotOutput("Plot")
    )
  )
))

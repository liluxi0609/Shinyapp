library(shiny)

shinyUI(fluidPage(

  titlePanel("Indifference Map"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("U",
                  HTML("Utility"),
                  min = 0,
                  max = 18,
                  value = 10
                  #step=18
      ),
      #Slider for maximum total goods, also can check with tech
      sliderInput("A",
                  HTML("coefficient"),
                  min = 1,
                  max = 6,
                  value = 2
                  #step = 6,
      ),
      sliderInput("a",
                  HTML("alpha"),
                  min = 0,
                  max = 1,
                  value = 0.5
                  #step = 6,
      )
    ),

    mainPanel(
      plotOutput("Plot")
    )
  )
))



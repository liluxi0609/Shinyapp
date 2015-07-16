library(shiny)

shinyUI(fluidPage(
  
  titlePanel("budget constraint for apply and orange"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("w",
                  HTML("Total wealth"),
                  min = 0,
                  max = 100,
                  value = 50
                  #step=18
      ),
      #Slider for maximum total goods, also can check with tech
      sliderInput("a",
                  HTML("Price of good x"),
                  min = 4,
                  max = 20,
                  value = 8
                  #step = 6,
      ),
      sliderInput("b",
                  HTML("Price of good y"),
                  min = 1,
                  max = 5,
                  value = 3
                  #step = 6,
      )
    ),
    
    mainPanel(
      plotOutput("Plot")
    )
  )
))



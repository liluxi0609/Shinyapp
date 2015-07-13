library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  #Call on MathJax
  #withMathJax(),
  
  # Application title
  titlePanel("Indifference Curve"),
  
  # Sidebar with a slider input for the number of bins
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
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot")
    )
  )
))
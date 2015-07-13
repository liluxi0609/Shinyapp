library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  #Call on MathJax
  #withMathJax(),
  
  # Application title
  titlePanel("Feasibility Frontier of GPA and leisure hour"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("A",
                  HTML("efficiency of study"),
                  min = 0,
                  max = 1.4,
                  value = 1,
                  step = 0.1,
                  round=FALSE)
     
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("Plot")
    )
  )
))



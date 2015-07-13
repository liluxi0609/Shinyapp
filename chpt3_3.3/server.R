library(shiny)

shinyServer(function(input, output) {
  output$Plot <- renderPlot({
    plot1 <- function(x,U=10,A=2,a=0.5) {
      (((U/A)*(1/x)^a)^(1/(1-a)))
    }
    plot2 <- function(x,U=8,A=2,a=0.5) {
      ((((U-2)/A)*(1/x)^a)^(1/(1-a)))
    }
    plot3 <- function(x,U=6,A=2,a=0.5) {
      ((((U-4)/A)*(1/x)^a)^(1/(1-a)))
    }
    
    
    
    COL <- c("#1B9E77", "#F0F0D8", "#D8D8C0", "#E7298A", "#66A61E", "#E6AB02", "#A6761D", "#666666")
    par(mar =  c(5, 5, 4, 2))
    xlims <- c(0, 8)
    ylims <- c(0, 18)
    
    plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
         xlab = expression(paste("Quantity of good x")),
         ylab = expression(paste("quantity of good y")),
         xaxt = "n", 
         yaxt = "n", 
         cex.lab = 1.3, 
         bty = "n")
    
    npts <- 500
    xx1 <- seq(xlims[1], xlims[2], length.out = npts)
    yy1 <- plot1(xx1,U=input$U, A=input$A, a=input$a)
    yy2 <- plot2(xx1,U=input$U, A=input$A, a=input$a)
    yy3 <- plot3(xx1,U=input$U, A=input$A, a=input$a)
    lines(xx1, yy1, col = COL[1], lwd = 4)
    lines(xx1, yy2, col = COL[4], lwd = 4)
    lines(xx1, yy3, col = COL[5], lwd = 4)


    axis(1, at = xlims, pos = 0)
    axis(2, at = ylims, pos = 0)
    add_legend <- function(...) {
      opar <- par(fig=c(0, 1, 0, 1), oma=c(0, 0, 0, 0), 
                  mar=c(0, 0, 0, 0), new=TRUE)
      on.exit(par(opar))
      plot(0, 0, type='n', bty='n', xaxt='n', yaxt='n')
      legend(...)
    }
    
    add_legend("topright", legend=c(
      expression(paste("Indifference curve for a")), 
      expression(paste("indifference curve for b")),
      expression(paste("indifference curve for c"))
    ),
    col = COL, lty = 1, lwd = 3, bty = "n", cex=1.2, pt.cex = 1)
  })
})
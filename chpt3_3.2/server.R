library(shiny)
library(ggvis)

shinyServer(function(input, output) {
  output$plot <- renderPlot({
    indiffcurve <- function(x,U=10,A=2,a=0.5) {
      (((U/A)*(1/x)^a)^(1/(1-a)))
    }
    
    
    
    COL <- c("#1B9E77", "#F0F0D8", "#D8D8C0", "#E7298A", "#66A61E", "#E6AB02", "#A6761D", "#666666")
    par(mar =  c(5, 5, 4, 2))
    xlims <- c(0, 8)
    ylims <- c(0, 20)
    
    plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
         xlab = expression(paste("Quantity of x")),
         ylab = expression(paste("Quantity of y")),
         xaxt = "n", 
         yaxt = "n", 
         cex.lab = 1.3, 
         bty = "n")
   
    
    npts <- 500
    xx1 <- seq(xlims[1], xlims[2], length.out=npts)
    yy1 <- indiffcurve(xx1,U=input$U, A=input$A, a=input$a)
    lines(xx1, yy1, col = COL[1], lwd = 4)
    polygon(c(xx1, min(xx1)), c(yy1, min(yy1)), col = COL[2], density=NULL,
            border = NA)

    
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
      expression(paste("Indifference Curve"))
    ),
    col = COL, lty = 1, lwd = 3, bty = "n", cex=1.2, pt.cex = 1)
  })
})



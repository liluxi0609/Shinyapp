library(shiny)

shinyServer(function(input, output) {
  output$Plot <- renderPlot({
   constraint <- function(x,w=50,b=3,a=8) {
       ((w/b)-a*x/b)
    }
    
    
    
    COL <- c("#1B9E77", "#F0F0D8", "#D8D8C0", "#E7298A", "#66A61E", "#E6AB02", "#A6761D", "#666666")
    par(mar =  c(5, 5, 4, 2))
    xlims <- c(0, 50)
    ylims <- c(0, 50)
    
    plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
         xlab = expression(paste("Quantity of good x")),
         ylab = expression(paste("quantity of good y")),
         xaxt = "n", 
         yaxt = "n", 
         cex.lab = 1.3, 
         bty = "n")
    
    npts <- 500
    xx1 <- seq(xlims[1], xlims[2], length.out = npts)
    yy1 <- constraint(xx1, w=input$w, b=input$b, a=input$a)
 
    lines(xx1, yy1, col = COL[1], lwd = 4)

    
    
    axis(1, at=0:50, pos = 0)
    axis(2, at=0:50, pos = 0)
    add_legend <- function(...) {
      opar <- par(fig=c(0, 1, 0, 1), oma=c(0, 0, 0, 0), 
                  mar=c(0, 0, 0, 0), new=TRUE)
      on.exit(par(opar))
      plot(0, 0, type='n', bty='n', xaxt='n', yaxt='n')
      legend(...)
    }
    
    add_legend("topright", legend=c(
      expression(paste("budget constraint"))
    ),
    col = COL, lty = 1, lwd = 3, bty = "n", cex=1.2, pt.cex = 1)
  })
})
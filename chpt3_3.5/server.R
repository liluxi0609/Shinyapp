library(shiny)

shinyServer(function(input, output) {
  output$Plot <- renderPlot({
    feasibility <- function(h,A) {
      (A*log((17-h), base=exp(1)))
    }
    
    
    
    COL <- c("#1B9E77", "#F0F0D8", "#D8D8C0", "#E7298A", "#66A61E", "#E6AB02", "#A6761D", "#666666")
    par(mar =  c(5, 5, 4, 2))
    xlims <- c(0, 18)
    ylims <- c(0, 5)
    
    plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
         xlab = expression(paste("Hour of leisure time ")),
         ylab = expression(paste("average GPA")),
         xaxt = "n", 
         yaxt = "n", 
         cex.lab = 1.3,
         bty = "n")
    
    npts <- 500
    maxh <- 16
    xx1 <- seq(xlims[1], maxh, length.out = npts)
    yy1 <- feasibility(xx1, A=input$A)
    lines(xx1, yy1, col = COL[1], lwd = 4)
    polygon(c(xx1,xx1[1]),c(yy1,rev(yy1)[1]), col = COL[2], border=NA)


    
    axis(1, at = seq(0,18,by=1), pos = 0, tick=TRUE)
    axis(2, at = seq(0,5,by=1), pos = 0, tick=TRUE)
    
    identify(xx1, yy1, pos=TRUE, plot=TRUE)
    
    add_legend <- function(...) {
      opar <- par(fig=c(0, 1, 0, 1), oma=c(0, 0, 0, 0), 
                  mar=c(0, 0, 0, 0), new=TRUE)
      on.exit(par(opar))
      plot(0, 0, type='n', bty='n', xaxt='n', yaxt='n')
      legend(...)
    }
    
    add_legend("topright", legend=c(
      expression(paste("feasibility set"))
    ),
    col = COL, lty = 1, lwd = 3, bty = "n", cex=1.2, pt.cex = 1)
  })
})
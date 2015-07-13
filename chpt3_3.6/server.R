library(shiny)

shinyServer(function(input, output) {
  output$Plot <- renderPlot({
    feasibility1 <- function(h,A=0.5) {
      (A*log((17-h), base=exp(1)))
    }
    feasibility2 <- function(h,A) {
      ((A+0.4)*log((17-h), base=exp(1)))
    }
    
    
    COL <- c("#1B9E77", "#F0F0D8", "#D8D8C0", "#E7298A", "#66A61E", "#E6AB02", "#A6761D", "#666666")
    par(mar =  c(5, 5, 4, 2))
    xlims <- c(0, 16)
    ylims <- c(0, 4)
    
    plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
         xlab = expression(paste("Hour of leisure time ")),
         ylab = expression(paste("average GPA")),
         xaxt = "n", 
         yaxt = "n", 
         cex.lab = 1.3,
         bty = "n")
    
    npts <- 500
    xx1 <- seq(xlims[1], xlims[2], length.out = npts)
    yy1 <- feasibility1(xx1, A=input$A)
    yy2 <- feasibility2(xx1, A=input$A)
    lines(xx1, yy1, col = "blue", lwd = 4)
    lines(xx1, yy2, col = "black", lwd= 4)
    polygon(c(xx1,xx1[1]),c(yy1,rev(yy1)[1]), col = COL[1], border=NA)
    polygon(c(xx1,rev(xx1)),c(yy1,rev(yy2)), col = COL[2], border=NA)
    
    
    axis(1, at = seq(0,16,by=1), pos = 0, tick=TRUE)
    axis(2, at = seq(0,4,by=1), pos = 0, tick=TRUE)
    
    identify(xx1, yy1, pos=TRUE, plot=TRUE)
    
    add_legend <- function(...) {
      opar <- par(fig=c(0, 1, 0, 1), oma=c(0, 0, 0, 0), 
                  mar=c(0, 0, 0, 0), new=TRUE)
      on.exit(par(opar))
      plot(0, 0, type='n', bty='n', xaxt='n', yaxt='n')
      legend(...)
    }
    
    add_legend("topright", legend=c(
      expression(paste("feasible set 1")), 
      expression(paste("feasible Set 2"))
    ),
    col = COL, lty = 1, lwd = 3, bty = "n", cex=1.2, pt.cex = 1)
  })
})
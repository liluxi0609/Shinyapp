library(shiny)

shinyServer(function(input, output) {
  output$BestResponse <- renderPlot({
    BestResponse1 <- function(a, T=12, m=0.5) {
      ((T/m)-(1/m)*a)
    }
    BestResponse2 <- function(a, Q=12, s=0.5){
      (Q-s*a)
    }
    
    
    
    COL <- c("#1B9E77", "#F0F0D8", "#D8D8C0", "#E7298A", "#66A61E", "#E6AB02", "#A6761D", "#666666")
    par(mar =  c(2, 2, 5, 5))
    xlims <- c(0, 50)
    ylims <- c(0, 50)
    
    plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
         xlab = expression(paste("amount of A, ", a)),
         ylab = expression(paste("amount of B, ", b)),
         xaxt = "n", 
         yaxt = "n", 
         cex.lab = 1.5, 
         bty = "n")
    
    npts <- 500
    xx1 <- seq(xlims[1], input$T, length.out = npts)
    yy1 <- BestResponse1(xx1, T=input$T, m=input$m)
    lines(xx1, yy1, col = COL[1], lwd = 4)
    xx2 <- seq(xlims[1], input$Q / input$s, length.out = npts)
    yy2 <- BestResponse2(xx2, Q=input$Q, s=input$s)
    lines(xx2, yy2, col = COL[3], lwd = 4)
    
    
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
      expression(paste("A best response function")), 
      expression(paste("B best response function"))
    ),
    col = COL, lty = 1, lwd = 3, bty = "n", cex=1.2, pt.cex = 1)
  })
})
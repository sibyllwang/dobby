##multiple simple dotplots 
##takes 1 response var and 1+ predictive vars
multiPlot<-function(dat, x, y, nrow, ncol){
  if(length(y)!=1)
    stop("y must be of length 1.")
  n<-length(x)
  par(mfrow=c(nrow, ncol))
  for(i in 1:n){
    xi<-x[i]
    plot(dat[,xi], dat[,y], xlab=xi, ylab=y, main=i)
    if(is.numeric(dat[,xi])){
      lmi<-lm(dat[,y]~dat[,xi])
      abline(lmi)
    }
  }
}

##example
##multiPlot(mtcars, c("mpg", "cyl", "disp", "hp"), "drat", 2, 2)
##multiPlot(mtcars, 1:4, 5, 2, 2)










#hw1 practical data analysis fall 2017

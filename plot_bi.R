##function to plot points and simple linear regression line by binary variable
##y and x are strings that are variable names or a function of the vaiables
##bi is a binary variable (SEX, Smoking, etc.)
##from and to define range of the regression curve
##used to check interaction when fitting multiple linear regressions
plot_bi<-function(dat, y, x, bi, from, to, color, main, lable){
  bool1<-dat[, bi]==unique(dat[, bi])[1]
  dat1<-dat[bool1,]
  bool2<-dat[, bi]==unique(dat[, bi])[2]
  dat2<-dat[bool2,]
  formula<-paste0(y, "~", x)
  lm1<-lm(formula, data=dat1)
  lm2<-lm(formula, data=dat2)
  colors<-ifelse(dat[, bi]==1, color[1], color[2])
  plot(as.formula(formula), col=colors, pch=1, main=main, data=dat)
  legend("topright", legend = lable, col = color, pch=c(1, 1))
  curve(coef(lm1)[1]+coef(lm1)[2]*x, from=from, to=to, col=color[1], add=TRUE)
  curve(coef(lm2)[1]+coef(lm2)[2]*x, from=from, to=to, col=color[2], add=TRUE)
}

##example
##plot_bi(mtcars, "qsec", "disp", "vs", min(mtcars$disp), max(mtcars$disp), c("black", "red"), "qsec v. disp by vs", c(0,1))

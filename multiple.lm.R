##function to run more than one simple linear regressions 
##outputs a list of lm objects
##takes 1 x var and 1+ y vars
multiy.lm<-function(dat, x, y){
  if(length(x)!=1)
    stop("x must be of length 1.")
  lmLst<-list()
  n<-length(y)
  for(i in 1:n){
    yi<-y[i]
    formulai<-paste0(yi, "~", x)
    fiti<-lm(as.formula(formulai), data=dat)
    lmLst<-c(lmLst, list(fiti))
  }
  lmLst
}

##examples:
##lm1<-multiy.lm(mtcars, "mpg", c("cyl", "disp", "hp"))
##lm(cyl~mpg, mtcars)
##lm(disp~mpg, mtcars)
##lm(hp~mpg, mtcars)
##lapply(lm1, summary)

##takes 1+ x vars and 1 y var
##can also specify what test should be run based on type of x var
##choices are ("lm", "t", "anova")
##outputs a list of test objects
multix.lm<-function(dat, x, y, test){
  if(length(y)!=1)
    stop("y must be of length 1.")
  lmLst<-list()
  n<-length(x)
  for(i in 1:n){
    xi<-x[i]
    formulai<-paste0(y, "~", xi)
    if(test=="lm"){
      fiti<-lm(as.formula(formulai), data=dat)
    }else if(test=="t"){
      fiti<-t.test(as.formula(formulai), data=dat)
    }else if(test=="anova"){
      fiti<-aov(as.formula(formulai), data=dat)
    }
    lmLst<-c(lmLst, list(fiti))
  }
  lmLst
}

##examples:
##lm2<-multix.lm(mtcars, c("disp", "hp"), "mpg", "lm")
##lm(mpg~disp, mtcars)
##lm(mpg~hp, mtcars)

##anova1<-multix.lm(mtcars, c("cyl", "gear"), "mpg", "anova")
##aov(mpg~cyl, data=mtcars)
##aov(mpg~gear, data=mtcars)

##lapply(lm2, summary)
##lapply(anova1, summary)







#hw1 practical data analysis fall 2017



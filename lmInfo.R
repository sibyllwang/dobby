##function to retrieve single value from a list of lm/test objects
##takes a list of lm/test objects and a function which 
##specifies which value is being retrieved
lmInfo<-function(lst,fun){
  n<-length(lst)
  val<-c()
  for(i in 1:n){
    val[i]<-fun(lst[[i]])
  }
  val
}

##examples:
##first get a list of lm objects with multiy.lm
##multiy.lm<-function(dat, x, y){
##if(length(x)!=1)
##  stop("x must be of length 1.")
##lmLst<-list()
##n<-length(y)
##for(i in 1:n){
##  yi<-y[i]
##  formulai<-paste0(yi, "~", x)
##  fiti<-lm(as.formula(formulai), data=dat)
##  lmLst<-c(lmLst, list(fiti))
##}
##lmLst
##}

##lm1<-multiy.lm(mtcars, "mpg", c("cyl", "disp", "hp"))
##lmInfo(lm1, function(lm)coef(lm)[1])

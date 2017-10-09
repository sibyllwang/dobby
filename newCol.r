##assign values corresponding to an exisitng column to a new column
##takes a dataset, string character of existing column name, 
##corresponding levels in new column
##note that the order of items in newLevels is matching with the 
##order of items in levels(dat[,"oldCol"])
newCol<-function(dat, oldCol, newLevels){
  newCol<-c()
  for(i in 1:length(unique(dat[,oldCol]))){
     bool<-dat[,oldCol]==unique(dat[,oldCol])[i]
     nrow<-sum(bool)
     newCol[bool]<-rep(newLevels[i], nrow)
  }
  dat$newCol<-newCol
  dat
}

##example:
##dat<-data.frame(a=rbinom(100, 10, 0.4), b=rnorm(100, 10, 3))
##length(unique(dat$a))
##note that the length of the newLevels may vary in this example due to random sampling
##dat<-newCol(dat, "a", 100:106)
##dat2<-newCol(dat, "a", c("do", "re", "mi", "fa", "so", "la", "ti"))
##dat3<-newCol(dat[order(dat$a),], "a", c("do", "re", "mi", "fa", "so", "la", "ti"))

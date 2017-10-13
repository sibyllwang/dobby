##assign values corresponding to an exisitng column to a new column
##takes a dataset, string character of existing column name, 
##corresponding levels in new column
##note that the order of items in newLevels is matching with the 
##order of items in levels(dat[,"oldCol"])
newCat<-function(dat, oldCat, newLevels){
  newCat<-c()
  for(i in 1:length(unique(dat[,oldCat]))){
    bool<-dat[,oldCat]==unique(dat[,oldCat])[i]
    nrow<-sum(bool)
    newCat[bool]<-rep(newLevels[i], nrow)
  }
  dat$newCat<-newCat
  dat
}

##example:
#dat<-data.frame(a=rbinom(100, 10, 0.4))
#length(unique(dat$a))
#note that the length of the newLevels may vary in this example due to random sampling
#dat<-newCat(dat, "a", 100:107)
#dat2<-newCat(dat, "a", c("do", "re", "mi", "fa", "so", "la", "ti", "do"))
#dat3<-newCat(dat[order(dat$a),], "a", c("do", "re", "mi", "fa", "so", "la", "ti","do"))

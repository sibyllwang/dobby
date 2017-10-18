##function to check if any rows in a dataframe are identical
identical.row<-function(dat){
  #Lst<-matrix(ncol=ncol(dat), nrow=nrow(dat))
  Lst<-list()
  for(i in 1:nrow(dat)){
    lst<-c()
    for(j in 1:nrow(dat)){
      lst[j]<-if(i<j){
                 identical(c(dat[i,]), c(dat[j,]))
              }
    }
    Lst[[i]]<-lst  
  }
  #Lst has as many elements as nrow-1 (last row is not compared to anythong), 
  #each containing nrow logical values
  Lst
}


##example
#test<-data.frame(x=c(1, 1, 3, 3, 3),
#                 y=c(1, 1, 3, 5, 3),
#                 z=c("a", "a", "b", "b", "b"))
#test.res<-identical.row(test)
##in here, Lst[[1]] suggests that the 1st row is identical to the 2nd
##Lst[[3]] suggests that the 3rd row is identical to the 5th
#test.res

##check if any row is identical to any other row in the dataset
#lapply(test.res, function(vec)any(vec))

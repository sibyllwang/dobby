#For a simple linear model, "assume that the regression model is correct, it should happen only 5% of the time 
#that the estimate beta-hat falls more than 1 standard error away from the true beta" (Gelman-Hill, Data Analysis). 
#Test with a simple simulation:


#true beta and sigma
beta=6
sigma=1
#no randomness in x b/c all of y's variation comes from error (sigma)
x<-1:100
beta_hats<-vector()
beta_ses<-vector()

for(i in 1:10000){
  errori<-rnorm(100, 0, 1)
  yi<-beta*x+errori
  lmi<-lm(yi~x)
  beta_hats[i]<-coef(lmi)[2]
  beta_ses[i]<-summary(lmi)$coefficients[2,2]
}

#estimate true SE of beta
beta_se_hat<-mean(beta_ses)

#percentage of beta hats that falls out of 2 se from true beta
paste0(sum(beta_hats<beta-beta_se_hat*1.96|beta_hats>beta+beta_se_hat*1.96)/100, "%")

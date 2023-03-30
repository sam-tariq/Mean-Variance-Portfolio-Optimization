#Importing the libraries
library(quantmod)
library(ggplot2)
library(tidyverse)
library(tidyquant)

#Inputs for the function
ticks<- c('GE','XOM','GBX','SBUX','PFE','HMC','NVDA')
length(ticks)
rfrt<-0
start1<-"20140101"
end1<-"20171231"


#Defining the function
myMeanVarPort <- function(ticks,start1,end1,rfrt){
  retout <- NULL
  retout <- xts(retout)
  
  #getting the monthly stock returns of the ticks
  for(i in 1:length(ticks)){
    prices = getSymbols(ticks[i], auto.assign = F)
    returns <- periodReturn(prices, period = "monthly", 
                            type = "arithmetic")
    retout <- merge.xts(retout, returns)
  }
  
  #defining the time range of the returns we just got
  time_range<-paste(start1,end1,sep="/")
  colnames(retout) <- ticks
  retout <- retout[time_range]
  retout <- na.omit(retout)
  
  #calculating the mean and covariance of the stock returns
  meanret <- colMeans(retout,na.rm = T)
  meanret = round(meanret, 5)
  meanret <- as.matrix(meanret)
  covmat <- var(retout)
  covmat = round(covmat, 8)
  
  #Generating the matrices for the mean-variance metrics
  set.seed(12)
  N<-length(ticks)
  niter <- 100*N   # Set the number of iterations here
  randomnums <- data.frame(replicate(N, runif(niter, 1, 10)))
  
  wt_sim <- randomnums / rowSums(randomnums)
  wt_sim<-round(wt_sim, 5)
  weight <- matrix(data = NA, nrow = N, ncol = 1)
  Results <- matrix(data = NA, nrow = niter, ncol = N+3)
  
  # loop: each i is a portfolio
  for (i in 1:niter){
    
    # inner loop places weights into Results
    for (k in 1:N) {
      Results[i,k] = weight[k,1] = wt_sim[i,k]
    }
    #Calculating the mean-variance metrics
    Results[i,N+1] <- t(weight) %*% meanret                # portfolio mean
    Results[i,N+2] <- sqrt(t(weight) %*% covmat %*% weight)# portfolio sigma
    Results[i,N+3] <- ((t(weight) %*% meanret)-rfrt)/(sqrt(t(weight) %*% covmat %*% weight))# portfolio sharpe ratio
  }
  #Converting to data frame and preparing the output
  colnames(Results) <- c(ticks, "PortMean", "PortSigma","PortSharpeRatio")
  Results <- as.data.frame(Results)
  Port_Mean = Results[['PortMean']]
  
  #Putting the output in a list for the return function
  everything<-list(ticks,meanret,covmat,Results)
  return(everything)
}
#Calling the function
Result<- myMeanVarPort(ticks,start1,end1,0)

Result1<-Result[4]

#Selecting the portfolio with the highest Sharpe Ratio
max_sr <- Result1[[1]][which.max(Result1[[1]]$PortSharpeRatio),]
print(b)
#Generating the graph for the weights of the portfolio with the highest Sharpe Ratio
g1 <- max_sr %>%
  gather(GE:NVDA, key = Asset,
         value = Weights) %>%
  mutate(Asset = as.factor(Asset)) %>%
  ggplot(aes(x = fct_reorder(Asset,Weights), y = Weights, fill = Asset)) +
  geom_bar(stat = 'identity') +
  theme_minimal() +
  labs(x = 'Assets', y = 'Weights', title = "Optimal Portfolio Weights") +
  scale_y_continuous(labels = scales::percent) 

plot(g1)

#Generating the graph to show all the portfolios calculated and highlighting the optimal one
g2 <- Result1[[1]] %>%
  ggplot(aes(x = PortSigma, y = PortMean, color = PortSharpeRatio)) +
  geom_point() +
  theme_classic() +
  scale_y_continuous(labels = scales::percent) +
  scale_x_continuous(labels = scales::percent) +
  labs(x = 'Annualized Risk',
       y = 'Annualized Returns',
       title = "Portfolio Optimization") +
  geom_point(aes(x = PortSigma,
                 y = PortMean), data = max_sr, color = 'red') +
  annotate('text', x = 0.040, y = 0.023, label = "Optimal Portfolio",size=2.5) +
  annotate(geom = 'segment', x = 0.0421, xend = 0.04,  y = 0.0191, 
           yend = 0.022, color = 'red', arrow = arrow(type = "open")) 
plot(g2)



#Selecting the portfolio with the highest Sharpe Ratio
max_sr <- Results[which.max(Results$PortSharpeRatio),]

#Generating the graph for the weights of the portfolio with the highest Sharpe Ratio
g1 <- max_sr %>%
  gather(GE:NVDA, key = Asset,
         value = Weights) %>%
  mutate(Asset = as.factor(Asset)) %>%
  ggplot(aes(x = fct_reorder(Asset,Weights), y = Weights, fill = Asset)) +
  geom_bar(stat = 'identity') +
  theme_minimal() +
  labs(x = 'Assets', y = 'Weights', title = "Optimal Portfolio Weights") +
  scale_y_continuous(labels = scales::percent) 

#Generating the graph to show all the portfolios calculated and highlighting the optimal one
g2 <- Results %>%
  ggplot(aes(x = PortSigma, y = PortMean, color = PortSharpeRatio)) +
  geom_point() +
  theme_classic() +
  scale_y_continuous(labels = scales::percent) +
  scale_x_continuous(labels = scales::percent) +
  labs(x = 'Annualized Risk',
       y = 'Annualized Returns',
       title = "Portfolio Optimization") +
  geom_point(aes(x = PortSigma,
                 y = PortMean), data = max_sr, color = 'red') +
  annotate('text', x = 0.040, y = 0.023, label = "Optimal Portfolio",size=2.5) +
  annotate(geom = 'segment', x = 0.0421, xend = 0.04,  y = 0.0191, 
           yend = 0.022, color = 'red', arrow = arrow(type = "open")) 

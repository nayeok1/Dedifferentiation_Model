# install.packages('deSolve')

library(deSolve) 
# This is a didifferentiation model of cell lineage for ode model

state <- c(X0 = 1000, X1 =100)
# X0 - stem cell
# X1 - differentiated cell

parameters <- c(p = 1,gamma = 1, v0 = 1 , v1 =0.2, d0 = 0, d1 =0.4 , r1 =1)
# (p = 1,gamma = 1, v0 = 1 , v1 =0.2, d0 = 0, d1 =0.4 , r1 =1) #i.case1
# (p = 1,gamma = 1, v0 = 1 , v1 =0.2, d0 = 0, d1 =0.6 , r1 =0.1) #i.case2

# (p = 1,gamma = 1, v0 = 1 , v1 =0.1, d0 = 0.1, d1 =1 , r1 =0) #ii.case1
# (p = 1,gamma = 1, v0 = 1 , v1 =0.1, d0 = 0.1, d1 =11 , r1 =0) #ii.case1

# (p = 1,gamma = 1, v0 = 1 , v1 =0.5, d0 = 0.1, d1 =1 , r1 =0.2) #iii.case1
# (p = 1,gamma = 1, v0 = 1 , v1 =2, d0 = 15, d1 =11 , r1 =1.1) #iii.case3

# p - self renewal probability: feedback = p/(1+gamma*X1)
# v0 - division rate for X0
# v1 - division rate for X1
# d0 - death rate for X0
# d1 - death rate for X1
# r1 - dedifferentiation rate 

times <- seq(0, 10, by = 0.01)

Model <- function(t, state, parameters) {with(as.list(c(state, parameters)),
    {# rate of change 
      dX0 <- (2*p/(1+gamma*X1)-1)*v0*X0 - d0*X0 + r1*X1
      dX1 <- 2*(1-p/(1+gamma*X1))*v0*X0 + (v1-d1)*X1 - r1*X1
     # return the rate of change
      list(c(dX0, dX1))}) # end with(as.list ... 
}


out <- ode(y = state, times = times, func = Model, parms = parameters)

x <- out[,1] # time
y1 <- out[,2] # X0 population 
y2 <- out[,3] # X1 population
y3 <- out[,2]+out[,3]
df <- data.frame(x,y1,y2,y3)

require(ggplot2)
p <- ggplot(df, aes(x)) +                    
  geom_line(aes(y=y1), colour="red", show.legend= TRUE) + 
  geom_line(aes(y=y2), colour="blue", show.legend= TRUE) 
# + geom_line(aes(y=y3), colour="green", show.legend= TRUE)
 
p + labs(x = "time", y = "population", title = "Dedifferentiation Numerical Model") 


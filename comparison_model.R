#Comparison with cancer cell model 
setwd("~/Documents/Fall 2018/Eco Evo 282/Final Project")

# This is cancer model from the paper 
cancerplus <- read.csv(file="CD133+ xenografts.csv", header=TRUE, sep=",")
cancerminus <- read.csv(file="CD133- xenografts.csv", header=TRUE, sep=",")

# we need to convert the volume to number of cell 
# for the convertion we use pancreatic cell volume 5.24 X 10^-4

x <- cancerminus[,1]
y1 <- cancerplus[,2]/(1.15*10^(-5)*0.7+ 5.23*10^(-7)*0.3)
y2 <- cancerminus[,2]/(1.15*10^(-5))
dff <- data.frame(x,y2)

require(ggplot2)
p <- ggplot(dff, aes(x)) +   
  geom_line(aes(y=y1), colour="red", show.legend= TRUE) +
  geom_line(aes(y=y2), colour="blue", show.legend= TRUE) #only with differentiated cell

p + labs(x = "days after treatment", y = "population", title = "Tumor regression of xenograft")

library(deSolve) 
state <- c(X0 = 100, X1 =100000)
parameters <- c(p = 1,gamma = 1, v0 = 1 , v1 =7, d0 = 0.3, d1 =13, r1 =25)
times <- seq(0, 25, by = 0.01)
Model <- function(t, state, parameters) {with(as.list(c(state, parameters)),
      {# rate of change 
        dX0 <- (2*p/(1+gamma*X1)-1)*v0*X0 - d0*X0 + r1*X1
        dX1 <- 2*(1-p/(1+gamma*X1))*v0*X0 + (v1-d1)*X1 - r1*X1
        # return the rate of change
        list(c(dX0, dX1))}) # end with(as.list ... 
}
out1 <- ode(y = state, times = times, func = Model, parms = parameters)
x <- out1[,1]
y1 <- out1[,2]+out1[,3]

state <- c(X0 = 100, X1 =100000)
parameters <- c(p = 1,gamma = 1, v0 = 1 , v1 =8, d0 = 0.3, d1 =13, r1 =24)
times <- seq(0, 25, by = 0.01)
Model <- function(t, state, parameters) {with(as.list(c(state, parameters)),
        {# rate of change 
         dX0 <- (2*p/(1+gamma*X1)-1)*v0*X0 - d0*X0 + r1*X1
         dX1 <- 2*(1-p/(1+gamma*X1))*v0*X0 + (v1-d1)*X1 - r1*X1
         # return the rate of change
         list(c(dX0, dX1))}) # end with(as.list ... 
}
out2 <- ode(y = state, times = times, func = Model, parms = parameters)
x <- out2[,1]
y2 <- out2[,2]+out2[,3]
df <- data.frame(x,y1,y2)

require(ggplot2)
p <- ggplot(df, aes(x)) +                    
  geom_line(aes(y=y1), colour="blue", show.legend= TRUE) + 
  geom_line(aes(y=y2), colour="red", show.legend= TRUE) 

p + labs(x = "time", y = "population", title = "Tumor regression of xenograft ODE") 


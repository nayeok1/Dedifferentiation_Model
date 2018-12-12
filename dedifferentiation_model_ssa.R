#install.packages('GillespieSSA')

library(GillespieSSA)

# This is a didifferentiation model of cell lineage for ode model

state <- c(X0 = 100, X1 = 100)
# X0 - stem cell
# X1 - differentiated cell

parameters <- c(p = 1,gamma = 1, v0 = 1 , v1 =2, d0 = 15, d1 =11 , r1 =1.1)
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

func <- c("p/(1+gamma*X1)*v0*X0","v0*X0","d0*X0","r1*X1","v1*X1","d1*X1")

nu  <- matrix(c(+2,-1,-1,+1,0,0,-2,2,0,-1,+1,-1),nrow=2,byrow=TRUE)

out <- ssa(state, func, nu, parameters, tf=100, ignoreNegativeState=TRUE, simName="Dedifferentiation Stochastic Model")
ssa.plot(out)
out <- ssa(state, func, nu, parameters, tf=1000, method ="BTL",f = 50,ignoreNegativeState=TRUE, simName="Dedifferentiation Stochastic Model")
ssa.plot(out)
out <- ssa(state, func, nu, parameters, tf=10000,method ="ETL",tau = 0.001,ignoreNegativeState=TRUE, simName="Dedifferentiation Stochastic Model")
ssa.plot(out)


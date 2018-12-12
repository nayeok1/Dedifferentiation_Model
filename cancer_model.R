#install.packages('csvread')
setwd("~/Documents/Fall 2018/Eco Evo 282/Final Project")

# This is cancer model from the paper 
cancerplus <- read.csv(file="CD133+ xenografts.csv", header=TRUE, sep=",")
cancerminus <- read.csv(file="CD133- xenografts.csv", header=TRUE, sep=",")

x <- cancerplus[,1]
y1 <- cancerplus[,2]
y2 <- cancerminus[,2]
df <- data.frame(x,y1,y2)


require(ggplot2)
p <- ggplot(df, aes(x)) +                    
  geom_line(aes(y=y1), colour="red", show.legend= TRUE) + 
  geom_line(aes(y=y2), colour="blue", show.legend= TRUE) 
  
p + labs(x = "days after treatment", y = "tumor volume(mm^3)", title = "Tumor regression of pancreatic cancer xenograft") 
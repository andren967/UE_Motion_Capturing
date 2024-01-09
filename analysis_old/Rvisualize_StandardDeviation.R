setwd("C:/Users/andre/Documents/UNI/Master_Digital_Humanities/S1_WS2023/UE_Motion_Capture/")

df <- read.csv("deviation.csv", header=TRUE, sep=",")

df

aggregate(MusicMean ~ music, data = df, FUN = mean)

# Load ggplot2
# install.packages("ggplot2")
library(ggplot2)

# plot the point plot 
p<-ggplot(df[df$music == 'M1',], aes(x=music, y=StepMean, group=interaction(person, music))) +  
  geom_point(position=position_dodge(0.5))+ 
  geom_errorbar(aes(ymin=StepMean-std, ymax=StepMean+std), width=.5, 
                position=position_dodge(0.5))+
  geom_hline(yintercept = 67.55)
  #geom_hline(yintercept = 74.91)+
 #geom_hline(yintercept = 64.78) +
 # facet_wrap(~ music)

p
  

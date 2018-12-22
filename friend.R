library(ggplot2)
library(gridExtra)

pf <- read.csv('pseudo_facebook.tsv', sep = '\t')
ggplot(aes(x = friend_count), data = subset(pf, na.omit(gender))) + 
  geom_histogram() + 
  scale_x_continuous(limits = c(0,1000), breaks = seq(0, 1000, 50)) +
  facet_grid(~gender)

table(pf$dob_day)

by(pf$friend_count,pf$gender, summary)

ggplot(aes(x = tenure / 365), data = pf) + 
  geom_histogram(binwidth = .25, color = 'black', fill = '#099DD9') +
scale_x_continuous(breaks = seq(1, 7, 1), limits = c(0, 7)) + 
  xlab('Number of years using Facebook') + 
  ylab('Number of users in sample')

chart <- ggplot(aes(x = friend_count), data = pf) +
  geom_histogram(fill = '#5760AB')
  xlab("Idade") +
  ylab("Quantidade")

# log 10
chart_log10 <- chart + scale_x_log10()

# sqrt 

chart_sqrt <- chart +  scale_x_sqrt() 

grid.arrange(chart, chart_log10, chart_sqrt, nrow=3)

  
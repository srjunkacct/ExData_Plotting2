# load in data
library("dplyr")
library("ggplot2")
PM25 <- readRDS("summarySCC_PM25.rds")
baltimoreTable <- filter(PM25,fips=="24510")
# sum up total emissions grouped by type and year
emissions<-summarise(group_by(baltimoreTable,type,year),s=sum(Emissions))
# create and save the plot
p<-ggplot(emissions,aes(x=year,y=s,group=type,colour=type)) + geom_line() + labs(y="Total emissions") + ggtitle("Baltimore emissions by year")

ggsave(file="plot3.png")
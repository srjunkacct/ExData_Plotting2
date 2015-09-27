# load in data
library("dplyr")
library("ggplot2")
PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# read in codes for motor vehicle-based sources.  

motorCodes <- SCC$SCC[grepl("[mM]otor",SCC$Short.Name)]
motorTable <- PM25[PM25$SCC %in% motorCodes & PM25$fips %in% c("06037","24510"),]
motorTable <- replace(motorTable, motorTable == "06037", "Los Angeles")
motorTable <- replace(motorTable, motorTable == "24510", "Baltimore")
# sum up total emissions grouped by type and year
emissions<-summarise(group_by(motorTable,city=fips,year),s=sum(Emissions))
# create and save the plot
ggplot(emissions,aes(x=year,y=s,group=city,colour=city)) + geom_line() + labs(x="year",y="Total emissions") + ggtitle("Motor vehicle emissions by year")

ggsave(file="plot6.png")


     
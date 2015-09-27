# load in data
library("dplyr")
PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# read in codes for motor vehicle-based sources
coalCodes <- SCC$SCC[grep("[cC]oal",SCC$Short.Name)]
coalTable <- PM25[PM25$SCC %in% coalCodes,]

# sum up total emissions grouped by type and year
emissions<-summarise(group_by(coalTable,year),s=sum(Emissions))
# create and save the plot
plot(emissions,xlab='year',ylab='Total emissions', main='Coal-based emissions in the US')
dev.copy(png,'plot4.png',width=480,height=480)
dev.off()

     
# load in data
library("dplyr")
PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# read in codes for motor vehicle-based sources
motorCodes <- SCC$SCC[grep("[mM]otor",SCC$Short.Name)]
motorTable <- PM25[PM25$SCC %in% motorCodes & PM25$fips=="24510",]

# sum up total emissions grouped by type and year
emissions<-summarise(group_by(motorTable,year),s=sum(Emissions))
# create and save the plot
plot(emissions,xlab='year',ylab='Total emissions', main='Motor vehicle-based emissions in Baltimore')
dev.copy(png,'plot5.png',width=480,height=480)
dev.off()

     
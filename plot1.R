# load in data
library("dplyr")
PM25 <- readRDS("summarySCC_PM25.rds")

# sum up total emissions by year
emissionsByYear <- summarise(group_by(PM25,year),sum(Emissions))

# create and save the plot
plot(emissionsByYear, ylab="Total Emissions")
dev.copy(png,'plot1.png',width=480,height=480)
dev.off()
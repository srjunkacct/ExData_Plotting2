# load in data
library("dplyr")
PM25 <- readRDS("summarySCC_PM25.rds")

# extract Baltimore subtable
baltimoreTable <- filter(PM25, fips=="24510")

# sum up total emissions by year
baltimoreEmissionsByYear <- summarise(group_by(baltimoreTable,year),sum(Emissions))

# create and save the plot
baltimoreEmissionsPlot <- plot(baltimoreEmissionsByYear, ylab="Total Emissions", main="Baltimore Emissions")
dev.copy(png,'plot2.png',width=480,height=480)
dev.off()
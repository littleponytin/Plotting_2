## This first line will likely take a few seconds. Be patient!
setwd("~/1Wendy/Data Science Course/Exploratory Data Analysis/Week 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get Coal combustion related data only
CoalData = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge two data sets
mergeData <- merge(x=NEI, y=CoalData, by='SCC')
finalData <- aggregate(mergeData[, 'Emissions'], by=list(mergeData$year), sum)
colnames(finalData) <- c('Year', 'Emissions')


par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "plot4.png", width = 480, height = 480, units = "px")

plot(finalData, type = "l", xlab = "Year", 
     main = "Total Emissions From Coal Combustion-related\n Sources from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()

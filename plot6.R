## This first line will likely take a few seconds. Be patient!
setwd("~/1Wendy/Data Science Course/Exploratory Data Analysis/Week 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get data for Baltimore and LA 
filterData <- NEI[NEI$fips == "24510"|NEI$fips == "06037", ]

#Get Motor vehicles sources only
MotorData = SCC[grepl("Motor", SCC$Short.Name, ignore.case=TRUE),]

# Merge Motor Vehicles and LA data sets
mergeData <- merge(x=filterData, y=MotorData, by='SCC')
finalData <- aggregate(mergeData[, 'Emissions'], by=list(mergeData$year), sum)
colnames(finalData) <- c('Year', 'Emissions')

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "plot6.png", width = 480, height = 480, units = "px")

library(ggplot2)
MotorData = SCC[grepl("Motor", SCC$Short.Name, ignore.case=TRUE),]
MotorData <- filterData[filterData$SCC %in% MotorData$SCC, ]

g <- ggplot(MotorData, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") + ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Comparison of emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008") +
  scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))

dev.off()
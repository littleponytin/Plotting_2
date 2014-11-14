## This first line will likely take a few seconds. Be patient!
setwd("~/1Wendy/Data Science Course/Exploratory Data Analysis/Week 2")
NEI <- readRDS("summarySCC_PM25.rds")

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "plot1.png", width = 480, height = 480, units = "px")

totalEmissions <- aggregate(NEI$Emissions, list(NEI$year), FUN = "sum")

totalEmissions$PM <- round(totalEmissions[,2]/1000,2)

plot(totalEmissions$Group.1, totalEmissions$PM, type = "l", xlab = "Year", main = "Total Emissions in the United States from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission in kilotons"))

dev.off()


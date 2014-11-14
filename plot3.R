## This first line will likely take a few seconds. Be patient!
setwd("~/1Wendy/Data Science Course/Exploratory Data Analysis/Week 2")
NEI <- readRDS("summarySCC_PM25.rds")

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "plot3.png", width = 480, height = 480, units = "px")

filterNEI <- NEI[NEI$fips == "24510",]

library(ggplot2)
g <- ggplot(filterNEI, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")

dev.off()
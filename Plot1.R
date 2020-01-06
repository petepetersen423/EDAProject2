# QUESTION 1:
#  Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#  Using the base plotting system, make a plot showing the total PM2.5 emission from 
#  all sources for each of the years 1999, 2002, 2005, and 2008.

library(dplyr)
# Read emissions dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Read emission source classification dataset
SCC <- readRDS("Source_Classification_Code.rds")

# Get the total emissions by year using DPLYR

 SummaryNEI <- group_by(NEI, year) %>%
  summarize(Total = sum(Emissions))
# Open png device
 
#OPen the PNG Device 
png(filename='plot1.png', width=480, height=480, units='px')


with(SummaryNEI, {
  plot(year, Total/1000000, type = 'l',  
       xlab="Year",
       ylab='Emissions (tons in millions)',
       main='PM2.5 Emissions')
})

# Close png device
dev.off()
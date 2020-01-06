
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
## (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot 
## answering this question.

library(dplyr)
# Read emissions dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Read emission source classification dataset
SCC <- readRDS("Source_Classification_Code.rds")

# Get the total emissions by year using DPLYR
# Get the emissions in Baltimore City

SummaryNEI <- group_by(NEI[emissions.df$fips == '24510', ], year) %>%
  summarize(Total = sum(Emissions))
# Open png device

#OPen the PNG Device 
png(filename='plot2.png', width=480, height=480, units='px')


with(SummaryNEI, {
  plot(year, Total, type = "l",  
       xlab="Year",
       ylab="Emissions (tons)",
       main="Baltimore PM2.5 Emissions")
})

# Close png device
dev.off()
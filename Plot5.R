#  How have emissions from motor vehicle sources 
#  changed from 1999–2008 in Baltimore City?

library(dplyr)

# Read emissions dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Read emission source classification dataset
SCC <- readRDS("Source_Classification_Code.rds")

# Get the total emissions by year using DPLYR

SummaryNEI <- group_by(NEI[emissions.df$type == 'ON-ROAD'
                         & emissions.df$fips == '24510', ], year) %>%
  summarize(Total = sum(Emissions))
# Open png device

#OPen the PNG Device 
png(filename='plot5.png', width=480, height=480, units='px')

options(scipen=10)
with(SummaryNEI, {
  plot(year, Total, type = 'l',  
       xlab="Year", ylab="Emissions (tons)",
       main="Emissions from motor vehicle in Baltimore")
})

# Close png device
dev.off()
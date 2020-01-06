#Compare emissions from motor vehicle sources in Baltimore City with 
#emissions from motor vehicle sources in Los Angeles County, California 
# fips=="06037". 
# Which city has seen greater changes over time in motor vehicle emissions?

library(dplyr)
library(ggplot2)

# Read emissions dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Read emission source classification dataset
SCC <- readRDS("Source_Classification_Code.rds")

# Get the total emissions by year using DPLYR

SummaryNEI <- group_by(NEI[emissions.df$type == 'ON-ROAD'
                           & emissions.df$fips == '24510'|
                             emissions.df$type == 'ON-ROAD'
                           & emissions.df$fips == '06037' 
                             , ], year, fips) %>%
  summarize(Total = sum(Emissions))
# Open png device

#Open the PNG Device 
png(filename='plot6.png', width=480, height=480, units='px')

options(scipen=10)
plot6 <- qplot(year, Total, data=SummaryNEI, facets = . ~ fips) +  
  geom_line() +
  xlab("Year") +
  ylab("Emissions (tons)") +
  ggtitle("TotalPM2.5 in Los Angeles(06037) and Baltimore(24510)")

print(plot6)
# Close png device
dev.off()
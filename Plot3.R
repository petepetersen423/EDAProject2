## Of the four types of sources indicated by the type (point, nonpoint, 
## onroad, nonroad) variable, which of these four sources have seen decreases in emissions 
## from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

library(dplyr)
library(ggplot2)
# Read emissions dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Read emission source classification dataset
SCC <- readRDS("Source_Classification_Code.rds")

# Get the total emissions by year using DPLYR
# Get the emissions in Baltimore City

SummaryNEI <- group_by(NEI, year,type) %>%
  summarize(Total = sum(Emissions))
# Open png device

#OPen the PNG Device 
png(filename='plot3.png', width=480, height=480, units='px')

options(scipen=10)
plot3 <- qplot(year, Total, data=SummaryNEI, facets = . ~ type) +  geom_line() 
  + xlab("Year") +
  ylab('PM2.5 Emissions (tons)') +
  ggtitle('Emissions by Type')

print(plot3)

# Close png device
dev.off()
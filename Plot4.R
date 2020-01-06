#  Across the United States, how have emissions from coal combustion-related
#  sources changed from 1999–2008?

library(dplyr)

# Read emissions dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Read emission source classification dataset
SCC <- readRDS("Source_Classification_Code.rds")

# Get the total emissions by year using DPLYR
# Get the emissions in Baltimore City
SCC.coal <- SCC[grep('coal', scc.df$Short.Name), ]

SummaryNEI <- group_by(NEI[NEI$SCC %in% SCC.coal$SCC, ], year) %>%
  summarize(Total = sum(Emissions))
# Open png device

#OPen the PNG Device 
png(filename='plot4.png', width=480, height=480, units='px')

options(scipen=10)
with(SummaryNEI, {
  plot(year, Total, type = 'l',  
       xlab="Year",
       ylab='Emissions (tons in millions)',
       main='PM2.5 Emissions from Coal'
       )
})

# Close png device
dev.off()
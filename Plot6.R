NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC<-merge(NEI, SCC, by="SCC")
validData<-NEISCC[(NEISCC$fips=="24510" | NEISCC$fips=="06037") & NEISCC$type=="ON-ROAD",]
aggregateddata<-aggregate(Emissions ~ year + fips, validData, sum)
g<-ggplot(aggregateddata, aes(factor(year), Emissions))
g<-g+geom_point()
print(g)
dev.copy(png,"Plot6.R")
dev.off()

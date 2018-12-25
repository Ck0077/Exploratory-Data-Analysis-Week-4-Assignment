NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC<-merge(NEI, SCC, by="SCC")
coal_combustion<-grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
validData<-NEISCC[coal_combustion,]
aggregateddata<-aggregate(Emissions~year, validData, sum)
g<-ggplot(aggregateddata, aes(factor(year), Emissions))
g<-g+geom_point()
print(g)
dev.copy(png,"Plot4.R")
dev.off()
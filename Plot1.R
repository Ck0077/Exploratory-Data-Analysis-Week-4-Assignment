NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total_emmission<-group_by(NEI, year) %>% summarise(total=sum(Emissions))

png("Plot1.png")
with(total_emmission, plot(year, total, pch=20))
dev.off()
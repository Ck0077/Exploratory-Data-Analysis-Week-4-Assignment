NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total_emmission_baltimore<-NEI %>% subset(fips=="24510") %>% group_by(year) %>% summarise(total=sum(Emissions, na.rm = TRUE))

png("Plot1.png")
with(total_emmission_baltimore, plot(year, total, pch=20))
dev.off()
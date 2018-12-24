NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total_emmission_baltimore_type<-NEI %>% subset(fips=="24510") %>% group_by(year,type) %>% summarise(total=sum(Emissions, na.rm = TRUE))
ggplot_emission_type<- ggplot(total_emmission_baltimore_type, aes(year, total))
ggplot_emission_type + geom_point()+facet_grid(.~type)

dev.copy(png, "Plot3.png")
dev.off()
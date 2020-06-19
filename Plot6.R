## This solution uses the "downloader" package from CRAN. If you already have it loaded,
## then please ignore the next section.
##########
install.packages("downloader")
library(downloader)
##########

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(url, dest="dataset.zip", mode="wb")
unzip("dataset.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##########
install.packages("dplyr")
library(dplyr)
library(ggplot2)
##########

F <- filter(NEI, type == "ON-ROAD", fips %in% c("06037", "24510"))
F$fips <- factor(F$fips, levels = c("06037", "24510"), 
                 labels = c("Los Angeles County", "Baltimore City"))

g <- ggplot(F, aes(year, Emissions))
g + geom_point(color = "steelblue", size = 2, alpha = 1/3) +
  geom_smooth(method="lm") + facet_grid(.~fips) +
  theme(strip.text.y = element_text(size = 7)) +
  coord_cartesian(ylim = c(0, 750)) + 
  theme(plot.title = element_text(size = 10)) + xlab("Year") +
  ggtitle("Annual Motor Vehicle PM25 Emmisions - Los Angeles County vs. Baltimore City")
      


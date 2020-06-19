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

B <- filter(NEI, fips == "24510")
C1 <- filter(B, type == "POINT")
C2 <- filter(B, type == "NONPOINT")
C3 <- filter(B, type == "ON-ROAD")
C4 <- filter(B, type == "NON-ROAD")

g <- ggplot(B, aes(year, Emissions))
g + geom_point(color = "steelblue", size = 2, alpha = 1/2) + facet_grid(type~.) +
  ylab(label = "PM25 Emmisions") + theme(strip.text.y = element_text(size = 7), axis.text.y = element_text(size = 8)) +
  geom_smooth(method = "lm", color = "green", se=FALSE, alpha = 2/3) +
  coord_cartesian(ylim = c(0, 500), xlim = c(1999, 2008)) + ggtitle("Annual Emmisions of PM25 - Baltimore City")
  
  




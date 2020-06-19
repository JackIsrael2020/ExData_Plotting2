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

E <- filter(NEI, type == "ON-ROAD", fips == "24510")

g <- ggplot(E, aes(year, Emissions))
g + geom_point(color = "steelblue", size = 2, alpha = 1/3) +
  geom_smooth(method="lm") + xlab("Year") +
  ggtitle("Annual Motor Vehicle PM25 Emmisions - Baltimore City")
      

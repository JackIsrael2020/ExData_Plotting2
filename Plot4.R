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

q <- grep("Coal", unique(SCC$SCC.Level.Three))
C <- unique(SCC$SCC.Level.Three)[q][c(1:7, 11)]
dx <- filter(SCC, SCC.Level.Three %in% C)
dy <- dx$SCC
D <- filter(NEI, SCC %in% dy)

g <- ggplot(D, aes(year, Emissions))
g + geom_point(color = "steelblue", size = 2, alpha = 1/30) +
  geom_smooth(method = "lm") + coord_cartesian(ylim = c(0, 500)) +
  ggtitle("Annual USA Emmisions From Coal Combustion (& Related Sources)") +
  theme(plot.title = element_text(size = 10)) + xlab("Year")



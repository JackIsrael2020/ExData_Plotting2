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
##########

A1 <- filter(NEI, year == 1999)
A2 <- filter(NEI, year == 2002)
A3 <- filter(NEI, year == 2005)
A4 <- filter(NEI, year == 2008)
x1 <- sum(A1$Emissions)
x2 <- sum(A2$Emissions)
x3 <- sum(A3$Emissions)
x4 <- sum(A4$Emissions)
years <- c(1999, 2002, 2005, 2008)
year_emmisions <- c(x1, x2, x3, x4)

plot(x = years, y = year_emmisions, yaxt = "none", xlab = "Year", type = "b", lwd = 2,
     lty = 2, ylab = "Annual Emmisions of PM25 - All Sources", ylim = c(3000000, 8000000))
axis(2 , seq(3000000, 8000000, 500000), las=2, font = 4, cex.axis = 0.5)


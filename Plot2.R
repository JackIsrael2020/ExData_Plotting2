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

B <- filter(NEI, fips == "24510")
years <- c(1999, 2002, 2005, 2008)
y1 <- sum(filter(B, year == 1999)$Emissions)
y2 <- sum(filter(B, year == 2002)$Emissions)
y3 <- sum(filter(B, year == 2005)$Emissions)
y4 <- sum(filter(B, year == 2008)$Emissions)
BaltEmmisions <- c(y1, y2, y3, y4)
plot(x = years, y = BaltEmmisions, yaxt="none", xlab = "Year", type = "b", lwd = 2, pch=20, 
     lty = 2, ylab = "Annual Emmisions of PM25 - Baltimore City", ylim = c(1800, 3400))
axis(2 , seq(1800, 3400, 200), las=2, cex.axis = 0.8)




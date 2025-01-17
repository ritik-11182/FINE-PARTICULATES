library(ggplot2)
a <- readRDS("summarySCC_PM25.rds")
b <- readRDS("Source_Classification_Code.rds")
motor <- grep("Vehicles", b$EI.Sector, ignore.case = TRUE, value = TRUE)
motor1 <- subset(b, b$EI.Sector %in% motor)
baltimore <- subset(a, a$fips == 24510)
motor2 <- subset(baltimore, SCC %in% motor1$SCC)
angeles <- subset(a, a$fips == 06037)
m2 <- subset(angeles, SCC %in% motor1$SCC)
png("sccplot6.png")
par(mfrow = c(1,2), mar = rep(0.2, 4))
ggplot(data = motor2, aes(year, Emissions, fill = type)) + geom_bar(stat = "identity", position = "dodge")+
  ggtitle("Baltimore: motor vehicle PM2.5 emission from 1999-2008")
ggplot(data = m2, aes(year, Emissions, fill = type)) + geom_bar(stat = "identity", position = "dodge")+
  ggtitle("Los angeles: motor vehicle PM2.5 emission from 1999-2008") 
dev.off()
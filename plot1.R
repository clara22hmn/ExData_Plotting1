setwd("C:/Users/MHuang/Google Drive/Coursera/Data Science Specialization_JHU/Exploratory Data Analysis")
rm(list=ls())

dat <- read.table(file="household_power_consumption.txt", header=T, sep=";", na.strings="?")
head(dat)
dat <- dat[which(dat$Date=="1/2/2007" | dat$Date=="2/2/2007"),]
dat$DateTime <- paste0(dat$Date, " ", dat$Time)
dat$DateTime <- strptime(dat$DateTime, format="%d/%m/%Y %H:%M:%S")

summary(dat$Global_active_power)

with(dat, hist(Global_active_power, col="red", xlim=c(0,7.5), ylim=c(0,1200), axes=F,
     main="Global Active Power", xlab="Global Active Power (kilowatts)"))
axis(side=1, at=seq(0,6,by=2))
axis(side=2, at=seq(0,1200,by=200))
dev.copy(png, file=paste0(getwd(),"/ExData_Plotting1/","plot1.png"), width=480, height=480)
dev.off()

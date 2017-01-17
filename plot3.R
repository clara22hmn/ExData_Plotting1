setwd("C:/Users/MHuang/Google Drive/Coursera/Data Science Specialization_JHU/Exploratory Data Analysis")
rm(list=ls())

dat <- read.table(file="household_power_consumption.txt", header=T, sep=";", na.strings="?")
head(dat)
dat <- dat[which(dat$Date=="1/2/2007" | dat$Date=="2/2/2007"),]
dat$DateTime <- paste0(dat$Date, " ", dat$Time)
dat$DateTime <- strptime(dat$DateTime, format="%d/%m/%Y %H:%M:%S")

summary(dat$Sub_metering_1)
summary(dat$Sub_metering_2)
summary(dat$Sub_metering_3)

with(dat, plot(DateTime, Sub_metering_1, type="l", col="black", ylim=c(0,38), yaxt="n",
               xlab="", ylab="Energy sub metering"))
with(dat, lines(DateTime, Sub_metering_2, type="l", col="red"))
with(dat, lines(DateTime, Sub_metering_3, type="l", col="blue"))
axis(side=2, at=seq(0,30,by=10))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), col=c("black","red","blue"), cex=0.75)
dev.copy(png, file=paste0(getwd(),"/ExData_Plotting1/","plot3.png"), width=480, height=480)
dev.off()

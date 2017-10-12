t1 <- read.table("household_power_consumption.txt", 
                header=TRUE, sep=";", stringsAsFactors = FALSE)

t2 <- filter(t1, Date == "2/2/2007" | Date == "1/2/2007")
t2 <- mutate(t2, Date_Time = paste(Date, Time, sep = " "))
t2$Date_Time <- strptime(t2$Date_Time, "%d/%m/%Y %H:%M:%S")
t2[, 3:9] <- lapply(t2[, 3:9], as.numeric)
t2 <- dataFil[, c(10, 3:9)]

colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
#Plot 1{
hist(t$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
cat("Plot1.png has been saved in", getwd())
}
plot1() 

plot2 <- function() {
plot(t2$Date_Time, t2$Global_active_power, type = "l",
    ylab = "Global Active Power (kilowatts)", xlab = "")
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("plot2.png has been saved in", getwd())
}
plot2()  
  
 plot3<- function() {
   plot(t2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
   lines(t2$Sub_metering_2,col="red")
   lines(t2$Sub_metering_3,col="blue")
   legend("topright", col=c("black","red","blue"), c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
cat("plot3.png has been saved in", getwd())
}
plot3()

plot4 <- function() {
par(mfrow = c(2,2))
##plot1
plot(t2$Date_Time, t2$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab = "")
##plot2
plot(t2$Date_Time, t2$Voltage, type = "l",
     ylab = "Voltage", xlab = "")
##plot3
plot(t2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(t2$Sub_metering_2,col="red")
lines(t2$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "),lty=c(1,1), lwd=c(1,1))
##4
plot(t2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

cat("plot4.png has been saved in", getwd())
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
}
plot4()
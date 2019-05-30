#
# plot4.R
#
hpc <-
  read.csv("household_power_consumption.txt",
           sep = ";",
           stringsAsFactors = FALSE)
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc <- subset(hpc, hpc$Date == "2007-02-01" |
                hpc$Date == "2007-02-02")
hpc$Time <-
  strptime(paste(hpc$Date, hpc$Time), format = "%Y-%m-%d %H:%M:%S")
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$Global_reactive_power <- as.numeric(hpc$Global_reactive_power)
hpc$Voltage <- as.numeric(hpc$Voltage)
hpc$Global_intensity <- as.numeric(hpc$Global_intensity)
hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)

png("plot4.png")

par(mfrow=c(2,2))

plot(
  hpc$Time,
  hpc$Global_active_power,
  type = "l",
  ylab = "Global Active Power (kilowatts)",
  xlab = ""
)

plot(
  hpc$Time,
  hpc$Voltage,
  type = "l",
  ylab = "Voltage",
  xlab = "datetime"
)

plot(
  hpc$Time,
  hpc$Sub_metering_1,
  type = "n",
  xlab = "",
  ylab = "Energy sub metering"
)
lines(hpc$Time, hpc$Sub_metering_1, col = "black")
lines(hpc$Time, hpc$Sub_metering_2, col = "red")
lines(hpc$Time, hpc$Sub_metering_3, col = "blue")
legend(
  "topright",
  lty = 1,
  col = c("black", "red", "blue"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

plot(
  hpc$Time,
  hpc$Global_reactive_power,
  type = "l",
  ylab = "Global_reactive_power",
  xlab = "datetime"
)

dev.off()

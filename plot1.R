# plot1.R
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

png("plot1.png")

hist(
  hpc$Global_active_power,
  main = "Global Active Power",
  col = "red",
  xlab = "Global Active Power (kilowats)"
)

dev.off()


# plot4.R - Multiple plots

# Read the data
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   na.strings = "?",
                   colClasses = c("character", "character", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", "numeric", "numeric"))

# Convert Date column
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset to required dates
subset_data <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

# Create DateTime column
subset_data$DateTime <- strptime(paste(subset_data$Date, subset_data$Time), 
                                 format = "%Y-%m-%d %H:%M:%S")

# Create PNG file
png("plot4.png", width = 480, height = 480)

# Set up 2x2 grid for plots
par(mfrow = c(2, 2))

# Plot 1: Top-left (Global Active Power)
plot(subset_data$DateTime, subset_data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# Plot 2: Top-right (Voltage)
plot(subset_data$DateTime, subset_data$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Plot 3: Bottom-left (Energy sub-metering)
plot(subset_data$DateTime, subset_data$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     col = "black")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

# Plot 4: Bottom-right (Global Reactive Power)
plot(subset_data$DateTime, subset_data$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

# Close PNG device
dev.off()

cat("plot4.png has been created successfully!\n")


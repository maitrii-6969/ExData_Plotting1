
# plot3.R - Energy sub-metering

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
png("plot3.png", width = 480, height = 480)

# Create plot with three sub-metering lines
plot(subset_data$DateTime, subset_data$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     col = "black")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")

# Add legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

# Close PNG device
dev.off()

cat("plot3.png has been created successfully!\n")


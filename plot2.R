
# plot2.R - Time series of Global Active Power

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
png("plot2.png", width = 480, height = 480)

# Create time series plot
plot(subset_data$DateTime, subset_data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Close PNG device
dev.off()

cat("plot2.png has been created successfully!\n")



# plot1.R - Histogram of Global Active Power

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

# Create PNG file
png("plot1.png", width = 480, height = 480)

# Create histogram
hist(subset_data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red",
     breaks = 12)

# Close PNG device
dev.off()

cat("plot1.png has been created successfully!\n")


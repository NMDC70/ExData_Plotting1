library(lubridate)
library(data.table)
mydatax <- suppressWarnings(fread("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?"))
# fread considerably speeds up performance but there are warnings due to "?" for missing values
mydata2 <- subset(mydatax, mydatax$Date == "1/2/2007" | mydatax$Date == "2/2/2007")
mydata2 <- as.data.frame(mydata2)
# I found it easier to convert the columns to numeric with data.frame rather than data.table
id <- c(3:8)
mydata2[,id] <- as.numeric(as.character(unlist(mydata2[,id])))
# columns 3 to 8 converted to numeric values
mydata2$date_time = dmy_hms(paste(mydata2$Date, mydata2$Time))
# new column created for date & time 
png(filename = "plot3.png")
# required 480x480 pixels is the default size
plot(mydata2$date_time, mydata2$Sub_metering_1,  col = "grey", type = "l", xlab = "", ylab = "Energy Sub Metering")
  lines(mydata2$date_time, mydata2$Sub_metering_2, type = "l", col = "red")
  lines(mydata2$date_time, mydata2$Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, lwd = 1 , col = c("grey", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
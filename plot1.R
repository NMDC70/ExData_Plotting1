library(data.table)
mydatax <- suppressWarnings(fread("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?"))
# fread considerably speeds up performance but there are warnings due to "?" for missing values
mydata2 <- subset(mydatax, mydatax$Date == "1/2/2007" | mydatax$Date == "2/2/2007")
mydata2 <- as.data.frame(mydata2)
# I found it easier to convert the columns to numeric with data.frame rather than data.table
id <- c(3:8)
mydata2[,id] <- as.numeric(as.character(unlist(mydata2[,id])))
# columns 3 to 8 converted to numeric values
png(filename = "plot1.png" )
# required 480x480 pixels is the default size
hist(mydata2$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", breaks = 15, main = "Global Active Power")
dev.off()







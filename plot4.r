path = file.choose() #"/Users/matiroqueta/Dropbox/Coursera Assignment/household_power_consumption.txt"
#df = fread(path,colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")
df = read.table(path,colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?", sep = ";", header = T)
df <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$datetime <- as.POSIXct(strptime(paste(df$Date,df$Time,sep=" "),format = "%Y-%m-%d %H:%M:%S"))

#plot4
png(filename =  "plot4.png", width = 480, height = 480,)

par(mfrow=c(2,2))

#subplot1
plot(x = df$datetime, y = df$Global_active_power, type = "l", col = "black",xlab = "", ylab = "Global Active Power (kilowatts)", main = "", bg = NA)

#subplot2
plot(x = df$datetime, y = df$Voltage, type = "l", col = "black",xlab = "datetime", ylab = "Voltage",  main = "", bg = NA)

#subplot3
plot(x = df$datetime, y = df$Sub_metering_1, type = "l", col = "black",xlab = "", ylab = "Energy sub metering", main = "", bg = NA)
points(x = df$datetime, y = df$Sub_metering_2, type = "l", col = "red")
points(x = df$datetime, y = df$Sub_metering_3, type = "l", col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),
       lty=1,bty = "n")

#subplot4
plot(x = df$datetime, y = df$Global_reactive_power, type = "l", col = "black",xlab = "datetime", ylab = "Global_reactive_power",  main = "", bg = NA)

dev.off()
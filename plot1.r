path = file.choose() #"/Users/matiroqueta/Dropbox/Coursera Assignment/household_power_consumption.txt"
#df = fread(path,colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")
df = read.table(path,colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?", sep = ";", header = T)
df <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$datetime <- as.POSIXct(strptime(paste(df$Date,df$Time,sep=" "),format = "%Y-%m-%d %H:%M:%S"))

#plot1

png(filename =  "plot1.png", width = 480, height = 480,)
hist(x = df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", bg = NA)
dev.off()


#Downloading the file, unzipping and saving the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "electricpower.zip", method="curl")
unzip("electricpower.zip")
rawData <- "household_power_consumption.txt"

#Subsetting the data
data <- read.table(rawData, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?",
                   quote="",comment.char="") 
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

data$DateTime <- as.POSIXlt(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Opening the graphic device, creating the plot and saving it in png
png(file="plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, 
     type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
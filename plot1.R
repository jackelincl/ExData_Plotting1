#Downloading the file, unzipping and saving the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "electricpower.zip", method="curl")
unzip("electricpower.zip")
rawData <- "household_power_consumption.txt"

#Subsetting the data
data <- read.table(rawData, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?",
                   quote="",comment.char="") 
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Opening the graphic device, creating the histogram and saving it in png
png(file="plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", main="Global Active Power")
dev.off()
##Read in the dataset
dataset<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")

##Convert the Date variable to Date class
dataset$Date<-as.Date(dataset$Date, format="%d/%m/%Y")

##Take only the data from 2007-02-01 and 2007-02-02
subdataset<-subset(dataset,subset=(Date>="2007-02-01" & Date<="2007-02-02"))

##Convert the Date and Time variables to Date/Time classes
subdataset$DateTime<-strptime(paste(subdataset$Date,subdataset$Time), "%Y-%m-%d %H:%M:%S")

##Convert the DateTime variable to POSIXct
subdataset$DateTime<-as.POSIXct(subdataset$DateTime)

##Make the second plot
##Outline the plot details
plot(Global_active_power ~ DateTime,type="l",ylab="Global Active Power (kilowatts)",xlab="")

##Save the plot output
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()


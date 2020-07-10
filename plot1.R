##Read in the dataset
dataset<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")

##Convert the Date variable to Date class
dataset$Date<-as.Date(dataset$Date, format="%d/%m/%Y")

##Take only the data from 2007-02-01 and 2007-02-02
subdataset<-subset(dataset,subset=(Date>="2007-02-01" & Date<="2007-02-02"))

##Convert the Date and Time variables to Date/Time classes
subdataset$DateTime<-strptime(paste(subdataset$Date,subdataset$Time), "%Y-%m-%d %H:%M:%S")

##Make the first plot
##Attach the dataset
attach(subdataset)
##Outline the histogram details
hist(Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

##Save the histogram output
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()
#Exploratory Data Analysis

#project 1

#Reading the data

household_data<- read.csv("C:/Users/Maria/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";")

#Data Discription

head(household_data)
str(household_data)
names(household_data)

#Subsetting the data

subset_data<-subset(household_data,Date %in% c("1/2/2007","2/2/2007"))
View(subset_data)
#Converting date format
subset_data$Date <- as.Date(subset_data$Date, format="%Y/%m/%d")
subset_data$Date
str(subset_data)

#Plot4

#Converting time format
subset_data$Time <- strptime(subset_data$Time, format="%H:%M:%S")
subset_data$Time
subset_data[1:1440,"Time"] <- format(subset_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset_data[1441:2880,"Time"] <- format(subset_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

par(mfrow=c(2,2),mar=c(4,4,2,1))
with(subset_data,{
  plot(subset_data$Time,as.numeric(subset_data$Global_active_power),type="l",xlab="",ylab="Global Active Power")  
  plot(subset_data$Time,as.numeric(subset_data$Voltage), type="l",xlab="datetime",ylab="Voltage")
  plot(subset_data$Time,subset_data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subset_data,lines(Time,as.numeric(Sub_metering_1)))
  with(subset_data,lines(Time,as.numeric(Sub_metering_2),col="red"))
  with(subset_data,lines(Time,as.numeric(Sub_metering_3),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.55)
  plot(subset_data$Time,as.numeric(subset_data$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.copy(png, filename="plot4.png",width=480, height=480)
dev.off()

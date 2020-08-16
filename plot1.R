#Exploratory Data Analysis

#project 1

#Reading the data

household_data <- read.csv("C:/Users/Delfy/AppData/Local/Temp/household_power_consumption_BnBqyT.txt", header=TRUE, sep=";")

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

#Plot1

#Converting the Global_active_power variable to numeric
subset_data$Global_active_power<-as.numeric(subset_data$Global_active_power)
hist(subset_data$Global_active_power,main = "Global Active Power",col="red",xlab="Global Active Power(kilowatts)")
dev.copy(png, filename="plot1.png",width=480, height=480)
dev.off()



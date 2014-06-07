#reads and subsets the data down to the two pertinent days
data<-read.table("household_power_consumption.txt",sep=";",header=T,colClasses="character")
date<-data$Date
date<-date=="1/2/2007" | date=="2/2/2007"
data<-split(data,date)
data<-data[["TRUE"]]

#creates a vector with the date and time for the x-axis
data$Date[data$Date=="1/2/2007"]="2007-2-1"
data$Date[data$Date=="2/2/2007"]="2007-2-2"
x<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

y<-as.numeric(data$Global_active_power)

png("plot2.png")
plot(x,y,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()


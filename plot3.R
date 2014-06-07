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

y1<-as.numeric(data$Sub_metering_1)
y2<-as.numeric(data$Sub_metering_2)
y3<-as.numeric(data$Sub_metering_3)

png("plot3.png")
plot(x,y1,type="l",ylab="Energy sub metering",xlab="")
lines(x,y2,type="l",col="red")
lines(x,y3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
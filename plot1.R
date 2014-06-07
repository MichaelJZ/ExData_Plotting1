#reads and subsets the data down to the two pertinent days
data<-read.table("household_power_consumption.txt",sep=";",header=T,colClasses="character")
date<-data$Date
date<-date=="1/2/2007" | date=="2/2/2007"
data<-split(data,date)
data<-data[["TRUE"]]

png("plot1.png")
x<-as.numeric(data$Global_active_power)
hist(x,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()


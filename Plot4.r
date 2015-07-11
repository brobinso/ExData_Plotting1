# Plot4.r
# set up the classes to speed up the read.table op
classes<-c(rep("character",2),rep("numeric",7))
pow<-read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F,na.strings="?",colClasses=classes)
# re-class the date column
pow$Date<-as.Date(pow$Date,format="%d/%m/%Y")
# subset out the 2 days of data we want to work with
df<-pow[pow$Date %in% as.Date(c('2007-02-01','2007-02-02')),]
# prepare plot params and graph it
png(file="plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
with(df,plot(Global_active_power,ylab="Global Active Power",xaxt="n",type="l",xlab=""))
axis(1,c(1,1440,2880),c("Thu","Fri","Sat"))
plot(Voltage,ylab="Voltage",xlab="datetime",xaxt="n",type="l")
axis(1,c(1,1440,2880),c("Thu","Fri","Sat"))
plot(Sub_metering_1,type="l",ylab="Energy sub metering",xaxt="n",xlab="")
lines(Sub_metering_2,col="red")
lines(Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="___")
axis(1,c(1,1440,2880),c("Thu","Fri","Sat"))
plot(Global_reactive_power,xaxt="n",type="l",xlab="datetime")
axis(1,c(1,1440,2880),c("Thu","Fri","Sat"))
dev.off()
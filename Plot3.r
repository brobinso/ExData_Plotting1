# Plot3.r
classes<-c(rep("character",2),rep("numeric",7))
pow<-read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F,na.strings="?",colClasses=classes)
# re-class the date column
pow$Date<-as.Date(pow$Date,format="%d/%m/%Y")
# subset out the 2 days of data we want to work with
df<-pow[pow$Date %in% as.Date(c('2007-02-01','2007-02-02')),]
# prepare plot params and graph it
png(file="plot3.png",width = 480, height = 480)
par(mar=c(4,4,2,1))
attach(df)
plot(Sub_metering_1,type="l",ylab="Energy sub metering",xaxt="n",xlab="")
lines(Sub_metering_2,col="red")
lines(Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="____")
axis(1,c(1,1440,2880),c("Thu","Fri","Sat"))
dev.off()
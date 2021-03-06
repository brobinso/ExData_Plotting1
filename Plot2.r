# Plot2.r
setwd("C:/Documents and Settings/brian.robinson/ExData_Plotting1")
classes<-c(rep("character",2),rep("numeric",7))
pow<-read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F,na.strings="?",colClasses=classes)
# re-class the date column
pow$Date<-as.Date(pow$Date,format="%d/%m/%Y")
# subset out the 2 days of data we want to work with
df<-pow[pow$Date %in% as.Date(c('2007-02-01','2007-02-02')),]
# prepare plot params and graph it
png(file="plot2.png",width = 480, height = 480)
with(df,plot(Global_active_power,type="l",ylab="Global active power (kilowatts)",xaxt="n",xlab=""))
axis(1,c(1,1440,2880),c("Thu","Fri","Sat"))
dev.off()
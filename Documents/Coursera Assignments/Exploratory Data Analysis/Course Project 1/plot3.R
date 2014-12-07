plot3 <-plot(x=(subdatacsv$Date),y=subdatacsv$Sub_metering_1,type="l",ylab="Energy sub metering", xlab ="")
lines(x=(subdatacsv$Date),y=subdatacsv$Sub_metering_2,col="red")
lines(x=(subdatacsv$Date),y=subdatacsv$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)

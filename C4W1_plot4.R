########
#Plot4
########
par(mfrow=c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(final_data, {
        plot(Global_active_power~dateTime, 
             type="l",
             ylab="Global Active Power (kilowatts)",
             xlab="",
             cex.lab=0.7)
        plot(Voltage~dateTime, 
             type="l",
             ylab="Voltage (volt)", 
             xlab="",
             cex.lab=0.7)
        plot(Sub_metering_1~dateTime, 
             type="l",
             ylab="Global Active Power (kilowatts)", 
             xlab="",
             cex.lab=0.7)
        lines(Sub_metering_2~dateTime,col="red")
        lines(Sub_metering_3~dateTime,col="blue")
        legend("topright", col=c("black","red","blue"),
               lty=1, 
               lwd=1, 
               bty="n",
               cex=0.5,
               pt.cex = 1,
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~dateTime, 
             type="l",
             ylab = "Global Rective Power (kilowatts)",
             xlab="",
             cex.lab=0.7)
})
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
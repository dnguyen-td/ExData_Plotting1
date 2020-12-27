########
#Plot2
########
plot(final_data$Global_active_power~final_data$dateTime, 
     type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
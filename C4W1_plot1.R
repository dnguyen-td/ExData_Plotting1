library(dplyr)
rm(list=ls())

## Subset a sample
my_data <- read.table("household_power_consumption.txt",
                      header = TRUE, sep = ";",
                      na.strings = "?",
                      colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y")
final_data <- my_data %>% dplyr::filter(Date>= as.Date("2007-2-1") &
                                        Date <= as.Date("2007-2-2"))

rm(my_data)

## Remove incomplete observation
final_data <- final_data[complete.cases(final_data),]

## Combine Date and Time column
dateTime <- paste(final_data$Date, final_data$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
final_data <- final_data[ ,!(names(final_data) %in% c("Date","Time"))]

## Add DateTime column
final_data <- cbind(dateTime, final_data)

## Format dateTime Column
final_data$dateTime <- as.POSIXct(dateTime)

########
#Plot1
########


hist(final_data$Global_active_power, col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()






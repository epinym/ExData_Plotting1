### Data Science Track
### Exploring Data
## Quiz 1 - plot 4 (includes 4 graphs)

## use local unix tools to strip down our data by issuing the following commands
## (remove the "#>" before issuing the commands):
#> grep "^[12]\/2\/2007" household_power_consumption.txt > hpc_2days_noheader.txt
#> head -1 household_power_consumption.txt > hpc_2days_headeronly.txt
#> cat hpc_2days_headeronly.txt hpc_2days_noheader.txt > hpc_2days.txt

library(data.table)
hpc <- fread("hpc_2days.txt", header=TRUE, sep=";")

# get into a workable date format
hpc <- transform(hpc, DateCT = strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S"))

# set up our 2 x 2 grid of graphs
par(mfrow = c(2, 2))

# graph 1 is from quiz 1 plot 2
with(hpc, plot(DateCT, Global_active_power, type="l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)"))

# graph 2 is new
with(hpc, plot(DateCT, Voltage, type="l", main = "", xlab = "datetime", ylab = "Voltage"))

# graph 3 is from quiz 1 plot 3
with(hpc, plot(DateCT, Sub_metering_1, type="n", main = "", ylab = "Entergy sub metering", xlab = ""))

with(hpc, {
        lines(x = DateCT, y = Sub_metering_1, type="l", col="black")
        lines(x = DateCT, y = Sub_metering_2, type="l", col="red")
        lines(x = DateCT, y = Sub_metering_3, type="l", col="blue")
})

# this is tricky
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, cex = 0.3)

# graph 4 is new
with(hpc, plot(DateCT, Global_reactive_power, type="l", main = "", xlab = "datetime", ylab = "Global_reactive_power"))

dev.copy(png, "plot4.png")
dev.off()

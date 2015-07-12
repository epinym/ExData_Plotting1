### Data Science Track
### Exploring Data
## Quiz 1 - plot 3

## use local unix tools to strip down our data by issuing the following commands
## (remove the "#>" before issuing the commands):
#> grep "^[12]\/2\/2007" household_power_consumption.txt > hpc_2days_noheader.txt
#> head -1 household_power_consumption.txt > hpc_2days_headeronly.txt
#> cat hpc_2days_headeronly.txt hpc_2days_noheader.txt > hpc_2days.txt

library(data.table)
hpc <- fread("hpc_2days.txt", header=TRUE, sep=";")

hpc <- transform(hpc, DateCT = strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S"))

with(hpc, plot(DateCT, Sub_metering_1, type="n", main = "", ylab = "Entergy sub metering", xlab = ""))

with(hpc, {
        lines(x = DateCT, y = Sub_metering_1, type="l", col="black")
        lines(x = DateCT, y = Sub_metering_2, type="l", col="red")
        lines(x = DateCT, y = Sub_metering_3, type="l", col="blue")
})

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)

dev.copy(png, "plot3.png")
dev.off()


### Data Science Track
### Exploring Data
## Quiz 1 - plot 1

## use local unix tools to strip down our data by issuing the following commands
## (remove the "#>" before issuing the commands):
#> grep "^[12]\/2\/2007" household_power_consumption.txt > hpc_2days_noheader.txt
#> head -1 household_power_consumption.txt > hpc_2days_headeronly.txt
#> cat hpc_2days_headeronly.txt hpc_2days_noheader.txt > hpc_2days.txt

library(data.table)
hpc <- fread("hpc_2days.txt", header=TRUE, sep=";")

hpc <- transform(hpc, DateCT = strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S"))

hist(hpc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.copy(png, "plot1.png")
dev.off()

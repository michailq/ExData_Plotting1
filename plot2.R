### Before you run the code, please set the working directory
### with the txt file inside.

#### Read in the entire dataset (might take a while) ####

DATA_SET <- read.table("household_power_consumption.txt", 
                       header=T,
                       na.strings="?", 
                       sep=";", 
                       colClasses="character")

### Convert the first variable into date format

DATA_SET$Date <- as.Date(DATA_SET$Date, "%d/%m/%Y")


### Subset observations where date is between 2007-02-01 and 2007-02-02


Dates <- c("2007-02-01" ,"2007-02-02")
myData <- subset(DATA_SET, DATA_SET$Date == "2007-02-01" | 
                   DATA_SET$Date == "2007-02-02" )

## Plot 2

myData$Date <- as.character(myData$Date)

## Concatenate Date and Time into one variable
x <- paste(myData$Date, myData$Time)

## Format of the new variable
myData$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")
# Save the graph in plot2.png
png(filename="plot2.png",width=480, height=480)

# Create the plot
plot(myData$Time, myData$Global_active_power, 
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

dev.off()






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


### Plot 1 - histogram


myData$Global_active_power <- as.numeric(myData$Global_active_power)


# Create a hstiogram
# Save the graph in .png format
png(filename="plot1.png", width=480, height=480, bg = "transparent")
hist(myData$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     freq=TRUE)


## The picture is saved in the specified working directory
dev.off()



## Read in txt file
x <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")

## Process data:
        ## Copy data; convert Date to date type; 
        ## Subset data; convert Time to time type
        ## hpc is the processed data frame
y <- x 
y$Date <- as.Date(x$Date, format = "%d/%m/%Y") 
z <- subset(y,y$Date == as.Date("2007-02-01") | y$Date == as.Date("2007-02-02"))
dates <- z$Date
times <- z$Time
p <- paste(dates,times)
z$Time <- strptime(p,"%Y-%m-%d %H:%M:%S") 
hpc <- z

## Write hist to png file
png(filename="plot1.png",height=480,width=480)
hist(hpc[,3],main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()







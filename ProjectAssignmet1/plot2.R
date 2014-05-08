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

## Write plot to png file
png(filename="plot2.png",height=480,width=480)
plot(hpc[c(2,3)],type="l",ylab="Global Active Power",xlab="",cex.axis=0.9)
dev.off()







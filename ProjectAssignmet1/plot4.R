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
png(filename="plot4.png",height=480,width=480)
par(mfrow = c(2,2))
        plot(hpc[c(2,3)],type="l",ylab="Global Active Power",xlab="",cex.axis=0.7,cex.lab=0.7)
        plot(hpc[c(2,5)],type="l",ylab="Voltage",xlab="datetime",cex.axis=0.7,cex.lab=0.7)
        plot(range(hpc[,2]),range(hpc[,7]),type="n",xlab="",ylab="Energy sub metering",cex.axis=0.7,cex.lab=0.7)
                lines(hpc[,2],hpc[,7])
                lines(hpc[,2],hpc[,8],col="red")
                lines(hpc[,2],hpc[,9],col="blue")
                legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),cex=0.3,xjust=1,yjust=1)
        plot(hpc[c(2,4)],type="l",ylab="Global_reactive_power",xlab="datetime",cex.axis=0.7,cex.lab=0.7)
dev.off()







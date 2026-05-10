# 1. 读数据
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

# 2. 日期处理
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# 3. 过滤两天
subdata <- subset(data,
                  Date == "2007-02-01" |
                    Date == "2007-02-02")

# 4. 时间合并
subdata$Datetime <- strptime(paste(subdata$Date, subdata$Time),
                             "%Y-%m-%d %H:%M:%S")

# 5. 开始保存图
png("plot3.png", width = 480, height = 480)

# 6. 第一条线
plot(subdata$Datetime,
     subdata$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

# 7. 第二条线
lines(subdata$Datetime,
      subdata$Sub_metering_2,
      col = "red")

# 8. 第三条线
lines(subdata$Datetime,
      subdata$Sub_metering_3,
      col = "blue")

# 9. 图例（非常关键）
legend("topright",
       col = c("black", "red", "blue"),
       lty = 1,
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))

# 10. 保存
dev.off()
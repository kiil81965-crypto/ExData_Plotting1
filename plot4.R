# 1. 读数据
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

# 2. 日期转换
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# 3. 筛选两天
subdata <- subset(data,
                  Date == "2007-02-01" |
                    Date == "2007-02-02")

# 4. 时间合并
subdata$Datetime <- strptime(paste(subdata$Date, subdata$Time),
                             "%Y-%m-%d %H:%M:%S")

# 5. 保存图片
png("plot4.png", width = 480, height = 480)

# 6. 2x2布局
par(mfrow = c(2,2))

# --- 图1 ---
plot(subdata$Datetime,
     subdata$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# --- 图2 ---
plot(subdata$Datetime,
     subdata$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# --- 图3 ---
plot(subdata$Datetime,
     subdata$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering")

lines(subdata$Datetime, subdata$Sub_metering_2, col = "red")
lines(subdata$Datetime, subdata$Sub_metering_3, col = "blue")

legend("topright",
       col = c("black", "red", "blue"),
       lty = 1,
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))

# --- 图4 ---
plot(subdata$Datetime,
     subdata$Global_reactive_power,
     type = "l")

# 7. 保存
dev.off()
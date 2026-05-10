# 1. 读取数据
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

# 2. 转换日期
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# 3. 只取两天数据
subdata <- subset(data,
                  Date == "2007-02-01" |
                    Date == "2007-02-02")

# 4. 合成时间变量
subdata$Datetime <- strptime(paste(subdata$Date, subdata$Time),
                             "%Y-%m-%d %H:%M:%S")

# 5. 开始保存图像（关键！）
png("plot2.png", width = 480, height = 480)

# 6. 画折线图
plot(subdata$Datetime,
     subdata$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# 7. 关闭图形设备（必须）
dev.off()
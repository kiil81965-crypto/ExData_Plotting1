# 1. 读数据
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

# 2. 转日期
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# 3. 只保留两天
subdata <- subset(data,
                  Date == "2007-02-01" |
                    Date == "2007-02-02")

# 4. 画图并保存
png("plot1.png", width = 480, height = 480)

hist(subdata$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()

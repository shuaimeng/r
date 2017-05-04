#研究f_eject射出次数和频率
#分为single单次射出，即单脉冲内射出的次数
#还有eject，总体射出频率

#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
k2 <- read.xlsx("f_eject.xls", sheetName = "single_k2", header = TRUE)
k3 <- read.xlsx("f_eject.xls", sheetName = "single_k3", header = TRUE)
k4 <- read.xlsx("f_eject.xls", sheetName = "single_k4", header = TRUE)
k5 <- read.xlsx("f_eject.xls", sheetName = "single_k5", header = TRUE)

#设置画图区间
par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(2,2,2,2))

#保存数据
#pdf("f_k_mixed.pdf")

##################################画图--占空比k为0.2#######################
plot(k2$fv, k2$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Frequency in cycle (Hz)", main = "Eject frequency in duty = 0.2", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 150), ylim = c(0, 110))

#model1 = loess(k2$X1.5 ~ k2$fv, span = 0.8 , degree = 2)
lines(k2$fv, k2$X1.5,  col="#458B74", lwd=2, type="l", lty=3)

#model2 = loess(k2$X27 ~ k2$fv, span = 0.8, degree = 2)
lines(k2$fv, k2$X27, col="#FF00FF", lwd=2, type="l", lty=3)

#model3 = loess(k2$X54 ~ k2$fv, span = 0.8, degree = 2)
lines(k2$fv, k2$X54, col="#EE0000", lwd=2, type="l", lty=3)

#model4 = loess(k2$X180 ~ k2$fv, span = 0.8, degree =2)
lines(k2$fv, k2$X180, col="#27408B", lwd=2, type="l", lty=3)

#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

##################################画图--占空比k为0.3#######################
plot(k3$fv, k3$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Frequency in cycle (Hz)", main = "Eject frequency in duty = 0.3", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 150), ylim = c(0, 100))

#model1 = loess(k3$X1.5 ~ k3$fv, span = 0.8 , degree = 2)
lines(k3$fv, k3$X1.5,  col="#458B74", lwd=2, type="l", lty=3)

#model2 = loess(k3$X27 ~ k3$fv, span = 0.8, degree = 2)
lines(k3$fv, k3$X27, col="#FF00FF", lwd=2, type="l", lty=3)

#model3 = loess(k3$X54 ~ k3$fv, span = 0.8, degree = 2)
lines(k3$fv, k3$X54, col="#EE0000", lwd=2, type="l", lty=3)

#model4 = loess(k3$X180 ~ k3$fv, span = 0.8, degree =2)
lines(k3$fv, k3$X180, col="#27408B", lwd=2, type="l", lty=3)

#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

##################################画图--占空比k为0.2#######################
plot(k4$fv, k4$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Frequency in cycle (Hz)", main = "Eject frequency in duty = 0.4", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 150), ylim = c(0, 172))

#model1 = loess(k4$X1.5 ~ k4$fv, span = 0.8 , degree = 2)
lines(k4$fv, k4$X1.5,  col="#458B74", lwd=2, type="l", lty=3)

#model2 = loess(k4$X27 ~ k4$fv, span = 0.8, degree = 2)
lines(k4$fv, k4$X27, col="#FF00FF", lwd=2, type="l", lty=3)

#model3 = loess(k4$X54 ~ k4$fv, span = 0.8, degree = 2)
lines(k4$fv, k4$X54, col="#EE0000", lwd=2, type="l", lty=3)

#model4 = loess(k4$X180 ~ k4$fv, span = 0.8, degree =2)
lines(k4$fv, k4$X180, col="#27408B", lwd=2, type="l", lty=3)

#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

##################################画图--占空比k为0.5#######################
plot(k5$fv, k5$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Frequency in cycle (Hz)", main = "Eject frequency in duty = 0.5", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 150), ylim = c(0, 110))

#model1 = loess(k5$X1.5 ~ k5$fv, span = 0.8 , degree = 2)
lines(k5$fv, k5$X1.5,  col="#458B74", lwd=2, type="l", lty=3)

#model2 = loess(k5$X27 ~ k5$fv, span = 0.8, degree = 2)
lines(k5$fv, k5$X27, col="#FF00FF", lwd=2, type="l", lty=3)

#model3 = loess(k5$X54 ~ k5$fv, span = 0.8, degree = 2)
lines(k5$fv, k5$X54, col="#EE0000", lwd=2, type="l", lty=3)

#model4 = loess(k5$X180 ~ k5$fv, span = 0.8, degree =2)
lines(k5$fv, k5$X180, col="#27408B", lwd=2, type="l", lty=3)

#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

#dev.off()

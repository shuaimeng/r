#研究f_eject射出次数和频率
#分为single单次射出，即单脉冲内射出的次数
#还有eject，总体射出频率

#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
#k2 <- read.xlsx("f_eject.xls", sheetName = "single_k5", header = TRUE)
#k3 <- read.xlsx("f_eject.xls", sheetName = "single_k5", header = TRUE)
#k5 <- read.xlsx("f_eject.xls", sheetName = "single_k5", header = TRUE)
k5 <- read.xlsx("f_eject.xls", sheetName = "single_k5", header = TRUE)

#保存数据
#pdf("f_k0.4.pdf")

#画图
#设定空间位置
par(fig=c(0,1,0,1), new = F)

##################################画图--占空比k为0.5#######################
plot(k5$fv, k5$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Frequency in cycle (Hz)", main = "Eject frequency in duty = 0.5", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 3550), ylim = c(0, 110))

#model1 = loess(k5$X1.5 ~ k5$fv, span = 0.8 , degree = 2)
lines(k5$fv, k5$X1.5,  col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

#model2 = loess(k5$X27 ~ k5$fv, span = 0.8, degree = 2)
lines(k5$fv, k5$X27, col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

#model3 = loess(k5$X54 ~ k5$fv, span = 0.8, degree = 2)
lines(k5$fv, k5$X54, col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

#model4 = loess(k5$X180 ~ k5$fv, span = 0.8, degree =2)
lines(k5$fv, k5$X180, col="#27408B", pch=24, lwd=2.5, type="b", lty=2)

#区域划线


legend("topleft", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

###############画小图########
par(fig = c(0.22,0.98,0.2,0.98), new  = TRUE)

plot(k5$fv, k5$X1.5, xaxs = "i", col = 0, xlab = "0 ~ 250 Hz", ylab = "f_eject in cycle (Hz)", main = "", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 250), ylim = c(0, 110))

#model1 = loess(k5$X1.5 ~ k5$fv, span = 0.8 , degree = 2)
lines(k5$fv, k5$X1.5,  col="#458B74", lwd=2.5, type="l", lty=3)

#model2 = loess(k5$X27 ~ k5$fv, span = 0.8, degree = 2)
lines(k5$fv, k5$X27, col="#FF00FF", lwd=2.5, type="l", lty=3)

#model3 = loess(k5$X54 ~ k5$fv, span = 0.8, degree = 2)
lines(k5$fv, k5$X54, col="#EE0000", lwd=2.5, type="l", lty=3)

#model4 = loess(k5$X180 ~ k5$fv, span = 0.8, degree =2)
lines(k5$fv, k5$X180, col="#27408B", lwd=2.5, type="l", lty=3)

#legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n", inset = .03)

#画小小图
par(fig = c(0.35,0.95,0.4,0.95), new  = TRUE)

plot(k5$fv, k5$X1.5, xaxs = "i", col = 0, xlab = "0 ~ 75 Hz", ylab = "f_eject in cycle (Hz)", main = "", cex.lab = 1.2, cex.main = 1.5, xlim = c(0,  75), ylim = c(0, 110))

#text(260, 0.85, "射出时间在[0.3ms, 0.8ms]内", font = 2, col = "blue", cex = 1.3)

#model1 = loess(k5$X1.5 ~ k5$fv, span = 1.6 , degree = 2)
lines(k5$fv, k5$X1.5, col="#458B74", lwd=2, type="l")

#model2 = loess(k5$X27 ~ k5$fv, span = 1.6, degree = 2)
lines(k5$fv,  k5$X27, col="#FF00FF", lwd=2, type="l")

#model3 = loess(k5$X54 ~ k5$fv, span = 1.6, degree = 2)
lines(k5$fv, k5$X54, col="#EE0000", lwd=2, type="l")

#model4 = loess(k5$X180 ~ k5$fv, span = 1.6, degree =2)
lines(k5$fv, k5$X180, col="#27408B", lwd=2, type="l")

abline(h=40, lty = 3, col = "red", lwd = 2)
abline(h=1, lty = 3, col = "red", lwd = 2)

#legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n", inset = .03)

#dev.off()

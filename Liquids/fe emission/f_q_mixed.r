#研究f_eject射出次数和频率
#分为single单次射出，即单脉冲内射出的次数
#还有eject，总体射出频率

#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
#q2 <- read.xlsx("f_eject.xls", sheetName = "single_q15", header = TRUE)
#q3 <- read.xlsx("f_eject.xls", sheetName = "single_q27", header = TRUE)
#q4 <- read.xlsx("f_eject.xls", sheetName = "single_q54", header = TRUE)
q5 <- read.xlsx("f_eject.xls", sheetName = "single_q180", header = TRUE)

#设置画图区域
par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(2,2,2,2))

#保存数据
#pdf("f_q_mixed.pdf")

##################################画图--占空比Q-1.5#######################
plot(q2$fv, q2$X0.2, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Frequency in cycle (Hz)", main = "Eject frequency in Q = 1.5nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 150), ylim = c(0, 100))

#model1 = loess(q2$X0.2 ~ q2$fv, span = 0.8 , degree = 2)
lines(q2$fv, q2$X0.2,  col="#458B74", lwd=2, type="l", lty=3)

#model2 = loess(q2$X0.3 ~ q2$fv, span = 0.8, degree = 2)
lines(q2$fv, q2$X0.3, col="#FF00FF", lwd=2, type="l", lty=3)

#model3 = loess(q2$X0.4 ~ q2$fv, span = 0.8, degree = 2)
lines(q2$fv, q2$X0.4, col="#EE0000", lwd=2, type="l", lty=3)

#model4 = loess(q2$X0.5 ~ q2$fv, span = 0.8, degree =2)
lines(q2$fv, q2$X0.5, col="#27408B", lwd=2, type="l", lty=3)

#区域划线
legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

##################################画图--占空比Q-27nl/min#######################
plot(q3$fv, q3$X0.2, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Frequency in cycle (Hz)", main = "Eject frequency in Q = 27nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 150), ylim = c(0, 172))

#model1 = loess(q3$X0.2 ~ q3$fv, span = 0.8 , degree = 2)
lines(q3$fv, q3$X0.2,  col="#458B74", lwd=2, type="l", lty=3)

#model2 = loess(q3$X0.3 ~ q3$fv, span = 0.8, degree = 2)
lines(q3$fv, q3$X0.3, col="#FF00FF", lwd=2, type="l", lty=3)

#model3 = loess(q3$X0.4 ~ q3$fv, span = 0.8, degree = 2)
lines(q3$fv, q3$X0.4, col="#EE0000", lwd=2, type="l", lty=3)

#model4 = loess(q3$X0.5 ~ q3$fv, span = 0.8, degree =2)
lines(q3$fv, q3$X0.5, col="#27408B", lwd=2, type="l", lty=3)

#区域划线
legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

##################################画图--占空比q为54#######################
plot(q4$fv, q4$X0.2, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Frequency in cycle (Hz)", main = "Eject frequency in Q = 54nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 150), ylim = c(0, 172))

#model1 = loess(q4$X0.2 ~ q4$fv, span = 0.8 , degree = 2)
lines(q4$fv, q4$X0.2,  col="#458B74", lwd=2, type="l", lty=3)

#model2 = loess(q4$X0.3 ~ q4$fv, span = 0.8, degree = 2)
lines(q4$fv, q4$X0.3, col="#FF00FF", lwd=2, type="l", lty=3)

#model3 = loess(q4$X0.4 ~ q4$fv, span = 0.8, degree = 2)
lines(q4$fv, q4$X0.4, col="#EE0000", lwd=2, type="l", lty=3)

#model4 = loess(q4$X0.5 ~ q4$fv, span = 0.8, degree =2)
lines(q4$fv, q4$X0.5, col="#27408B", lwd=2, type="l", lty=3)

#区域划线
legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

##################################画图--占空比q为180#######################
plot(q5$fv, q5$X0.2, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Frequency in cycle (Hz)", main = "Eject frequency in Q = 180nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 150), ylim = c(0, 110))

#model1 = loess(q5$X0.2 ~ q5$fv, span = 0.8 , degree = 2)
lines(q5$fv, q5$X0.2,  col="#458B74", lwd=2, type="l", lty=3)

#model2 = loess(q5$X0.3 ~ q5$fv, span = 0.8, degree = 2)
lines(q5$fv, q5$X0.3, col="#FF00FF", lwd=2, type="l", lty=3)

#model3 = loess(q5$X0.4 ~ q5$fv, span = 0.8, degree = 2)
lines(q5$fv, q5$X0.4, col="#EE0000", lwd=2, type="l", lty=3)

#model4 = loess(q5$X0.5 ~ q5$fv, span = 0.8, degree =2)
lines(q5$fv, q5$X0.5, col="#27408B", lwd=2, type="l", lty=3)

#区域划线
legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")
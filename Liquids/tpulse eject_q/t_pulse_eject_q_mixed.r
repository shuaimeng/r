#t_pulse是单次射出所需的时间
#t_pulse，随着电压频率fv的上升而改变；随着流量而改变；

#以流量为划分

#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
eq15<-read.xlsx("t_pulse.xls", sheetName = "eject_q15", header = TRUE)
eq27<-read.xlsx("t_pulse.xls", sheetName = "eject_q27", header = TRUE)
eq54<-read.xlsx("t_pulse.xls", sheetName = "eject_q54", header = TRUE)
eq180<-read.xlsx("t_pulse.xls", sheetName = "eject_q180", header = TRUE)

#设定空间位置
par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(2,2,2,2))

############1.5nl/min#######
##################################画图--占空比k为1.5nl/min#######################
plot(eq15$fv, eq15$X0.2, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Eject time t_eject (ms)", main = "Eject time in Q = 1.5nl/min", cex.lab = 1.1, cex.main = 1.2, xlim = c(0, 250), ylim = c(0.1, 82))

#model1 = loess(eq15$X0.2 ~ eq15$fv, span = 0.8 , degree = 2)
lines(eq15$fv, eq15$X0.2,  col="#458B74",lwd=2, type="l", lty=3)

#model2 = loess(eq15$X0.3 ~ eq15$fv, span = 0.8, degree = 2)
lines(eq15$fv, eq15$X0.3, col="#FF00FF", lwd=2, type="l", lty=3)

#model3 = loess(eq15$X0.4 ~ eq15$fv, span = 0.8, degree = 2)
lines(eq15$fv, eq15$X0.4, col="#EE0000", lwd=2, type="l", lty=3)

#model4 = loess(eq15$X0.5 ~ eq15$fv, span = 0.8, degree =2)
lines(eq15$fv, eq15$X0.5, col="#27408B", lwd=2, type="l", lty=3)

#区域划线
legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.1, inset = .03, bty = "n")

##################################画图--占空比k为27nl/min#######################
plot(eq27$fv, eq27$X0.2, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Eject time t_eject (ms)", main = "Eject time in Q = 27nl/min", cex.lab = 1.1, cex.main = 1.2, xlim = c(0, 250), ylim = c(0.1, 80))

#model1 = loess(eq27$X0.2 ~ eq27$fv, span = 0.8 , degree = 2)
lines(eq27$fv, eq27$X0.2,  col="#458B74", lwd=2, type="l", lty=3)

#model2 = loess(eq27$X0.3 ~ eq27$fv, span = 0.8, degree = 2)
lines(eq27$fv, eq27$X0.3, col="#FF00FF", lwd=2, type="l", lty=3)

#model3 = loess(eq27$X0.4 ~ eq27$fv, span = 0.8, degree = 2)
lines(eq27$fv, eq27$X0.4, col="#EE0000", lwd=2, type="l", lty=3)

#model4 = loess(eq27$X0.5 ~ eq27$fv, span = 0.8, degree =2)
lines(eq27$fv, eq27$X0.5, col="#27408B", lwd=2, type="l", lty=3)

#区域划线
legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.1, inset = .03, bty = "n")

##################################画图--占空比k为54nl/min#######################
plot(eq54$fv, eq54$X0.2, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Eject time t_eject (ms)", main = "Eject time in Q = 54nl/min", cex.lab = 1.1, cex.main = 1.2, xlim = c(0, 250), ylim = c(0.1, 82))

#model1 = loess(eq54$X0.2 ~ eq54$fv, span = 0.8 , degree = 2)
lines(eq54$fv, eq54$X0.2,  col="#458B74", lwd=2, type="l", lty=3)

#model2 = loess(eq54$X0.3 ~ eq54$fv, span = 0.8, degree = 2)
lines(eq54$fv, eq54$X0.3, col="#FF00FF", lwd=2, type="l", lty=3)

#model3 = loess(eq54$X0.4 ~ eq54$fv, span = 0.8, degree = 2)
lines(eq54$fv, eq54$X0.4, col="#EE0000", lwd=2, type="l", lty=3)

#model4 = loess(eq54$X0.5 ~ eq54$fv, span = 0.8, degree =2)
lines(eq54$fv, eq54$X0.5, col="#27408B", lwd=2, type="l", lty=3)

#区域划线
legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.1, inset = .03, bty = "n")

##################################画图--占空比k为180nl/min#######################
plot(eq180$fv, eq180$X0.2, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Eject time t_eject (ms)", main = "Eject time in Q = 180nl/min", cex.lab = 1.1, cex.main = 1.2, xlim = c(0, 250), ylim = c(0.1, 90))

#model1 = loess(eq180$X0.2 ~ eq180$fv, span = 0.8 , degree = 2)
lines(eq180$fv, eq180$X0.2,  col="#458B74", lwd=2, type="l", lty=3)

#model2 = loess(eq180$X0.3 ~ eq180$fv, span = 0.8, degree = 2)
lines(eq180$fv, eq180$X0.3, col="#FF00FF", lwd=2, type="l", lty=3)

#model3 = loess(eq180$X0.4 ~ eq180$fv, span = 0.8, degree = 2)
lines(eq180$fv, eq180$X0.4, col="#EE0000", lwd=2, type="l", lty=3)

#model4 = loess(eq180$X0.5 ~ eq180$fv, span = 0.8, degree =2)
lines(eq180$fv, eq180$X0.5, col="#27408B", lwd=2, type="l", lty=3)

#区域划线
legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.1, inset = .03, bty = "n")

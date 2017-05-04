#t_pulse是单次射出所需的时间
#t_pulse，随着电压频率fv的上升而改变；随着流量而改变；

#以流量为划分

#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
sink15<-read.xlsx("t_pulse.xls", sheetName = "single_q_15", header = TRUE)
sink27<-read.xlsx("t_pulse.xls", sheetName = "single_q27", header = TRUE)
sink54<-read.xlsx("t_pulse.xls", sheetName = "single_q54", header = TRUE)
sink180<-read.xlsx("t_pulse.xls", sheetName = "single_q180", header = TRUE)

#保存数据
#pdf("t_pulse_mixed_q.pdf")

#设定空间位置
par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(2,2,2,2))

##################################画图--占空比k为1.5nl/min#######################
plot(sink15$fv, sink15$X0.2, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Pulse time t_pulse (ms)", main = "Pulse time in Q = 1.5nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 1050), ylim = c(0, 1.5))

#model1 = loess(sink15$X0.2 ~ sink15$fv, span = 0.8 , degree = 2)
lines(sink15$fv, sink15$X0.2,  col="#458B74", lwd=2, type="l", lty=2)

#model2 = loess(sink15$X0.3 ~ sink15$fv, span = 0.8, degree = 2)
lines(sink15$fv, sink15$X0.3, col="#FF00FF", lwd=2, type="l", lty=2)

#model3 = loess(sink15$X0.4 ~ sink15$fv, span = 0.8, degree = 2)
lines(sink15$fv, sink15$X0.4, col="#EE0000", lwd=2, type="l", lty=2)

#model4 = loess(sink15$X0.5 ~ sink15$fv, span = 0.8, degree =2)
lines(sink15$fv, sink15$X0.5, col="#27408B", lwd=2, type="l", lty=2)

#区域划线


legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

##################################画图--占空比k为27nl/min#######################
plot(sink27$fv, sink27$X0.2, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Pulse time t_pulse (ms)", main = "Pulse time in Q = 27nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 550), ylim = c(0,  1.5))

#model1 = loess(sink27$X0.2 ~ sink27$fv, span = 0.8 , degree = 2)
lines(sink27$fv, sink27$X0.2,  col="#458B74", lwd=2, type="l", lty=2)

#model2 = loess(sink27$X0.3 ~ sink27$fv, span = 0.8, degree = 2)
lines(sink27$fv, sink27$X0.3, col="#FF00FF", lwd=2, type="l", lty=2)

#model3 = loess(sink27$X0.4 ~ sink27$fv, span = 0.8, degree = 2)
lines(sink27$fv, sink27$X0.4, col="#EE0000", lwd=2, type="l", lty=2)

#model4 = loess(sink27$X0.5 ~ sink27$fv, span = 0.8, degree =2)
lines(sink27$fv, sink27$X0.5, col="#27408B", lwd=2, type="l", lty=2)

#区域划线


legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

##################################画图--占空比k为54nl/min#######################
plot(sink54$fv, sink54$X0.2, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Pulse time t_pulse (ms)", main = "Pulse time in Q = 54nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 1050), ylim = c(0, 1.5))

#model1 = loess(sink54$X0.2 ~ sink54$fv, span = 0.8 , degree = 2)
lines(sink54$fv, sink54$X0.2,  col="#458B74", lwd=2, type="l", lty=2)

#model2 = loess(sink54$X0.3 ~ sink54$fv, span = 0.8, degree = 2)
lines(sink54$fv, sink54$X0.3, col="#FF00FF", lwd=2, type="l", lty=2)

#model3 = loess(sink54$X0.4 ~ sink54$fv, span = 0.8, degree = 2)
lines(sink54$fv, sink54$X0.4, col="#EE0000", lwd=2, type="l", lty=2)

#model4 = loess(sink54$X0.5 ~ sink54$fv, span = 0.8, degree =2)
lines(sink54$fv, sink54$X0.5, col="#27408B", lwd=2, type="l", lty=2)

#区域划线


legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

##################################画图--占空比k为180nl/min#######################
plot(sink180$fv, sink180$X0.2, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Pulse time t_pulse (ms)", main = "Pulse time in Q = 180nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 3550), ylim = c(0, 1.5))

#model1 = loess(sink180$X0.2 ~ sink180$fv, span = 0.8 , degree = 2)
lines(sink180$fv, sink180$X0.2,  col="#458B74", lwd=2, type="l", lty=2)

#model2 = loess(sink180$X0.3 ~ sink180$fv, span = 0.8, degree = 2)
lines(sink180$fv, sink180$X0.3, col="#FF00FF", lwd=2, type="l", lty=2)

#model3 = loess(sink180$X0.4 ~ sink180$fv, span = 0.8, degree = 2)
lines(sink180$fv, sink180$X0.4, col="#EE0000", lwd=2, type="l", lty=2)

#model4 = loess(sink180$X0.5 ~ sink180$fv, span = 0.8, degree =2)
lines(sink180$fv, sink180$X0.5, col="#27408B", lwd=2, type="l", lty=2)

#区域划线


legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

#dev.off()
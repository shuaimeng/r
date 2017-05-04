#t_pulse是单次射出所需的时间
#t_pulse，随着电压频率fv的上升而改变；随着流量而改变；

#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
sink2<-read.xlsx("t_pulse.xls", sheetName = "single_k2", header = TRUE)
sink3<-read.xlsx("t_pulse.xls", sheetName = "single_k3", header = TRUE)
sink4<-read.xlsx("t_pulse.xls", sheetName = "single_k4", header = TRUE)
sink5<-read.xlsx("t_pulse.xls", sheetName = "single_k5", header = TRUE)

#保存数据
#pdf("t_pulse_mixed.pdf")

#设定空间位置
par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(2,2,2,2))

##################################画图--占空比k为0.2#######################
plot(sink2$fv, sink2$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Pulse time t_pulse (ms)", main = "Pulse time in duty = 0.2", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 1050), ylim = c(0.2, 1))

#model1 = loess(sink2$X1.5 ~ sink2$fv, span = 0.8 , degree = 2)
lines(sink2$fv, sink2$X1.5,  col="#458B74", lwd=2, type="b", lty=3)

#model2 = loess(sink2$X27 ~ sink2$fv, span = 0.8, degree = 2)
lines(sink2$fv, sink2$X27, col="#FF00FF", lwd=2, type="b", lty=3)

#model3 = loess(sink2$X54 ~ sink2$fv, span = 0.8, degree = 2)
lines(sink2$fv, sink2$X54, col="#EE0000", lwd=2, type="b", lty=3)

#model4 = loess(sink2$X180 ~ sink2$fv, span = 0.8, degree =2)
lines(sink2$fv, sink2$X180, col="#27408B", lwd=2, type="b", lty=3)

#区域划线


legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

##################################画图--占空比k为0.3#######################
plot(sink3$fv, sink3$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Pulse time t_pulse (ms)", main = "Pulse time in duty = 0.3", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 850), ylim = c(0.1, 1))

#model1 = loess(sink3$X1.5 ~ sink3$fv, span = 0.8 , degree = 2)
lines(sink3$fv, sink3$X1.5,  col="#458B74", lwd=2, type="b", lty=3)

#model2 = loess(sink3$X27 ~ sink3$fv, span = 0.8, degree = 2)
lines(sink3$fv, sink3$X27, col="#FF00FF", lwd=2, type="b", lty=3)

#model3 = loess(sink3$X54 ~ sink3$fv, span = 0.8, degree = 2)
lines(sink3$fv, sink3$X54, col="#EE0000", lwd=2, type="b", lty=3)

#model4 = loess(sink3$X180 ~ sink3$fv, span = 0.8, degree =2)
lines(sink3$fv, sink3$X180, col="#27408B", lwd=2, type="b", lty=3)

#区域划线


legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

##################################画图--占空比k为0.4#######################
plot(sink4$fv, sink4$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Pulse time t_pulse (ms)", main = "Pulse time in duty = 0.4", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 2050), ylim = c(0.1, 1.6))

#model1 = loess(sink4$X1.5 ~ sink4$fv, span = 0.8 , degree = 2)
lines(sink4$fv, sink4$X1.5,  col="#458B74", lwd=2, type="b", lty=3)

#model2 = loess(sink4$X27 ~ sink4$fv, span = 0.8, degree = 2)
lines(sink4$fv, sink4$X27, col="#FF00FF", lwd=2, type="b", lty=3)

#model3 = loess(sink4$X54 ~ sink4$fv, span = 0.8, degree = 2)
lines(sink4$fv, sink4$X54, col="#EE0000", lwd=2, type="b", lty=3)

#model4 = loess(sink4$X180 ~ sink4$fv, span = 0.8, degree =2)
lines(sink4$fv, sink4$X180, col="#27408B", lwd=2, type="b", lty=3)

#区域划线


legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

##################################画图--占空比k为0.5#######################
plot(sink5$fv, sink5$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Pulse time t_pulse (ms)", main = "Pulse time in duty = 0.5", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 3050), ylim = c(0.1, 2))

#model1 = loess(sink5$X1.5 ~ sink5$fv, span = 0.8 , degree = 2)
lines(sink5$fv, sink5$X1.5,  col="#458B74", lwd=2, type="b", lty=3)

#model2 = loess(sink5$X27 ~ sink5$fv, span = 0.8, degree = 2)
lines(sink5$fv, sink5$X27, col="#FF00FF", lwd=2, type="b", lty=3)

#model3 = loess(sink5$X54 ~ sink5$fv, span = 0.8, degree = 2)
lines(sink5$fv, sink5$X54, col="#EE0000", lwd=2, type="b", lty=3)

#model4 = loess(sink5$X180 ~ sink5$fv, span = 0.8, degree =2)
lines(sink5$fv, sink5$X180, col="#27408B", lwd=2, type="b", lty=3)

#区域划线


legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

#dev.off()
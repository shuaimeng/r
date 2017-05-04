#t_pulse是单次射出所需的时间
#t_pulse，随着电压频率fv的上升而改变；随着流量而改变；

#以流量为划分

#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
#sink15<-read.xlsx("t_pulse.xls", sheetName = "single_q_15", header = TRUE)
#sink27<-read.xlsx("t_pulse.xls", sheetName = "single_q27", header = TRUE)
sink54<-read.xlsx("t_pulse.xls", sheetName = "single_q54", header = TRUE)
#sink180<-read.xlsx("t_pulse.xls", sheetName = "single_q180", header = TRUE)

#保存数据
pdf("t_pulse_q54.pdf")

#设定空间位置
par(fig=c(0,1,0,1), new = F)

##################################画图--占空比k为54nl/min#######################
plot(sink54$fv, sink54$X0.2, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Pulse time t_pulse (ms)", main = "Pulse time in Q = 54nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 1050), ylim = c(0.2, 5))

#model1 = loess(sink54$X0.2 ~ sink54$fv, span = 0.8 , degree = 2)
lines(sink54$fv, sink54$X0.2,  col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

#model2 = loess(sink54$X0.3 ~ sink54$fv, span = 0.8, degree = 2)
lines(sink54$fv, sink54$X0.3, col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

#model3 = loess(sink54$X0.4 ~ sink54$fv, span = 0.8, degree = 2)
lines(sink54$fv, sink54$X0.4, col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

#model4 = loess(sink54$X0.5 ~ sink54$fv, span = 0.8, degree =2)
lines(sink54$fv, sink54$X0.5, col="#27408B", pch=24, lwd=2.5, type="b", lty=2)

#区域划线


legend("topleft", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

###############画小图########
#par(fig = c(0.3,0.98,0.15,0.98), new  = TRUE)

#plot(sink54$fv, sink54$X0.2, xaxs = "i", col = 0, xlab = "0 ~ 250 Hz", ylab = "t_pulse (ms)", main = "", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 250), ylim = c(0, 1.05))

#model1 = loess(sink54$X0.2 ~ sink54$fv, span = 0.8 , degree = 2)
#lines(sink54$fv, sink54$X0.2,  col="#458B74", lwd=2.5, type="o", lty=2)

#model2 = loess(sink54$X0.3 ~ sink54$fv, span = 0.8, degree = 2)
#lines(sink54$fv, sink54$X0.3, col="#FF00FF", lwd=2.5, type="o", lty=2)

#model3 = loess(sink54$X0.4 ~ sink54$fv, span = 0.8, degree = 2)
#lines(sink54$fv, sink54$X0.4, col="#EE0000", lwd=2.5, type="o", lty=2)

#model4 = loess(sink54$X0.5 ~ sink54$fv, span = 0.8, degree =2)
#lines(sink54$fv, sink54$X0.5, col="#27408B", lwd=2.5, type="o", lty=2)

#legend("topleft", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n", inset = .03)

#画小小图
par(fig = c(0.25,0.95,0.25,0.95), new  = TRUE)

plot(sink54$fv, sink54$X0.2, xaxs = "i", col = 0, xlab = "0 ~ 250 Hz", ylab = "t_pulse (ms)", main = "", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 250), ylim = c(0.2, 0.9))

text(120, 0.8, "射出时间在[0.3ms, 0.7ms]内", font = 2, col = "blue", cex = 1.3)
#text(250, 1.8, "180nl/min时突然增大", font = 2, col = "blue", cex = 1.3)
#text(120, 1, "低频电压区间[0 ~ 250Hz]", font = 2, col = "red", cex = 1.3)

#model1 = loess(sink54$X0.2 ~ sink54$fv, span = 1.6 , degree = 2)
lines(sink54$fv, sink54$X0.2, col="#458B74", lwd=2, type="l")

#model2 = loess(sink54$X0.3 ~ sink54$fv, span = 1.6, degree = 2)
lines(sink54$fv,  sink54$X0.3, col="#FF00FF", lwd=2, type="l")

#model3 = loess(sink54$X0.4 ~ sink54$fv, span = 1.6, degree = 2)
lines(sink54$fv, sink54$X0.4, col="#EE0000", lwd=2, type="l")

#model4 = loess(sink54$X0.5 ~ sink54$fv, span = 1.6, degree =2)
lines(sink54$fv, sink54$X0.5, col="#27408B", lwd=2, type="l")



abline(h=0.8, lty = 3, col = "red", lwd = 2)
abline(h=0.4, lty = 3, col = "red", lwd = 2)
abline(h=0.7, lty = 3, col = "blue", lwd = 2)

#legend("topleft", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n", inset = .03)

dev.off()

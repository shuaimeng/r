#t_pulse是单次射出所需的时间
#t_pulse，随着电压频率fv的上升而改变；随着流量而改变；

#以流量为划分

#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
ek2<-read.xlsx("t_pulse.xls", sheetName = "eject_k2", header = TRUE)
ek3<-read.xlsx("t_pulse.xls", sheetName = "eject_k3", header = TRUE)
ek4<-read.xlsx("t_pulse.xls", sheetName = "eject_k4", header = TRUE)
ek5<-read.xlsx("t_pulse.xls", sheetName = "eject_k5", header = TRUE)

#保存数据
#pdf("t_pulse_eject_q_minxed.pdf")

#设定空间位置
par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(2,2,2,2))

##################################画图--占空比k为1.5nl/min#######################
plot(ek2$fv, ek2$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Eject time t_eject (ms)", main = "Eject time in Q = 1.5nl/min", cex.lab = 1.1, cex.main = 1.2, xlim = c(0, 250), ylim = c(0, 80))

#model1 = loess(ek2$X1.5 ~ ek2$fv, span = 0.8 , degree = 2)
lines(ek2$fv, ek2$X1.5, col="#458B74", lwd=2.5, type="l", lty=3)

#model2 = loess(ek2$X27 ~ ek2$fv, span = 0.8, degree = 2)
lines(ek2$fv, ek2$X27,col="#FF00FF", lwd=2.5, type="l", lty=3)

#model3 = loess(ek2$X54 ~ ek2$fv, span = 0.8, degree = 2)
lines(ek2$fv, ek2$X54, col="#EE0000", lwd=2.5, type="l", lty=3)

#model4 = loess(ek2$X180 ~ ek2$fv, span = 0.8, degree =2)
lines(ek2$fv, ek2$X180, col="#27408B", lwd=2.5, type="l", lty=3)

#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"),lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

#############画图 27nl/min ############

plot(ek3$fv, ek3$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Eject time t_eject (ms)", main = "Eject time in Q = 27nl/min", cex.lab = 1.1, cex.main = 1.2, xlim = c(0, 250), ylim = c(0.1, 60))

#model1 = loess(ek3$X1.5 ~ ek3$fv, span = 0.8 , degree = 2)
lines(ek3$fv, ek3$X1.5,  col="#458B74", lwd=2.5, type="l", lty=3)

#model2 = loess(ek3$X27 ~ ek3$fv, span = 0.8, degree = 2)
lines(ek3$fv, ek3$X27, col="#FF00FF",lwd=2.5, type="l", lty=3)

#model3 = loess(ek3$X54 ~ ek3$fv, span = 0.8, degree = 2)
lines(ek3$fv, ek3$X54, col="#EE0000", lwd=2.5, type="l", lty=3)

#model4 = loess(ek3$X180 ~ ek3$fv, span = 0.8, degree =2)
lines(ek3$fv, ek3$X180, col="#27408B", lwd=2.5, type="l", lty=3)

#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"),lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

##################################画图--占空比k为1.5nl/min#######################
plot(ek4$fv, ek4$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Eject time t_eject (ms)", main = "Eject time in Q = 54nl/min", cex.lab = 1.1, cex.main = 1.2, xlim = c(0, 250), ylim = c(0, 65))

#model1 = loess(ek4$X1.5 ~ ek4$fv, span = 0.8 , degree = 2)
lines(ek4$fv, ek4$X1.5, col="#458B74",lwd=2.5, type="l", lty=3)

#model2 = loess(ek4$X27 ~ ek4$fv, span = 0.8, degree = 2)
lines(ek4$fv, ek4$X27, col="#FF00FF", lwd=2.5, type="l", lty=3)

#model3 = loess(ek4$X54 ~ ek4$fv, span = 0.8, degree = 2)
lines(ek4$fv, ek4$X54, col="#EE0000", lwd=2.5, type="l", lty=3)

#model4 = loess(ek4$X180 ~ ek4$fv, span = 0.8, degree =2)
lines(ek4$fv, ek4$X180, col="#27408B", lwd=2.5, type="l", lty=3)

#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

##################################画图--占空比k为180nl/min#######################
plot(ek5$fv, ek5$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Eject time t_eject (ms)", main = "Eject time in Q = 180nl/min", cex.lab = 1.1, cex.main = 1.2, xlim = c(0, 250), ylim = c(0, 85))

#model1 = loess(ek5$X1.5 ~ ek5$fv, span = 0.8 , degree = 2)
lines(ek5$fv, ek5$X1.5,  col="#458B74", lwd=2.5, type="l", lty=3)

#model2 = loess(ek5$X27 ~ ek5$fv, span = 0.8, degree = 2)
lines(ek5$fv, ek5$X27, col="#FF00FF", lwd=2.5, type="l", lty=3)

#model3 = loess(ek5$X54 ~ ek5$fv, span = 0.8, degree = 2)
lines(ek5$fv, ek5$X54, col="#EE0000", lwd=2.5, type="l", lty=3)

#model4 = loess(ek5$X180 ~ ek5$fv, span = 0.8, degree =2)
lines(ek5$fv, ek5$X180, col="#27408B", lwd=2.5, type="l", lty=3)

#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

#dev.off()
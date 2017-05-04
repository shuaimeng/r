#t_pulse是单次射出所需的时间
#t_pulse，随着电压频率fv的上升而改变；随着流量而改变；

#以流量为划分

#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
#ek4<-read.xlsx("t_pulse.xls", sheetName = "eject_k2", header = TRUE)
#ek4<-read.xlsx("t_pulse.xls", sheetName = "eject_k3", header = TRUE)
ek4<-read.xlsx("t_pulse.xls", sheetName = "eject_k4", header = TRUE)
#ek5<-read.xlsx("t_pulse.xls", sheetName = "eject_k5", header = TRUE)

#保存数据
#pdf("t_pulse_eject_k4.pdf")

#设定空间位置
par(fig=c(0,1,0,1), new = F)

##################################画图--占空比k为0.4#######################
plot(ek4$fv, ek4$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Eject time t_eject (ms)", main = "Eject time in k = 0.4", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 2050), ylim = c(0.1, 65))

#model1 = loess(ek4$X1.5 ~ ek4$fv, span = 0.8 , degree = 2)
lines(ek4$fv, ek4$X1.5,  col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

#model2 = loess(ek4$X27 ~ ek4$fv, span = 0.8, degree = 2)
lines(ek4$fv, ek4$X27, col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

#model3 = loess(ek4$X54 ~ ek4$fv, span = 0.8, degree = 2)
lines(ek4$fv, ek4$X54, col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

#model4 = loess(ek4$X180 ~ ek4$fv, span = 0.8, degree =2)
lines(ek4$fv, ek4$X180, col="#27408B", pch=24, lwd=2.5, type="b", lty=2)

#区域划线


legend("topleft", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.1, inset = .03, bty = "n")

###############画小图########
#par(fig = c(0.3,0.98,0.15,0.98), new  = TRUE)

#plot(ek4$fv, ek4$X1.5, xaxs = "i", col = 0, xlab = "0 ~ 250 Hz", ylab = "t_pulse (ms)", main = "", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 250), ylim = c(0, 1.05))

#model1 = loess(ek4$X1.5 ~ ek4$fv, span = 0.8 , degree = 2)
#lines(ek4$fv, ek4$X1.5,  col="#458B74", lwd=2.5, type="o", lty=2)

#model2 = loess(ek4$X27 ~ ek4$fv, span = 0.8, degree = 2)
#lines(ek4$fv, ek4$X27, col="#FF00FF", lwd=2.5, type="o", lty=2)

#model3 = loess(ek4$X54 ~ ek4$fv, span = 0.8, degree = 2)
#lines(ek4$fv, ek4$X54, col="#EE0000", lwd=2.5, type="o", lty=2)

#model4 = loess(ek4$X180 ~ ek4$fv, span = 0.8, degree =2)
#lines(ek4$fv, ek4$X180, col="#27408B", lwd=2.5, type="o", lty=2)

#legend("topleft", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n", inset = .03)

#画小小图
par(fig = c(0.22,0.95,0.18,0.95), new  = TRUE)

plot(ek4$fv, ek4$X1.5, xaxs = "i", col = 0, xlab = "0 ~ 250 Hz", ylab = "t_eject (ms)", main = "", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 250), ylim = c(0, 65))

#text(120, 40, "射出时间在[0.3ms, 0.8ms]内", font = 2, col = "blue", cex = 1.3)
#text(250, 1.8, "180nl/min时突然增大", font = 2, col = "blue", cex = 1.3)

#model1 = loess(ek4$X1.5 ~ ek4$fv, span = 1.6 , degree = 2)
lines(ek4$fv, ek4$X1.5, col="#458B74", lwd=2, type="l", lty = 3)

#model2 = loess(ek4$X27 ~ ek4$fv, span = 1.6, degree = 2)
lines(ek4$fv,  ek4$X27, col="#FF00FF", lwd=2, type="l", lty = 3)

#model3 = loess(ek4$X54 ~ ek4$fv, span = 1.6, degree = 2)
lines(ek4$fv, ek4$X54, col="#EE0000", lwd=2, type="l", lty = 3)

#model4 = loess(ek4$X180 ~ ek4$fv, span = 1.6, degree =2)
lines(ek4$fv, ek4$X180, col="#27408B", lwd=2, type="l", lty = 3)

############局部图##########
#画小小图
par(fig = c(0.35,0.9,0.35,0.9), new  = TRUE)

plot(ek4$fv, ek4$X1.5, xaxs = "i", col = 0, xlab = "0 ~ 75 Hz", ylab = "t_eject (ms)", main = "", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 75), ylim = c(0, 65))

#text(120, 40, "射出时间在[0.3ms, 0.8ms]内", font = 2, col = "blue", cex = 1.3)
#text(250, 1.8, "180nl/min时突然增大", font = 2, col = "blue", cex = 1.3)

#model1 = loess(ek4$X1.5 ~ ek4$fv, span = 1.6 , degree = 2)
lines(ek4$fv, ek4$X1.5, col="#458B74", lwd=2, type="l")

#model2 = loess(ek4$X27 ~ ek4$fv, span = 1.6, degree = 2)
lines(ek4$fv,  ek4$X27, col="#FF00FF", lwd=2, type="l")

#model3 = loess(ek4$X54 ~ ek4$fv, span = 1.6, degree = 2)
lines(ek4$fv, ek4$X54, col="#EE0000", lwd=2, type="l")

#model4 = loess(ek4$X180 ~ ek4$fv, span = 1.6, degree =2)
lines(ek4$fv, ek4$X180, col="#27408B", lwd=2, type="l")


abline(h=1, lty = 3, col = "red", lwd = 2)
#abline(h=0.3, lty = 3, col = "red", lwd = 2)
abline(h=20, lty = 3, col = "blue", lwd = 2)
abline(v=70, lty = 3, col = "green3", lwd = 2)

#legend("topleft", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n", inset = .03)

#dev.off()

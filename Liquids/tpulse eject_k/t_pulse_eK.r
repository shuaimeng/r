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
#pdf("t_pulse_K_mixed.pdf")

par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(2,2,2,2))
mycolors <- c("red", "RoyalBlue", "DarkGreen", "Purple")

##################################画图--占空比k为0.2#######################
par(fig=c(0,0.5,0.5,1), new = TRUE)
plot(ek2$fv, ek2$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "eject time (ms)", main = "k = 0.2", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0, 150), ylim = c(0.2, 80))

for (i in 1:4){
lines(ek2$fv, ek2[,i+1],  col=mycolors[i], lwd = 2, type="l")
}
text(12, 80, "(a)", cex  = 1.2, font = 2)

par(fig = c(0.1,0.48,0.6,0.98), new  = TRUE)

plot(ek2$fv, ek2$X1.5, xaxs = "i", col = 0, xlab = "", ylab = "", main = "", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0, 75), ylim = c(0.2, 80))

for (i in 1:4){
lines(ek2$fv, ek2[,i+1],  col=mycolors[i], lwd = 2, type="l")
}
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = mycolors, lty =1, cex = 0.9, bty = "n")

##################################画图--占空比k为0.3#######################
par(fig=c(0.5,1,0.5,1), new = TRUE)

plot(ek3$fv, ek3$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "eject time (ms)", main = "k = 0.3", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0, 150), ylim = c(0.2, 80))

for (i in 1:4){
lines(ek3$fv, ek3[,i+1],  col=mycolors[i], lwd = 2, type="l")
}

text(12, 80, "(b)", cex  = 1.2, font = 2)

par(fig = c(0.6,0.98,0.6,0.98), new  = TRUE)

plot(ek3$fv, ek3$X1.5, xaxs = "i", col = 0, xlab = "", ylab = "", main = "", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0,75), ylim = c(0.2, 80))

for (i in 1:4){
lines(ek3$fv, ek3[,i+1],  col=mycolors[i], lwd = 2, type="l")
}
##################################画图--占空比k为0.4#######################
par(fig=c(0,0.5,0,0.5), new = TRUE)

plot(ek4$fv, ek4$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "eject time (ms)", main = "k = 0.4", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0, 150), ylim = c(0.2, 70))

for (i in 1:4){
lines(ek4$fv, ek4[,i+1],  col=mycolors[i], lwd = 2, type="l")
}

text(12, 70, "(c)", cex  = 1.2, font = 2)

par(fig=c(0.1,0.48,0.1,0.48), new = TRUE)

plot(ek4$fv, ek4$X1.5, xaxs = "i", col = 0, xlab = "", ylab = "", main = "", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0, 75), ylim = c(0.2, 70))

for (i in 1:4){
lines(ek4$fv, ek4[,i+1],  col=mycolors[i], lwd = 2, type="l")
}
##################################画图--占空比k为0.5#######################
par(fig=c(0.5,1,0,0.5), new = TRUE)

plot(ek5$fv, ek5$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "eject time (ms)", main = "k = 0.5", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0, 150), ylim = c(0.2, 85))

for (i in 1:4){
lines(ek5$fv, ek5[,i+1],  col=mycolors[i], lwd = 2, type="l")
}

text(12, 85, "(d)", cex  = 1.2, font = 2)

par(fig=c(0.6,0.98,0.1,0.48), new = TRUE)

plot(ek4$fv, ek4$X1.5, xaxs = "i", col = 0, xlab = "", ylab = "", main = "", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0, 75), ylim = c(0.2, 70))

for (i in 1:4){
lines(ek4$fv, ek4[,i+1],  col=mycolors[i], lwd = 2, type="l")
}

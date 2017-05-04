#研究t_for时间，即弯月面形成时间
#x轴是电压频率，y轴是t_for，legend是流量

#设定工作目录
setwd("D:/data")
library(xlsx)
 library(RColorBrewer)

#读取数据
q1<-read.xlsx("t_for_z.xls", sheetName = "15", header = TRUE)
q2<-read.xlsx("t_for_z.xls", sheetName = "27", header = TRUE)
q3<-read.xlsx("t_for_z.xls", sheetName = "54", header = TRUE)
q4<-read.xlsx("t_for_z.xls", sheetName = "180", header = TRUE)
#names(q1)<-c("q", 5, 10, 20, 30, 50, 75, 100, 125, 150, 175, 200, 250)
#seq(from=0， to=1, seq.out=12)
mycolors <-brewer.pal(12,"Paired")
par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(2,2,2,2))

plot(q1$k, q1[,1], xaxs = "r", col = 0, xlab = "Duty cycle k ", ylab = "t_for (ms)", main = "Q = 1.5nl/min", cex.lab = 1, cex.main = 1.3, xlim = c(0.2, 0.5), ylim = c(0.2, 40))
for (i in 1:12) {
lines(q1$k, q1[, i+1], col=mycolors[i], lwd=2, type="l", lty=1)
}

plot(q2$k, q2[,1], xaxs = "r", col = 0, xlab = "Duty cycle k", ylab = "t_for (ms)", main = "Q = 27nl/min", cex.lab = 1, cex.main = 1.3, xlim = c(0.2, 0.5), ylim = c(0.2, 40))
for (i in 1:12) {
lines(q2$k, q2[, i+1], col=mycolors[i], lwd=2, type="l", lty=1)
}

plot(q3$k, q3[,1], xaxs = "r", col = 0, xlab = "Duty cycle k", ylab = "t_for (ms)", main = "Q = 54nl/min", cex.lab = 1, cex.main = 1.3, xlim = c(0.2, 0.5), ylim = c(0.2, 25))
for (i in 1:12) {
lines(q3$k, q3[, i+1], col=mycolors[i], lwd=2, type="l", lty=1)
}

plot(q4$k, q4[,1], xaxs = "r", col = 0, xlab = "Duty cycle k", ylab = "t_for (ms)", main = "Q = 180nl/min", cex.lab = 1, cex.main = 1.3, xlim = c(0.2, 0.5), ylim = c(0.2, 50))
for (i in 1:12) {
lines(q4$k, q4[, i+1], col=mycolors[i], lwd=2, type="l", lty=1)
}

legend("topleft", c("5Hz", "10Hz", "20Hz", "30Hz", "50Hz", "75Hz", "100Hz", "125Hz", "150Hz", "175Hz", "200Hz", "250Hz"), col = mycolors, lwd = 2, lty = 1, cex = 0.9, bty = "n", inset = .03)

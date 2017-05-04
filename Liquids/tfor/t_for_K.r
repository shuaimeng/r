#研究t_for时间，即弯月面形成时间
#x轴是电压频率，y轴是t_for，legend是流量

#设定工作目录
setwd("D:/data")
library(xlsx)
 library(RColorBrewer)

#读取数据
k1<-read.xlsx("t_for_z.xls", sheetName = "0.2", header = TRUE)
k2<-read.xlsx("t_for_z.xls", sheetName = "0.3", header = TRUE)
k3<-read.xlsx("t_for_z.xls", sheetName = "0.4", header = TRUE)
k4<-read.xlsx("t_for_z.xls", sheetName = "0.5", header = TRUE)
#names(k1)<-c("q", 5, 10, 20, 30, 50, 75, 100, 125, 150, 175, 200, 250)
#seq(from=0， to=1, seq.out=12)
mycolors <-brewer.pal(12,"Paired")
par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(2,2,2,2))

plot(k1$q, k1[,1], xaxs = "r", col = 0, xlab = "Flow rate (nl/min)", ylab = "t_for (ms)", main = "K = 0.2", cex.lab = 1.2, cex.main = 1.3, xlim = c(0, 180), ylim = c(0.2, 36))
for (i in 1:12) {
lines(k1$q, k1[, i+1], col=mycolors[i], lwd=2, type="l", lty=1)
}

legend("topright", c("5Hz", "10Hz", "20Hz", "30Hz", "50Hz", "75Hz", "100Hz", "125Hz", "150Hz", "175Hz", "200Hz", "250Hz"), col = mycolors, lwd = 2, lty = 1, cex = 0.8, bty = "n", inset = .03)

plot(k2$q, k2[,1], xaxs = "r", col = 0, xlab = "Flow rate (nl/min)", ylab = "t_for (ms)", main = "K = 0.3", cex.lab = 1.2, cex.main = 1.3, xlim = c(0, 180), ylim = c(0.2, 30))
for (i in 1:12) {
lines(k2$q, k2[, i+1], col=mycolors[i], lwd=2, type="l", lty=1)
}

plot(k3$q, k3[,1], xaxs = "r", col = 0, xlab = "Flow rate (nl/min)", ylab = "t_for (ms)", main = "K = 0.4", cex.lab = 1.2, cex.main = 1.3, xlim = c(0, 180), ylim = c(0.2, 25))
for (i in 1:12) {
lines(k3$q, k3[, i+1], col=mycolors[i], lwd=2, type="l", lty=1)
}

plot(k4$q, k4[,1], xaxs = "r", col = 0, xlab = "Flow rate (nl/min)", ylab = "t_for (ms)", main = "K = 0.5", cex.lab = 1.2, cex.main = 1.3, xlim = c(0, 180), ylim = c(0.2, 50))
for (i in 1:12) {
lines(k4$q, k4[, i+1], col=mycolors[i], lwd=2, type="l", lty=1)
}


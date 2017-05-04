#研究t_for时间，即弯月面形成时间
#x轴是电压频率，y轴是t_for，legend是流量

#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
k1<-read.xlsx("t_for.xls", sheetName = "0.2", header = TRUE)
k2<-read.xlsx("t_for.xls", sheetName = "0.3", header = TRUE)
k3<-read.xlsx("t_for.xls", sheetName = "0.4", header = TRUE)
k4<-read.xlsx("t_for.xls", sheetName = "0.5", header = TRUE)

#设定空间
par(mfrow = c(2, 2), mar = c(4,4,2,2),  oma = c(2,2,2,2))

#pdf文件
pdf("t_for_125Hz.pdf")

##################################画图--占空比k为0.2#######################
plot(k1$fv, k1$X1.5, xaxs = "i", col = 0, xlab = "Fv (Hz)", ylab = "Formation time tfor (ms)", main = "k = 0.2", cex.lab = 1.2, cex.main = 1.3, xlim = c(0, 125), ylim = c(0.2, 40))

#model1 = loess(k1$X1.5 ~ k1$fv, span = 0.8 , degree = 2)
lines(k1$fv, k1$X1.5,  col="#458B74", lwd=2, type="l", lty=1)

#model2 = loess(k1$X27 ~ k1$fv, span = 0.8, degree = 2)
lines(k1$fv, k1$X27, col="#FF00FF",lwd=2, type="l", lty=1)

#model3 = loess(k1$X54 ~ k1$fv, span = 0.8, degree = 2)
lines(k1$fv, k1$X54, col="#EE0000", lwd=2, type="l", lty=1)

#model4 = loess(k1$X180 ~ k1$fv, span = 0.8, degree =2)
lines(k1$fv, k1$X180, col="#27408B", lwd=2, type="l", lty=1)
abline(h =5, lwd = 2, lty = 3, col = "red")
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n", inset = .03)

#################################画图--占空比为0.3#######################
plot(k2$fv, k2$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Formation time t_for (ms)", main = "k = 0.3", cex.lab = 1.2, cex.main = 1.3, xlim = c(0, 125), ylim = c(0.2, 30))

#model1 = loess(k2$X1.5 ~ k2$fv, span = 0.8 , degree = 2)
lines(k2$fv, k2$X1.5,  col="#458B74", lwd=2, type="l", lty=1)

#model2 = loess(k2$X27 ~ k2$fv, span = 0.8, degree = 2)
lines(k2$fv, k2$X27, col="#FF00FF", lwd=2, type="l", lty=1)

#model3 = loess(k2$X54 ~ k2$fv, span = 0.8, degree = 2)
lines(k2$fv, k2$X54, col="#EE0000", lwd=2, type="l", lty=1)

#model4 = loess(k2$X180 ~ k2$fv, span = 0.8, degree =2)
lines(k2$fv, k2$X180, col="#27408B", lwd=2, type="l", lty=1)
abline(h =5, lwd = 2, lty = 3, col = "red")
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n", inset = .03)

#################################画图--占空比为0.4#######################
plot(k3$fv, k3$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Formation time t_for (ms)", main = "k = 0.4", cex.lab = 1.2, cex.main = 1.3, xlim = c(0, 125), ylim = c(0.2, 25))

#model1 = loess(k3$X1.5 ~ k3$fv, span = 0.8 , degree = 2)
lines(k3$fv, k3$X1.5,  col="#458B74", lwd=2, type="l", lty=1)

#model2 = loess(k3$X27 ~ k3$fv, span = 0.8, degree = 2)
lines(k3$fv, k3$X27, col="#FF00FF", lwd=2, type="l", lty=1)

#model3 = loess(k3$X54 ~ k3$fv, span = 0.8, degree = 2)
lines(k3$fv, k3$X54, col="#EE0000", lwd=2, type="l", lty=1)

#model4 = loess(k3$X180 ~ k3$fv, span = 0.8, degree =2)
lines(k3$fv, k3$X180, col="#27408B", lwd=2, type="l", lty=1)
abline(h =5, lwd = 2, lty = 3, col = "red")
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n", inset = .03)

#################################画图--占空比为0.5#######################
plot(k4$fv, k4$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Formation time t_for (ms)", main = "k =  0.5", cex.lab = 1.2, cex.main = 1.3, xlim = c(0, 125), ylim = c(0, 50))

#model1 = loess(k4$X1.5 ~ k4$fv, span = 0.8 , degree = 2)
lines(k4$fv, k4$X1.5,  col="#458B74", lwd=2, type="l", lty=1)

#model2 = loess(k4$X27 ~ k4$fv, span = 0.8, degree = 2)
lines(k4$fv, k4$X27, col="#FF00FF", lwd=2, type="l", lty=1)

#model3 = loess(k4$X54 ~ k4$fv, span = 0.8, degree = 2)
lines(k4$fv, k4$X54, col="#EE0000", lwd=2, type="l", lty=1)

#model4 = loess(k4$X180 ~ k4$fv, span = 0.8, degree =2)
lines(k4$fv, k4$X180, col="#27408B", lwd=2, type="l", lty=1)

abline(h =5, lwd = 2, lty = 3, col = "red")

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n", inset = .03)

#mtext("Ethylene glycol | Distance = 1mm | Voltage = 2.0kv | Nozzle 30G 0.16mm", 1, line=1, col="black", cex=1.3, font=2, outer=TRUE )

dev.off()
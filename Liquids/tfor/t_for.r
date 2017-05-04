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
pdf("t_for_max-300Hz.pdf")

##################################画图--占空比k为0.2#######################
plot(k1$fv, k1$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Formation time t_for (ms)", main = "Formation time in duty = 0.2", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 300), ylim = c(0.2, 40))

#model1 = loess(k1$X1.5 ~ k1$fv, span = 0.8 , degree = 2)
lines(k1$fv, k1$X1.5,  col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

#model2 = loess(k1$X27 ~ k1$fv, span = 0.8, degree = 2)
lines(k1$fv, k1$X27, col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

#model3 = loess(k1$X54 ~ k1$fv, span = 0.8, degree = 2)
lines(k1$fv, k1$X54, col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

#model4 = loess(k1$X180 ~ k1$fv, span = 0.8, degree =2)
lines(k1$fv, k1$X180, col="#27408B", pch=24, lwd=2.5, type="b", lty=2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n")

#################################画图--占空比为0.3#######################
plot(k2$fv, k2$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Formation time t_for (ms)", main = "Formation time in duty = 0.3", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 300), ylim = c(0.2, 40))

#model1 = loess(k2$X1.5 ~ k2$fv, span = 0.8 , degree = 2)
lines(k2$fv, k2$X1.5,  col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

#model2 = loess(k2$X27 ~ k2$fv, span = 0.8, degree = 2)
lines(k2$fv, k2$X27, col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

#model3 = loess(k2$X54 ~ k2$fv, span = 0.8, degree = 2)
lines(k2$fv, k2$X54, col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

#model4 = loess(k2$X180 ~ k2$fv, span = 0.8, degree =2)
lines(k2$fv, k2$X180, col="#27408B", pch=24, lwd=2.5, type="b", lty=2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n")

#################################画图--占空比为0.4#######################
plot(k3$fv, k3$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Formation time t_for (ms)", main = "Formation time in duty = 0.4", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 300), ylim = c(0.2, 25))

#model1 = loess(k3$X1.5 ~ k3$fv, span = 0.8 , degree = 2)
lines(k3$fv, k3$X1.5,  col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

#model2 = loess(k3$X27 ~ k3$fv, span = 0.8, degree = 2)
lines(k3$fv, k3$X27, col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

#model3 = loess(k3$X54 ~ k3$fv, span = 0.8, degree = 2)
lines(k3$fv, k3$X54, col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

#model4 = loess(k3$X180 ~ k3$fv, span = 0.8, degree =2)
lines(lowess(k3$fv, k3$X180), col="#27408B", pch=24, lwd=2.5, type="b", lty=2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n")

#################################画图--占空比为0.5#######################
plot(k4$fv, k4$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Formation time t_for (ms)", main = "Formation time in duty = 0.5", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 300), ylim = c(0, 50))

#model1 = loess(k4$X1.5 ~ k4$fv, span = 0.8 , degree = 2)
lines(k4$fv, k4$X1.5,  col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

#model2 = loess(k4$X27 ~ k4$fv, span = 0.8, degree = 2)
lines(k4$fv, k4$X27, col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

#model3 = loess(k4$X54 ~ k4$fv, span = 0.8, degree = 2)
lines(k4$fv, k4$X54, col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

#model4 = loess(k4$X180 ~ k4$fv, span = 0.8, degree =2)
lines(k4$fv, k4$X180, col="#27408B", pch=24, lwd=2.5, type="b", lty=2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n")

mtext("Ethylene glycol | Distance = 1mm | Voltage = 2.0kv | Nozzle 30G 0.16mm", 1, line=1, col="black", cex=1.3, font=2, outer=TRUE )

dev.off()
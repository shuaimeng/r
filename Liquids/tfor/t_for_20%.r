#研究t_for问题
#对不同占空比下的数据进行排列整理
#一张大图，对应一张小图，小图嵌套在大图中

#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
k1<-read.xlsx("t_for.xls", sheetName = "0.2", header = TRUE)
k2<-read.xlsx("t_for.xls", sheetName = "0.3", header = TRUE)
k3<-read.xlsx("t_for.xls", sheetName = "0.4", header = TRUE)
k4<-read.xlsx("t_for.xls", sheetName = "0.5", header = TRUE)

#pdf保存
pdf("t_for_0.2.pdf")

#设定空间位置
par(fig=c(0,1,0,1), new = F)

##################################画图--占空比k为0.2#######################
plot(k1$fv, k1$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Formation time t_for (ms)", main = "Formation time in duty = 0.2", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 1050), ylim = c(0.2, 40))

#model1 = loess(k1$X1.5 ~ k1$fv, span = 0.8 , degree = 2)
lines(k1$fv, k1$X1.5,  col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

#model2 = loess(k1$X27 ~ k1$fv, span = 0.8, degree = 2)
lines(k1$fv, k1$X27, col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

#model3 = loess(k1$X54 ~ k1$fv, span = 0.8, degree = 2)
lines(k1$fv, k1$X54, col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

#model4 = loess(k1$X180 ~ k1$fv, span = 0.8, degree =2)
lines(k1$fv, k1$X180, col="#27408B", pch=24, lwd=2.5, type="b", lty=2)

legend("topleft", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

###############画小图########
par(fig = c(0.3,0.98,0.15,0.98), new  = TRUE)

plot(k1$fv, k1$X1.5, xaxs = "i", col = 0, xlab = "0 ~ 250 Hz", ylab = "t_for (ms)", main = "", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 250), ylim = c(0.2, 40))

#model1 = loess(k1$X1.5 ~ k1$fv, span = 0.8 , degree = 2)
lines(k1$fv, k1$X1.5,  col="#458B74", lwd=2.5, type="o", lty=2)

#model2 = loess(k1$X27 ~ k1$fv, span = 0.8, degree = 2)
lines(k1$fv, k1$X27, col="#FF00FF", lwd=2.5, type="o", lty=2)

#model3 = loess(k1$X54 ~ k1$fv, span = 0.8, degree = 2)
lines(k1$fv, k1$X54, col="#EE0000", lwd=2.5, type="o", lty=2)

#model4 = loess(k1$X180 ~ k1$fv, span = 0.8, degree =2)
lines(k1$fv, k1$X180, col="#27408B", lwd=2.5, type="o", lty=2)

#legend("topleft", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n", inset = .03)

#画小小图
par(fig = c(0.45,0.95,0.35,0.95), new  = TRUE)

plot(k1$fv, k1$X1.5, xaxs = "i", col = 0, xlab = "0 ~ 125 Hz", ylab = "t_for (ms)", main = "", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 125), ylim = c(0.2, 38))

#model1 = loess(k1$X1.5 ~ k1$fv, span = 1.6 , degree = 2)
lines(k1$fv, k1$X1.5, col="#458B74", lwd=2, type="l")

#model2 = loess(k1$X27 ~ k1$fv, span = 1.6, degree = 2)
lines(k1$fv,  k1$X27, col="#FF00FF", lwd=2, type="l")

#model3 = loess(k1$X54 ~ k1$fv, span = 1.6, degree = 2)
lines(k1$fv, k1$X54, col="#EE0000", lwd=2, type="l")

#model4 = loess(k1$X180 ~ k1$fv, span = 1.6, degree =2)
lines(k1$fv, k1$X180, col="#27408B", lwd=2, type="l")

#legend("topleft", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n", inset = .03)

dev.off()
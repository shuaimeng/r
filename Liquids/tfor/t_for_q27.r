#研究t_for问题
#对不同占空比下的数据进行排列整理
#一张大图，对应一张小图，小图嵌套在大图中

#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
#q3<-read.xlsx("t_for.xls", sheetName = "15nl", header = TRUE)
q3<-read.xlsx("t_for.xls", sheetName = "27nl", header = TRUE)
#q4<-read.xlsx("t_for.xls", sheetName = "54nl", header = TRUE)
#q5<-read.xlsx("t_for.xls", sheetName = "180nl", header = TRUE)

#pdf保存
#pdf("t_for_q27.pdf")

#设定空间位置
par(fig=c(0,1,0,1), new = F)

##################################画图--占空比k为0.3#######################
plot(q3$fv, q3$X0.2, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Formation time t_for (ms)", main = "Formation time in Q 27nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 650), ylim = c(0.2, 30))

#model1 = loess(q3$X0.2 ~ q3$fv, span = 0.8 , degree = 2)
lines(q3$fv, q3$X0.2,  col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

#model2 = loess(q3$X0.3 ~ q3$fv, span = 0.8, degree = 2)
lines(q3$fv, q3$X0.3, col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

#model3 = loess(q3$X0.4 ~ q3$fv, span = 0.8, degree = 2)
lines(q3$fv, q3$X0.4, col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

#model4 = loess(q3$X0.5 ~ q3$fv, span = 0.8, degree =2)
lines(q3$fv, q3$X0.5, col="#27408B", pch=24, lwd=2.5, type="b", lty=2)

abline(h=0.4, lwd = 1.5, col = "green", lty =2)

legend("topleft", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

###############画小图########
par(fig = c(0.3,0.98,0.15,0.98), new  = TRUE)

plot(q3$fv, q3$X0.2, xaxs = "i", col = 0, xlab = "0 ~ 250 Hz", ylab = "t_for (ms)", main = "", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 250), ylim = c(0.2, 30))

#model1 = loess(q3$X0.2 ~ q3$fv, span = 0.8 , degree = 2)
lines(q3$fv, q3$X0.2,  col="#458B74", lwd=2.5, type="l", lty=3)

#model2 = loess(q3$X0.3 ~ q3$fv, span = 0.8, degree = 2)
lines(q3$fv, q3$X0.3, col="#FF00FF", lwd=2.5, type="l", lty=3)

#model3 = loess(q3$X0.4 ~ q3$fv, span = 0.8, degree = 2)
lines(q3$fv, q3$X0.4, col="#EE0000", lwd=2.5, type="l", lty=3)

#model4 = loess(q3$X0.5 ~ q3$fv, span = 0.8, degree =2)
lines(q3$fv, q3$X0.5, col="#27408B", lwd=2.5, type="l", lty=3)

abline(v=200, lwd =2, col ="red", lty = 2)
abline(h=5, lwd =2, col = "blue", lty =2)

#legend("topleft", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n", inset = .03)

#画小小图
par(fig = c(0.45,0.95,0.35,0.95), new  = TRUE)

plot(q3$fv, q3$X0.2, xaxs = "i", col = 0, xlab = "0 ~ 125 Hz", ylab = "t_for (ms)", main = "", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 125), ylim = c(0.2, 30))

#model1 = loess(q3$X0.2 ~ q3$fv, span = 1.6 , degree = 2)
lines(q3$fv, q3$X0.2, col="#458B74", lwd=2, type="l")

#model2 = loess(q3$X0.3 ~ q3$fv, span = 1.6, degree = 2)
lines(q3$fv,  q3$X0.3, col="#FF00FF", lwd=2, type="l")

#model3 = loess(q3$X0.4 ~ q3$fv, span = 1.6, degree = 2)
lines(q3$fv, q3$X0.4, col="#EE0000", lwd=2, type="l")

#model4 = loess(q3$X0.5 ~ q3$fv, span = 1.6, degree =2)
lines(q3$fv, q3$X0.5, col="#27408B", lwd=2, type="l")


#legend("topleft", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, bty = "n", inset = .03)

#dev.off()
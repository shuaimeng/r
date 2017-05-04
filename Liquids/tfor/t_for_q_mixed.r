#研究t_for问题
#对不同占空比下的数据进行排列整理
#一张大图，对应一张小图，小图嵌套在大图中

#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
q2<-read.xlsx("t_for.xls", sheetName = "15nl", header = TRUE)
q3<-read.xlsx("t_for.xls", sheetName = "27nl", header = TRUE)
q4<-read.xlsx("t_for.xls", sheetName = "54nl", header = TRUE)
q5<-read.xlsx("t_for.xls", sheetName = "180nl", header = TRUE)

#pdf保存
#pdf("t_for_q54.pdf")

#设定空间位置
par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(2,2,2,2))

plot(q2$fv, q2$X0.2, xaxs = "i", col = 0, xlab = "0 ~ 125 Hz", ylab = "t_for (ms)", main = "Q = 1.5nl/min", cex.lab = 1.2, cex.main = 1.3, xlim = c(0, 125), ylim = c(0.2, 38))

#model1 = loess(q2$X0.2 ~ q2$fv, span = 1.6 , degree = 2)
lines(q2$fv, q2$X0.2, col="#458B74", lwd=2, type="l")

#model2 = loess(q2$X0.3 ~ q2$fv, span = 1.6, degree = 2)
lines(q2$fv,  q2$X0.3, col="#FF00FF", lwd=2, type="l")

#model3 = loess(q2$X0.4 ~ q2$fv, span = 1.6, degree = 2)
lines(q2$fv, q2$X0.4, col="#EE0000", lwd=2, type="l")

#model4 = loess(q2$X0.5 ~ q2$fv, span = 1.6, degree =2)
lines(q2$fv, q2$X0.5, col="#27408B", lwd=2, type="l")

abline(h = 5, lwd =2, col = "red", lty = 3)

legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

plot(q3$fv, q3$X0.2, xaxs = "i", col = 0, xlab = "0 ~ 125 Hz", ylab = "t_for (ms)", main = "Q = 27nl/min", cex.lab = 1.2, cex.main = 1.3, xlim = c(0, 125), ylim = c(0.2, 30))

#model1 = loess(q3$X0.2 ~ q3$fv, span = 1.6 , degree = 2)
lines(q3$fv, q3$X0.2, col="#458B74", lwd=2, type="l")

#model2 = loess(q3$X0.3 ~ q3$fv, span = 1.6, degree = 2)
lines(q3$fv,  q3$X0.3, col="#FF00FF", lwd=2, type="l")

#model3 = loess(q3$X0.4 ~ q3$fv, span = 1.6, degree = 2)
lines(q3$fv, q3$X0.4, col="#EE0000", lwd=2, type="l")

#model4 = loess(q3$X0.5 ~ q3$fv, span = 1.6, degree =2)
lines(q3$fv, q3$X0.5, col="#27408B", lwd=2, type="l")
abline(h = 5, lwd =2, col = "red", lty = 3)
legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

plot(q4$fv, q4$X0.2, xaxs = "i", col = 0, xlab = "0 ~ 125 Hz", ylab = "t_for (ms)", main = "Q = 54nl/min", cex.lab = 1.2, cex.main = 1.3, xlim = c(0, 125), ylim = c(0.2, 25))

#model1 = loess(q4$X0.2 ~ q4$fv, span = 1.6 , degree = 2)
lines(q4$fv, q4$X0.2, col="#458B74", lwd=2, type="l")

#model2 = loess(q4$X0.3 ~ q4$fv, span = 1.6, degree = 2)
lines(q4$fv,  q4$X0.3, col="#FF00FF", lwd=2, type="l")

#model3 = loess(q4$X0.4 ~ q4$fv, span = 1.6, degree = 2)
lines(q4$fv, q4$X0.4, col="#EE0000", lwd=2, type="l")

#model4 = loess(q4$X0.5 ~ q4$fv, span = 1.6, degree =2)
lines(q4$fv, q4$X0.5, col="#27408B", lwd=2, type="l")
abline(h = 5, lwd =2, col = "red", lty = 3)
legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

plot(q5$fv, q5$X0.2, xaxs = "i", col = 0, xlab = "0 ~ 125 Hz", ylab = "t_for (ms)", main = "Q = 180nl/min", cex.lab = 1.2, cex.main = 1.3, xlim = c(0, 125), ylim = c(0.2, 20))

#model1 = loess(q5$X0.2 ~ q5$fv, span = 1.6 , degree = 2)
lines(q5$fv, q5$X0.2, col="#458B74", lwd=2, type="l")

#model2 = loess(q5$X0.3 ~ q5$fv, span = 1.6, degree = 2)
lines(q5$fv,  q5$X0.3, col="#FF00FF", lwd=2, type="l")

#model3 = loess(q5$X0.4 ~ q5$fv, span = 1.6, degree = 2)
lines(q5$fv, q5$X0.4, col="#EE0000", lwd=2, type="l")

#model4 = loess(q5$X0.5 ~ q5$fv, span = 1.6, degree =2)
lines(q5$fv, q5$X0.5, col="#27408B", lwd=2, type="l")
abline(h = 5, lwd =2, col = "red", lty = 3)
legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")
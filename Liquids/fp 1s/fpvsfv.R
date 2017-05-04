library(xlsx)
#读取数据
q2 <- read.xlsx("f_eject.xls", sheetName = "eject_k2", header = TRUE)
q3 <- read.xlsx("f_eject.xls", sheetName = "eject_k3", header = TRUE)
q4 <- read.xlsx("f_eject.xls", sheetName = "eject_k4", header = TRUE)
q5 <- read.xlsx("f_eject.xls", sheetName = "eject_k5", header = TRUE)

#设置画图区域
par(mfrow = c(2,2), mar = c(2,2.6,2,2), oma = c(1,1,1,1))

#读取的是1s内总射出频率的数据

#画的是fp与fv相关的关系，在不同的流量的变化下的规律，四张图对应四个占空比k

#pdf("fp_vs_fv.pdf")

##################################画图--占空比k = 0.2#######################
plot(q2$fv, q2$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.3, 0, 0),tck=0.03, main = "k = 0.2", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 1200), ylim = c(0, 1200))

#model1 = loess(q2$X0.2 ~ q2$fv, span = 0.8 , degree = 2)
lines(q2$fv, q2$X1.5,  col="#458B74", lwd=2, type="l", lty=2)

#model2 = loess(q2$X0.3 ~ q2$fv, span = 0.8, degree = 2)
lines(q2$fv, q2$X27, col="#FF00FF", lwd=2, type="l", lty=2)

#model3 = loess(q2$X0.4 ~ q2$fv, span = 0.8, degree = 2)
lines(q2$fv, q2$X54, col="#EE0000", lwd=2, type="l", lty=2)

#model4 = loess(q2$X0.5 ~ q2$fv, span = 0.8, degree =2)
lines(q2$fv, q2$X180, col="#27408B", lwd=2, type="l", lty=2)

#区域划线
legend("bottomright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24),
       lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")

##################################画图--占空比k = 0.3#######################
plot(q3$fv, q3$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.3, 0, 0),tck=0.03,main = "k = 0.3", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 1600), ylim = c(0, 1600))

#model1 = loess(q2$X0.2 ~ q2$fv, span = 0.8 , degree = 2)
lines(q3$fv, q3$X1.5,  col="#458B74", lwd=2, type="l", lty=2)

#model2 = loess(q2$X0.3 ~ q2$fv, span = 0.8, degree = 2)
lines(q3$fv, q3$X27, col="#FF00FF", lwd=2, type="l", lty=2)

#model3 = loess(q2$X0.4 ~ q2$fv, span = 0.8, degree = 2)
lines(q3$fv, q3$X54, col="#EE0000", lwd=2, type="l", lty=2)

#model4 = loess(q2$X0.5 ~ q2$fv, span = 0.8, degree =2)
lines(q3$fv, q3$X180, col="#27408B", lwd=2, type="l", lty=2)

#区域划线
legend("bottomright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")

##################################画图--占空比k = 0.4#######################
plot(q4$fv, q4$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(f["p"]) (Hz)),mgp=c(1.3, 0, 0),tck=0.03, main = "k = 0.4", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 2000), ylim = c(0, 2000))

#model1 = loess(q2$X0.2 ~ q2$fv, span = 0.8 , degree = 2)
lines(q4$fv, q4$X1.5,  col="#458B74", lwd=2, type="l", lty=2)

#model2 = loess(q2$X0.3 ~ q2$fv, span = 0.8, degree = 2)
lines(q4$fv, q4$X27, col="#FF00FF", lwd=2, type="l", lty=2)

#model3 = loess(q2$X0.4 ~ q2$fv, span = 0.8, degree = 2)
lines(q4$fv, q4$X54, col="#EE0000", lwd=2, type="l", lty=2)

#model4 = loess(q2$X0.5 ~ q2$fv, span = 0.8, degree =2)
lines(q4$fv, q4$X180, col="#27408B", lwd=2, type="l", lty=2)

#区域划线
legend("bottomright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")

##################################画图--占空比k = 0.5#######################
plot(q5$fv, q5$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.3, 0, 0),tck=0.03,main = "k = 0.5", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 3500), ylim = c(0, 3500))

#model1 = loess(q2$X0.2 ~ q2$fv, span = 0.8 , degree = 2)
lines(q5$fv, q5$X1.5,  col="#458B74", lwd=2, type="l", lty=2)

#model2 = loess(q2$X0.3 ~ q2$fv, span = 0.8, degree = 2)
lines(q5$fv, q5$X27, col="#FF00FF", lwd=2, type="l", lty=2)

#model3 = loess(q2$X0.4 ~ q2$fv, span = 0.8, degree = 2)
lines(q5$fv, q5$X54, col="#EE0000", lwd=2, type="l", lty=2)

#model4 = loess(q2$X0.5 ~ q2$fv, span = 0.8, degree =2)
lines(q5$fv, q5$X180, col="#27408B", lwd=2, type="l", lty=2)

#区域划线
legend("bottomright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")


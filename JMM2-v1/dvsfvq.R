dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/jmm2-v1")
library(xlsx)
#读取数据
q2 <- read.xlsx("dvsfv.xls", sheetName = "q15", header = TRUE)
q3 <- read.xlsx("dvsfv.xls", sheetName = "q27", header = TRUE)
q4 <- read.xlsx("dvsfv.xls", sheetName = "q54", header = TRUE)
q5 <- read.xlsx("dvsfv.xls", sheetName = "q180", header = TRUE)

#设置画图区域
par(mfrow = c(2,2), mar = c(2,2.6,2,2), oma = c(1,1,1,1))

#读取的是1s内总射出频率的数据

#画的是fp与fv相关的关系，在不同的流量的变化下的规律，四张图对应四个占空比k

#pdf("fp_vs_fv.pdf")

##################################画图--占空比k = 0.2#######################
plot(q2$fv, q2$X2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(d) (um)), mgp=c(1.3, 0, 0),tck=0.03, main = "1.5nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 1000), ylim = c(0, 170))

#lines(q2$fv,q2$X2,col="#458B74", lwd=2, type="l", lty=2)
#lines(q2$fv,q2$X3,col="#458B74", lwd=2, type="l", lty=2)
#lines(q2$fv,q2$X4, col="#EE0000", lwd=2, type="l", lty=2)
#lines(q2$fv,q2$X5,col="#27408B", lwd=2, type="l", lty=2)


lines(lowess(q2$fv,q2$X2,f=0.6),  col="#458B74", lwd=2, type="l", lty=2)
lines(lowess(q2$fv,q2$X3,f=0.6), col="#FF00FF", lwd=2, type="l", lty=2)
lines(lowess(q2$fv,q2$X4,f=0.6), col="#EE0000", lwd=2, type="l", lty=2)
lines(lowess(q2$fv,q2$X5,f=0.6), col="#27408B", lwd=2, type="l", lty=2)

#区域划线
legend("topright", c("k=0.2", "k=0.3", "k=0.4", "k=0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24),
       lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")

##################################画图--占空比k = 0.3#######################
plot(q3$fv, q3$X2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(d) (um)), mgp=c(1.3, 0, 0),tck=0.03,main = "27nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 500), ylim = c(0, 170))

lines(q3$fv,q3$X2,  col="#458B74", lwd=2, type="l", lty=2)
lines(q3$fv,q3$X3, col="#FF00FF", lwd=2, type="l", lty=2)
lines(q3$fv,q3$X4, col="#EE0000", lwd=2, type="l", lty=2)
lines(q3$fv,q3$X5, col="#27408B", lwd=2, type="l", lty=2)

#lines(lowess(q3$fv,q3$X2,f=0.3),  col="#458B74", lwd=2, type="l", lty=2)
#lines(lowess(q3$fv,q3$X3,f=0.3), col="#FF00FF", lwd=2, type="l", lty=2)
#lines(lowess(q3$fv,q3$X4,f=0.3), col="#EE0000", lwd=2, type="l", lty=2)
#lines(lowess(q3$fv,q3$X5,f=0.3), col="#27408B", lwd=2, type="l", lty=2)

#区域划线
legend("topright", c("k=0.2", "k=0.3", "k=0.4", "k=0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24),
       lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")
##################################画图--占空比k = 0.4#######################
plot(q4$fv, q4$X2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(d) (um)),mgp=c(1.3, 0, 0),tck=0.03, main = "54nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 1100), ylim = c(0, 170))

lines(q4$fv, q4$X2,col="#458B74", lwd=2, type="l", lty=2)
lines(q4$fv, q4$X3,col="#FF00FF", lwd=2, type="l", lty=2)
lines(q4$fv, q4$X4,col="#EE0000", lwd=2, type="l", lty=2)
lines(q4$fv, q4$X5,col="#27408B", lwd=2, type="l", lty=2)


#lines(lowess(q4$fv, q4$X2,f=0.3),  col="#458B74", lwd=2, type="l", lty=2)
#lines(lowess(q4$fv, q4$X3,f=0.3), col="#FF00FF", lwd=2, type="l", lty=2)
#lines(lowess(q4$fv, q4$X4,f=0.3), col="#EE0000", lwd=2, type="l", lty=2)
#lines(lowess(q4$fv, q4$X5,f=0.3), col="#27408B", lwd=2, type="l", lty=2)

#区域划线
legend("topright", c("k=0.2", "k=0.3", "k=0.4", "k=0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24),
       lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")
##################################画图--占空比k = 0.5#######################
plot(q5$fv, q5$X2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(d) (um)), mgp=c(1.3, 0, 0),tck=0.03,main = "180nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 3500), ylim = c(0, 170))

#lines(q5$fv, q5$X2,  col="#458B74", lwd=2, type="l", lty=2)
#lines(q5$fv, q5$X3,  col="#FF00FF", lwd=2, type="l", lty=2)
#lines(q5$fv, q5$X4,  col="#EE0000", lwd=2, type="l", lty=2)
#lines(q5$fv, q5$X5,  col="#27408B", lwd=2, type="l", lty=2)
#scatter.smooth(q5$fv,q5$X2, span=2/3,degree=1, col="#458B74", lwd=2, type="l", lty=2)
#scatter.smooth(q5$fv,q5$X3, span=2/3,degree=1, col="#458B74", lwd=2, type="l", lty=2)
#scatter.smooth(q5$fv,q5$X4, span=2/3,degree=1, col="#458B74", lwd=2, type="l", lty=2)
#scatter.smooth(q5$fv,q5$X5, span=2/3,degree=1, col="#458B74", lwd=2, type="l", lty=2)


lines(lowess(q5$fv, q5$X2,f=0.1),col="#458B74", lwd=2, type="l", lty=2)
lines(lowess(q5$fv, q5$X3,f=0.1),col="#FF00FF", lwd=2, type="l", lty=2)
lines(lowess(q5$fv, q5$X4,f=0.1),col="#EE0000", lwd=2, type="l", lty=2)
lines(lowess(q5$fv, q5$X5,f=0.1),col="#27408B", lwd=2, type="l", lty=2)

#区域划线
legend("topright", c("k=0.2", "k=0.3", "k=0.4", "k=0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24),
       lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")

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
ylab = expression(italic(d["d"]) (um)), mgp=c(1.3, 0, 0),tck=0.03,main = "1.5nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 1000), ylim = c(0, 170))

points(q2$fv,q2$X2,col="green4",pch=0,cex=0.5)
points(q2$fv,q2$X3,col="black",pch=1,cex=0.5)
points(q2$fv,q2$X4,col="red",pch=2,cex=0.5)
points(q2$fv,q2$X5,col="blue",pch=5,cex=0.5)

lines(loess.smooth(q2$fv,q2$X2, span=0.8,degree=2), col="green4", lwd=2,lty=2)
lines(loess.smooth(q2$fv,q2$X3, span=0.8,degree=2), col="black", lwd=2,lty=2)
lines(loess.smooth(q2$fv,q2$X4, span=0.8,degree=2), col="red", lwd=2,lty=2)
lines(loess.smooth(q2$fv,q2$X5, span=0.8,degree=2), col="blue", lwd=2,lty=2)

abline(h=40, col="red", lwd=1,lty=3)
text(600,50,"ratio=4",col="red", font=2,cex=1)
abline(h=20, col="blue", lwd=1,lty=3)
text(700,33,"ratio=8",col="blue", font=2,cex=1)
abline(h=10, col="green4", lwd=1,lty=3)
text(800,6,"ratio=16",col="green4", font=2,cex=1)

#####小图##






#区域划线
legend("topright", c("k=0.2", "k=0.3", "k=0.4", "k=0.5"), col = c("green4", "black", "red", "blue"), pch = c(0, 1, 2, 5),
       lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")

##################################画图--占空比k = 0.3#######################
plot(q3$fv, q3$X2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(d["d"]) (um)), mgp=c(1.3, 0, 0),tck=0.03,main = "27nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 1000), ylim = c(0, 170))

points(q3$fv,q3$X2,col="green4",pch=0,cex=0.5)
points(q3$fv,q3$X3,col="black",pch=1,cex=0.5)
points(q3$fv,q3$X4,col="red",pch=2,cex=0.5)
points(q3$fv,q3$X5,col="blue",pch=5,cex=0.5)

lines(loess.smooth(q3$fv,q3$X2, span=0.8,degree=2), col="green4", lwd=2,lty=2)
lines(loess.smooth(q3$fv,q3$X3, span=0.8,degree=2), col="black", lwd=2,lty=2)
lines(loess.smooth(q3$fv,q3$X4, span=0.8,degree=2), col="red", lwd=2,lty=2)
lines(loess.smooth(q3$fv,q3$X5, span=0.8,degree=2), col="blue", lwd=2,lty=2)

abline(h=40, col="red", lwd=1,lty=3)
text(350,60,"ratio=4",col="red", font=2,cex=1)
abline(h=20, col="blue", lwd=1,lty=3)
text(160,30,"ratio=8",col="blue", font=2,cex=1)
abline(h=10, col="green4", lwd=1,lty=3)
text(400,6,"ratio=16",col="green4", font=2,cex=1)
#区域划线
legend("topright", c("k=0.2", "k=0.3", "k=0.4", "k=0.5"), col = c("green4", "black", "red", "blue"), pch = c(0, 1, 2, 5),
       lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")

##################################画图--占空比k = 0.4#######################
plot(q4$fv, q4$X2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(d["d"]) (um)),mgp=c(1.3, 0, 0),tck=0.03, main = "54nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 1000), ylim = c(0, 170))

points(q4$fv,q4$X2,col="green4",pch=0,cex=0.5)
points(q4$fv,q4$X3,col="black",pch=1,cex=0.5)
points(q4$fv,q4$X4,col="red",pch=2,cex=0.5)
points(q5$fv,q5$X5,col="blue",pch=5,cex=0.5)

lines(loess.smooth(q4$fv,q4$X2, span=0.8,degree=2), col="green4", lwd=2,lty=2)
lines(loess.smooth(q4$fv,q4$X3, span=0.8,degree=2), col="black", lwd=2,lty=2)
lines(loess.smooth(q4$fv,q4$X4, span=0.8,degree=2), col="red", lwd=2,lty=2)
lines(loess.smooth(q4$fv,q4$X5, span=0.8,degree=2), col="blue", lwd=2,lty=2)

abline(h=40, col="red", lwd=1,lty=3)
text(700,50,"ratio=4",col="red", font=2,cex=1)
abline(h=20, col="blue", lwd=1,lty=3)
text(400,30,"ratio=8",col="blue", font=2,cex=1)
abline(h=10, col="green4", lwd=1,lty=3)
text(800,6,"ratio=16",col="green4", font=2,cex=1)
#区域划线
legend("topright", c("k=0.2", "k=0.3", "k=0.4", "k=0.5"), col = c("green4", "black", "red", "blue"), pch = c(0, 1, 2, 5),
       lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")

##################################画图--占空比k = 0.5#######################
plot(q5$fv, q5$X2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(d["d"]) (um)), mgp=c(1.3, 0, 0),tck=0.03,main = "180nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 3500), ylim = c(0, 170))

points(q5$fv,q5$X2,col="green4",pch=0,cex=0.5)
points(q5$fv,q5$X3,col="black",pch=1,cex=0.5)
points(q5$fv,q5$X4,col="red",pch=2,cex=0.5)
points(q5$fv,q5$X5,col="blue",pch=5,cex=0.5)

lines(loess.smooth(q5$fv,q5$X2, span=0.8,degree=2), col="green4", lwd=2,lty=2)
lines(loess.smooth(q5$fv,q5$X3, span=0.8,degree=2), col="black", lwd=2,lty=2)
lines(loess.smooth(q5$fv,q5$X4, span=0.8,degree=2), col="red", lwd=2,lty=2)
lines(loess.smooth(q5$fv,q5$X5, span=0.8,degree=2), col="blue", lwd=2,lty=2)

abline(h=40, col="red", lwd=1,lty=3)
text(1200,50,"ratio=4",col="red", font=2,cex=1)
abline(h=20, col="blue", lwd=1,lty=3)
text(1600,33,"ratio=8",col="blue", font=2,cex=1)
abline(h=10, col="green4", lwd=1,lty=3)
text(2000,6,"ratio=16",col="green4", font=2,cex=1)
#区域划线
legend("topright", c("k=0.2", "k=0.3", "k=0.4", "k=0.5"), col = c("green4", "black", "red", "blue"), pch = c(0, 1, 2, 5),
       lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")

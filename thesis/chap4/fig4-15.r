dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/chap4")
library(xlsx)
#读取数据
q2 <- read.xlsx("dvsfv.xlsx", sheetName = "q15", header = TRUE)
#q3 <- read.xlsx("dvsfv.xls", sheetName = "q27", header = TRUE)
#q4 <- read.xlsx("dvsfv.xls", sheetName = "q54", header = TRUE)
q5 <- read.xlsx("dvsfv.xlsx", sheetName = "q180", header = TRUE)

#设置画图区域
par(mar = c(2,2.6,2,2), oma = c(1,1,1,1))

#读取的是1s内总射出频率的数据

#画的是fp与fv相关的关系，在不同的流量的变化下的规律，四张图对应四个占空比k

#pdf("fp_vs_fv.pdf")

##################################画图--占空比k = 0.2#######################


plot(q2$fv, q2$X2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(d["d"]) (um)), mgp=c(1, 0, 0),tck=0.01,main = "", cex.lab = 1, cex.main = 1, xlim = c(0, 3500), ylim = c(0, 100))

points(q2$fv,q2$X2,col="red",pch=0,cex=0.5)
points(q2$fv,q2$X3,col="blue",pch=1,cex=0.5)

points(q5$fv,q5$X4,col="green3",pch=2,cex=0.5)
points(q5$fv,q5$X5,col="black",pch=5,cex=0.5)

lines(loess.smooth(q2$fv,q2$X2, span=0.8,degree=2), col="red", lwd=2,lty=2)
lines(loess.smooth(q2$fv,q2$X3, span=0.8,degree=2), col="blue", lwd=2,lty=2)
#lines(loess.smooth(q2$fv,q2$X4, span=0.8,degree=2), col="red", lwd=2,lty=2)
#lines(loess.smooth(q2$fv,q2$X5, span=0.8,degree=2), col="blue", lwd=2,lty=2)
lines(loess.smooth(q5$fv,q5$X4, span=0.8,degree=2), col="green3", lwd=2,lty=2)
lines(loess.smooth(q5$fv,q5$X5, span=0.8,degree=2), col="black", lwd=2,lty=2)

abline(h=40, col="red", lwd=1,lty=3)
text(900,50,"ratio=4",col="red", font=2,cex=1)
abline(h=20, col="blue", lwd=1,lty=3)
text(1500,29,"ratio=8",col="blue", font=2,cex=1)
abline(h=10, col="green4", lwd=1,lty=3)
text(2000,6,"ratio=16",col="green4", font=2,cex=1)

#####小图##






#区域划线
legend("topright", c("1.5nl/min-kv0.2", "1.5nl/min-kv0.3", "180nl/min-kv0.4",
                     "180nl/min-kv0.5"), col = c("red", "blue", "green3", "black"), pch = c(0, 1, 2, 5),
       lwd = 2, lty = 2, cex = 0.8, inset = .02, bty = "n")

##################################画图--占空比k = 0.3#######################

dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/jmm2-v1")

library(xlsx)
#读取数据
q2 <- read.xlsx("dvsfv.xls", sheetName = "q15", header = TRUE)
q3 <- read.xlsx("dvsfv.xls", sheetName = "q27", header = TRUE)
q4 <- read.xlsx("dvsfv.xls", sheetName = "q54", header = TRUE)
q5 <- read.xlsx("dvsfv.xls", sheetName = "q180", header = TRUE)

plot(q2$fv, q2$X2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(d) (um)), main = "1.5nl/min", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 1000), ylim = c(0, 170))

points(q2$fv,q2$X2,col="green4",pch=0,cex=0.5)
points(q2$fv,q2$X3,col="black",pch=1,cex=0.5)
points(q2$fv,q2$X4,col="red",pch=2,cex=0.5)
points(q2$fv,q2$X5,col="blue",pch=5,cex=0.5)
points(q2$fv,q2$X6,col="red",pch=6,cex=0.5)
points(q2$fv,q2$X8,col="blue",pch=22,cex=0.5)


lines(loess.smooth(q2$fv,q2$X2, span=2/3,degree=2), col="green4", lwd=2,lty=2)
lines(loess.smooth(q2$fv,q2$X3, span=2/3,degree=2), col="black", lwd=2,lty=2)
lines(loess.smooth(q2$fv,q2$X4, span=2/3,degree=2), col="red", lwd=2,lty=2)
lines(loess.smooth(q2$fv,q2$X5, span=2/3,degree=2), col="blue", lwd=2,lty=2)
lines(loess.smooth(q2$fv,q2$X6, span=2/3,degree=2), col="yellow", lwd=2,lty=2)
lines(loess.smooth(q2$fv,q2$X8, span=2/3,degree=2), col="pink", lwd=2,lty=2)


legend("topright", c("k=0.2", "k=0.3", "k=0.4", "k=0.5","k=0.6","k=0.8"), col = c("green4", "black", "red", "blue","yellow","pink"),
       pch = c(0, 1, 2, 5,6,22),lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")

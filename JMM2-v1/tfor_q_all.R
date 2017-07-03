dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/jmm2-v1")
library(xlsx)
#读取数据
q2 <- read.xlsx("t_for.xls", sheetName = "15nl", header = TRUE)
q3 <- read.xlsx("t_for.xls", sheetName = "27nl", header = TRUE)
q4 <- read.xlsx("t_for.xls", sheetName = "54nl", header = TRUE)
q5 <- read.xlsx("t_for.xls", sheetName = "180nl", header = TRUE)

par(mfrow = c(2,2), mar = c(2,2.6,2,2), oma = c(1,1,1,1))
#######k=0.2#######
#par(fig=c(0.1,0.98,0.1,0.98), new=F)

plot(q2$fv, q2$X0.2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(1.3, 0, 0),tck=0.03,
     main = "1.5nlmin", cex.lab = 1.2, cex.main = 1.3,
     xlim = c(0, 250),ylim=c(0,40))

points(q2$fv,q2$X0.2,col="green4",pch=0,cex=0.6)
points(q2$fv,q2$X0.3,col="black",pch=1,cex=0.6)
points(q2$fv,q2$X0.4,col="red",pch=2,cex=0.6)
points(q2$fv,q2$X0.5,col="blue",pch=5,cex=0.6)

lines(lowess(q2$fv, q2$X0.2,f=0.1,iter=3),col="green4", lwd=2, type="l", lty=2)
lines(lowess(q2$fv, q2$X0.3,f=0.1,iter=3),col="black", lwd=2, type="l", lty=2)
lines(lowess(q2$fv,q2$X0.4,f=0.1,iter=3),col="red", lwd=2, type="l", lty=2)
lines(lowess(q2$fv, q2$X0.5,f=0.1,iter=3),col="blue", lwd=2, type="l", lty=2)

legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4",
                     "k = 0.5"), col = c("green4",
                                           "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 1, inset = .1, bty = "n")


########k=0.3#######
plot(q3$fv, q3$X0.2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(1.3, 0, 0),tck=0.03,
     main = "27nlmin", cex.lab = 1.2, cex.main = 1.3,
     xlim = c(0, 250),ylim=c(0,40))

points(q3$fv,q3$X0.2,col="green4",pch=0,cex=0.6)
points(q3$fv,q3$X0.3,col="black",pch=1,cex=0.6)
points(q3$fv,q3$X0.4,col="red",pch=2,cex=0.6)
points(q3$fv,q3$X0.5,col="blue",pch=5,cex=0.6)

lines(lowess(q3$fv, q3$X0.2,f=0.1,iter=3),col="green4", lwd=2, type="l", lty=2)
lines(lowess(q3$fv, q3$X0.3,f=0.1,iter=3),col="black", lwd=2, type="l", lty=2)
lines(lowess(q3$fv, q3$X0.4,f=0.1,iter=3),col="red", lwd=2, type="l", lty=2)
lines(lowess(q3$fv, q3$X0.5,f=0.1,iter=3),col="blue", lwd=2, type="l", lty=2)

legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4",
                     "k = 0.5"), col = c("green4",
                                         "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 1, inset = .1, bty = "n")
########k=0.4######
plot(q4$fv, q4$X0.2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(1.3, 0, 0),tck=0.03,
     main = "54nlmin", cex.lab = 1.2, cex.main = 1.3,
     xlim = c(0, 250),ylim=c(0,40))

points(q4$fv,q4$X0.2,col="green4",pch=0,cex=0.6)
points(q4$fv,q4$X0.3,col="black",pch=1,cex=0.6)
points(q4$fv,q4$X0.4,col="red",pch=2,cex=0.6)
points(q4$fv,q4$X0.5,col="blue",pch=5,cex=0.6)

lines(lowess(q4$fv, q4$X0.2,f=0.1,iter=3), col="green4", lwd=2, type="l", lty=2)
lines(lowess(q4$fv, q4$X0.3,f=0.1,iter=3),col="black", lwd=2, type="l", lty=2)
lines(lowess(q4$fv, q4$X0.4,f=0.1,iter=3),col="red", lwd=2, type="l", lty=2)
lines(lowess(q4$fv, q4$X0.5,f=0.1,iter=3),col="blue", lwd=2, type="l", lty=2)

legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4",
                     "k = 0.5"), col = c("green4",
                                         "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 1, inset = .1, bty = "n")
########k=0.5######

plot(q5$fv, q5$X0.2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(1.3, 0, 0),tck=0.03,
     main = "180nlmin", cex.lab = 1.2, cex.main = 1.3,
     xlim = c(0, 250),ylim=c(0,40))

points(q5$fv,q5$X0.2,col="green4",pch=0,cex=0.6)
points(q5$fv,q5$X0.3,col="black",pch=1,cex=0.6)
points(q5$fv,q5$X0.4,col="red",pch=2,cex=0.6)
points(q5$fv,q5$X0.5,col="blue",pch=5,cex=0.6)

lines(lowess(q5$fv, q5$X0.2,f=0.1,iter=3), col="green4", lwd=2, type="l", lty=2)
lines(lowess(q5$fv, q5$X0.3,f=0.1,iter=3), col="black", lwd=2, type="l", lty=2)
lines(lowess(q5$fv, q5$X0.4,f=0.1,iter=3),col="red", lwd=2, type="l", lty=2)
lines(lowess(q5$fv, q5$X0.5,f=0.1,iter=3),col="blue", lwd=2, type="l", lty=2)

legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4",
                     "k = 0.5"), col = c("green4",
                                         "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 1, inset = .1, bty = "n")

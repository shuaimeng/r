dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/chap4")
library(xlsx)
#读取数据
q2 <- read.xlsx("t_for.xls", sheetName = "15nl", header = TRUE)
q3 <- read.xlsx("t_for.xls", sheetName = "27nl", header = TRUE)
q4 <- read.xlsx("t_for.xls", sheetName = "54nl", header = TRUE)
q5 <- read.xlsx("t_for.xls", sheetName = "180nl", header = TRUE)

#par(mfrow = c(2,2), mar = c(2,2.4,2,2), oma = c(1,1,1,1))
#######k=0.2#######
par(fig=c(0,0.5,0.5,1),mar = c(2,2,0.6,0.8), oma = c(1,1,1,1),new=F)

plot(q2$fv,q2$X0.2,col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(0.8, 0, 0),tck=0.01,
     main = "", cex.lab = 1, cex.main = 1,cex.axis = 1,
     xlim = c(0, 250),ylim=c(0,40))

     mtext("1.5nl/min",3,line=0,font=2,cex=0.9)

points(q2$fv,q2$X0.2,col="green4",pch=0,cex=0.6)
points(q2$fv,q2$X0.3,col="black",pch=1,cex=0.6)
points(q2$fv,q2$X0.4,col="red",pch=2,cex=0.6)
points(q2$fv,q2$X0.5,col="blue",pch=5,cex=0.6)

lines(lowess(q2$fv, q2$X0.2,f=0.2,iter=3),col="green4", lwd=2, type="l", lty=2)
lines(lowess(q2$fv, q2$X0.3,f=0.2,iter=3),col="black", lwd=2, type="l", lty=2)
lines(lowess(q2$fv,q2$X0.4,f=0.2,iter=3),col="red", lwd=2, type="l", lty=2)
lines(lowess(q2$fv, q2$X0.5,f=0.2,iter=3),col="blue", lwd=2, type="l", lty=2)

####小图####
par(fig=c(0.12,0.49,0.65,0.99),new=T)

plot(q2$fv, q2$X0.2,col ="0",bty="n",xlab="250Hz ~ 1KHz",ylab=expression(italic(t["for"]) (ms)), mgp=c(0.6, 0, 0),tck=0.01,
     cex.axis = 0.7,cex.lab=0.7, xlim = c(250, 1000),ylim=c(0,3))

lines(q2$fv, q2$X0.2,col="green4", lwd=2, type="l", lty=2)
lines(q2$fv, q2$X0.3,col="black", lwd=2, type="l", lty=2)
lines(q2$fv,q2$X0.4,col="red", lwd=2, type="l", lty=2)
lines(q2$fv, q2$X0.5,col="blue", lwd=2, type="l", lty=2)

legend("topright", c("kv = 0.2", "kv = 0.3", "kv = 0.4",
                     "kv = 0.5"), col = c("green4",
                                         "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.8, inset = .01, bty = "n")


########k=0.3#######
par(fig=c(0.5,1,0.5,1), new=T)

plot(q3$fv, q3$X0.2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(0.8, 0, 0),tck=0.01,
     main = "", cex.lab = 1, cex.axis = 1,cex.main = 0.8,
     xlim = c(0, 250),ylim=c(0,40))
     mtext("27nl/min",3,line=0,font=2,cex=0.9)

points(q3$fv,q3$X0.2,col="green4",pch=0,cex=0.6)
points(q3$fv,q3$X0.3,col="black",pch=1,cex=0.6)
points(q3$fv,q3$X0.4,col="red",pch=2,cex=0.6)
points(q3$fv,q3$X0.5,col="blue",pch=5,cex=0.6)

lines(lowess(q3$fv, q3$X0.2,f=0.2,iter=3),col="green4", lwd=2, type="l", lty=2)
lines(lowess(q3$fv, q3$X0.3,f=0.2,iter=3),col="black", lwd=2, type="l", lty=2)
lines(lowess(q3$fv, q3$X0.4,f=0.2,iter=3),col="red", lwd=2, type="l", lty=2)
lines(lowess(q3$fv, q3$X0.5,f=0.2,iter=3),col="blue", lwd=2, type="l", lty=2)

####小图####
par(fig=c(0.6,0.99,0.65,0.99),new=T)

plot(q3$fv, q3$X0.2,col ="0",bty="n",xlab="250Hz ~ 600Hz",ylab=expression(italic(t["for"]) (ms)), mgp=c(0.6, 0, 0),tck=0.01,
     cex.axis = 0.7,cex.lab=0.8, xlim = c(250, 600),ylim=c(0,3))

lines(q3$fv, q3$X0.2,col="green4", lwd=2, type="l", lty=2)
lines(q3$fv, q3$X0.3,col="black", lwd=2, type="l", lty=2)
lines(q3$fv, q3$X0.4,col="red", lwd=2, type="l", lty=2)
lines(q3$fv, q3$X0.5,col="blue", lwd=2, type="l", lty=2)

legend("topright", c("kv = 0.2", "kv = 0.3", "kv = 0.4",
                     "kv = 0.5"), col = c("green4",
                                         "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.8, inset = .01, bty = "n")


########k=0.4######
par(fig=c(0,0.5,0,0.5), new=T)

plot(q4$fv, q4$X0.2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(0.8, 0, 0),tck=0.03,
     main = "", cex.lab = 1, cex.axis = 1,cex.main = 0.8,
     xlim = c(0, 250),ylim=c(0,40))

     mtext("54nl/min",3,line=0,font=2,cex=0.9)


points(q4$fv,q4$X0.2,col="green4",pch=0,cex=0.6)
points(q4$fv,q4$X0.3,col="black",pch=1,cex=0.6)
points(q4$fv,q4$X0.4,col="red",pch=2,cex=0.6)
points(q4$fv,q4$X0.5,col="blue",pch=5,cex=0.6)

lines(lowess(q4$fv, q4$X0.2,f=0.2,iter=3), col="green4", lwd=2, type="l", lty=2)
lines(lowess(q4$fv, q4$X0.3,f=0.2,iter=3),col="black", lwd=2, type="l", lty=2)
lines(lowess(q4$fv, q4$X0.4,f=0.2,iter=3),col="red", lwd=2, type="l", lty=2)
lines(lowess(q4$fv, q4$X0.5,f=0.2,iter=3),col="blue", lwd=2, type="l", lty=2)


###小图###
par(fig=c(0.12,0.49,0.15,0.49),new=T)

plot(q2$fv, q2$X0.2,col ="0",bty="n",xlab="250Hz ~ 1KHz",ylab=expression(italic(t["for"]) (ms)), mgp=c(0.6, 0, 0),tck=0.01,
     cex.axis = 0.7,cex.lab=0.8, xlim = c(250, 1000),ylim=c(0,2))

lines(q4$fv, q4$X0.2, col="green4", lwd=2, type="l", lty=2)
lines(q4$fv, q4$X0.3,col="black", lwd=2, type="l", lty=2)
lines(q4$fv, q4$X0.4,col="red", lwd=2, type="l", lty=2)
lines(q4$fv, q4$X0.5,col="blue", lwd=2, type="l", lty=2)

legend("topright", c("kv = 0.2", "kv = 0.3", "kv = 0.4",
                     "kv = 0.5"), col = c("green4",
                                         "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.8, inset = .01, bty = "n")
########k=0.5######
par(fig=c(0.5,1,0,0.5), new=T)

plot(q5$fv, q5$X0.2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(0.8, 0, 0),tck=0.01,
     main = "", cex.lab = 1,cex.axis = 1, cex.main = 0.8,
     xlim = c(0, 250),ylim=c(0,40))
     mtext("180nl/min",3,line=0,font=2,cex=0.9)

points(q5$fv,q5$X0.2,col="green4",pch=0,cex=0.6)
points(q5$fv,q5$X0.3,col="black",pch=1,cex=0.6)
points(q5$fv,q5$X0.4,col="red",pch=2,cex=0.6)
points(q5$fv,q5$X0.5,col="blue",pch=5,cex=0.6)

lines(lowess(q5$fv, q5$X0.2,f=0.2,iter=3), col="green4", lwd=2, type="l", lty=2)
lines(lowess(q5$fv, q5$X0.3,f=0.2,iter=3), col="black", lwd=2, type="l", lty=2)
lines(lowess(q5$fv, q5$X0.4,f=0.2,iter=3),col="red", lwd=2, type="l", lty=2)
lines(lowess(q5$fv, q5$X0.5,f=0.2,iter=3),col="blue", lwd=2, type="l", lty=2)

###小图###
par(fig=c(0.58,0.99,0.15,0.49),new=T)

plot(q3$fv, q3$X0.2,col ="0",bty="n",xlab="250Hz ~ 3.5KHz",ylab=expression(italic(t["for"]) (ms)), mgp=c(0.6, 0, 0),tck=0.01,
     cex.axis = 0.7,cex.lab=0.8, xlim = c(250,3500),ylim=c(0,2))

lines(q5$fv, q5$X0.2, col="green4", lwd=2, type="l", lty=2)
lines(q5$fv, q5$X0.3, col="black", lwd=2, type="l", lty=2)
lines(q5$fv, q5$X0.4,col="red", lwd=2, type="l", lty=2)
lines(q5$fv, q5$X0.5,col="blue", lwd=2, type="l", lty=2)

legend("topright", c("kv = 0.2", "kv = 0.3", "kv = 0.4",
                     "kv = 0.5"), col = c("green4",
                                         "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.8, inset = .01, bty = "n")

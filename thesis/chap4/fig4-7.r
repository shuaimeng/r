dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/chap4")
library(xlsx)
#读取数据
q2 <- read.xlsx("t_for.xls", sheetName = "0.2", header = TRUE)
q3 <- read.xlsx("t_for.xls", sheetName = "0.3", header = TRUE)
q4 <- read.xlsx("t_for.xls", sheetName = "0.4", header = TRUE)
q5 <- read.xlsx("t_for.xls", sheetName = "0.5", header = TRUE)

#######k=0.2#######

par(fig=c(0,0.5,0.5,1),mar = c(2,2,0.6,0.8), oma = c(1,1,1,1),new=F)

plot(q2$fv, q2$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(0.8, 0, 0),tck=0.01,
     main = "", cex.lab = 1, cex.axis = 1,
     xlim = c(0, 250),ylim=c(0,40))

     mtext("kv = 0.2",3,line=0,font=2,cex=0.9)

points(q2$fv,q2$X1.5,col="green4",pch=0,cex=0.6)
points(q2$fv,q2$X27,col="black",pch=1,cex=0.6)
points(q2$fv,q2$X54,col="red",pch=2,cex=0.6)
points(q2$fv,q2$X180,col="blue",pch=5,cex=0.6)

lines(lowess(q2$fv, q2$X1.5,f=0.1,iter=3),col="green4", lwd=2, type="l", lty=2)
lines(lowess(q2$fv, q2$X27,f=0.1,iter=3),col="black", lwd=2, type="l", lty=2)
lines(lowess(q2$fv,q2$X54,f=0.1,iter=3),col="red", lwd=2, type="l", lty=2)
lines(lowess(q2$fv, q2$X180,f=0.1,iter=3),col="blue", lwd=2, type="l", lty=2)

####小图####
par(fig=c(0.12,0.485,0.65,0.99),new=T)

plot(q2$fv, q2$X1.5, xaxs = "i", bty="n",col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(0.8, 0, 0),tck=0.01,
     main = "", cex.lab = 0.8, cex.axis = 0.8,
     xlim = c(250, 1000),ylim=c(0,1))


points(q2$fv,q2$X1.5,col="green4",pch=0,cex=0.6)
points(q2$fv,q2$X27,col="black",pch=1,cex=0.6)
points(q2$fv,q2$X54,col="red",pch=2,cex=0.6)
points(q2$fv,q2$X180,col="blue",pch=5,cex=0.6)

lines(lowess(q2$fv, q2$X1.5,f=0.1,iter=3),col="green4", lwd=2, type="l", lty=2)
lines(lowess(q2$fv, q2$X27,f=0.1,iter=3),col="black", lwd=2, type="l", lty=2)
lines(lowess(q2$fv,q2$X54,f=0.1,iter=3),col="red", lwd=2, type="l", lty=2)
lines(lowess(q2$fv, q2$X180,f=0.1,iter=3),col="blue", lwd=2, type="l", lty=2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min",
                     "180nl/min"), col = c("green4",
                                           "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.85, inset = .01, bty = "n")


########k=0.3#######

par(fig=c(0.5,1,0.5,1), new=T)


plot(q3$fv, q3$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(0.8, 0, 0),tck=0.01,
     main = "", cex.lab = 1, cex.axis = 1,
     xlim = c(0, 250),ylim=c(0,40))

     mtext("kv = 0.3",3,line=0,font=2,cex=0.9)


points(q3$fv,q3$X1.5,col="green4",pch=0,cex=0.6)
points(q3$fv,q3$X27,col="black",pch=1,cex=0.6)
points(q3$fv,q3$X54,col="red",pch=2,cex=0.6)
points(q3$fv,q3$X180,col="blue",pch=5,cex=0.6)

lines(lowess(q3$fv, q3$X1.5,f=0.1,iter=3),col="green4", lwd=2, type="l", lty=2)
lines(lowess(q3$fv, q3$X27,f=0.1,iter=3),col="black", lwd=2, type="l", lty=2)
lines(lowess(q3$fv, q3$X54,f=0.1,iter=3),col="red", lwd=2, type="l", lty=2)
lines(lowess(q3$fv, q3$X180,f=0.1,iter=3),col="blue", lwd=2, type="l", lty=2)

####小图####
par(fig=c(0.6,0.985,0.65,0.99),new=T)

plot(q3$fv, q3$X1.5, xaxs = "i",bty="n", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(0.8, 0, 0),tck=0.01,
     main = "", cex.lab = 0.8, cex.axis = 0.8,
     xlim = c(250, 1050),ylim=c(0,2))

points(q3$fv,q3$X1.5,col="green4",pch=0,cex=0.6)
points(q3$fv,q3$X27,col="black",pch=1,cex=0.6)
points(q3$fv,q3$X54,col="red",pch=2,cex=0.6)
points(q3$fv,q3$X180,col="blue",pch=5,cex=0.6)

lines(lowess(q3$fv, q3$X1.5,f=0.1,iter=3),col="green4", lwd=2, type="l", lty=2)
lines(lowess(q3$fv, q3$X27,f=0.1,iter=3),col="black", lwd=2, type="l", lty=2)
lines(lowess(q3$fv, q3$X54,f=0.1,iter=3),col="red", lwd=2, type="l", lty=2)
lines(lowess(q3$fv, q3$X180,f=0.1,iter=3),col="blue", lwd=2, type="l", lty=2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min",
                     "180nl/min"), col = c("green4",
                                           "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.85, inset = .01, bty = "n")
########k=0.4######
par(fig=c(0,0.5,0,0.5), new=T)

plot(q4$fv, q4$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(0.8, 0, 0),tck=0.01,
     main = "", cex.lab = 1, cex.axis = 1,
     xlim = c(0, 250),ylim=c(0,40))

     mtext("kv = 0.4",3,line=0,font=2,cex=0.9)


points(q4$fv,q4$X1.5,col="green4",pch=0,cex=0.6)
points(q4$fv,q4$X27,col="black",pch=1,cex=0.6)
points(q4$fv,q4$X54,col="red",pch=2,cex=0.6)
points(q4$fv,q4$X180,col="blue",pch=5,cex=0.6)

lines(q4$fv, q4$X1.5, col="green4", lwd=2, type="l", lty=2)
lines(q4$fv, q4$X27,col="black", lwd=2, type="l", lty=2)
lines(q4$fv, q4$X54,col="red", lwd=2, type="l", lty=2)
lines(q4$fv, q4$X180,col="blue", lwd=2, type="l", lty=2)

par(fig=c(0.12,0.485,0.15,0.49),new=T)

plot(q4$fv, q4$X1.5, xaxs = "i", bty="n",col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(0.8, 0, 0),tck=0.01,
     main = "", cex.lab = 0.8, cex.axis = 0.8,
     xlim = c(250, 2050),ylim=c(0,2))

points(q4$fv,q4$X1.5,col="green4",pch=0,cex=0.6)
points(q4$fv,q4$X27,col="black",pch=1,cex=0.6)
points(q4$fv,q4$X54,col="red",pch=2,cex=0.6)
points(q4$fv,q4$X180,col="blue",pch=5,cex=0.6)

lines(q4$fv, q4$X1.5, col="green4", lwd=2, type="l", lty=2)
lines(q4$fv, q4$X27,col="black", lwd=2, type="l", lty=2)
lines(q4$fv, q4$X54,col="red", lwd=2, type="l", lty=2)
lines(q4$fv, q4$X180,col="blue", lwd=2, type="l", lty=2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min",
                     "180nl/min"), col = c("green4",
                                           "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.85, inset = .01, bty = "n")

########k=0.5######
par(fig=c(0.5,1,0,0.5), new=T)


plot(q5$fv, q5$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(0.8, 0, 0),tck=0.01,
     main = "", cex.lab = 1, cex.axis = 1,
     xlim = c(0, 250),ylim=c(0,40))

     mtext("kv = 0.5",3,line=0,font=2,cex=0.9)


points(q5$fv,q5$X1.5,col="green4",pch=0,cex=0.6)
points(q5$fv,q5$X27,col="black",pch=1,cex=0.6)
points(q5$fv,q5$X54,col="red",pch=2,cex=0.6)
points(q5$fv,q5$X180,col="blue",pch=5,cex=0.6)

lines(q5$fv, q5$X1.5,col="green4", lwd=2, type="l", lty=2)
lines(q5$fv, q5$X27, col="black", lwd=2, type="l", lty=2)
lines(q5$fv, q5$X54,col="red", lwd=2, type="l", lty=2)
lines(q5$fv, q5$X180,col="blue", lwd=2, type="l", lty=2)

par(fig=c(0.6,0.99,0.15,0.49),new=T)

plot(q5$fv, q5$X1.5, xaxs = "i", bty="n",col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)), mgp=c(0.8, 0, 0),tck=0.01,
     main = "", cex.lab = 0.8, cex.axis = 0.8,
     xlim = c(250, 4000),ylim=c(0,2))

points(q5$fv,q5$X1.5,col="green4",pch=0,cex=0.6)
points(q5$fv,q5$X27,col="black",pch=1,cex=0.6)
points(q5$fv,q5$X54,col="red",pch=2,cex=0.6)
points(q5$fv,q5$X180,col="blue",pch=5,cex=0.6)

lines(q5$fv, q5$X1.5,col="green4", lwd=2, type="l", lty=2)
lines(q5$fv, q5$X27, col="black", lwd=2, type="l", lty=2)
lines(q5$fv, q5$X54,col="red", lwd=2, type="l", lty=2)
lines(q5$fv, q5$X180,col="blue", lwd=2, type="l", lty=2)


legend("topright", c("1.5nl/min", "27nl/min", "54nl/min",
                     "180nl/min"), col = c("green4",
                                           "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.85, inset = .01, bty = "n")

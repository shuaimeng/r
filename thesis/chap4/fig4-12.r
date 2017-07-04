dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/chap4")
library(xlsx)
#读取数据
q2 <- read.xlsx("f_eject_2.xls", sheetName = "eject_q15", header = TRUE)
q3 <- read.xlsx("f_eject_2.xls", sheetName = "eject_q27", header = TRUE)
q4 <- read.xlsx("f_eject_2.xls", sheetName = "eject_q54", header = TRUE)
q5 <- read.xlsx("f_eject_2.xls", sheetName = "eject_q180", header = TRUE)

#设置画图区域
par(mfrow = c(2,2), mar = c(1.6,2,0.6,1), oma = c(1,1,1,1))

#读取的是1s内总射出频率的数据

#画的是fp与fv相关的关系，在不同的占空比的变化下的规律，四张图对应四个流量

#pdf("fp_vs_fv.pdf")

##################################画图--占空比k = 0.2#######################
plot(q2$fv, q2$X0.2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(0.8, 0, 0),tck=0.01, main = "", cex.lab = 0.8, cex.axis = 0.8, xlim = c(0, 1200), ylim = c(0, 1200))

     mtext("1.5nl/min",3,line=-1,font=2,cex=0.9)


points(q2$fv,q2$X0.2,col="green4",pch=0,cex=0.5)
points(q2$fv,q2$X0.3,col="black",pch=1,cex=0.5)
points(q2$fv,q2$X0.4,col="red",pch=2,cex=0.5)
points(q2$fv,q2$X0.5,col="blue",pch=5,cex=0.5)

z1=loess(q2$X0.2~q2$fv,span=0.1,degree=2)
lines(q2$fv, z1$fit,  col="green4", lwd=2, type="l", lty=2)
z2=loess(q2$X0.3~q2$fv,span=0.1,degree=2)
lines(q2$fv, q2$X0.3, col="black", lwd=2, type="l", lty=2)
z3=loess(q2$X0.4~q2$fv,span=0.1,degree=2)
lines(q2$fv, q2$X0.4, col="red", lwd=2, type="l", lty=2)
z4=loess(q2$X0.5~q2$fv,span=0.1,degree=2)
lines(q2$fv, q2$X0.5, col="blue", lwd=2, type="l", lty=2)
#区域划线
legend("bottomright", c("k=0.2", "k=0.3", "k=0.4", "k=0.5"), col = c("green4", "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.8, inset = .02, bty = "n")

##################################画图--占空比k = 0.3#######################
plot(q3$fv, q3$X0.2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(0.8, 0, 0),tck=0.01,main = "", cex.lab = 0.8, cex.axis = 0.8, xlim = c(0, 1600), ylim = c(0, 1600))

     mtext("27nl/min",3,line=-1,font=2,cex=0.9)

points(q3$fv,q3$X0.2,col="green4",pch=0,cex=0.8)
points(q3$fv,q3$X0.3,col="black",pch=1,cex=0.8)
points(q3$fv,q3$X0.4,col="red",pch=2,cex=0.8)
points(q3$fv,q3$X0.5,col="blue",pch=5,cex=0.8)

z5=loess(q3$X0.2~q3$fv,span=0.1,degree=2)
lines(q3$fv, q3$X0.2,  col="green4", lwd=2, type="l", lty=2)
z6=loess(q3$X0.3~q3$fv,span=0.1,degree=2)
lines(q3$fv, q3$X0.3, col="black", lwd=2, type="l", lty=2)
z7=loess(q3$X0.4~q3$fv,span=0.1,degree=2)
lines(q3$fv, q3$X0.4, col="red", lwd=2, type="l", lty=2)
z8=loess(q3$X0.5~q3$fv,span=0.1,degree=2)
lines(q3$fv, q3$X0.5, col="blue", lwd=2, type="l", lty=2)

#区域划线
legend("bottomright", c("k=0.2", "k=0.3", "k=0.4", "k=0.5"), col = c("green4", "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.8, inset = .02, bty = "n")
##################################画图--占空比k = 0.4#######################
plot(q4$fv, q4$X0.2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["p"]) (Hz)),mgp=c(0.8, 0, 0),tck=0.01, main = "", cex.lab = 0.8, cex.axis = 0.8, xlim = c(0, 2000), ylim = c(0, 2000))

mtext("54nl/min",3,line=-1,font=2,cex=0.9)


points(q4$fv,q4$X0.2,col="green4",pch=0,cex=0.8)
points(q4$fv,q4$X0.3,col="black",pch=1,cex=0.8)
points(q4$fv,q4$X0.4,col="red",pch=2,cex=0.8)
points(q4$fv,q4$X0.5,col="blue",pch=5,cex=0.8)

z9=loess(q4$X0.2~q4$fv,span=0.1,degree=2)
lines(q4$fv, z9$fit,col="green4", lwd=2, type="l", lty=2)
z10=loess(q4$X0.3~q4$fv,span=0.1,degree=2)
lines(q4$fv, q4$X0.3, col="black", lwd=2, type="l", lty=2)
z11=loess(q4$X0.4~q4$fv,span=0.1,degree=2)
lines(q4$fv, z11$fit, col="red", lwd=2, type="l", lty=2)
z12=loess(q4$X0.5~q4$fv,span=0.1,degree=2)
lines(q4$fv, z12$fit, col="blue", lwd=2, type="l", lty=2)


#区域划线
legend("bottomright", c("k=0.2", "k=0.3", "k=0.4", "k=0.5"), col = c("green4", "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.8, inset = .02, bty = "n")
##################################画图--占空比k = 0.5#######################
plot(q5$fv, q5$X0.2, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(0.8, 0, 0),tck=0.01,main = "", cex.lab = 0.8, cex.axis = 0.8, xlim = c(0, 3500), ylim = c(0, 3500))

mtext("180nl/min",3,line=-1,font=2,cex=0.9)


points(q5$fv,q5$X0.2,col="green4",pch=0,cex=0.8)
points(q5$fv,q5$X0.3,col="black",pch=1,cex=0.8)
points(q5$fv,q5$X0.4,col="red",pch=2,cex=0.8)
points(q5$fv,q5$X0.5,col="blue",pch=5,cex=0.8)

z13=loess(q5$X0.2~q5$fv,span=0.1,degree=2)
lines(q5$fv, z13$fit,col="green4", lwd=2, type="l", lty=2)
z14=loess(q5$X0.3~q5$fv,span=0.1,degree=2)
lines(q5$fv, z14$fit, col="black", lwd=2, type="l", lty=2)
z15=loess(q5$X0.4~q5$fv,span=0.1,degree=2)
lines(q5$fv, z15$fit, col="red", lwd=2, type="l", lty=2)
z16=loess(q5$X0.5~q5$fv,span=0.1,degree=2)
lines(q5$fv, z16$fit, col="blue", lwd=2, type="l", lty=2)


#区域划线
legend("bottomright", c("k=0.2", "k=0.3", "k=0.4", "k=0.5"), col = c("green4", "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.8, inset = .02, bty = "n")

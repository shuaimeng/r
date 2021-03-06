dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/jmm2-v1")
library(xlsx)
#读取数据
q2 <- read.xlsx("f_eject_2.xls", sheetName = "single_k2", header = TRUE)
q3 <- read.xlsx("f_eject_2.xls", sheetName = "single_k3", header = TRUE)
q4 <- read.xlsx("f_eject_2.xls", sheetName = "single_k4", header = TRUE)
q5 <- read.xlsx("f_eject_2.xls", sheetName = "single_k5", header = TRUE)

#设置画图区域
#par(mfrow = c(2,2), mar = c(2,2.6,2,2), oma = c(1,1,1,1))

#读取的是1s内总射出频率的数据

#画的是fp与fv相关的关系，在不同的流量的变化下的规律，四张图对应四个占空比k

#pdf("fp_vs_fv.pdf")

##################################画图--占空比k = 0.2#######################
par(fig=c(0,0.5,0.5,1),mar = c(2,2.2,2,2), oma = c(1,1,1,1),new=F)

plot(q2$fv, q2$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.01, main = "", cex.lab = 1, xlim = c(0, 50),ylim=c(0,200))

  mtext("k=0.2",3,line=0.2,font=2,cex=1.2)

points(q2$fv,q2$X1.5,col="green4",pch=0,cex=0.8)
points(q2$fv,q2$X27,col="black",pch=1,cex=0.8)
points(q2$fv,q2$X54,col="red",pch=2,cex=0.8)
points(q2$fv,q2$X180,col="blue",pch=5,cex=0.8)

#z1=loess(q2$X1.5~q2$fv,span=0.1,degree=2)
lines(q2$fv, q2$X1.5, col="green4", lwd=2, type="l", lty=2)
#z2=loess(q2$X27~q2$fv,span=0.1,degree=2)
lines(q2$fv, q2$X27, col="black", lwd=2, type="l", lty=2)
#z3=loess(q2$X54~q2$fv,span=0.1,degree=2)
lines(q2$fv, q2$X54, col="red", lwd=2, type="l", lty=2)
#z4=loess(q2$X180~q2$fv,span=0.1,degree=2)
lines(q2$fv, q2$X180, col="blue", lwd=2, type="l", lty=2)

######小图######
par(fig=c(0.12,0.49,0.65,0.99),new=T)

plot(q2$fv, q2$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1, 0, 0),tck=0.01, main = "", cex.lab = 1, xlim = c(0, 150),ylim=c(0,200))

points(q2$fv,q2$X1.5,col="green4",pch=0,cex=0.8)
points(q2$fv,q2$X27,col="black",pch=1,cex=0.8)
points(q2$fv,q2$X54,col="red",pch=2,cex=0.8)
points(q2$fv,q2$X180,col="blue",pch=5,cex=0.8)

#z1=loess(q2$X1.5~q2$fv,span=0.1,degree=2)
lines(q2$fv, q2$X1.5, col="green4", lwd=2, type="l", lty=2)
#z2=loess(q2$X27~q2$fv,span=0.1,degree=2)
lines(q2$fv, q2$X27, col="black", lwd=2, type="l", lty=2)
#z3=loess(q2$X54~q2$fv,span=0.1,degree=2)
lines(q2$fv, q2$X54, col="red", lwd=2, type="l", lty=2)
#z4=loess(q2$X180~q2$fv,span=0.1,degree=2)
lines(q2$fv, q2$X180, col="blue", lwd=2, type="l", lty=2)

#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("green4", "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.8, inset = .01, bty = "n")

##################################画图--占空比k = 0.3#######################
par(fig=c(0.5,1,0.5,1), new=T)


plot(q3$fv, q3$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1, 0, 0),tck=0.01,main = "", cex.lab = 1, xlim = c(0, 50),ylim =c(0,200))
     mtext("k=0.3",3,line=0.2,font=2,cex=1.2)


points(q3$fv,q3$X1.5,col="green4",pch=0,cex=0.8)
points(q3$fv,q3$X27,col="black",pch=1,cex=0.8)
points(q3$fv,q3$X54,col="red",pch=2,cex=0.8)
points(q3$fv,q3$X180,col="blue",pch=5,cex=0.8)

#z5=loess(q3$X1.5~q3$fv,span=0.1,degree=2)
lines(q3$fv, q3$X1.5,col="green4", lwd=2, type="l", lty=2)
#z6=loess(q3$X27~q3$fv,span=0.1,degree=2)
lines(q3$fv,q3$X27, col="black", lwd=2, type="l", lty=2)
#z7=loess(q3$X54~q3$fv,span=0.1,degree=2)
lines(q3$fv,q3$X54, col="red", lwd=2, type="l", lty=2)
#z8=loess(q3$X180~q3$fv,span=0.1,degree=2)
lines(q3$fv,q3$X180, col="blue", lwd=2, type="l", lty=2)

####小图####
par(fig=c(0.62,0.99,0.65,0.99),new=T)

plot(q3$fv, q3$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1, 0, 0),tck=0.01,main = "", cex.lab = 1, xlim = c(0, 150),ylim =c(0,200))

points(q3$fv,q3$X1.5,col="green4",pch=0,cex=0.8)
points(q3$fv,q3$X27,col="black",pch=1,cex=0.8)
points(q3$fv,q3$X54,col="red",pch=2,cex=0.8)
points(q3$fv,q3$X180,col="blue",pch=5,cex=0.8)

#z5=loess(q3$X1.5~q3$fv,span=0.1,degree=2)
lines(q3$fv, q3$X1.5,col="green4", lwd=2, type="l", lty=2)
#z6=loess(q3$X27~q3$fv,span=0.1,degree=2)
lines(q3$fv,q3$X27, col="black", lwd=2, type="l", lty=2)
#z7=loess(q3$X54~q3$fv,span=0.1,degree=2)
lines(q3$fv,q3$X54, col="red", lwd=2, type="l", lty=2)
#z8=loess(q3$X180~q3$fv,span=0.1,degree=2)
lines(q3$fv,q3$X180, col="blue", lwd=2, type="l", lty=2)


#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("green4", "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.8, inset = .01, bty = "n")

##################################画图--占空比k = 0.4#######################
par(fig=c(0,0.5,0,0.5), new=T)


plot(q4$fv, q4$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)),mgp=c(1, 0, 0),tck=0.01, main = "", cex.lab = 1, xlim = c(0, 50),ylim=c(0,200))

     mtext("k=0.4",3,line=0.2,font=2,cex=1.2)


points(q4$fv,q4$X1.5,col="green4",pch=0,cex=0.8)
points(q4$fv,q4$X27,col="black",pch=1,cex=0.8)
points(q4$fv,q4$X54,col="red",pch=2,cex=0.8)
points(q4$fv,q4$X180,col="blue",pch=5,cex=0.8)

#z9=loess(q4$X1.5~q4$fv,span=0.1,degree=2)
lines(q4$fv,q4$X1.5,col="green4", lwd=2, type="l", lty=2)
#z10=loess(q4$X27~q4$fv,span=0.1,degree=2)
lines(q4$fv,q4$X27, col="black", lwd=2, type="l", lty=2)
#z11=loess(q4$X54~q4$fv,span=0.1,degree=2)
lines(q4$fv,q4$X54, col="red", lwd=2, type="l", lty=2)
#z12=loess(q4$X180~q4$fv,span=0.1,degree=2)
lines(q4$fv,q4$X180, col="blue", lwd=2, type="l", lty=2)

###小图###
par(fig=c(0.12,0.49,0.15,0.49),new=T)

plot(q4$fv, q4$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)),mgp=c(1, 0, 0),tck=0.01, main = "", cex.lab = 1, xlim = c(0, 150),ylim=c(0,200))

points(q4$fv,q4$X1.5,col="green4",pch=0,cex=0.8)
points(q4$fv,q4$X27,col="black",pch=1,cex=0.8)
points(q4$fv,q4$X54,col="red",pch=2,cex=0.8)
points(q4$fv,q4$X180,col="blue",pch=5,cex=0.8)

#z9=loess(q4$X1.5~q4$fv,span=0.1,degree=2)
lines(q4$fv,q4$X1.5,col="green4", lwd=2, type="l", lty=2)
#z10=loess(q4$X27~q4$fv,span=0.1,degree=2)
lines(q4$fv,q4$X27, col="black", lwd=2, type="l", lty=2)
#z11=loess(q4$X54~q4$fv,span=0.1,degree=2)
lines(q4$fv,q4$X54, col="red", lwd=2, type="l", lty=2)
#z12=loess(q4$X180~q4$fv,span=0.1,degree=2)
lines(q4$fv,q4$X180, col="blue", lwd=2, type="l", lty=2)

#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("green4", "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.8, inset = .01, bty = "n")


##################################画图--占空比k = 0.5#######################
########k=0.5######
par(fig=c(0.5,1,0,0.5), new=T)

plot(q5$fv, q5$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1, 0, 0),tck=0.01,main = "", cex.lab = 1, xlim = c(0, 50),ylim=c(0,200))
     mtext("k=0.5",3,line=0.2,font=2,cex=1.2)


points(q5$fv,q5$X1.5,col="green4",pch=0,cex=0.8)
points(q5$fv,q5$X27,col="black",pch=1,cex=0.8)
points(q5$fv,q5$X54,col="red",pch=2,cex=0.8)
points(q5$fv,q5$X180,col="blue",pch=5,cex=0.8)

#z13=loess(q5$X1.5~q5$fv,span=0.1,degree=2)
lines(q5$fv, q5$X1.5,col="green4", lwd=2, type="l", lty=2)
#z14=loess(q5$X27~q5$fv,span=0.1,degree=2)
lines(q5$fv,q5$X27, col="black", lwd=2, type="l", lty=2)
#z15=loess(q5$X54~q5$fv,span=0.1,degree=2)
lines(q5$fv,q5$X54, col="red", lwd=2, type="l", lty=2)
#z16=loess(q5$X180~q5$fv,span=0.1,degree=2)
lines(q5$fv,q5$X180, col="blue", lwd=2, type="l", lty=2)

###小图###
par(fig=c(0.6,0.99,0.15,0.49),new=T)

plot(q5$fv, q5$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1, 0, 0),tck=0.01,main = "", cex.lab = 1, xlim = c(0, 150),ylim=c(0,200))

points(q5$fv,q5$X1.5,col="green4",pch=0,cex=0.8)
points(q5$fv,q5$X27,col="black",pch=1,cex=0.8)
points(q5$fv,q5$X54,col="red",pch=2,cex=0.8)
points(q5$fv,q5$X180,col="blue",pch=5,cex=0.8)

#z13=loess(q5$X1.5~q5$fv,span=0.1,degree=2)
lines(q5$fv, q5$X1.5,col="green4", lwd=2, type="l", lty=2)
#z14=loess(q5$X27~q5$fv,span=0.1,degree=2)
lines(q5$fv,q5$X27, col="black", lwd=2, type="l", lty=2)
#z15=loess(q5$X54~q5$fv,span=0.1,degree=2)
lines(q5$fv,q5$X54, col="red", lwd=2, type="l", lty=2)
#z16=loess(q5$X180~q5$fv,span=0.1,degree=2)
lines(q5$fv,q5$X180, col="blue", lwd=2, type="l", lty=2)

#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("green4", "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 0.8, inset = .01, bty = "n")

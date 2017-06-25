dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/print")

library(xlsx)

# reading ux and sy

k1<-read.xlsx("doty.xlsx",sheetName="600",header=TRUE)
k2<-read.xlsx("doty.xlsx",sheetName="1khz",header=TRUE)
k3<-read.xlsx("doty.xlsx",sheetName="2khz",header=TRUE)

# par

par(mfrow = c(2,1), mar = c(2,2.4,2,2), oma = c(1,1,1,1))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))

# errorbar
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
stop("vectors must be same length")
arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}


# color setting

yan<-c("red","blue","black")
pcc<-c(0,1,2)
uy<-c(50,100,150)

z1<-k1$syeva/uy
z2<-k2$syeva/uy
z3<-k3$syeva/uy

e1<-k1$systd/uy
e2<-k2$systd/uy
e3<-k3$systd/uy

plot(uy,z1, col=0,xlab = expression(italic(U["y"]) (um)),ylab = expression(italic(Sy/Uy)), mgp=c(1.1, 0, 0),tck=0.02,main = "", xlim = c(50,150),ylim=c(-0.5,1))

mtext("Sy/Uy",3,line=0.2,font=2,cex=1.2)

lines(uy,z1,col=yan[1],pch=pcc[1],lwd=1.5,lty=2,type="b")
lines(uy,z2,col=yan[2],pch=pcc[2],lwd=1.5,lty=2,type="b")
lines(uy,z3,col=yan[3],pch=pcc[3],lwd=1.5,lty=2,type="b")

error.bar(uy,z1,e1/2,col=yan[1])
error.bar(uy,z2,e2/2,col=yan[2])
error.bar(uy,z3,e3/2,col=yan[3])

leg<-c("600Hz","1KHz","2KHz")

legend("topleft",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n",cex=0.8)

# plot2,Sy+D

r1<-(k1$syeva+k1$deva)/uy
r2<-(k2$syeva+k2$deva)/uy
r3<-(k3$syeva+k3$deva)/uy

q1<-(k1$systd+k1$stdd)/uy
q2<-(k2$systd+k2$stdd)/uy
q3<-(k3$systd+k3$stdd)/uy

plot(uy,r1, col=0,xlab = expression(italic(U["y"]) (um)),ylab = expression(italic(Sy+D/Uy)), mgp=c(1.1, 0, 0),tck=0.02,main = "", xlim = c(50,150),ylim=c(0.5,1))

mtext("Line space/Uy",3,line=0.2,font=2,cex=1.2)

lines(uy,r1,col=yan[1],pch=pcc[1],lwd=1.5,lty=2,type="b")
lines(uy,r2,col=yan[2],pch=pcc[2],lwd=1.5,lty=2,type="b")
lines(uy,r3,col=yan[3],pch=pcc[3],lwd=1.5,lty=2,type="b")

error.bar(uy,r1,q1/2,col=yan[1])
error.bar(uy,r2,q2/2,col=yan[2])
error.bar(uy,r3,q3/2,col=yan[3])

abline(h=0.7,col="green3",lwd=1,lty=2)
text(110,0.8,"ratio=0.7",font=2,col="black")
abline(h=0.65,col="green3",lwd=1,lty=2)
text(70,0.62,"ratio=0.65",font=2,col="black")

leg<-c("600Hz","1KHz","2KHz")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n",cex=0.8)

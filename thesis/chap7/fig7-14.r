dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/maxfp")

library(xlsx)

# reading execl

k1<-read.xlsx("gly1.xlsx",sheetName="qd2-20",header=TRUE)


par(mfrow = c(2,1), mar = c(2,2.4,0.8,1), oma = c(1,1,1,1))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))

plot(k1$fv,k1$deva,col="0",xlab = expression(italic(f["v"]) (Hz)),
          ylab =expression(italic(D)(um)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "",xlim = c(0,4000),ylim=c(0,80))

points(k1$fv,k1$deva,col="red",pch=0)

z1=loess(k1$deva~k1$fv,span=0.5,degree=2)

lines(k1$fv,z1$fit,col="red",lwd=1.5,lty=2,type="b")

abline(lm(k1$deva~k1$fv),pch=0,type="b",col="blue",lwd=1.5,lty=2)

mtext("Droplet size and fitting",3,line=-1,font=2,cex=1)

leg1<-c("Droplet real","Droplet fit")

legend("topright",legend=leg1,col=c("red","blue"),pch=c(0,1),lwd=1.5,lty=2,
bty="n",inset=.02,cex=0.9)

plot(k1$fv,k1$deva,col=0,xlab = expression(italic(f["v"]) (Hz)),ylab =expression(italic(U["s"]) (mm/s)), mgp=c(1.1, 0, 0),tck=0.02,main = "",xlim = c(0,4000),ylim=c(0,80))

mtext("Critical velocity Us",3,line=0-1,font=2,cex=1)


# 临界速度的拟合

# 实际的临界速度为Sd=0，液滴k1$deva * k1$fv的结果

# 拟合的数据，为根据

fit<-(k1$deva*k1$fv*0.9)/1000 # 真实数据
fv<-1:4000

lines(k1$fv,fit,col="black",pch=0,type="b",lwd=2.5,lty=2)

x<-1:4000
y<-(x*(-0.01046*x+54)*0.9)/1000

lines(x,y,col="green3",lwd=2.5,pch=1,cex=0.5,lty=2)

leg2<-c("Us real","Us fitting")
legend("topleft",legend=leg2,pch=c(0,1),col=c("black","green3"),lwd=1.5,
bty="n",inset=.02,cex=0.9)

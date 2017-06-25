dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/print")

library(xlsx)

# reading repeart

#k1<-read.xlsx("repert.xlsx",sheetName="600",header=TRUE)
k1<-read.xlsx("repert.xlsx",sheetName="600",header=TRUE)
k2<-read.xlsx("repert.xlsx",sheetName="1k",header=TRUE)
k3<-read.xlsx("repert.xlsx",sheetName="1.5k",header=TRUE)
k4<-read.xlsx("repert.xlsx",sheetName="3k",header=TRUE)

# color setting

yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

# x坐标是液滴的尺寸，y坐标是消耗的时间

par(mfrow = c(2,1), mar = c(2,2.4,2,2), oma = c(1,1,1,1))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))

# 消耗的时间

plot(k1$dp,k1$trp, col=0,xlab = expression(italic(paste(Droplet,' ',diameter,' ',(um)))),
          ylab = expression(italic(t["rp"])(ms)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(40,400),ylim=c(0,150))

mtext("Efficiency",3,line=0.2,font=2,cex=1.2)

# 单位尺寸的液滴所需的时间
lines(k1$dp,k1$trp,col=yan[1],pch=pcc[1],lwd=1.5,lty=2,type="b")
lines(k2$dp,k2$trp,col=yan[2],pch=pcc[2],lwd=1.5,lty=2,type="b")
lines(k3$dp,k3$trp,col=yan[3],pch=pcc[3],lwd=1.5,lty=2,type="b")
lines(k4$dp,k4$trp,col=yan[4],pch=pcc[4],lwd=1.5,lty=2,type="b")

leg<-c("600Hz","1KHz","1.5KHz","3KHz")

legend("topleft",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,
bty="n",cex=0.8)

# plot，计算打印频率

plot(k1$dp,k1$trp, col=0,xlab = expression(italic(paste(Droplet,' ',diameter,' ',(um)))),
          ylab = expression(italic(f["p"])(Hz)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(40,400),ylim=c(0,300))

mtext("Printing frequency",3,line=0.2,font=2,cex=1.2)

fp1<-1000/k1$trp
fp2<-1000/k2$trp
fp3<-1000/k3$trp
fp4<-1000/k4$trp

lines(k1$dp,fp1,col=yan[1],pch=pcc[1],lwd=1.5,lty=2,type="b")
lines(k2$dp,fp2,col=yan[2],pch=pcc[2],lwd=1.5,lty=2,type="b")
lines(k3$dp,fp3,col=yan[3],pch=pcc[3],lwd=1.5,lty=2,type="b")
lines(k4$dp,fp4,col=yan[4],pch=pcc[4],lwd=1.5,lty=2,type="b")

leg1<-c("600Hz","1KHz","1.5KHz","3KHz")

legend("topright",legend=leg1,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,
bty="n",cex=0.8)

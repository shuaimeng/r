dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/print")

library(xlsx)

# reading repeart

k1<-read.xlsx("repert.xlsx",sheetName="600",header=TRUE)
k2<-read.xlsx("repert.xlsx",sheetName="1k",header=TRUE)
k3<-read.xlsx("repert.xlsx",sheetName="3k",header=TRUE)

# color setting

yan<-c("red","blue","green3")
pcc<-c(0,1,2)


# 比较转换之后的液滴的大小
par(fig=c(0,1,0,1),new=F)
plot(k1$no,k1$dp, col=0,xlab = expression(italic(n["p"])(Number)),
          ylab = expression(italic(d["p"])(um)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,300),ylim=c(0,400))

mtext("Repeart Droplet size",3,line=-1,font=2,cex=1)

lines(k1$no,k1$dp,col=yan[1],pch=pcc[1],lwd=1.5,lty=2,type="b")
lines(k2$no,k2$dp,col=yan[2],pch=pcc[2],lwd=1.5,lty=2,type="b")
lines(k3$no,k3$dp,col=yan[3],pch=pcc[3],lwd=1.5,lty=2,type="b")


leg<-c("600Hz","1KHz","3KHz")

legend("bottomright",legend=leg,col=yan,pch=pcc,lty=2,lwd=1.5,inset=.02,
bty="n",cex=0.9)

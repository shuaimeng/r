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


# 比较转换之后的液滴的大小
par(fig=c(0,1,0,1),new=F)

plot(k1$no,k1$dp, col=0,xlab = expression(italic(n["p"])(Number)),
          ylab = expression(italic(t["rp"])(ms)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,300),ylim=c(0,100))

mtext("Cost time",3,line=0.2,font=2,cex=1.2)

lines(k1$no,k1$trp,col=yan[1],pch=pcc[1],lwd=1.5,lty=2,type="b")
lines(k2$no,k2$trp,col=yan[2],pch=pcc[2],lwd=1.5,lty=2,type="b")
lines(k3$no,k3$trp,col=yan[3],pch=pcc[3],lwd=1.5,lty=2,type="b")
lines(k4$no,k4$trp,col=yan[4],pch=pcc[4],lwd=1.5,lty=2,type="b")


leg<-c("600Hz","1KHz","1.5KHz","3KHz")

legend("topleft",legend=leg,col=yan,pch=pcc,lty=2,lwd=1.5,inset=.02,
bty="n",cex=0.8)

# plot 2,斜率拟合

par(fig=c(0.35,0.99,0.1,0.5),new=TRUE)

plot(k1$no,k1$dp,col=0,bty="n",xlab = expression(italic(Frequency)(KHz)),
          ylab = expression(italic(slope)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "",xlim = c(1,3),ylim=c(0,1.8))

z1<-lm(k1$trp~k1$no)
z2<-lm(k2$trp~k2$no)
z3<-lm(k3$trp~k3$no)
z4<-lm(k4$trp~k4$no)

kv1<-z1$coefficients[2]
kv2<-z2$coefficients[2]
kv3<-z3$coefficients[2]
kv4<-z4$coefficients[2]

kv<-c(kv2,kv3,kv4)
x<-c(1,1.5,3)

b2<-1
b3<-1/1.5
b4<-1/3

b<-c(b2,b3,b4)

lines(x,kv,col="red",lwd=1.5,lty=2,pch=0,type="b")
lines(x,b,col="blue",lwd=1.5,lty=2,pch=1,type="b")

leg2<-c("real","fitting")

legend("topright",legend=leg2,lwd=1.5,lty=2,pch=c(0,1),col=c("red","blue"),
inset=.02,bty="n",cex=0.8)

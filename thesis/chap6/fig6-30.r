dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/viscous")

library(xlsx)

# 比较18nl/min和180nl/min下的两种液体；
# 电压选择为2kv和2.2kv两种即可

k1<-read.xlsx("liquid1.xlsx",sheetName="2kv-18",header=TRUE)
k2<-read.xlsx("liquid2.xlsx",sheetName="2kv-18",header=TRUE)
k3<-read.xlsx("liquid1.xlsx",sheetName="2.2kv-18",header=TRUE)
k4<-read.xlsx("liquid2.xlsx",sheetName="2.2kv-18",header=TRUE)

# errorbar
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
stop("vectors must be same length")
arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

# 布局
par(mfrow = c(2,1), mar = c(2,2.4,0.8,1), oma = c(1,1,1,1))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))

# yan
yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

# plot

plot(k1$fv,k1$raeva, col=0,xlab = expression(italic(f["v"]) (Hz)),
ylab = expression(italic(ratio)), mgp=c(1.1, 0, 0),tck=0.02,
main = "", xlim = c(0,800),ylim=c(0,20))

mtext("18nl/min-ratio",3,line=-1,cex=1,font=2)

# lines and error

lines(k1$fv,k1$raeva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
lines(k2$fv,k2$raeva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(k3$fv,k3$raeva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)
lines(k4$fv,k4$raeva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)

error.bar(k1$fv,k1$raeva,k1$stdra/2,col=yan[1])
error.bar(k2$fv,k2$raeva,k2$stdra/2,col=yan[2])
error.bar(k3$fv,k3$raeva,k3$stdra/2,col=yan[3])
error.bar(k4$fv,k4$raeva,k4$stdra/2,col=yan[4])

abline(h=5,lwd=1,lty=2,col="red")
abline(h=10,lwd=1,lty=2,col="blue")
abline(h=15,lwd=1,lty=2,col="green3")

leg<-c("2kv-Liquid1","2kv-Liquid2","2.2kv-Liquid1","2.2kv-Liquid2")


legend("bottomright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset = .01,bty = "n",cex=0.8)

# plot 2 for 180nl/min

q1<-read.xlsx("liquid1.xlsx",sheetName="2kv-180",header=TRUE)
q2<-read.xlsx("liquid2.xlsx",sheetName="2kv-180",header=TRUE)
q3<-read.xlsx("liquid1.xlsx",sheetName="2.2kv-180",header=TRUE)
q4<-read.xlsx("liquid2.xlsx",sheetName="2.2kv-90",header=TRUE)


plot(q1$fv,q1$raeva, col=0,xlab = expression(italic(f["v"]) (Hz)),
ylab = expression(italic(ratio)), mgp=c(1.1, 0, 0),tck=0.02,
main = "", xlim = c(0,800),ylim=c(0,20))

mtext("180nl/min-ratio",3,line=-1,cex=1,font=2)
#mtext("",3,line=0,font=2)

# lines and error

lines(q1$fv,q1$raeva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
lines(q2$fv,q2$raeva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(q3$fv,q3$raeva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)
lines(q4$fv,q4$raeva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)

error.bar(q1$fv,q1$raeva,q1$stdra/2,col=yan[1])
error.bar(q2$fv,q2$raeva,q2$stdra/2,col=yan[2])
error.bar(q3$fv,q3$raeva,q3$stdra/2,col=yan[3])
error.bar(q4$fv,q4$raeva,q4$stdra/2,col=yan[4])

abline(h=5,lwd=1,lty=2,col="red")
abline(h=10,lwd=1,lty=2,col="blue")

leg<-c("2kv-Liquid1","2kv-Liquid2","2.2kv-Liquid1","2.2kv-Liquid2")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset = .01,bty = "n",cex=0.8)

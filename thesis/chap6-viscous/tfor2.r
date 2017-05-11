dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/viscous")

library(xlsx)

# 比较tfor和tp
# tfor下，liquid1和liquid2的比较
# 2.2kv下的比较
# 18nl/min和180nl/min
# 18nl/min-liquid1，18nl/min-liquid2, 180nl/min-liquid1,180nl/min-liquid2


# legend: 18nl/min-l1,18nl/min-l2,180nl/min-l1,180nl/min-liquid2

k1<-read.xlsx("liquid1.xlsx",sheetName="2kv-18",header=TRUE)
k2<-read.xlsx("liquid2.xlsx",sheetName="2kv-18",header=TRUE)
k3<-read.xlsx("liquid1.xlsx",sheetName="2kv-180",header=TRUE)
k4<-read.xlsx("liquid2.xlsx",sheetName="2kv-180",header=TRUE)

# errorbar
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
stop("vectors must be same length")
arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

# 布局
par(mfrow = c(2,1), mar = c(2,2.4,2,2), oma = c(1,1,1,1))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))

# yan
yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

# plot

plot(k1$fv,k1$tfeva, col=0,xlab = expression(italic(f["v"]) (Hz)),
ylab = expression(italic(t["for"])(ms)), mgp=c(1.1, 0, 0),tck=0.02,
main = "", xlim = c(0,800),ylim=c(0,40))

mtext("tfor-2kv",3,line=0,font=2)

# lines and error

lines(k1$fv,k1$tfeva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
lines(k2$fv,k2$tfeva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(k3$fv,k3$tfeva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)
lines(k4$fv,k4$tfeva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)

error.bar(k1$fv,k1$tfeva,k1$stdtf/2,col=yan[1])
error.bar(k2$fv,k2$tfeva,k2$stdtf/2,col=yan[2])
error.bar(k3$fv,k3$tfeva,k3$stdtf/2,col=yan[3])
error.bar(k4$fv,k4$tfeva,k4$stdtf/2,col=yan[4])

leg<-c("liquid1-18nl/min","liquid1-180nl/min","liquid2-18nl/min",
"liquid2-180nl/min")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset = .02,bty = "n",cex=0.8)

# plot 2 for tp

plot(k1$fv,k1$tpeva, col=0,xlab = expression(italic(f["v"]) (Hz)),
ylab = expression(italic(t["for"])(ms)), mgp=c(1.1, 0, 0),tck=0.02,
main = "", xlim = c(0,800),ylim=c(0,1.5))

mtext("tp-2kv",3,line=0,font=2)

# lines and error

lines(k1$fv,k1$tpeva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
lines(k2$fv,k2$tpeva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(k3$fv,k3$tpeva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)
lines(k4$fv,k4$tpeva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)

error.bar(k1$fv,k1$tpeva,k1$stdtp/2,col=yan[1])
error.bar(k2$fv,k2$tpeva,k2$stdtp/2,col=yan[2])
error.bar(k3$fv,k3$tpeva,k3$stdtp/2,col=yan[3])
error.bar(k4$fv,k4$tpeva,k4$stdtp/2,col=yan[4])

leg<-c("liquid1-18nl/min","liquid1-180nl/min","liquid2-18nl/min",
"liquid2-180nl/min")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset = .02,bty = "n",cex=0.8)

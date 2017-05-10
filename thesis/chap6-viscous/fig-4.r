dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/viscous")

library(xlsx)

# liquid1下的Q-V组合
# 查看tfor和tp

k1<-read.xlsx("liquid1.xlsx",sheetName="2kv-18",header=TRUE)
k2<-read.xlsx("liquid1.xlsx",sheetName="2.1kv-18",header=TRUE)
k3<-read.xlsx("liquid1.xlsx",sheetName="2.2kv-18",header=TRUE)
k4<-read.xlsx("liquid2.xlsx",sheetName="2kv-18",header=TRUE)
k5<-read.xlsx("liquid2.xlsx",sheetName="2.1kv-18",header=TRUE)
k6<-read.xlsx("liquid2.xlsx",sheetName="2.2kv-18",header=TRUE)

# layout


# errorbar

error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
stop("vectors must be same length")
arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

par(mfrow = c(2,1), mar = c(2,2.4,2,2), oma = c(1,1,1,1))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))
#
yan<-rainbow(6)
pcc<-c(0,1,2,5,22,23)
yan[2]<-c("yellow3")

# plot figures

plot(k1$fv,k1$tfeva, col=0,xlab = expression(italic(f["v"]) (Hz)),
ylab = expression(italic(f["p"])(Hz)), mgp=c(1.1, 0, 0),tck=0.02,
main = "Liquid1", xlim = c(0,800),ylim=c(0,80))

# lines and error

lines(k1$fv,k1$feeva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
lines(k2$fv,k2$feeva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(k3$fv,k3$feeva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)
lines(k4$fv,k4$feeva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)
lines(k5$fv,k5$feeva,col=yan[5],lwd=1.5,lty=2,type="b",pch=pcc[5],cex=0.8)
lines(k6$fv,k6$feeva,col=yan[6],lwd=1.5,lty=2,type="b",pch=pcc[6],cex=0.8)

error.bar(k1$fv,k1$feeva,k1$stdfe/2,col=yan[1])
error.bar(k2$fv,k2$feeva,k2$stdfe/2,col=yan[2])
error.bar(k3$fv,k3$feeva,k3$stdfe/2,col=yan[3])
error.bar(k4$fv,k4$feeva,k1$stdfe/2,col=yan[4])
error.bar(k5$fv,k5$feeva,k2$stdfe/2,col=yan[5])
error.bar(k6$fv,k6$feeva,k3$stdfe/2,col=yan[6])

leg<-c("2kv-Liquid1","2.1kv-Liquid1","2.2kv-Liquid1","2kv-Liquid2","2.1kv-Liquid2","2.2kv-Liquid2")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.06,bty="n",cex=0.8)

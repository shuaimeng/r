dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/viscous")

library(xlsx)

# liquid1下的Q-V组合
# 查看tfor和tp

k1<-read.xlsx("liquid2.xlsx",sheetName="2kv-18",header=TRUE)
k2<-read.xlsx("liquid2.xlsx",sheetName="2kv-90",header=TRUE)

k3<-read.xlsx("liquid2.xlsx",sheetName="2kv-180",header=TRUE)
k4<-read.xlsx("liquid2.xlsx",sheetName="2.1kv-18",header=TRUE)
k5<-read.xlsx("liquid2.xlsx",sheetName="2.1kv-90",header=TRUE)
k6<-read.xlsx("liquid2.xlsx",sheetName="2.2kv-180",header=TRUE)
k7<-read.xlsx("liquid2.xlsx",sheetName="2.2kv-18",header=TRUE)
k8<-read.xlsx("liquid2.xlsx",sheetName="2.2kv-90",header=TRUE)


# layout

par(mfrow = c(2,1), mar = c(2,2.4,2,2), oma = c(1,1,1,1))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))

# errorbar

error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
stop("vectors must be same length")
arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

#
yan<-rainbow(8)
pcc<-c(0,1,2,5,22,23,24,25)
yan[2]<-c("yellow3")

# plot figures

plot(k1$fv,k1$tfeva, col=0,xlab = expression(italic(f["v"]) (Hz)),
ylab = expression(italic(t["for"])(ms)), mgp=c(1.1, 0, 0),tck=0.02,
main = "tfor&tp-Liquid2", xlim = c(0,800),ylim=c(0,40))

# lines and error

lines(k1$fv,k1$tfeva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
lines(k2$fv,k2$tfeva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(k3$fv,k3$tfeva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)
lines(k4$fv,k4$tfeva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)
lines(k5$fv,k5$tfeva,col=yan[5],lwd=1.5,lty=2,type="b",pch=pcc[5],cex=0.8)
lines(k6$fv,k6$tfeva,col=yan[6],lwd=1.5,lty=2,type="b",pch=pcc[6],cex=0.8)
lines(k7$fv,k7$tfeva,col=yan[7],lwd=1.5,lty=2,type="b",pch=pcc[7],cex=0.8)
lines(k8$fv,k8$tfeva,col=yan[8],lwd=1.5,lty=2,type="b",pch=pcc[8],cex=0.8)

error.bar(k1$fv,k1$tfeva,k1$stdtf/2,col=yan[1])
error.bar(k2$fv,k2$tfeva,k2$stdtf/2,col=yan[2])
error.bar(k3$fv,k3$tfeva,k3$stdtf/2,col=yan[3])
error.bar(k4$fv,k4$tfeva,k4$stdtf/2,col=yan[4])
error.bar(k5$fv,k5$tfeva,k5$stdtf/2,col=yan[5])
error.bar(k6$fv,k6$tfeva,k6$stdtf/2,col=yan[6])
error.bar(k7$fv,k7$tfeva,k7$stdtf/2,col=yan[7])
error.bar(k8$fv,k8$tfeva,k8$stdtf/2,col=yan[8])


leg<-c("2kv-18nl/min","2kv-90nl/min","2kv-180nl/min","2.1kv-18nl/min",
"2.1kv-90nl/min","2.1kv-180nl/min","2.2kv-18nl/min","2.2kv-90nl/min")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n",cex=0.7)

# plot2,about tp

plot(k1$fv,k1$tpeva, col=0,xlab = expression(italic(f["v"]) (Hz)),
ylab = expression(italic(t["p"])(ms)), mgp=c(1.1, 0, 0),tck=0.02,
main = "tp", xlim = c(0,800),ylim=c(0.1,1.5))

lines(k1$fv,k1$tpeva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
lines(k2$fv,k2$tpeva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(k3$fv,k3$tpeva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)
lines(k4$fv,k4$tpeva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)
lines(k5$fv,k5$tpeva,col=yan[5],lwd=1.5,lty=2,type="b",pch=pcc[5],cex=0.8)
lines(k6$fv,k6$tpeva,col=yan[6],lwd=1.5,lty=2,type="b",pch=pcc[6],cex=0.8)

error.bar(k1$fv,k1$deva,k1$stdtp/2,col=yan[1])
error.bar(k2$fv,k2$deva,k2$stdtp/2,col=yan[2])
error.bar(k3$fv,k3$deva,k3$stdtp/2,col=yan[3])

error.bar(k4$fv,k4$deva,k4$stdtp/2,col=yan[4])
error.bar(k5$fv,k5$deva,k5$stdtp/2,col=yan[5])
error.bar(k6$fv,k6$deva,k6$stdtp/2,col=yan[6])

leg<-c("2kv-18nl/min","2kv-90nl/min","2kv-180nl/min","2.1kv-18nl/min",
"2.1kv-90nl/min","2.1kv-180nl/min","2.2kv-18nl/min","2.2kv-90nl/min")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset = .02,bty = "n",cex=0.7)

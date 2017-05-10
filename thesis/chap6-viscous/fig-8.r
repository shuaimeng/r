dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/viscous")

library(xlsx)

# reading datas

k1<-read.xlsx("liquid2.xlsx",sheetName="2kv-18",header=TRUE)
k2<-read.xlsx("liquid2.xlsx",sheetName="2.1kv-18",header=TRUE)
k3<-read.xlsx("liquid2.xlsx",sheetName="2.2kv-18",header=TRUE)
k4<-read.xlsx("liquid2.xlsx",sheetName="2kv-90",header=TRUE)
k5<-read.xlsx("liquid2.xlsx",sheetName="2.1kv-90",header=TRUE)
k6<-read.xlsx("liquid2.xlsx",sheetName="2.2kv-90",header=TRUE)
k7<-read.xlsx("liquid2.xlsx",sheetName="2kv-180",header=TRUE)
k8<-read.xlsx("liquid2.xlsx",sheetName="2.1kv-180",header=TRUE)


# errorbar
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
stop("vectors must be same length")
arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

# color setting

yan<-rainbow(8)
pcc<-c(0,1,2,5,22,23,24,25)
yan[2]<-c("yellow3")

# plot
plot(k1$fv,k1$feeva, col=0,xlab = expression(italic(f["v"]) (Hz)),
ylab = expression(italic(f["e"])(Hz)), mgp=c(1.1, 0, 0),tck=0.02,
main = "", xlim = c(0,800),ylim=c(0,20))

mtext("Liquid2-fe",3,line=0,font=2)

lines(k1$fv,k1$feeva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
lines(k2$fv,k2$feeva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(k3$fv,k3$feeva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)
lines(k4$fv,k4$feeva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)
lines(k5$fv,k5$feeva,col=yan[5],lwd=1.5,lty=2,type="b",pch=pcc[5],cex=0.8)
lines(k6$fv,k6$feeva,col=yan[6],lwd=1.5,lty=2,type="b",pch=pcc[6],cex=0.8)
lines(k7$fv,k7$feeva,col=yan[7],lwd=1.5,lty=2,type="b",pch=pcc[7],cex=0.8)
lines(k8$fv,k8$feeva,col=yan[8],lwd=1.5,lty=2,type="b",pch=pcc[8],cex=0.8)

error.bar(k1$fv,k1$feeva,k1$stdfe/2,col=yan[1])
error.bar(k2$fv,k2$feeva,k2$stdfe/2,col=yan[2])
error.bar(k3$fv,k3$feeva,k3$stdfe/2,col=yan[3])
error.bar(k4$fv,k4$feeva,k4$stdfe/2,col=yan[4])
error.bar(k5$fv,k5$feeva,k5$stdfe/2,col=yan[5])
error.bar(k6$fv,k6$feeva,k6$stdfe/2,col=yan[6])
error.bar(k7$fv,k7$feeva,k7$stdfe/2,col=yan[7])
error.bar(k8$fv,k8$feeva,k8$stdfe/2,col=yan[8])


leg<-c("2kv-18nl/min","2.1kv-18nl/min","2.2kv-18nl/min",
"2kv-90nl/min","2.1kv-90nl/min","2.2kv-90nl/min","2kv-180nl/min","2.1kv-180nl/min")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.06,bty="n",
cex=0.8)

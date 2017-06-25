dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/voltage")
library(xlsx)
##reading datas

#qd1.xlsx

#reading about 26G-18nl/min and 26G-180nl/min
#arguing three voltage configurations

k1<-read.xlsx("qd1.xlsx", sheetName = "v1", header = TRUE)
k2<-read.xlsx("qd1.xlsx", sheetName = "v2", header = TRUE)
k3<-read.xlsx("qd1.xlsx", sheetName = "v3", header = TRUE)
q1<-read.xlsx("qd2.xlsx", sheetName = "v1", header = TRUE)
q2<-read.xlsx("qd2.xlsx", sheetName = "v2", header = TRUE)
q3<-read.xlsx("qd2.xlsx", sheetName = "v3", header = TRUE)

#Aim:compare fp
#fveva,stdfv

##
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}
##
par(mar = c(2,2.4,2,2), oma = c(1,1,1,1))
layout(matrix(c(1,2),2,1,byrow=T))
##
yan<-c("red","blue","black")
pcc<-c(0,1,2)

##Plot-1
plot(k1$fv,k1$fveva, col=0,xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02,
     main = "26G-18nl/min", xlim = c(0,4000),ylim=c(0,1000))

lines(k1$fv,k1$fveva,col=yan[1],pch=pcc[1],lwd=1.5,lty=2,type="b")
lines(k2$fv,k2$fveva,col=yan[2],pch=pcc[2],lwd=1.5,lty=2,type="b")
lines(k3$fv,k3$fveva,col=yan[3],pch=pcc[3],lwd=1.5,lty=2,type="b")

error.bar(k1$fv,k1$fveva,k1$stdfv,col=yan[1])
error.bar(k2$fv,k2$fveva,k2$stdfv,col=yan[2])
error.bar(k3$fv,k3$fveva,k3$stdfv,col=yan[3])

leg<-c("1.7kv-2kv","1.9kv-2kv","1.95kv-2kv")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,inset=.08,bty="n")

##Plot-2

plot(q1$fv,q1$fveva, col=0,xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02,
     main = "26G-180nl/min", xlim = c(0,4000),ylim=c(0,1000))

lines(q1$fv,q1$fveva,col=yan[1],pch=pcc[1],lwd=1.5,lty=2,type="b")
lines(q2$fv,q2$fveva,col=yan[2],pch=pcc[2],lwd=1.5,lty=2,type="b")
lines(q3$fv,q3$fveva,col=yan[3],pch=pcc[3],lwd=1.5,lty=2,type="b")

error.bar(q1$fv,q1$fveva,q1$stdfv,col=yan[1])
error.bar(q2$fv,q2$fveva,q2$stdfv,col=yan[2])
error.bar(q3$fv,q3$fveva,q3$stdfv,col=yan[3])

leg<-c("1.7kv-2kv","1.9kv-2kv","1.95kv-2kv")

legend("topright",legend=leg,col=yan,pch=pcc,inset=.08,lwd=1.5,bty = "n")

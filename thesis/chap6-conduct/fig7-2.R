dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/conductivity")

library(xlsx)

#reading datas
#gly1
k1<-read.xlsx("gly1.xlsx", sheetName = "qd2-18", header = TRUE)
k2<-read.xlsx("gly1.xlsx", sheetName = "qd2-19", header = TRUE)
k3<-read.xlsx("gly1.xlsx", sheetName = "qd2-20", header = TRUE)
#gly2
q1<-read.xlsx("gly2.xlsx", sheetName = "qd2-18", header = TRUE)
q2<-read.xlsx("gly2.xlsx", sheetName = "qd2-19", header = TRUE)
q3<-read.xlsx("gly2.xlsx", sheetName = "qd2-20", header = TRUE)

#
par(mar = c(2,2.4,2,2), oma = c(1,1,1,1))

yan<-rainbow(6)
pcc<-c(1,2,5,6,22,23)

#
##
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}
##

plot(k1$fv,k1$fveva, col=0,xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02,
     main = "30G-180nl/min", xlim = c(0,4000),ylim=c(0,4000))

lines(k1$fv,k1$fveva,col=yan[1],pch=pcc[1],lwd=2,lty=2,type="b",cex=0.8)
lines(k2$fv,k2$fveva,col=yan[2],pch=pcc[2],lwd=2,lty=2,type="b",cex=0.8)
lines(k3$fv,k3$fveva,col=yan[3],pch=pcc[3],lwd=2,lty=2,type="b",cex=0.8)
lines(q1$fv,q1$fveva,col=yan[4],pch=pcc[4],lwd=2,lty=2,type="b",cex=0.8)
lines(q2$fv,q2$fveva,col=yan[5],pch=pcc[5],lwd=2,lty=2,type="b",cex=0.8)
lines(q3$fv,q3$fveva,col=yan[6],pch=pcc[6],lwd=2,lty=2,type="b",cex=0.8)

error.bar(k1$fv,k1$fveva,k1$stdfv/2,col=yan[1])
error.bar(k2$fv,k2$fveva,k2$stdfv/2,col=yan[2])
error.bar(k3$fv,k3$fveva,k3$stdfv/2,col=yan[3])

error.bar(q1$fv,q1$fveva,q1$stdfv/2,col=yan[4])
error.bar(q2$fv,q2$fveva,q2$stdfv/2,col=yan[5])
error.bar(q3$fv,q3$fveva,q3$stdfv/2,col=yan[6])

leg<-c("gly1-1.8kv","gly1-1.9kv","gly1-2kv","gly2-1.8kv","gly2-1.9kv","gly2-2kv")

legend("topleft",legend=leg,col=yan,pch=pcc,lty=2,lwd=2,inset=.07,bty="n")

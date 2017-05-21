dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/voltage")
library(xlsx)

# reading and compare the datas from gly1 and he-25g

k1<-read.xlsx("he-25g.xlsx", sheetName = "2kv18", header = TRUE)
k2<-read.xlsx("qd1.xlsx", sheetName = "v1", header = TRUE)
k3<-read.xlsx("qd1.xlsx", sheetName = "v2", header = TRUE)
k4<-read.xlsx("qd1.xlsx", sheetName = "v3", header = TRUE)

##
yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

##
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}
##

plot(k1$fv,1/k1$d_Rn, col=0,xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(ratio)) , mgp=c(1.1, 0, 0),tck=0.02,
     main = "", xlim = c(0,4000),ylim=c(5,15))

     mtext("26G-18nl/min-ratio",3,line=0.2,font=2,cex=1.2)

lines(k1$fv,1/k1$d_Rn,col=yan[1],pch=pcc[1],type="b",lwd=2,lty=2)
lines(k2$fv,k2$raeva,col=yan[2],pch=pcc[2],type="b",lwd=2,lty=2)
lines(k3$fv,k3$raeva,col=yan[3],pch=pcc[3],type="b",lwd=2,lty=2)
lines(k4$fv,k4$raeva,col=yan[4],pch=pcc[4],type="b",lwd=2,lty=2)


error.bar(k1$fv,1/k1$d_Rn,0,col=yan[1])
error.bar(k2$fv,k2$raeva,k2$rastd/2,col=yan[2])
error.bar(k3$fv,k3$raeva,k3$rastd/2,col=yan[3])
error.bar(k4$fv,k4$raeva,k4$rastd/2,col=yan[4])



leg<-c("V0+0:0kv+2Kv","Va+Vb:1.7kv-2kv","Va+Vb:1.8kv-2kv","Va+Vb:1.9kv-2kv")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.06,bty="n",cex=0.9)

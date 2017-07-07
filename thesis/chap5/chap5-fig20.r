dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/voltage")
library(xlsx)

par(mfrow = c(2,2), mar = c(2,2.2,0.8,1), oma = c(1,1,1,1))

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

plot(k1$fv,k1$fveva, col=0,xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02,
     main = "", xlim = c(0, 4000),ylim=c(0,1000))

     mtext("26G-18nl/min",3,line=0,font=2,cex=0.9)

lines(k1$fv,k1$fe*k1$fv,col=yan[1],pch=pcc[1],type="b",lwd=2,lty=2)
lines(k2$fv,k2$fveva,col=yan[2],pch=pcc[2],type="b",lwd=2,lty=2)
lines(k3$fv,k3$fveva,col=yan[3],pch=pcc[3],type="b",lwd=2,lty=2)
lines(k4$fv,k4$fveva,col=yan[4],pch=pcc[4],type="b",lwd=2,lty=2)


error.bar(k1$fv,k1$fe*k1$fv,0,col=yan[1])
error.bar(k2$fv,k2$fveva,k2$stdfv/2,col=yan[2])
error.bar(k3$fv,k3$fveva,k3$stdfv/2,col=yan[3])
error.bar(k4$fv,k4$fveva,k4$stdfv/2,col=yan[4])

leg<-c("V0+0:0kv+2Kv","Va+Vb:1.7kv-2kv","Va+Vb:1.9kv-2kv","Va+Vb:1.95kv-2kv")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n",cex=0.8)

### 26G-180nl/min ###

k1<-read.xlsx("he-25g.xlsx", sheetName = "2kv180", header = TRUE)
k2<-read.xlsx("qd2.xlsx", sheetName = "v1", header = TRUE)
k3<-read.xlsx("qd2.xlsx", sheetName = "v2", header = TRUE)
k4<-read.xlsx("qd2.xlsx", sheetName = "v3", header = TRUE)


plot(k1$fv,k1$fveva, col=0,xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02,
     main = "", xlim = c(0, 4000),ylim=c(0,1000))

     mtext("26G-180nl/min",3,line=0,font=2,cex=0.9)

lines(k1$fv,k1$fe*k1$fv,col=yan[1],pch=pcc[1],type="b",lwd=2,lty=2)
lines(k2$fv,k2$fveva,col=yan[2],pch=pcc[2],type="b",lwd=2,lty=2)
lines(k3$fv,k3$fveva,col=yan[3],pch=pcc[3],type="b",lwd=2,lty=2)
lines(k4$fv,k4$fveva,col=yan[4],pch=pcc[4],type="b",lwd=2,lty=2)


error.bar(k1$fv,k1$fe*k1$fv,0,col=yan[1])
error.bar(k2$fv,k2$fveva,k2$stdfv/2,col=yan[2])
error.bar(k3$fv,k3$fveva,k3$stdfv/2,col=yan[3])
error.bar(k4$fv,k4$fveva,k4$stdfv/2,col=yan[4])

leg<-c("V0+0:0kv+2Kv","Va+Vb:1.7kv-2kv","Va+Vb:1.8kv-2kv","Va+Vb:1.9kv-2kv")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n",cex=0.8)

## 32G ##

k1<-read.xlsx("he-32g.xlsx", sheetName = "2kv18", header = TRUE)
k2<-read.xlsx("qd3.xlsx", sheetName = "v1", header = TRUE)
k3<-read.xlsx("qd3.xlsx", sheetName = "v2", header = TRUE)
k4<-read.xlsx("qd3.xlsx", sheetName = "v3", header = TRUE)


plot(k1$fv,k1$feeva*k1$fv, col=0,xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02,
     main = "", xlim = c(0,6000),ylim=c(0,4000))

     mtext("32G-18nl/min",3,line=0,font=2,cex=0.9)

lines(k1$fv,k1$feeva*k1$fv,col=yan[1],pch=pcc[1],type="b",lwd=2,lty=2)
lines(k2$fv,k2$fveva,col=yan[2],pch=pcc[2],type="b",lwd=2,lty=2)
lines(k3$fv,k3$fveva,col=yan[3],pch=pcc[3],type="b",lwd=2,lty=2)
lines(k4$fv,k4$fveva,col=yan[4],pch=pcc[4],type="b",lwd=2,lty=2)


error.bar(k1$fv,k1$feeva*k1$fv,k1$stdfe*k1$fv/2,col=yan[1])
error.bar(k2$fv,k2$fveva,k2$stdfv/2,col=yan[2])
error.bar(k3$fv,k3$fveva,k3$stdfv/2,col=yan[3])
error.bar(k4$fv,k4$fveva,k4$stdfv/2,col=yan[4])

x1<-c(2500,2500)
y1<-c(0,2500)
lines(x1,y1,lwd=1,lty=2,col="blue")
text(2350,3000,"fvc = 2.5kHz",col="blue",font=2)

leg<-c("V0+0:0kv+2Kv","Va+Vb:1.7kv-2kv","Va+Vb:1.8kv-2kv","Va+Vb:1.9kv-2kv")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.01,bty="n",cex=0.8)


### 32G-180nl/min ###

k1<-read.xlsx("he-32g.xlsx", sheetName = "2kv180", header = TRUE)
k2<-read.xlsx("qd4.xlsx", sheetName = "v1", header = TRUE)
k3<-read.xlsx("qd4.xlsx", sheetName = "v2", header = TRUE)
k4<-read.xlsx("qd4.xlsx", sheetName = "v3", header = TRUE)

plot(k1$fv,k1$feeva*k1$fv, col=0,xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02,
     main = "", xlim = c(0,4000),ylim=c(0,4000))

     mtext("32G-180nl/min",3,line=0,font=2,cex=0.9)

lines(k1$fv,k1$feeva*k1$fv,col=yan[1],pch=pcc[1],type="b",lwd=2,lty=2)
lines(k2$fv,k2$fveva,col=yan[2],pch=pcc[2],type="b",lwd=2,lty=2)
lines(k3$fv,k3$fveva,col=yan[3],pch=pcc[3],type="b",lwd=2,lty=2)
lines(k4$fv,k4$fveva,col=yan[4],pch=pcc[4],type="b",lwd=2,lty=2)


error.bar(k1$fv,k1$feeva*k1$fv,k1$stdfe*k1$fv/2,col=yan[1])
error.bar(k2$fv,k2$fveva,k2$stdfv/2,col=yan[2])
error.bar(k3$fv,k3$fveva,k3$stdfv/2,col=yan[3])
error.bar(k4$fv,k4$fveva,k4$stdfv/2,col=yan[4])

x1<-c(2500,2500)
y1<-c(0,2500)
lines(x1,y1,lwd=1,lty=2,col="blue")
text(2350,3000,"fvc = 2.5kHz",col="blue",font=2)

x2<-c(2000,2000)
y2<-c(0,2000)
lines(x2,y2,lwd=1,lty=2,col="blue")
text(1800,2600,"fvc=2kHz",col="blue",font=2)

leg<-c("V0+0:0kv+2Kv","Va+Vb:1.7kv-2kv","Va+Vb:1.8kv-2kv","Va+Vb:1.9kv-2kv")

legend("topleft",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.01,bty="n",cex=0.8)

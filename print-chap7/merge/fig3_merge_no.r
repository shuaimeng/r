dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/print")

library(xlsx)

# reading ux and sd

k1<-read.xlsx("rong.xlsx",sheetName="600",header=TRUE)
k2<-read.xlsx("rong.xlsx",sheetName="1khz",header=TRUE)
k3<-read.xlsx("rong.xlsx",sheetName="2khz",header=TRUE)
k4<-read.xlsx("dotx.xlsx",sheetName="600",header=TRUE)
k5<-read.xlsx("dotx.xlsx",sheetName="1khz",header=TRUE)
k6<-read.xlsx("dotx.xlsx",sheetName="2khz",header=TRUE)

# errorbar
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
stop("vectors must be same length")
arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

# color setting

yan<-c("red","blue","black")
pcc<-c(0,1,2)

# par

par(mfrow = c(2,1), mar = c(2,2.4,2,2), oma = c(1,1,1,1))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))

plot(k1$ux,k1$deva, col=0,xlab = expression(italic(U["x"]) (mm/s)),
          ylab = expression(italic(d["d"]) (um)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,10),ylim=c(0,240))

mtext("Sd Merge and Sd",3,line=0.2,font=2,cex=1.2)

lines(k1$ux,k1$deva,col=yan[1],pch=pcc[1],lwd=1.5,lty=2,type="b")
lines(k2$ux,k2$deva,col=yan[2],pch=pcc[2],lwd=1.5,lty=2,type="b")
lines(k3$ux,k3$deva,col=yan[3],pch=pcc[3],lwd=1.5,lty=2,type="b")

error.bar(k1$ux,k1$deva,k1$dstd/2,col=yan[1])
error.bar(k2$ux,k2$deva,k2$dstd/2,col=yan[2])
error.bar(k3$ux,k3$deva,k3$dstd/2,col=yan[3])

# 液滴原来的尺寸
d1<-sum(k4$deva)/5
d2<-sum(k5$deva)/3
d3<-sum(k6$deva)/3

y1<-c(d1,d1)
y2<-c(d2,d2,d2,d2)
y3<-c(d3,d3,d3,d3)

lines(k1$ux,y1,col=yan[1],lwd=1.5,lty=4)
lines(k2$ux,y2,col=yan[2],lwd=1.5,lty=4)
lines(k3$ux,y3,col=yan[3],lwd=1.5,lty=4)

leg<-c("600Hz-Sd M","1KHz-Sd M","2KHz-Sd M")
leg1<-c("600Hz-Sd","1KHz-Sd","2KHz-Sd")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n",cex=0.9)
legend("topleft",legend=leg1,col=yan,lwd=1.5,lty=2,inset=.02,bty="n",cex=0.9)

# 次数的比较，n1，n2和n3

n1<-k1$deva/y1
n2<-k2$deva/y2
n3<-k3$deva/y3

plot(k1$ux,k1$deva, col=0,xlab = expression(italic(U["x"]) (mm/s)),
          ylab = expression(italic(Number)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,10),ylim=c(0,10))

mtext("Merge number",3,line=0.2,font=2,cex=1.2)

lines(k1$ux,n1,col=yan[1],pch=pcc[1],lwd=1.5,lty=2,type="b")
lines(k2$ux,n2,col=yan[2],pch=pcc[2],lwd=1.5,lty=2,type="b")
lines(k3$ux,n3,col=yan[3],pch=pcc[3],lwd=1.5,lty=2,type="b")

leg<-c("No - 600Hz","No - 1KHz","No - 2KHz")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n",cex=0.9)

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

par(mfrow = c(2,1), mar = c(2,2.4,0.8,1), oma = c(1,1,1,1))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))

# 液滴原来的尺寸
d1<-sum(k4$deva)/5
d2<-sum(k5$deva)/3
d3<-sum(k6$deva)/3

y1<-c(d1,d1)
y2<-c(d2,d2,d2,d2)
y3<-c(d3,d3,d3,d3)

# 次数的比较，n1，n2和n3

n1<-k1$deva/y1
n2<-k2$deva/y2
n3<-k3$deva/y3

plot(k1$ux,k1$deva, col=0,xlab = expression(italic(U["x"]) (mm/s)),
          ylab = expression(italic(n["m"])), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,10),ylim=c(0,10))

mtext("Merge number",3,line=-1,font=2,cex=1)

lines(k1$ux,n1,col=yan[1],pch=pcc[1],lwd=1.5,lty=2,type="b")
lines(k2$ux,n2,col=yan[2],pch=pcc[2],lwd=1.5,lty=2,type="b")
lines(k3$ux,n3,col=yan[3],pch=pcc[3],lwd=1.5,lty=2,type="b")

leg<-c("No - 600Hz","No - 1KHz","No - 2KHz")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n",cex=0.9)

# 分析Sd/deva（融合）的大小

plot(k1$ux,k1$deva, col=0,xlab = expression(italic(U["x"]) (mm/s)),
          ylab = expression(italic(S["dm"]/d["m"])), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,10),ylim=c(0,1))

mtext("Ratio between space and droplet size",3,line=-1,font=2,cex=1)

lines(k1$ux,k1$sdeva/k1$deva,col=yan[1],pch=pcc[1],lwd=1.5,lty=2,type="b")
lines(k2$ux,k2$sdeva/k2$deva,col=yan[2],pch=pcc[2],lwd=1.5,lty=2,type="b")
lines(k3$ux,k3$sdeva/k3$deva,col=yan[3],pch=pcc[3],lwd=1.5,lty=2,type="b")

abline(h=0.2,col="green3",lty=2,lwd=2)
text(5,0.4,"ratio = 20%",col="green3")

leg<-c("600Hz","1KHz","2KHz")

legend("topleft",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,
bty="n",cex=0.9)

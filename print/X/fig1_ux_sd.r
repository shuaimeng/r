dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/print")

library(xlsx)

# reading ux and sd

k1<-read.xlsx("dotx.xlsx",sheetName="600",header=TRUE)
k2<-read.xlsx("dotx.xlsx",sheetName="1khz",header=TRUE)
k3<-read.xlsx("dotx.xlsx",sheetName="2khz",header=TRUE)
k4<-read.xlsx("dotx.xlsx",sheetName="2.5khz",header=TRUE)

# errorbar
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
stop("vectors must be same length")
arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

# color setting

yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

# plot

plot(k1$ux,k1$sdeva, col=0,xlab = expression(italic(U["x"]) (mm/s)),
          ylab = expression(italic(S["d"]) (um)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,300),ylim=c(0,400))

mtext("Droplet space",3,line=0.2,font=2,cex=1.2)

lines(k1$ux,k1$sdeva,lwd=1.5,lty=2,col=yan[1],pch=pcc[1],type="b")
lines(k2$ux,k2$sdeva,lwd=1.5,lty=2,col=yan[2],pch=pcc[2],type="b")
lines(k3$ux,k3$sdeva,lwd=1.5,lty=2,col=yan[3],pch=pcc[3],type="b")
lines(k4$ux,k4$sdeva,lwd=1.5,lty=2,col=yan[4],pch=pcc[4],type="b")

error.bar(k1$ux,k1$sdeva,k1$sdstd/2,col=yan[1])
error.bar(k2$ux,k2$sdeva,k2$sdstd/2,col=yan[2])
error.bar(k3$ux,k3$sdeva,k3$sdstd/2,col=yan[3])
error.bar(k4$ux,k4$sdeva,k4$sdstd/2,col=yan[4])

leg<-c("600Hz","1KHz","2KHz","2.5KHz")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,
bty="n")

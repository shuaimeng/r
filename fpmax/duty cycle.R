#eject frequency in one pulse
# name: duty cycle

##reading datas##
dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/maxfp")
library(xlsx)

k1<-read.xlsx("duty cycle.xlsx",sheetName = "5",header = TRUE)
k2<-read.xlsx("duty cycle.xlsx",sheetName = "6",header = TRUE)
k3<-read.xlsx("duty cycle.xlsx",sheetName = "8",header = TRUE)
k4<-read.xlsx("duty cycle.xlsx",sheetName = "9",header = TRUE)

#Room#

#par(mfrow=c(2,2),mar=c(2,2.6,2,2),oma=c(1,1,1,1))


###error bar####
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}


####k=0.5###
plot(k1$fv,k1$tfeva, xaxs="i", col=0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)),mgp=c(1.1, 0, 0),tck=0.01, main="",
     cex.lab=1,xlim=c(0,300),ylim=c(0,10))


#z1=loess(k1$tfeva~k1$fv,span=0.4,degree=2)
#lines(k1$fv, z1$fit, col="red",pch=0,lty=2,type="b",lwd=2)

#z2=loess(k2$tfeva~k2$fv,span=0.4,degree=2)
#lines(k2$fv, z2$fit, col="blue",pch=1,lty=2,type="b",lwd=2)

#z3=loess(k3$tfeva~k3$fv,span=0.4,degree=2)
#lines(k3$fv, z3$fit, col="green3",pch=2,lty=2,type="b",lwd=2)

#z4=loess(k4$tfeva~k4$fv,span=0.4,degree=2)
#lines(k4$fv, z4$fit, col="black",pch=5,lty=2,type="b",lwd=2)

lines(k1$fv, k1$tfeva,col="red", lwd=2, pch=0,type="b", lty=2)
lines(k2$fv, k2$tfeva,col="blue", lwd=2, pch=1,type="b", lty=2)
lines(k3$fv, k3$tfeva,col="green3", lwd=2, pch=2,type="b", lty=2)
lines(k4$fv, k4$tfeva,col="black", lwd=2, pch=5,type="b", lty=2)

legend("topright",c("k=0.5","k=0.6","k=0.8","k=0.9"),col=c("red","blue","green3","black"),
       pch=c(0,1,2,5),lwd=2,lty=2,inset=.05,bty="n")

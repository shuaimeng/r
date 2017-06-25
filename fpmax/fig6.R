dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/maxfp")
library(xlsx)

##reading xlsx ##

k1<-read.xlsx("he-30g.xlsx", sheetName = "2kv180", header = TRUE)
k2<-read.xlsx("duty cycle2.xlsx", sheetName = "6", header = TRUE)
k3<-read.xlsx("duty cycle2.xlsx", sheetName = "8", header = TRUE)
k4<-read.xlsx("duty cycle2.xlsx", sheetName = "9", header = TRUE)

##error bar##
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}
##

#1.fp; fveva,stdfv;

yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)
##
plot(k1$fv,k1$fveva, col=0,xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02,
     main = "", xlim = c(0, 3500),ylim=c(0,4000))

lines(k1$fv,k1$fveva, col=yan[1],pch=pcc[1],lwd=2,lty=2,type="b")
lines(k2$fv,k2$fveva, col=yan[2],pch=pcc[2],lwd=2,lty=2,type="b")
lines(k3$fv,k3$fveva, col=yan[3],pch=pcc[3],lwd=2,lty=2,type="b")
lines(k4$fv,k4$fveva, col=yan[4],pch=pcc[4],lwd=2,lty=2,type="b")

error.bar(k1$fv,k1$fveva,k1$stdfv/2,col=yan[1])
error.bar(k2$fv,k2$fveva,k2$stdfv/2,col=yan[2])
error.bar(k3$fv,k3$fveva,k3$stdfv/2,col=yan[3])
error.bar(k4$fv,k4$fveva,k4$stdfv/2,col=yan[4])

x1<-c(3500,3500)
y1<-c(0,3000)
x2<-c(3500,3500)
y2<-c(0,3500)
x3<-c(700,700)
y3<-c(0,700)
x4<-c(3000,3000)
y4<-c(0,3000)

lines(x1,y1,col="red",lwd=1.5,lty=2)
lines(x2,y2,col="blue",lwd=1.5,lty=2)
lines(x3,y3,col="green3",lwd=1.5,lty=2)
lines(x4,y4,col="black",lwd=1.5,lty=2)

text(700,300,"fpmax=700Hz",col="green3",font=2)
text(3100,2000,"fpmax=3500Hz",col="red",font=2)
text(2600,1700,"fpmax=3000Hz",col="black",font=2)
text(3100,2500,"fpmax=3500Hz",col="blue",font=2)


leg<-c("kv=0.5","kv=0.6","kv=0.8","kv=0.9")

legend("topleft",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.06,bty="n")

dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/viscous")

library(xlsx)

# 比较tfor和tp
# tfor下，liquid1和liquid2的比较
# 2.2kv下的比较
# 18nl/min和180nl/min
# 18nl/min-liquid1，18nl/min-liquid2, 180nl/min-liquid1,180nl/min-liquid2


# legend: 18nl/min-l1,18nl/min-l2,180nl/min-l1,180nl/min-liquid2

k1<-read.xlsx("liquid1.xlsx",sheetName="2kv-18",header=TRUE)
k2<-read.xlsx("liquid1.xlsx",sheetName="2.2kv-18",header=TRUE)
k3<-read.xlsx("liquid2.xlsx",sheetName="2.2kv-18",header=TRUE)
k4<-read.xlsx("liquid1.xlsx",sheetName="2.2kv-180",header=TRUE)

# errorbar
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
stop("vectors must be same length")
arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

par(mfrow = c(2,1), mar = c(2,2.4,0.4,1), oma = c(1,1,1,1))


# color setting

yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

plot(k1$fv,k1$deva, col=0,xlab = expression(italic(f["v"]) (Hz)),
          ylab = expression(italic(d["d"]) (um)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,800),ylim=c(0,60))

   mtext("Small droplet",3,line=-1,font=2,cex=0.9)

   points(k1$fv,k1$deva,col=yan[1],lty=2,pch=pcc[1],cex=0.8)
   points(k2$fv,k2$deva,col=yan[2],lty=2,pch=pcc[2],cex=0.8)
   points(k3$fv,k3$deva,col=yan[3],lty=2,pch=pcc[3],cex=0.8)
   points(k4$fv,k4$deva,col=yan[4],lty=2,pch=pcc[4],cex=0.8)


   error.bar(k1$fv,k1$deva,k1$stdd/2,col=yan[1])
   error.bar(k2$fv,k2$deva,k2$stdd/2,col=yan[2])
   error.bar(k3$fv,k3$deva,k3$stdd/2,col=yan[3])
   error.bar(k4$fv,k4$deva,k4$stdd/2,col=yan[4])

   fit1=lm(k1$deva~k1$fv)
   fit2=lm(k2$deva~k2$fv)
   fit3=lm(k3$deva~k3$fv)
   fit4=lm(k4$deva~k4$fv)

   abline(fit1,col=yan[1],lwd=1.5,lty=2)
   abline(fit2,col=yan[2],lwd=1.5,lty=2)
   abline(fit3,col=yan[3],lwd=1.5,lty=2)
   abline(fit4,col=yan[4],lwd=1.5,lty=2)

   leg<-c("18nl/min-2kv(liquid1)","18nl/min-2.2kv(liquid1)","18nl/min-2.2kv(liquid2)","180nl/min-2.2kv(liquid1)")

   legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,
   inset=.01,bty="n",cex=0.8)

   inter<-c(coef(fit1)[1],coef(fit2)[1],coef(fit3)[1],coef(fit4)[1])
   slope<-c(coef(fit1)[2],coef(fit2)[2],coef(fit3)[2],coef(fit4)[2])

   k1<-read.xlsx("liquid1.xlsx",sheetName="2kv-18",header=TRUE)
   k2<-read.xlsx("liquid1.xlsx",sheetName="2.2kv-18",header=TRUE)
   k3<-read.xlsx("liquid2.xlsx",sheetName="2.2kv-18",header=TRUE)
   k4<-read.xlsx("liquid1.xlsx",sheetName="2.2kv-180",header=TRUE)


   # yan
   yan<-c("red","blue","black","green3")
   pcc<-c(0,1,2,5)

   # plot

   plot(k1$fv,k1$raeva, col=0,xlab = expression(italic(f["v"]) (Hz)),
   ylab = expression(italic(ratio)), mgp=c(1.1, 0, 0),tck=0.02,
   main = "", xlim = c(0,800),ylim=c(0,20))

   mtext("ratio",3,line=-1,cex=0.9,font=2)

   # lines and error

   lines(k1$fv,k1$raeva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
   lines(k2$fv,k2$raeva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
   lines(k3$fv,k3$raeva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)
   lines(k4$fv,k4$raeva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)

   error.bar(k1$fv,k1$raeva,k1$stdra/2,col=yan[1])
   error.bar(k2$fv,k2$raeva,k2$stdra/2,col=yan[2])
   error.bar(k3$fv,k3$raeva,k3$stdra/2,col=yan[3])
   error.bar(k4$fv,k4$raeva,k4$stdra/2,col=yan[4])

   abline(h=5,lwd=1,lty=2,col="red")
   abline(h=10,lwd=1,lty=2,col="blue")
   abline(h=15,lwd=1,lty=2,col="green3")

   leg<-c("18nl/min-2kv(liquid1)","18nl/min-2.2kv(liquid1)","18nl/min-2.2kv(liquid2)","180nl/min-2.2kv(liquid1)")


   legend("bottomright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset = .01,bty = "n",cex=0.8)

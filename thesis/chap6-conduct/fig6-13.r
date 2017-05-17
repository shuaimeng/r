dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/conductivity")

library(xlsx)

# reading datasets

# compare qd and conductivitys
# Gly1,18nl/min - 1.8kv; 180nl/min - 2kv;
# Gly2,18nl/min - 2kv; 180nl/min - 1.8kv;
#

k1<-read.xlsx("gly1.xlsx",sheetName="qd1-18",header=TRUE)
k2<-read.xlsx("gly1.xlsx",sheetName="qd2-20",header=TRUE)

k3<-read.xlsx("gly2.xlsx",sheetName="qd1-20",header=TRUE)
k4<-read.xlsx("gly2.xlsx",sheetName="qd2-18",header=TRUE)

#
yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

#error
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) !=
     length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

#
plot(k1$fv,k1$deva, col=0,xlab = expression(italic(f["v"]) (Hz)),
          ylab = expression(italic(d["d"]) (um)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,4000),ylim=c(0,60))

               mtext("Small droplets of Q-V",3,line=0,font=2,cex=1.1)

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

leg<-c("Gly1:18nl/min-1.8kv","Gly1:180nl/min-2kv","Gly2:18nl/min-2kv","Gly2:180nl/min-1.8kv")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,inset=.06,bty="n")

inter<-c(coef(fit1)[1],coef(fit2)[1],coef(fit3)[1],coef(fit4)[1])
slope<-c(coef(fit1)[2],coef(fit2)[2],coef(fit3)[2],coef(fit4)[2])

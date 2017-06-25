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
par(fig=c(0,1,0,1),new=T)

plot(k1$ux,k1$sdeva, col=0,xlab = expression(italic(U["x"]) (mm/s)),
          ylab = expression(italic(S["d"]) (um)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(-50,300),ylim=c(0,400))

mtext("Sd+d and fitting",3,line=0.2,font=2,cex=1.2)

points(k1$ux,(k1$sdeva+k1$deva),col=yan[1],pch=pcc[1])
points(k2$ux,(k2$sdeva+k2$deva),col=yan[2],pch=pcc[2])
points(k3$ux,(k3$sdeva+k3$deva),col=yan[3],pch=pcc[3])
points(k4$ux,(k4$sdeva+k4$deva),col=yan[4],pch=pcc[4])

z1<-lm((k1$sdeva+k1$deva)~k1$ux)
z2<-lm((k2$sdeva+k2$deva)~k2$ux)
z3<-lm((k3$sdeva+k3$deva)~k3$ux)
z4<-lm((k4$deva+k4$sdeva)~k4$ux)


abline(z1,col=yan[1],lwd=1.5,lty=2)
abline(z2,col=yan[2],lwd=1.5,lty=2)
abline(z3,col=yan[3],lwd=1.5,lty=2)
abline(z4,col=yan[4],lwd=1.5,lty=2)

error.bar(k1$ux,(k1$deva+k1$sdeva),(k1$stdd+k1$sdstd)/2,col=yan[1])
error.bar(k2$ux,(k2$deva+k2$sdeva),(k2$stdd+k2$sdstd)/2,col=yan[2])
error.bar(k3$ux,(k3$deva+k3$sdeva),(k3$stdd+k3$sdstd)/2,col=yan[3])
error.bar(k4$ux,(k4$deva+k4$sdeva),(k4$stdd+k4$sdstd)/2,col=yan[4])

leg<-c("600Hz","1KHz","2KHz","2.5KHz")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,
bty="n")

# 斜率获取
b11<-z1$coefficients[2] #b11 = 2.113 ,b1=2.13
b2<-z2$coefficients[2]
b3<-z3$coefficients[2]
b4<-z4$coefficients[2]

x<-b1/b11

a1<-z1$coefficients[1]
a2<-z2$coefficients[1]
a3<-z3$coefficients[1]
a4<-z4$coefficients[1]

b<-c(b1,b2,b3,b4)


# 近似的斜率获取
b1<-2.13


kv2<-b1*0.6

kv3<-b1*0.3

kv4<-b1*0.24

kv<-c(b1,kv2,kv3,kv4) # kv 是基于sd下的斜率拟合

kv22<-kv2*x
kv33<-kv3*x
kv44<-kv4*x

kv1<-c(b1,kv22,kv33,kv44) # kv1是基于sd+d下的斜率拟合


# 画斜线
par(fig=c(0.08,0.6,0.4,0.98),new=T)

ux<-c(0.6,1,2,2.5)

plot(ux,b, col=0,bty="n",xlab = expression(italic(f["p"]) (KHz)),
          ylab = expression(italic(Slope)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0.5,2.5),ylim=c(0,2.2),cex=0.8)

               lines(ux,b,col="red",lwd=1.5,lty=2,pch=pcc[1],type="b")
               lines(ux,kv,col="blue",lwd=1.5,lty=2,pch=pcc[2],type="b")
               lines(ux,kv1,col="black",lwd=1.5,lty=2,pch=pcc[3],type="b")

leg1<-c("fit","fit at Sd","fit at Sd+d")

legend("topright",legend=leg1,col=c("red","blue","black"),pch=c(0,1,2),lwd=1.5,lty=2,inset=.02,bty="n")

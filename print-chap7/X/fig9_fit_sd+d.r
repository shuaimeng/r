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

# par

par(mfrow = c(2,1), mar = c(2,2.4,2,2), oma = c(1,1,1,1))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))

# color setting

yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)


# plot

plot(k1$ux,k1$sdeva, col=0,xlab = expression(italic(U["x"]) (mm/s)),
          ylab = expression(italic(S["d"]+D) (um)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,300),ylim=c(0,500))

mtext("Droplet+Sd space",3,line=0.2,font=2,cex=1.2)

lines(k1$ux,(k1$sdeva+k1$deva),col=yan[1],pch=pcc[1],type="b")
lines(k2$ux,(k2$sdeva+k2$deva),col=yan[2],pch=pcc[2],type="b")
lines(k3$ux,(k3$sdeva+k3$deva),col=yan[3],pch=pcc[3],type="b")
lines(k4$ux,(k4$sdeva+k4$deva),col=yan[4],pch=pcc[4],type="b")

ux1<-k1$ux
ux2<-k2$ux
ux3<-k3$ux
ux4<-k4$ux

lines(ux1,(ux1*1000/600),col=yan[1],lwd=1.5,lty=2)
lines(ux2,(ux2*1000/1000),col=yan[2],lwd=1.5,lty=2)
lines(ux3,(ux3*1000/2000),col=yan[3],lwd=1.5,lty=2)
lines(ux4,(ux4*1000/2500),col=yan[4],lwd=1.5,lty=2)

#abline(z1,col=yan[1],lwd=1.5,lty=2)
#abline(z2,col=yan[2],lwd=1.5,lty=2)
#abline(z3,col=yan[3],lwd=1.5,lty=2)
#abline(z4,col=yan[4],lwd=1.5,lty=2)

error.bar(k1$ux,(k1$deva+k1$sdeva),(k1$stdd+k1$sdstd)/2,col=yan[1])
error.bar(k2$ux,(k2$deva+k2$sdeva),(k2$stdd+k2$sdstd)/2,col=yan[2])
error.bar(k3$ux,(k3$deva+k3$sdeva),(k3$stdd+k3$sdstd)/2,col=yan[3])
error.bar(k4$ux,(k4$deva+k4$sdeva),(k4$stdd+k4$sdstd)/2,col=yan[4])

leg<-c("600Hz","1KHz","2KHz","2.5KHz")
leg2<-c("600Hz-Set","1KHz-Set","2KHz-Set","2.5KHz-Set")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,
bty="n",cex=0.85)
legend("topleft",legend=leg2,col=yan,lwd=1.5,lty=2,inset=.02,
bty="n",cex=0.85)

# plot

plot(k1$ux,k1$sdeva, col=0,xlab = expression(italic(U["x"]) (mm/s)),
          ylab = expression(italic(error) (um)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,350),ylim=c(-120,120))

mtext("error",3,line=0.2,font=2,cex=1.2)

A<-(ux1*1000/600)
B<-(ux2*1000/1000)
C<-(ux3*1000/2000)
D<-(ux4*1000/2500)

t1<-A-k1$sdeva
t2<-B-k2$sdeva # 标准 - Sd
t3<-C-k3$sdeva
t4<-D-k4$sdeva

n1<-A-(k1$sdeva+k1$deva)
n2<-B-(k2$sdeva+k2$deva)  # 标准-Sd-D
n3<-C-(k3$sdeva+k3$deva)
n4<-D-(k4$sdeva+k4$deva)

#lines(k1$ux,t1,col="red",pch=0,lwd=1.5,lty=2,type="b")
#lines(k2$ux,t2,col="blue",pch=0,lwd=1.5,lty=2,type="b")
#lines(k3$ux,t3,col="black",pch=0,lwd=1.5,lty=2,type="b")
#lines(k4$ux,t4,col="green3",pch=0,lwd=1.5,lty=2,type="b")

lines(k1$ux,n1,col="red",pch=0,lwd=1.5,lty=2,type="b")
lines(k2$ux,n2,col="blue",pch=1,lwd=1.5,lty=2,type="b")
lines(k3$ux,n3,col="black",pch=2,lwd=1.5,lty=2,type="b")
lines(k4$ux,n4,col="green3",pch=5,lwd=1.5,lty=2,type="b")

abline(h=0,col="yellow3",lwd=1,lty=4)

lee<-c("600Hz-Sd-D","1KHz-Sd-D","2KHz-Sd-D","2.5KHz-Sd-D")

legend("bottomright",legend=lee,col=c("red","blue","black","green3"),pch=c(0,1,2,5),lwd=1.5,lty=2,inset=.01,bty="n",cex=0.8)

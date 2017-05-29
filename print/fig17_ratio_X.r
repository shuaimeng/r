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

# color setting

yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

ux1<-k1$ux
ux2<-k2$ux
ux3<-k3$ux
ux4<-k4$ux

A<-(ux1*1000/600)
B<-(ux2*1000/1000)
C<-(ux3*1000/2000)
D<-(ux4*1000/2500)

t1<-(A-k1$sdeva)/A
t2<-(B-k2$sdeva)/B # 标准 - Sd
t3<-(C-k3$sdeva)/C
t4<-(D-k4$sdeva)/D

n1<-(A-(k1$sdeva+k1$deva))/A
n2<-(B-(k2$sdeva+k2$deva))/B  # 标准-Sd-D
n3<-(C-(k3$sdeva+k3$deva))/C
n4<-(D-(k4$sdeva+k4$deva))/D



# plot

plot(k1$ux,k1$sdeva, col=0,xlab = expression(italic(U["x"]) (mm/s)),
          ylab = expression(italic(ratio_Sd)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,300),ylim=c(-0.5,1))

mtext("ratio of error in Sd",3,line=0.2,font=2,cex=1.2)

lines(ux1,t1,col=yan[1],lwd=1.5,lty=2,pch=pcc[1],type="b")
lines(ux2,t2,col=yan[2],lwd=1.5,lty=2,pch=pcc[2],type="b")
lines(ux3,t3,col=yan[3],lwd=1.5,lty=2,pch=pcc[3],type="b")
lines(ux4,t4,col=yan[4],lwd=1.5,lty=2,pch=pcc[4],type="b")

lines(ux1,-n1,col=yan[1],lwd=1.5)
lines(ux2,n2,col=yan[2],lwd=1.5)
lines(ux3,n3,col=yan[3],lwd=1.5)
lines(ux4,n4,col=yan[4],lwd=1.5)

abline(h=0,col="yellow3",lwd=1.5,lty=2)
abline(h=0.5,col="red",lwd=1.5,lty=2)

leg<-c("600Hz-r_Sd","1KHz-r_Sd","2KHz-r_Sd","2.5KHz-r_Sd")
leg2<-c("|600Hz-r_Sd+D|","1KHz-r_Sd+D","2KHz-r_Sd+D","2.5KHz-r_Sd+D")

legend("bottomright",legend=leg,col=yan,pch=pcc,lwd=1.5,inset=.02,bty="n",cex=0.9)
legend("bottomleft",legend=leg2,col=yan,lty=2,lwd=1.5,inset=.02,bty="n",cex=0.9)

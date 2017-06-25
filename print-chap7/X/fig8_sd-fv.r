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

z1<-(k1$sdeva+k1$deva)*0.6;
z2<-(k2$sdeva+k2$deva)*1;
z3<-(k3$sdeva+k3$deva)*2;
z4<-(k4$sdeva+k4$deva)*2.5;

#z1<-(k1$sdeva)*0.6;
#z2<-(k2$sdeva)*1;
#z3<-(k3$sdeva)*2;
#z4<-(k4$sdeva)*2.5;

e1<-(k1$sdstd+k1$stdd)*0.6;
e2<-(k2$sdstd+k2$stdd)*1;
e3<-(k3$sdstd+k3$stdd)*2;
e4<-(k4$sdstd+k4$stdd)*2.5;

plot(k1$ux,z1,col=0,xlab = expression(italic(U["x"]) (mm/s)),
          ylab = expression(italic((S["d"]+D)/fv)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,300),ylim=c(0,300))

               mtext("Sd_ratio",3,line=0.2,font=2,cex=1.2)

lines(k1$ux,z1,lwd=1.5,lty=2,col=yan[1],pch=pcc[1],type="b")
lines(k2$ux,z2,lwd=1.5,lty=2,col=yan[2],pch=pcc[2],type="b")
lines(k3$ux,z3,lwd=1.5,lty=2,col=yan[3],pch=pcc[3],type="b")
lines(k4$ux,z4,lwd=1.5,lty=2,col=yan[4],pch=pcc[4],type="b")

error.bar(k1$ux,z1,e1/2,col=yan[1])
error.bar(k2$ux,z2,e2/2,col=yan[2])
error.bar(k3$ux,z3,e3/2,col=yan[3])
error.bar(k4$ux,z4,e4/2,col=yan[4])

leg<-c("600Hz","1KHz","2KHz","2.5KHz")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,
bty="n")

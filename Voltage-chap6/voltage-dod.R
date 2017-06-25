dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/voltage")
library(xlsx)
##reading datas
#he-32g.xlsx
#qd4.xlsx

k1<-read.xlsx("he-30g.xlsx", sheetName = "2kv180", header = TRUE)
k2<-read.xlsx("qd4.xlsx", sheetName = "v1", header = TRUE)
k3<-read.xlsx("qd4.xlsx", sheetName = "v2", header = TRUE)
k4<-read.xlsx("qd4.xlsx", sheetName = "v3", header = TRUE)

##
yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

##
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}
##

plot(k1$fv,k1$X0.5, col=0,xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02,
     main = "", xlim = c(0, 4000),ylim=c(0,4000))

lines(k1$fv,k1$feeva*k1$fv,col=yan[1],pch=pcc[1],type="b",lwd=2,lty=2)
lines(k2$fv,k2$fveva,col=yan[2],pch=pcc[2],type="b",lwd=2,lty=2)
lines(k3$fv,k3$fveva,col=yan[3],pch=pcc[3],type="b",lwd=2,lty=2)
lines(k4$fv,k4$fveva,col=yan[4],pch=pcc[4],type="b",lwd=2,lty=2)


error.bar(k1$fv,k1$feeva*k1$fv,k1$festd*k1$fv/2,col=yan[1])
error.bar(k2$fv,k2$fveva,k2$stdfv/2,col=yan[2])
error.bar(k3$fv,k3$fveva,k3$stdfv/2,col=yan[3])
error.bar(k4$fv,k4$fveva,k4$stdfv/2,col=yan[4])

x1<-c(0,0)
x2<-c(1000,1000)
x3<-c(1200,1200)
y1<-c(0,683)
y2<-c(0,1000)
y3<-c(0,1200)
lines(x1,y1,col="blue",lwd=1.5,lty=2)
lines(x2,y2,col="blue",lwd=1.5,lty=2)
#lines(x3,y3,col="blue",lwd=1.5,lty=2)

text(500,350,"Low fv",col="black",font=2)
text(500,200,"Multi emission",col="black",font=2)

x4<-c(3500,3500)
x5<-c(2500,2500)
y5<-c(0,2200)
y4<-c(0,3500)
lines(x4,y4,col="red",lwd=1.5,lty=2)
text(1800,350,"Single emission", col="black",font=2)
text(1800,200,"fp=fv", col="black",font=2)
text(3050,500,"fpmax=3.5KHz",col="red",font=2)
text(2000,2500,"fpmax=2.2KHz",col="blue",font=2)
lines(x5,y5,col="black",lwd=1.5,lty=2)
##

leg<-c("V0+0:0kv+2Kv","Va+Vb:1.7kv-2kv","Va+Vb:1.8kv-2kv","Va+Vb:1.9kv-2kv")

legend("topleft",legend = leg, col=yan,pch=pcc,lwd=2,inset=.08,bty="n",cex=0.9)

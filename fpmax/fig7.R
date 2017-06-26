dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/maxfp")
library(xlsx)

#reading

v1<-read.xlsx("he-30g.xlsx", sheetName = "16kv", header = TRUE)
v2<-read.xlsx("he-30g.xlsx", sheetName = "18kv", header = TRUE)
v3<-read.xlsx("he-30g.xlsx", sheetName = "2kv180", header = TRUE)
v4<-read.xlsx("he-30g.xlsx", sheetName = "22kv", header = TRUE)


v5<-read.xlsx("duty cycle2.xlsx", sheetName = "9", header = TRUE)
v6<-read.xlsx("duty cycle2.xlsx", sheetName = "21-9", header = TRUE)

##
##error bar##
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}
##

##
par(mfrow = c(2,1), mar = c(2,2.4,1,1), oma = c(1,1,1,1))

##
yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

##Plot-1#
plot(v1$fv,v1$fveva, col=0,xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02,
     main = "", xlim = c(0, 3500),ylim=c(0,3500))

lines(v1$fv,v1$fveva,col=yan[1],pch=pcc[1],lwd=2,lty=2,type="b",cex=0.8)
lines(v2$fv,v2$fveva,col=yan[2],pch=pcc[2],lwd=2,lty=2,type="b",cex=0.8)
lines(v3$fv,v3$fveva,col=yan[3],pch=pcc[3],lwd=2,lty=2,type="b",cex=0.8)
lines(v4$fv,v4$fveva,col=yan[4],pch=pcc[4],lwd=2,lty=2,type="b",cex=0.8)

error.bar(v1$fv,v1$fveva,v1$stdfv/2,col=yan[1])
error.bar(v2$fv,v2$fveva,v2$stdfv/2,col=yan[2])
error.bar(v3$fv,v3$fveva,v3$stdfv/2,col=yan[3])
error.bar(v4$fv,v4$fveva,v4$stdfv/2,col=yan[4])

###800，1800，3000，2900；
x1<-c(800,800)
y1<-c(0,800)
x2<-c(1800,1800)
y2<-c(0,1800)
x3<-c(3500,3500)
y3<-c(0,3000)
x4<-c(2900,2900)
y4<-c(0,2900)

lines(x1,y1,col=yan[1],lwd=1.5,lty=2)
lines(x2,y2,col=yan[2],lwd=1.5,lty=2)
lines(x3,y3,col=yan[3],lwd=1.5,lty=2)
lines(x4,y4,col=yan[4],lwd=1.5,lty=2)

text(750,180,"fpmax=800Hz",col=yan[1],font=2)
text(1800,600,"fpmax=1.8KHz",col=yan[2],font=2)
text(3200,1800,"fpmax=3.5KHz",col=yan[3],font=2)
text(2600,1400,"fpmax=2.9KHz",col=yan[4],font=2)



leg<-c("V=1.6kv","V=1.8kv","V=2kv","V=2.2kv")

legend("topleft",legend=leg,col=yan,pch=pcc,lwd=1.5,inset=.06,bty="n")

##Plot2
plot(v5$fv,v5$fveva, col=0,xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02,
     main = "", xlim = c(0, 4500),ylim=c(0,4500))

lines(v5$fv,v5$fveva,col=yan[1],pch=pcc[1],lwd=2,lty=2,type="b",cex=0.8)
lines(v6$fv,v6$fveva,col=yan[2],pch=pcc[2],lwd=2,lty=2,type="b",cex=0.8)

error.bar(v5$fv,v5$fveva,v5$stdfv/2,col=yan[1])
error.bar(v6$fv,v6$fveva,v6$stdfv/2,col=yan[2])

x5<-c(4500,4500)
y5<-c(0,4500)
lines(x5,y5,col="blue",lwd=1.5,lty=2)
text(4000,2600,"fpmax=4.5KHz",col="blue",font=2)

leg1<-c("V-kv:2kv-0.9","V-kv:2.1kv-0.9")

legend("topleft",legend=leg1,col=c("red","blue"),pch=c(0,1),lwd=1.5,inset=.06,bty="n")

library(xlsx)

##reading datas
#he-32g.xlsx
#qd4.xlsx

k1<-read.xlsx("gly1.xlsx", sheetName = "qd2-20", header = TRUE)
#180nl/min-0.5,0.5mm间距

k2<-read.xlsx("he-30g.xlsx", sheetName = "2kv180", header = TRUE)
#180nl/min-0.5,1mm间距

k3<-read.xlsx("duty cycle2.xlsx", sheetName = "21-9", header = TRUE)
#180nl/min-0.9,2.1kv

#deva+stdd

##
yan<-c("red","blue","black")
pcc<-c(0,1,2)

##
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

#
D<-310
##plot
plot(k1$fv,D/k1$deva, col=0,xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(Ratio)) , mgp=c(1.1, 0, 0),tck=0.02, 
     main = "", xlim = c(1000, 4000),ylim=c(5,20))

#mod1=loess(k1$deva,k1$fv)
lines(lowess(k1$fv,k1$raeva,f=0.15,iter=3),col=yan[1],lwd=2,lty=2,type="b",pch=pcc[1],cex=0.8)

#lines(lowess(k2$fv,k2$deva,f=0.25,iter=3),col=yan[2],lwd=2,lty=2,type="b",pch=pcc[2],cex=0.8)

lines(lowess(k3$fv,k3$raeva,f=0.45,iter=3),col=yan[2],lwd=2,lty=2,type="b",pch=pcc[3],cex=0.8)

error.bar(k1$fv,k1$raeva,k1$rastd/2,col=yan[1])
#error.bar(k2$fv,k2$deva,k2$stdd/2,col=yan[2])
error.bar(k3$fv,k3$raeva,k3$rastd/2,col=yan[2])

x1<-c(1400,1400)
y1<-c(0,10)
x2<-c(0,3200)
y2<-c(10,10)
x3<-c(3200,3200)
x4<-c(3430,3430)
y3<-c(0,15)
x5<-c(0,3430)
y5<-c(15,15)
lines(x1,y1,col="red",lwd=1,lty=2)
lines(x2,y2,col="black",lwd=1,lty=2)
lines(x3,y1,col="red",lwd=1,lty=2)
lines(x4,y3,col="red",lwd=1,lty=2)
lines(x5,y5,col="black",lwd=1,lty=2)

text(1650,7,"fv=1.4KHz",col="red",font=2)
text(2900,7,"fv=3.2KHz",col="red",font=2)
text(3800,7,"fv=3.43KHz",col="red",font=2)

#abline(h=10,col="black",lwd=1,lty=2)
#abline(h=15,col="black",lwd=1,lty=2)

leg<-c("180nl/min-0.5,H=0.5mm","180nl/min-0.9,V=2.1kv")

legend("topleft",legend=leg,col=c("red","blue"),pch=c(0,1),lwd=1.5,inset=.06,bty="n")








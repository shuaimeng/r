
dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/chap5")
library(xlsx)

par(mar=c(2,2.2,0.8,0.8),oma=c(2,2,2,2))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))

x<-c(1,2,3,4)
y1<-c(2.2,2.2,2.2,2)
y2<-c(2,1.6,1.8,1.8)

plot(x,y1,type="l",lwd=2,lty=2,col=0,xlab = expression(italic(Nozzles)),
     ylab = expression(italic(Voltage-range)(kv)),mgp=c(1.1, 0, 0),tck=0.02,xaxt="n",xlim = c(0.9, 4.1),ylim=c(1.4,2.4))
axis(1,mgp=c(1.1, 0, 0),tck=0.02,at=c(1,2,3,4),label=c("25G","30G","32G","34G"))
points(x,y1,col="red",pch=1,lwd=2,lty=2,type="b")
points(x,y2,col="blue",pch=2,lwd=2,lty=2,type="b")

text(2,2.3,"High limit voltage",col="red",font=2)
text(3.2,1.7,"Low limit voltage",col="blue",font=2)


#25G
x1<-c(2,2.2)
y1<-c(0.8,0.8)
#30G
x2<-c(1.6,1.8,2,2.2)
y2<-c(0.8,1.8,2.8,2.9)
#32G
x3<-c(1.8,2)
y3<-c(2.8,3.5)
#34G
x4<-c(1.8,2)
y4<-c(2,3)



plot(x1,y1, xlab = expression(italic(f["v"])(Kv)),
     ylab=expression(italic(f["pmax"](KHz))),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(1.5,2.3),ylim=c(0,4),col=0)

#barplot(data,width=0.5,space=0.3,col=mycolor,names.arg=c("20mm/s","50mm/s","100mm/s","150mm/s"),xlab = expression(italic(U["x"]) (mm/s)), ylab = expression(italic(S["d"])(um)),xlim = c(0, 3), ylim=c(0,200))

lines(x1,y1,col="red",type="b",pch=1,lwd=2,lty=4)
lines(x2,y2,col="blue",type="b",pch=2,lwd=2,lty=4)
lines(x4,y4,col="black",type="b",pch=3,lwd=2,lty=4)
lines(x3,y3,col="green3",type="b",pch=4,lwd=2,lty=4)

name<-c("25G","30G","32G","34G")
legend("topleft",name,col=c("red","blue","black","green3"),pch=c(1,2,3,4),lwd=2,lty=4,inset=.02,bty="n")

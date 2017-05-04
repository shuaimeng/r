


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

plot(x1,y1, xlab = expression(Voltage(KV)),
     ylab=expression(f["pmax"](KHz)),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(1.5,2.3),ylim=c(0,4),col=0)

#barplot(data,width=0.5,space=0.3,col=mycolor,names.arg=c("20mm/s","50mm/s","100mm/s","150mm/s"),xlab = expression(italic(U["x"]) (mm/s)), ylab = expression(italic(S["d"])(um)),xlim = c(0, 3), ylim=c(0,200))

lines(x1,y1,col="red",type="b",pch=1,lwd=2,lty=4)
lines(x2,y2,col="blue",type="b",pch=2,lwd=2,lty=4)
lines(x4,y4,col="black",type="b",pch=3,lwd=2,lty=4)
lines(x3,y3,col="green3",type="b",pch=4,lwd=2,lty=4)

name<-c("25G","30G","32G","34G")
legend("topleft",name,col=c("red","blue","black","green3"),pch=c(1,2,3,4),lwd=2,lty=4,inset=.05,bty="n")
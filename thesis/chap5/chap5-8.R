par(mgp = c(2, 0.5, 0),tck=0.02)

x<-c(1,2,3,4)
y1<-c(2.2,2.2,2.2,2)
y2<-c(2,1.6,1.8,1.8)

plot(x,y1,type="l",lwd=2,lty=2,col=0,xlab = expression(italic(Nozzles)), 
     ylab = expression(italic(Voltage-range)(kv)),mgp=c(1.1, 0, 0),tck=0.02,xaxt="n",xlim = c(0.9, 4.1),ylim=c(1.4,2.4))
axis(1,at=c(1,2,3,4),label=c("25G","30G","32G","34G"))
points(x,y1,col="red",pch=1,lwd=2,lty=2,type="b")
points(x,y2,col="blue",pch=2,lwd=2,lty=2,type="b")

text(2,2.3,"High limit voltage",col="red",font=2)
text(3.2,1.7,"Low limit voltage",col="blue",font=2)

library(xlsx)
#layout(matrix(c(1,2), 1, 2,byrow = TRUE))

q1<-c(1000,1000,1000,1000)
sq1<-c(20,20,16,15)
q2<-c(1000,1000,1000,1000)
sq2<-c(16,20,20,28)
q3<-c(300,500,500,2000)
sq3<-c(30,35,20,18)
q4<-c(300,500,1000,3500)
sq4<-c(20,29,34,30)

#sq1=std(q1)

##error bar##
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}
##

k1<-read.xlsx("f_eject.xlsx", sheetName = "eject_q15", header = TRUE)
k2<-read.xlsx("f_eject.xlsx", sheetName = "eject_q27", header = TRUE)
k3<-read.xlsx("f_eject.xlsx", sheetName = "eject_q54", header = TRUE)
k4<-read.xlsx("f_eject.xlsx", sheetName = "eject_q180", header = TRUE)
k5<-read.xlsx("he-30g.xlsx", sheetName = "2kv180", header = TRUE)


q<-c(1.5,27,54,180)

par(mfrow = c(2,1), mar = c(2,2.4,2,2), oma = c(1,1,1,1))

plot(q,q1,xaxt="n",col = 0, axis="",xlab = expression(italic(Q) (nl/min)), 
     ylab = expression(italic(f["pmax"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02, 
     main = "", xlim = c(0, 180),ylim=c(0,3500))

axis(side=1,at=c(1.5,27,54,180),mgp=c(1.1,0,0),tck=0.02,label=c("1.5","27","54","180"))


yan<-c("red","blue","black","green3")

pcc<-c(0,1,2,5)

leg<-c("kv=0.2","kv=0.3","kv=0.4","kv=0.5")

lines(lowess(q,q1,f=0.2,iter=3),col=yan[1],lwd=2,pch=pcc[1],type="b",lty=2,cex=0.8)
lines(lowess(q,q2,f=0.2,iter=3),col=yan[2],lwd=2,pch=pcc[2],type="b",lty=2,cex=0.8)

lines(lowess(q,q3,f=0.2,iter=3),col=yan[3],lwd=2,pch=pcc[3],type="b",lty=2,cex=0.8)
lines(lowess(q,q4,f=0.2,iter=3),col=yan[4],lwd=2,pch=pcc[4],type="b",lty=2,cex=0.8)

error.bar(q,q1,sq1/2, col=yan[1])
error.bar(q,q2,sq2/2,col=yan[2])
error.bar(q,q3,sq3/2,col=yan[3])
error.bar(q,q4,sq4/2,col=yan[4])


legend("topleft",legend=leg,pch=pcc,col=yan,bty = "n",lwd=1.5,inset=.06)

#####plot2###

plot(q,q1,col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02, 
     main = "180nl/min", xlim =c(500, 3500),ylim=c(0,3500))

yan1<-rainbow(8)
yan<-c("red","blue","black","green3")

pcc1<-c(0.2,0.2,0.3,0.3,0.4,0.4,0.5,0.5)


leg1<-c("1.5nl/min-0.2","1.5nl/min-0.3","1.5nl/min-0.4","1.5nl/min-0.5",
       "180nl/min-0.2","180nl/min-0.3","180nl/min-0.4","180nl/min-0.5")

yan2<-c("red","blue","black","green3")
pcc2<-c(0,1,2,5)
leg2<-c("180nl/min-0.2","180nl/min-0.3","180nl/min-0.4","180nl/min-0.5")

#lines(k1$fv,k1$X0.2,col=yan1[1],lwd=2,pch=pcc1[1],type="b",lty=2)
#lines(k1$fv,k1$X0.3,col=yan1[2],lwd=2,pch=pcc1[2],type="b",lty=2)
#lines(k1$fv,k1$X0.4,col=yan1[3],lwd=2,pch=pcc1[3],type="b",lty=2)
#lines(k1$fv,k1$X0.5,col=yan1[4],lwd=2,pch=pcc1[4],type="b",lty=2)

##std##
std1<-c(50,40,35,35,30,18,20,21,14,13,12,10,19,20,10,8,12,5,4,6,0,0,0,0,0,0,0,0,0,0,0)
std2<-c(20,20,20,25,20,18,20,21,14,13,12,10,19,20,10,8,12,5,4,6,0,0,0,0,0,0,0,0,0,0,0)
std3<-c(20,20,20,25,20,18,20,21,14,13,12,10,19,20,10,8,12,5,4,6,0.04,0,0,0,0,0,0,0,0,0,0,0)
std4<-c(18,16,20,25,20,18,20,21,14,13,12,10,19,20,10,8,12,5,4,6,2,0,0,0,0,0,0,0,0,0,0,0)


lines(k4$fv1,k4$X0.2,col=yan2[1],lwd=2,pch=pcc[1],type="b",lty=2,cex=0.8)
lines(k4$fv1,k4$X0.3,col=yan2[2],lwd=2,pch=pcc[2],type="b",lty=2,cex=0.8)
lines(k4$fv2,k4$X0.4,col=yan2[3],lwd=2,pch=pcc[3],type="b",lty=2,cex=0.8)
lines(k5$fv,k5$fveva,col=yan2[4],lwd=2,pch=pcc[4],type="b",lty=2,cex=0.8)

error.bar(k4$fv1,k4$X0.2,std1/2,col=yan[1])
error.bar(k4$fv1,k4$X0.3,std2/2,col=yan[2])
error.bar(k4$fv2,k4$X0.4,std3/2,col=yan[3])
error.bar(k5$fv,k5$fveva,k5$stdfv/2,col=yan[4])

text(750,400,"Multi",col="blue",font=2)
text(700,200,"emission",col="blue",font=2)


text(1500,300,"Single emission",col="blue",font=2)
text(2900,300,"Single emission",col="blue",font=2)

text(k4$fv[20],1500, "fpmax-1KHz",col=yan2[1],font=2)
x1<-c(1000,1000,1000,1000,1000)
y1<-c(0,200,400,600,1000)
lines(x1,y1,col=yan2[1],lwd=1,lty=2)
#abline(v=k4$fv[20],col=yan2[1],lwd=1,lty=2)
lines(x1,y1,col=yan2[2],lwd=1,lty=2)

x2<-c(2000,2000,2000,2000,2000)
y2<-c(0,200,400,600,2000)
text(k4$fv[20],1800,"fpmax-1KHz",col=yan2[2],font=2)
#abline(v=k4$fv[20],col=yan2[2],lwd=1,lty=2)
lines(x2,y2,col=yan2[3],lwd=1,lty=2)

x3<-c(3500,3500,3500,3500,3500)
y3<-c(0,200,400,600,3500)
text(k4$fv[26],2500,"fpmax-2KHz",col=yan2[3],font=2)
#abline(v=k4$fv[26],col=yan2[3],lwd=1,lty=2)
lines(x3,y3,col=yan2[4],lwd=1,lty=2)

text(3100,2500,"fpmax-3.5KHz",col=yan2[4],font=2)
#abline(v=k4$fv[31],col=yan2[4],lwd=1,lty=2)



legend("topleft",legend=leg2,pch=pcc2,col=yan2,bty = "n",lwd=1.5,inset=.06)


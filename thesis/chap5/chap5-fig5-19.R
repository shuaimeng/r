dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/chap5")
library(xlsx)

#针头为25G
#n1<-read.xlsx("he-25g.xlsx",sheetName="2kv18",header=TRUE)
#n2<-read.xlsx("he-25g.xlsx",sheetName="2kv54",header=TRUE)
#n3<-read.xlsx("he-25g.xlsx",sheetName="2kv180",header=TRUE)


#读取针头为t_for
n1<-read.xlsx("dvsfv.xlsx",sheetName="q15",header=TRUE)
n2<-read.xlsx("dvsfv.xlsx",sheetName="q27",header=TRUE)
n3<-read.xlsx("dvsfv.xlsx",sheetName="q54",header=TRUE)
n4<-read.xlsx("dvsfv.xlsx",sheetName="q180",header=TRUE)

###布局###
par(mar=c(2,2.2,1.4,1),oma=c(2,2,2,2))
layout(matrix(c(1,2,3,4), 2, 2,byrow = TRUE))

# 液滴外径为310um

###颜色###
yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)
leg<-c("kv=0.2","kv=0.3","kv=0.4","kv=0.5")

D<-310

##rho

rho1<-(1000*0.2/(2*3.1415926*3.1415926))

rho2<-(1000*0.3/(2*3.1415926*3.1415926))

rho3<-(1000*0.4/(2*3.1415926*3.1415926))

rho4<-(1000*0.5/(2*3.1415926*3.1415926))

###画图
plot(n1$fv, n1$he_ra, xlab = expression(italic(log(W["ev"]))),
     ylab=expression(italic(D/d["d"])),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(-20,0),ylim=c(2,40),col=0)

     mtext("1.5nl/min",col="black",3,line=-1,font=2,cex=0.8)

a<-log(rho1*1.5*1.5/(n1$fv*60*60*3.1^3))

a1<-D/n1$X2

b<-log(rho2*1.5*1.5/(n1$fv*60*60*3.1^3))

b1<-D/n1$X3

c<-log(rho3*1.5*1.5/(n1$fv*60*60*3.1^3))
c1<-D/n1$X4

d<-log(rho4*1.5*1.5/(n1$fv*60*60*3.1^3))
d1<-D/n1$X5


#画点
points(lowess(a,a1,f=1/4,iter=3),col=yan[1],pch=0,lwd=2,lty=2,cex=0.8)

points(lowess(b,b1,f=1/4,iter=3),col=yan[2],pch=1,lwd=2,lty=2,cex=0.8)

points(lowess(c,c1,f=1/4,iter=3),col=yan[3],pch=2,lwd=2,lty=2,cex=0.8)

points(lowess(d,d1,f=1/4,iter=3),col=yan[4],pch=5,lwd=2,lty=2,cex=0.8)

##拟合

abline(lm(a1[1:27]~a[1:27]),col=yan[1],lty=4)
abline(lm(b1[1:19]~b[1:19]),col=yan[2],lty=4)
abline(lm(c1[1:14]~c[1:14]),col=yan[3],lty=4)
abline(lm(d1[1:14]~d[1:14]),col=yan[4],lty=4)

legend("topright",legend=leg,col=yan,pch=pcc,bty="n",lwd=1.5,lty=2,inset=.02,cex=0.8)

### 27nl/min ###
plot(n1$fv, n1$he_ra, xlab = expression(italic(log(W["ev"]))),
     ylab=expression(italic(D/d["d"])),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(-20,0),ylim=c(2,40),col=0)

     mtext("27nl/min",col="black",3,line=-1,font=2,cex=0.8)

a<-log(rho1*27*27/(n1$fv*60*60*3.1^3))

a1<-D/n1$X2

b<-log(rho2*27*27/(n1$fv*60*60*3.1^3))

b1<-D/n1$X3

c<-log(rho3*27*27/(n1$fv*60*60*3.1^3))
c1<-D/n1$X4

d<-log(rho4*27*27/(n1$fv*60*60*3.1^3))
d1<-D/n1$X5


#画点
points(lowess(a,a1,f=1/4,iter=3),col=yan[1],pch=0,lwd=2,lty=2,cex=0.8)

points(lowess(b,b1,f=1/4,iter=3),col=yan[2],pch=1,lwd=2,lty=2,cex=0.8)

points(lowess(c,c1,f=1/4,iter=3),col=yan[3],pch=2,lwd=2,lty=2,cex=0.8)

points(lowess(d,d1,f=1/4,iter=3),col=yan[4],pch=5,lwd=2,lty=2,cex=0.8)

##拟合

abline(lm(a1[1:14]~a[1:14]),col=yan[1],lty=4)
abline(lm(b1[1:14]~b[1:14]),col=yan[2],lty=4)
abline(lm(c1[1:14]~c[1:14]),col=yan[3],lty=4)
abline(lm(d1[1:14]~d[1:14]),col=yan[4],lty=4)

legend("topright",legend=leg,col=yan,pch=pcc,bty="n",lwd=1.5,lty=2,inset=.02,cex=0.8)

### 54nl/min ###

plot(n1$fv, n1$he_ra, xlab = expression(italic(log(W["ev"]))),
     ylab=expression(italic(D/d["d"])),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(-20,0),ylim=c(2,50),col=0)

     mtext("54nl/min",col="black",3,line=-1,font=2,cex=0.8)

a<-log(rho1*54*54/(n1$fv*60*60*3.1^3))

a1<-D/n1$X2

b<-log(rho2*54*54/(n1$fv*60*60*3.1^3))

b1<-D/n1$X3

c<-log(rho3*54*54/(n1$fv*60*60*3.1^3))
c1<-D/n1$X4

d<-log(rho4*54*54/(n1$fv*60*60*3.1^3))
d1<-D/n1$X5


#画点
points(lowess(a,a1,f=1/4,iter=3),col=yan[1],pch=0,lwd=2,lty=2,cex=0.8)

points(lowess(b,b1,f=1/4,iter=3),col=yan[2],pch=1,lwd=2,lty=2,cex=0.8)

points(lowess(c,c1,f=1/4,iter=3),col=yan[3],pch=2,lwd=2,lty=2,cex=0.8)

points(lowess(d,d1,f=1/4,iter=3),col=yan[4],pch=5,lwd=2,lty=2,cex=0.8)

##拟合

abline(lm(a1[1:19]~a[1:19]),col=yan[1],lty=4)
abline(lm(b1[1:19]~b[1:19]),col=yan[2],lty=4)
abline(lm(c1[1:19]~c[1:19]),col=yan[3],lty=4)
abline(lm(d1[1:19]~d[1:19]),col=yan[4],lty=4)

legend("topright",legend=leg,col=yan,pch=pcc,bty="n",lwd=1.5,lty=2,inset=.02,cex=0.8)

### 180nl/min ###

plot(n1$fv, n1$he_ra, xlab = expression(italic(log(W["ev"]))),
     ylab=expression(italic(D/d["d"])),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(-20,0),ylim=c(2,60),col=0)

     mtext("180nl/min",col="black",3,line=-1,font=2,cex=0.8)

a<-log(rho1*180*180/(n1$fv*60*60*3.1^3))

a1<-D/n1$X2

b<-log(rho2*180*180/(n1$fv*60*60*3.1^3))

b1<-D/n1$X3

c<-log(rho3*180*180/(n1$fv*60*60*3.1^3))
c1<-D/n1$X4

d<-log(rho4*180*180/(n1$fv*60*60*3.1^3))
d1<-D/n1$X5


#画点
points(lowess(a,a1,f=1/4,iter=3),col=yan[1],pch=0,lwd=2,lty=2,cex=0.8)

points(lowess(b,b1,f=1/4,iter=3),col=yan[2],pch=1,lwd=2,lty=2,cex=0.8)

points(lowess(c,c1,f=1/4,iter=3),col=yan[3],pch=2,lwd=2,lty=2,cex=0.8)

points(lowess(d,d1,f=1/4,iter=3),col=yan[4],pch=5,lwd=2,lty=2,cex=0.8)

##拟合

abline(lm(a1[1:19]~a[1:19]),col=yan[1],lty=4)
abline(lm(b1[1:19]~b[1:19]),col=yan[2],lty=4)
abline(lm(c1[1:25]~c[1:25]),col=yan[3],lty=4)
abline(lm(d1[1:29]~d[1:29]),col=yan[4],lty=4)

legend("topright",legend=leg,col=yan,pch=pcc,bty="n",lwd=1.5,lty=2,inset=.02,cex=0.8)

library(xlsx)

#读取

n1<-read.xlsx("dvsfv.xlsx",sheetName="k2",header=TRUE)
n2<-read.xlsx("dvsfv.xlsx",sheetName="k3",header=TRUE)
n3<-read.xlsx("dvsfv.xlsx",sheetName="k4",header=TRUE)
n4<-read.xlsx("dvsfv.xlsx",sheetName="k5",header=TRUE)

##30G针头，四种流量，外径为310，310/r

###布局
par(mar=c(2,2.2,1.4,1),oma=c(2,2,2,2))
layout(matrix(c(1,2,3,4), 2,2,byrow = TRUE))

###颜色###
yan<-c("red","blue","black","green3")
pchc<-c(1,2,3,4)

###画图-1.5nl/min##
plot(n1$fv, n1$X15, xlab = expression(log(W["ev"])),
     ylab=expression(D/d["d"]),mgp=c(1, 0, 0),tck=0.02,xlim=c(-14,-8),ylim=c(2,25),col=0)

a1<-310/n1$X15
a<-log(0.5*1.5*1.5/(n1$fv*60*3.1^3))

b1<-310/n2$X15
b<-log(0.5*1.5*1.5/(n2$fv*60*3.1^3))

c1<-310/n3$X15
c<-log(0.5*1.5*1.5/(n3$fv*60*3.1^3))

d1<- 310/n4$X15
d<-log(0.5*1.5*1.5/(n4$fv*60*3.1^3))

points(lowess(a,a1,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(b,b1,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(c,c1,f=1/4,iter=3),col=yan[3],pch=3,lwd=2,lty=2,cex=0.8)
points(lowess(d,d1,f=1/4,iter=3),col=yan[4],pch=4,lwd=2,lty=2,cex=0.8)

abline(lm(a1~a),col=yan[1],lty=4)
abline(lm(b1~b),col=yan[2],lty=4)
abline(lm(c1~c),col=yan[3],lty=4)
abline(lm(d1~d),col=yan[4],lty=4)

leg<-c("kv=0.2","kv=0.3","kv=0.4","kv=0.5")


legend("topleft",legend=leg,col=yan,pch=pchc,bty="n",lwd=1.5,lty=2,inset=.05,cex=0.8)

###流量为270

plot(n1$fv, n1$X15, xlab = expression(log(W["ev"])),
     ylab=expression(D/d["d"]),mgp=c(1, 0, 0),tck=0.02,xlim=c(-8,-2),ylim=c(2,25),col=0)

e1<-310/n1$X270
e<-log(0.5*27*27/(n1$fv*60*3.1^3))

f1<-310/n2$X270
f<-log(0.5*27*27/(n2$fv*60*3.1^3))

g1<-310/n3$X270
g<-log(0.5*27*27/(n3$fv*60*3.1^3))

h1<- 310/n4$X270
h<-log(0.5*27*27/(n4$fv*60*3.1^3))

points(lowess(e,e1,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(f,f1,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(g,g1,f=1/4,iter=3),col=yan[3],pch=3,lwd=2,lty=2,cex=0.8)
points(lowess(h,h1,f=1/4,iter=3),col=yan[4],pch=4,lwd=2,lty=2,cex=0.8)

abline(lm(e1~e),col=yan[1],lty=4)
abline(lm(f1~f),col=yan[2],lty=4)
abline(lm(g1~g),col=yan[3],lty=4)
abline(lm(h1~h),col=yan[4],lty=4)

leg<-c("kv=0.2","kv=0.3","kv=0.4","kv=0.5")


legend("topleft",legend=leg,col=yan,pch=pchc,bty="n",lwd=1.5,lty=2,inset=.05,cex=0.8)

###流量为54##
plot(n1$fv, n1$X15, xlab = expression(log(W["ev"])),
     ylab=expression(D/d["d"]),mgp=c(1, 0, 0),tck=0.02,xlim=c(-8,-2),ylim=c(2,25),col=0)

l1<-310/n1$X540
l<-log(0.5*54*54/(n1$fv*60*3.1^3))

i1<-310/n2$X540
i<-log(0.5*54*54/(n2$fv*60*3.1^3))

j1<-310/n3$X540
j<-log(0.5*54*54/(n3$fv*60*3.1^3))

k1<- 310/n4$X540
k<-log(0.5*54*54/(n4$fv*60*3.1^3))

points(lowess(l,l1,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(i,i1,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(j,j1,f=1/4,iter=3),col=yan[3],pch=3,lwd=2,lty=2,cex=0.8)
points(lowess(k,k1,f=1/4,iter=3),col=yan[4],pch=4,lwd=2,lty=2,cex=0.8)

abline(lm(l1~l),col=yan[1],lty=4)
abline(lm(i1~i),col=yan[2],lty=4)
abline(lm(j1~j),col=yan[3],lty=4)
abline(lm(k1~k),col=yan[4],lty=4)

leg<-c("kv=0.2","kv=0.3","kv=0.4","kv=0.5")

legend("topleft",legend=leg,col=yan,pch=pchc,bty="n",lwd=1.5,lty=2,inset=.05,cex=0.8)

##180nl/min
plot(n1$fv, n1$X15, xlab = expression(log(W["ev"])),
     ylab=expression(D/d["d"]),mgp=c(1, 0, 0),tck=0.02,xlim=c(-6,0),ylim=c(2,25),col=0)

m1<-310/n1$X1800
m<-log(0.5*180*180/(n1$fv*60*3.1^3))

n1<-310/n2$X1800
n<-log(0.5*180*180/(n2$fv*60*3.1^3))

o1<-310/n3$X1800
o<-log(0.5*180*180/(n3$fv*60*3.1^3))

p1<- 310/n4$X1800
p<-log(0.5*180*180/(n4$fv*60*3.1^3))

points(lowess(m,m1,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(n,n1,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(o,o1,f=1/4,iter=3),col=yan[3],pch=3,lwd=2,lty=2,cex=0.8)
points(lowess(p,p1,f=1/4,iter=3),col=yan[4],pch=4,lwd=2,lty=2,cex=0.8)

abline(lm(m1~m),col=yan[1],lty=4)
abline(lm(n1~n),col=yan[2],lty=4)
abline(lm(o1~o),col=yan[3],lty=4)
abline(lm(p1~p),col=yan[4],lty=4)

leg<-c("kv=0.2","kv=0.3","kv=0.4","kv=0.5")


legend("topleft",legend=leg,col=yan,pch=pchc,bty="n",lwd=1.5,lty=2,inset=.05,cex=0.8)


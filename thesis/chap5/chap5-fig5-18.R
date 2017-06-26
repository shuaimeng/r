dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/chap5")
library(xlsx)

#读取25G
n20<-read.xlsx("he-25g.xlsx",sheetName="2kv180",header=TRUE)
n22<-read.xlsx("he-25g.xlsx",sheetName="22kv180",header=TRUE)

#读取针头为30g
n1<-read.xlsx("he-30g.xlsx",sheetName="16kv",header=TRUE)
n2<-read.xlsx("he-30g.xlsx",sheetName="18kv",header=TRUE)
n3<-read.xlsx("he-30g.xlsx",sheetName="2kv180",header=TRUE)
n4<-read.xlsx("he-30g.xlsx",sheetName="22kv",header=TRUE)

n5<-read.xlsx("he-32g.xlsx",sheetName="18kv",header=TRUE)
n6<-read.xlsx("he-32g.xlsx",sheetName="2kv180",header=TRUE)
n7<-read.xlsx("he-32g.xlsx",sheetName="22kv",header=TRUE)

n8<-read.xlsx("he-34g.xlsx",sheetName="18kv",header=TRUE)
n9<-read.xlsx("he-34g.xlsx",sheetName="2kv180",header=TRUE)
n10<-read.xlsx("he-34g.xlsx",sheetName="22kv",header=TRUE)

###布局
par(mar=c(2,2.2,1.4,1),oma=c(2,2,2,2))
layout(matrix(c(1,2,3,4), 2,2,byrow = TRUE))

###画图-25G##
plot(n1$fv, n1$d_ra, xlab = expression(italic(f["v"](Hz))),
     ylab=expression(italic(D/d["d"])),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,1000),ylim=c(2,25),col=0)

mtext("25G",col="black",3,line=-1,font=2,cex=0.8)
k1<-1/n20$d_Rn
k<-(n20$fv)

l1<-1/n22$d_Rn
l<-(n22$fv)

points(lowess(k,k1,f=1/4,iter=3),col="red",pch=1,lwd=1.5,lty=2,cex=0.8)
points(lowess(l,l1,f=1/4,iter=3),col="blue",pch=2,lwd=1.5,lty=2,cex=0.8)

abline(lm(k1~k),col="red",lty=4)
abline(lm(l1~l),col="blue",lty=4)

leg<-c("2kv","2.2kv")

legend("topleft",legend=leg,col=yan,pch=pchc,bty="n",lwd=1.5,lty=2,inset=.02,cex=0.8)


###画图-30g##
plot(n1$fv, n1$d_ra, xlab = expression(italic(f["v"](Hz))),
     ylab=expression(italic(D/d["d"])),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,3000),ylim=c(2,25),col=0)
     mtext("30G",col="black",3,line=-1,font=2,cex=0.8)

###颜色###
yan<-c("red","blue","black","green3")
####30g针头下###

a1<-1/n1$d_eRn
a<-(n1$fv)

b1<-1/n2$d_eRn
b<-(n2$fv)

c1<-1/n3$d_eRn
c<-(n3$fv)

d1<-1/n4$d_eRn
d<-(n4$fv)

points(lowess(a,a1,f=1/4,iter=3),col=yan[1],pch=1,lwd=1.5,lty=2,cex=0.8)
points(lowess(b,b1,f=1/4,iter=3),col=yan[2],pch=2,lwd=1.5,lty=2,cex=0.8)
points(lowess(c,c1,f=1/4,iter=3),col=yan[3],pch=3,lwd=1.5,lty=2,cex=0.8)
points(lowess(d,d1,f=1/4,iter=3),col=yan[4],pch=4,lwd=1.5,lty=2,cex=0.8)

abline(lm(a1~a),col=yan[1],lty=4)
abline(lm(b1~b),col=yan[2],lty=4)
abline(lm(c1~c),col=yan[3],lty=4)
abline(lm(d1~d),col=yan[4],lty=4)

leg<-c("1.6kv","1.8kv","2kv","2.2kv")

legend("topleft",legend=leg,col=yan,pch=c(1,2,3,4),bty="n",lwd=1.5,lty=2,inset=.02,cex=0.8)

#####画图-32G###
plot(n1$fv, n1$d_ra, xlab = expression(italic(f["v"](Hz))),
     ylab=expression(italic(D/d["d"])),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,3500),ylim=c(2,25),col=0)
     mtext("32G",col="black",3,line=-1,font=2,cex=0.8)

###颜色###
yan<-c("red","blue","black")
####32g针头下###

e1<-1/n5$d_eRn
e<-(n5$fv)

f1<-1/n6$d_eRn
f<-(n6$fv)

g1<-1/n7$d_eRn
g<-(n7$fv)
#画点
points(lowess(e,e1,f=1/4,iter=3),col=yan[1],pch=1,lwd=1.5,lty=2,cex=0.8)
points(lowess(f,f1,f=1/4,iter=3),col=yan[2],pch=2,lwd=1.5,lty=2,cex=0.8)
points(lowess(g,g1,f=1/4,iter=3),col=yan[3],pch=3,lwd=1.5,lty=2,cex=0.8)

abline(lm(e1~e),col=yan[1],lty=4)
abline(lm(f1~f),col=yan[2],lty=4)
#abline(lm(g1~g),col=yan[3],lty=4)

leg<-c("1.8kv","2kv","2.2kv")

legend("topleft",legend=leg,col=yan,pch=c(1,2,3),bty="n",lwd=1.5,lty=2,inset=.02,cex=0.8)

####34G

plot(n1$fv, n1$d_ra, xlab = expression(italic(f["v"](Hz))),
     ylab=expression(italic(D/d["d"])),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,3500),ylim=c(2,25),col=0)
     mtext("34G",col="black",3,line=-1,font=2,cex=0.8)

###颜色###
yan<-c("red","blue","black")
####32g针头下###

h1<-1/n8$d_eRn
h<-(n8$fv)

i1<-1/n9$d_eRn
i<-(n9$fv)

j1<-1/n10$d_eRn
j<-(n10$fv)

#画点
points(lowess(h,h1,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(i,i1,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(j,j1,f=1/4,iter=3),col=yan[3],pch=3,lwd=2,lty=2,cex=0.8)


##拟合

abline(lm(h1~h),col=yan[1],lty=4)
abline(lm(i1~i),col=yan[2],lty=4)
#abline(lm(j1~j),col=yan[3],lty=4)

leg<-c("1.8kv","2kv","2.2kv")

legend("topleft",legend=leg,col=yan,pch=c(1,2,3),bty="n",lwd=1.5,lty=2,inset=.02,cex=0.8)

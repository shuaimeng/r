dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/chap5")
library(xlsx)


#针头为25G
#n1<-read.xlsx("he-25g.xlsx",sheetName="2kv18",header=TRUE)
#n2<-read.xlsx("he-25g.xlsx",sheetName="2kv54",header=TRUE)
#n3<-read.xlsx("he-25g.xlsx",sheetName="2kv180",header=TRUE)


#读取针头为30g
n1<-read.xlsx("he-30g.xlsx",sheetName="2kv18",header=TRUE)
n2<-read.xlsx("he-30g.xlsx",sheetName="2kv54",header=TRUE)
n3<-read.xlsx("he-30g.xlsx",sheetName="2kv180",header=TRUE)

#针头为32g
n4<-read.xlsx("he-32g.xlsx",sheetName="2kv18",header=TRUE)
n5<-read.xlsx("he-32g.xlsx",sheetName="2kv54",header=TRUE)
n6<-read.xlsx("he-32g.xlsx",sheetName="2kv180",header=TRUE)

#针头为34g
n7<-read.xlsx("he-34g.xlsx",sheetName="2kv18",header=TRUE)
n8<-read.xlsx("he-34g.xlsx",sheetName="2kv54",header=TRUE)
n9<-read.xlsx("he-34g.xlsx",sheetName="2kv180",header=TRUE)

###画图
plot(n1$fv, n1$he_ra, xlab = expression(italic(log(W["ev"]))),
     ylab=expression(italic(D/d["d"])),mgp=c(1.1, 0, 0),tck=0.01,
     xlim=c(-10,1),ylim=c(2,20),col=0)

###颜色###
yan<-rainbow(9)

rho<-(1000*0.5/(3.1415926*3.1415936))

####30g针头下###

#1#18nl-30g##
a<-log(rho*18*18/(n1$fv*60*60*3.1^3))
a1<-1/n1$d_eRn

#2###18nl-32g###
b<-log(rho*18*18/(n2$fv*60*60*2.3^3))
b1<-1/n2$d_eRn

#3#18nl-34G##

c<-log(rho*18*18/(n3$fv*60*60*1.9^3))
c1<-1/n4$d_eRn

#4#54nl-30g##

d<-log(rho*54*54/(n4$fv*60*60*3.1^3))
d1<-1/n3$d_eRn

#5#54nl-32G##
e<-log(rho*54*54/(n5$fv*60*60*2.3^3))
e1<-1/n5$d_eRn

#6#54nl-34G##
f<-log(rho*54*54/(n6$fv*60*60*1.9^3))
f1<-1/n6$d_eRn

#7#180nl-30G##
g<-log(rho*180*180/(n7$fv*60*60*3.1^3))
g1<-1/n7$d_eRn

#8#180nl-32G##
h<-log(rho*180*180/(n8$fv*60*60*2.3^3))
h1<-1/n8$d_eRn

#9#180nl-34G##
i<-log(rho*180*180/(n9$fv*60*60*1.9^3))
i1<-1/n9$d_eRn

###
xx<-c(a,b,c,d,e,f,g,h,i)

pchc<-c(1,2,3,4,5,6,7,22,24)

#画点
points(lowess(a,1/n1$d_eRn,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(b,1/n2$d_eRn,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(c,1/n3$d_eRn,f=1/4,iter=3),col=yan[3],pch=3,lwd=2,lty=2,cex=0.8)

points(lowess(d,1/n4$d_eRn,f=1/4,iter=3),col=yan[4],pch=4,lwd=2,lty=2,cex=0.8)
points(lowess(e,1/n5$d_eRn,f=1/4,iter=3),col=yan[5],pch=5,lwd=2,lty=2,cex=0.8)
points(lowess(f,1/n6$d_eRn,f=1/4,iter=3),col=yan[6],pch=6,lwd=2,lty=2,cex=0.8)


points(lowess(g,1/n7$d_eRn,f=1/4,iter=3),col=yan[7],pch=7,lwd=2,lty=2,cex=0.8)
points(lowess(h,1/n8$d_eRn,f=1/4,iter=3),col=yan[8],pch=22,lwd=2,lty=2,cex=0.8)
points(lowess(i,1/n9$d_eRn,f=1/4,iter=3),col=yan[9],pch=24,lwd=2,lty=2,cex=0.8)

##拟合

abline(lm(a1[8:18]~a[8:18]),col=yan[1],lty=4)
abline(lm(b1[10:23]~b[10:23]),col=yan[2],lty=4)
abline(lm(c1[7:18]~c[7:18]),col=yan[3],lty=4)

abline(lm(d1[9:22]~d[9:22]),col=yan[4],lty=4)
abline(lm(e1[7:22]~e[7:22]),col=yan[5],lty=4)
abline(lm(f1[9:22]~f[9:22]),col=yan[6],lty=4)

abline(lm(g1[10:13]~g[10:13]),col=yan[7],lty=4)
abline(lm(h1[10:18]~h[10:18]),col=yan[8],lty=4)
abline(lm(i1[8:20]~i[8:20]),col=yan[9],lty=4)

leg<-c("18nl/min-30G","18nl/min-32G","54nl/min-30G",
       "18nl/min-34G","54nl/min-32G",
       "180nl/min-30G","54nl/min-34G","180nl/min-32G","180nl/min-34G")

legend("topright",legend=leg,col=yan,pch=pchc,bty="n",lwd=1.5,lty=2,inset=.02,cex=0.8)

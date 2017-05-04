library(xlsx)

#针头为25G
n10<-read.xlsx("he-25g.xlsx",sheetName="2kv18",header=TRUE)
n11<-read.xlsx("he-25g.xlsx",sheetName="2kv54",header=TRUE)
n12<-read.xlsx("he-25g.xlsx",sheetName="2kv180",header=TRUE)


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

##b布局
###布局###
par(mar=c(2,2.2,1.4,1),oma=c(2,2,2,2))
layout(matrix(c(1,2,3,4), 2, 2,byrow = TRUE))

##颜色
yan<- c("red","blue","black")
pch<- c(1,2,4)
leg<-c("18nl/min","54nl/min","180nl/min")

plot(n1$fv, n1$he_ra, xlab = expression(log(q["d"])),
     ylab=expression(D/d["d"]),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(-14,-2),ylim=c(4,20),col=0)

#1#18nl-30g##
j<-log(0.5*18/(n10$fv*60*3.1^3))
j1<-1/n10$d_Rn
#2###18nl-32g###
k<-log(0.5*18/(n11$fv*60*2.3^3))
k1<-1/n11$d_Rn

#3#18nl-34G##
l<-log(0.5*18/(n12$fv*60*1.9^3))
l1<-1/n12$d_Rn

points(lowess(j,1/n10$d_Rn,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(k,1/n11$d_Rn,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(l,1/n12$d_Rn,f=1/4,iter=3),col=yan[3],pch=5,lwd=2,lty=2,cex=0.8)

legend("topright",legend=leg,col=yan,pch=c(1,2,5),bty="n",lwd=1.5,lty=2,inset=.1,cex=1)

plot(n1$fv, n1$he_ra, xlab = expression(log(q["d"])),
     ylab=expression(D/d["d"]),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(-14,-2),ylim=c(4,20),col=0)

#1#18nl-30g##
a<-log(0.5*18/(n1$fv*60*3.1^3))
a1<-1/n1$d_eRn

#2###18nl-32g###
b<-log(0.5*18/(n2$fv*60*2.3^3))
b1<-1/n2$d_eRn

#3#18nl-34G##
c<-log(0.5*18/(n3$fv*60*1.9^3))
c1<-1/n3$d_eRn

points(lowess(a,1/n1$d_eRn,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(b,1/n2$d_eRn,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(c,1/n3$d_eRn,f=1/4,iter=3),col=yan[3],pch=5,lwd=2,lty=2,cex=0.8)

abline(lm(a1[8:20]~a[8:20]),col=yan[1],lty=4)
abline(lm(b1[11:24]~b[11:24]),col=yan[2],lty=4)
abline(lm(c1[9:24]~c[9:24]),col=yan[3],lty=4)


legend("topright",legend=leg,col=yan,pch=c(1,2,5),bty="n",lwd=1.5,lty=2,inset=.1,cex=1)

plot(n1$fv, n1$he_ra, xlab = expression(log(q["d"])),
     ylab=expression(D/d["d"]),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(-14,-2),ylim=c(4,20),col=0)

#4#54nl-30g##
d<-log(0.5*54/(n4$fv*60*3.1^3))
d1<-1/n4$d_eRn

#5#54nl-32G##
e<-log(0.5*54/(n5$fv*60*2.3^3))
e1<-1/n5$d_eRn

#6#54nl-34G##
f<-log(0.5*54/(n6$fv*60*1.9^3))
f1<-1/n6$d_eRn


points(lowess(d,1/n4$d_eRn,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(e,1/n5$d_eRn,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(f,1/n6$d_eRn,f=1/4,iter=3),col=yan[3],pch=5,lwd=2,lty=2,cex=0.8)

abline(lm(d1[8:23]~d[8:23]),col=yan[1],lty=4)
abline(lm(e1[6:23]~e[6:23]),col=yan[2],lty=4)
abline(lm(f1[10:23]~f[10:23]),col=yan[3],lty=4)

legend("topright",legend=leg,col=yan,pch=c(1,2,5),bty="n",lwd=1.5,lty=2,inset=.1,cex=1)

plot(n1$fv, n1$he_ra, xlab = expression(log(q["d"])),
     ylab=expression(D/d["d"]),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(-14,-2),ylim=c(4,20),col=0)

#7#180nl-30G##
g<-log(0.5*180/(n7$fv*60*3.1^3))
g1<-1/n7$d_eRn

#8#180nl-32G##
h<-log(0.5*180/(n8$fv*60*2.3^3))
h1<-1/n8$d_eRn

#9#180nl-34G##
i<-log(0.5*180/(n9$fv*60*1.9^3))
i1<-1/n9$d_eRn

points(lowess(g,1/n7$d_eRn,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(h,1/n8$d_eRn,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(i,1/n9$d_eRn,f=1/4,iter=3),col=yan[3],pch=5,lwd=2,lty=2,cex=0.8)

abline(lm(g1[9:15]~g[9:15]),col=yan[1],lty=4)
abline(lm(h1[6:18]~h[6:18]),col=yan[2],lty=4)
abline(lm(i1[6:22]~i[6:22]),col=yan[3],lty=4)

legend("topright",legend=leg,col=yan,pch=c(1,2,5),bty="n",lwd=1.5,lty=2,inset=.1,cex=1)

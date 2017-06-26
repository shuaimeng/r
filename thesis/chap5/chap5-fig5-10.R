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
n4<-read.xlsx("he-30g.xlsx",sheetName="2kv180",header=TRUE)

nt<-read.xlsx("t_for.xlsx",sheetName="180nl",header=TRUE)

np<-read.xlsx("t_pulse.xlsx",sheetName="single_q180",header=TRUE)


#针头为32g
#n7<-read.xlsx("he-32g.xlsx",sheetName="2kv18",header=TRUE)
#n8<-read.xlsx("he-32g.xlsx",sheetName="2kv54",header=TRUE)
#n9<-read.xlsx("he-32g.xlsx",sheetName="2kv180",header=TRUE)

#针头为34g
#n10<-read.xlsx("he-34g.xlsx",sheetName="2kv18",header=TRUE)
#n11<-read.xlsx("he-34g.xlsx",sheetName="2kv54",header=TRUE)
#n12<-read.xlsx("he-34g.xlsx",sheetName="2kv180",header=TRUE)
par(mfrow = c(1,2), mar = c(2,2.4,2,2), oma = c(1,1,1,1))

###画图
plot(n1$fv, n1$he_ra, xlab = expression(log(q["d"])),
     ylab=expression(log(f["e"])),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(-14,-2),ylim=c(-2,8),col=0)

###颜色###
yan<-rainbow(4)

####30g针头下###

#1#180nl/min-k-0.2##
a<-log(0.2*180/(n4$fv*60*3.1^3))

a1<-log((200/n4$fv - n4$tf)/n4$tp)

#2###k=0.3###
b<-log(0.3*180/(n4$fv*60*3.1^3))
b1<-log((300/n4$fv - n4$tf)/n4$tp)

#3#k=0.5##
c<-log(0.5*180/(n4$fv*60*3.1^3))

c1<-log((500/n4$fv - n4$tf)/n4$tp)



#5#k=0.8##
d<-log(0.8*180/(n4$fv*60*3.1^3))
d1<-log((800/n4$fv - n4$tf)/n4$tp)


###
xx<-c(a,b,c,d)
yy<-c(a1,b1,c1,d1)
pchc<-c(1,2,3,4,5)

#画点
points(lowess(a,a1,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(b,b1,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(c,c1,f=1/4,iter=3),col=yan[3],pch=3,lwd=2,lty=2,cex=0.8)

points(lowess(d,d1,f=1/4,iter=3),col=yan[4],pch=4,lwd=2,lty=2,cex=0.8)


##拟合

abline(lm(a1~a),col=yan[1],lty=4,lwd=2)
abline(lm(b1~b),col=yan[2],lty=4,lwd=2)
abline(lm(c1~c),col=yan[3],lty=4,lwd=2)

abline(lm(d1~d),col=yan[4],lty=4,lwd=2)

leg<-c("kv=0.2","kv=0.3","kv=0.5","kv=0.8")

legend("topleft",legend=leg,col=yan,pch=c(1,2,3,4),bty="n",lwd=2,lty=2,inset=.05,cex=1)


####真实###

plot(n1$fv, n1$he_ra, xlab = expression(log(q["d"])),
     ylab=expression(log(f["e"])),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(-14,-2),ylim=c(-2,8),col=0)

###颜色###
yan<-rainbow(4)

####30g针头下###
0.2*nt$fv

#1#180nl/min-k-0.2##
e<-log(0.2*180/(nk2$fv*60*3.1^3))

e1<-log(nk2$X180)

#2###k=0.3###
f<-log(0.3*180/(nk3$fv*60*3.1^3))
f1<-log(nk3$X180)

#3#k=0.4##
g<-log(0.5*180/(nk4$fv*60*3.1^3))

g1<-log(nk4$X180)



#5#k=0.5##
h<-log(0.8*180/(nk5$fv*60*3.1^3))
h1<-log(nk5$X180)



#画点
points(lowess(e,e1,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(f,f1,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(g,g1,f=1/4,iter=3),col=yan[3],pch=3,lwd=2,lty=2,cex=0.8)

points(lowess(h,h1,f=1/4,iter=3),col=yan[4],pch=4,lwd=2,lty=2,cex=0.8)


##拟合

abline(lm(e1~e),col=yan[1],lty=4,lwd=2)
abline(lm(f1~f),col=yan[2],lty=4,lwd=2)
abline(lm(g1~g),col=yan[3],lty=4,lwd=2)

abline(lm(h1~h),col=yan[4],lty=4,lwd=2)

leg<-c("kv=0.2","kv=0.3","kv=0.4","kv=0.5")

legend("topleft",legend=leg,col=yan,pch=c(1,2,3,4),bty="n",lwd=2,lty=2,inset=.05,cex=1)

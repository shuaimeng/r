library(xlsx)

#读取针头为30g
n1<-read.xlsx("he-30g.xlsx",sheetName="16kv",header=TRUE)
n2<-read.xlsx("he-30g.xlsx",sheetName="18kv",header=TRUE)
n3<-read.xlsx("he-30g.xlsx",sheetName="2kv180",header=TRUE)
n4<-read.xlsx("he-30g.xlsx",sheetName="22kv",header=TRUE)

n5<-read.xlsx("he-32g.xlsx",sheetName="18kv",header=TRUE)
n6<-read.xlsx("he-32g.xlsx",sheetName="2kv180",header=TRUE)
n7<-read.xlsx("he-32g.xlsx",sheetName="22kv",header=TRUE)
###布局
par(mar=c(2,2.2,1.4,1),oma=c(2,2,2,2))
layout(matrix(c(1,2,3,4), 2,1,byrow = TRUE))
###画图-30g##
plot(n3$fv, n3$he_ra, xlab = expression(log(q["d"])),
     ylab=expression(log(f["e"])),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(-6,5),ylim=c(-2,8),col=0)

###颜色###
yan<-c("red","blue","black","green3")
####30g针头下###

#1#1.6kv-180nl/min##
a<-log(500*180/(n1$fv*60*3.1^3))

a1<-log((500/n1$fv - n1$tf)/n1$tp)

#2###1.8kv-180nl/min###
b<-log(500*180/(n2$fv*60*3.1^3))
b1<-log((500/n2$fv - n2$tf)/n2$tp)

#3#2kv-180nl/min##
c<-log(500*180/(n3$fv*60*3.1^3))

c1<-log((500/n3$fv - n3$tf)/n3$tp)

#4#2.2kv-180nl/min##
d<-log(500*180/(n4$fv*60*3.1^3))

d1<-log((500/n4$fv - n4$tf)/n4$tp)


###
xx<-c(a,b,c,d)
yy<-c(a1,b1,c1,d1)
pchc<-c(1,2,3,4)

#画点
points(lowess(a,a1,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(b,b1,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(c,c1,f=1/4,iter=3),col=yan[3],pch=3,lwd=2,lty=2,cex=0.8)
points(lowess(d,d1,f=1/4,iter=3),col=yan[4],pch=4,lwd=2,lty=2,cex=0.8)


##拟合

abline(lm(a1~a),col=yan[1],lty=4)
abline(lm(b1~b),col=yan[2],lty=4)
abline(lm(c1~c),col=yan[3],lty=4)
abline(lm(d1~d),col=yan[4],lty=4)


leg<-c("1.6kv","1.8kv","2kv","2.2kv")

legend("topleft",legend=leg,col=yan,pch=pchc,bty="n",lwd=1.5,lty=2,inset=.05,cex=0.8)

#####画图-32G###

plot(n3$fv, n3$he_ra, xlab = expression(log(q["d"])),
     ylab=expression(log(f["e"])),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(-6,5),ylim=c(-2,8),col=0)

###颜色###
yan<-c("red","blue","black")
####32g针头下###

#1#1.8kv-180nl/min##
e<-log(500*180/(n5$fv*60*2.3^3))

e1<-log((500/n5$fv - n5$tf)/n5$tp)

#2###2kv-180nl/min###
f<-log(500*180/(n6$fv*60*2.3^3))
f1<-log((500/n6$fv - n6$tf)/n6$tp)

#3#2.2kv-180nl/min##
g<-log(500*180/(n7$fv*60*2.3^3))

g1<-log((500/n7$fv - n7$tf)/n7$tp)
###
xx<-c(e,f,g)
yy<-c(e1,f1,g1)
pchc<-c(1,2,3)

#画点
points(lowess(e,e1,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(f,f1,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(g,g1,f=1/4,iter=3),col=yan[3],pch=3,lwd=2,lty=2,cex=0.8)


##拟合

abline(lm(e1~e),col=yan[1],lty=4)
abline(lm(f1~f),col=yan[2],lty=4)
abline(lm(g1~g),col=yan[3],lty=4)

leg<-c("1.8kv","2kv","2.2kv")

legend("topleft",legend=leg,col=yan,pch=pchc,bty="n",lwd=1.5,lty=2,inset=.05,cex=0.8)





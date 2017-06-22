dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/jmm2")


library(xlsx)

#针头为25G
#n1<-read.xlsx("he-25g.xlsx",sheetName="2kv18",header=TRUE)
#n2<-read.xlsx("he-25g.xlsx",sheetName="2kv54",header=TRUE)
#n3<-read.xlsx("he-25g.xlsx",sheetName="2kv180",header=TRUE)


#读取针头为30g
n1<-read.xlsx("he-30g.xlsx",sheetName="2kv18",header=TRUE)
n2<-read.xlsx("he-30g.xlsx",sheetName="2kv54",header=TRUE)
n4<-read.xlsx("he-30g.xlsx",sheetName="2kv180",header=TRUE)

#针头为32g
#n7<-read.xlsx("he-32g.xlsx",sheetName="2kv18",header=TRUE)
#n8<-read.xlsx("he-32g.xlsx",sheetName="2kv54",header=TRUE)
#n9<-read.xlsx("he-32g.xlsx",sheetName="2kv180",header=TRUE)

#针头为34g
#n10<-read.xlsx("he-34g.xlsx",sheetName="2kv18",header=TRUE)
#n11<-read.xlsx("he-34g.xlsx",sheetName="2kv54",header=TRUE)
#n12<-read.xlsx("he-34g.xlsx",sheetName="2kv180",header=TRUE)

###画图
plot(n1$fv, n1$he_ra, xlab = expression(log(q["d"])),
     ylab=expression(log(f["e"])),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(-14,-2),ylim=c(-2,8),col=0)

###颜色###
yan<-rainbow(5)

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

#4#k为0.6##
d<-log(0.6*180/(n4$fv*60*3.1^3))

d1<-log((600/n4$fv - n4$tf)/n4$tp)

#5#k=0.8##
e<-log(0.8*180/(n4$fv*60*3.1^3))
e1<-log((800/n4$fv - n4$tf)/n4$tp)


###
xx<-c(a,b,c,d,e)
yy<-c(a1,b1,c1,d1,e1)
pchc<-c(1,2,3,4,5)

#画点
points(lowess(a,a1,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(b,b1,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(c,c1,f=1/4,iter=3),col=yan[3],pch=3,lwd=2,lty=2,cex=0.8)

points(lowess(d,d1,f=1/4,iter=3),col=yan[4],pch=4,lwd=2,lty=2,cex=0.8)
points(lowess(e,e1,f=1/4,iter=3),col=yan[5],pch=5,lwd=2,lty=2,cex=0.8)

##拟合

abline(lm(a1~a),col=yan[1],lty=4,lwd=2)
abline(lm(b1~b),col=yan[2],lty=4,lwd=2)
abline(lm(c1~c),col=yan[3],lty=4,lwd=2)

abline(lm(d1~d),col=yan[4],lty=4,lwd=2)
abline(lm(e1~e),col=yan[5],lty=4,lwd=2)

leg<-c("kv=0.2","kv=0.3","kv=0.5",
       "kv=0.6","kv=0.8")

legend("topleft",legend=leg,col=yan,pch=pchc,bty="n",lwd=2,lty=2,inset=.05,cex=1)

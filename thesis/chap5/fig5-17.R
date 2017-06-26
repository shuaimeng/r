dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/chap5")
library(xlsx)

#针头为25G
#n1<-read.xlsx("he-25g.xlsx",sheetName="2kv18",header=TRUE)
#n2<-read.xlsx("he-25g.xlsx",sheetName="2kv54",header=TRUE)
#n3<-read.xlsx("he-25g.xlsx",sheetName="2kv180",header=TRUE)


#读取针头为30g
n4<-read.xlsx("he-30g.xlsx",sheetName="2kv18",header=TRUE)
n5<-read.xlsx("he-30g.xlsx",sheetName="2kv54",header=TRUE)
n6<-read.xlsx("he-30g.xlsx",sheetName="2kv180",header=TRUE)

#针头为32g
n7<-read.xlsx("he-32g.xlsx",sheetName="2kv18",header=TRUE)
n8<-read.xlsx("he-32g.xlsx",sheetName="2kv54",header=TRUE)
n9<-read.xlsx("he-32g.xlsx",sheetName="2kv180",header=TRUE)

#针头为34g
n10<-read.xlsx("he-34g.xlsx",sheetName="2kv18",header=TRUE)
n11<-read.xlsx("he-34g.xlsx",sheetName="2kv54",header=TRUE)
n12<-read.xlsx("he-34g.xlsx",sheetName="2kv180",header=TRUE)

###画图
plot(n4$fv, n4$d_e, xlab = expression(log(q["d"])),
     ylab=expression(D/d["d"]),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(-10,0),ylim=c(1,3),col=0)

###颜色###
yan<-rainbow(9)

####30g针头下###

#1#18nl-30g##
a<- log(0.5*18*18/(n4$fv*60*3.1^3))

a1<- log(310/n4$d_e)

#2###18nl-32g###
b<- log(0.5*18*18/(n7$fv*60*2.3^3))
b1<- log(230/n7$d_e)

#3#54nl-30g##
c<- log(0.5*54*18/(n5$fv*60*3.1^3))

c1<-log(310/n5$d_e)

#4#18nl-34G##
d<- log(0.5*18*18/(n10$fv*60*1.9^3))

d1<- log(190/n10$d_e)

#5#54nl-32G##
e<- log(0.5*54*54/(n8$fv*60*2.3^3))
e1<- log(230/n8$d_e)

#6#54nl-34G##
f<- log(0.5*54*54/(n11$fv*60*1.9^3))

f1<- log(190/n11$d_e)

#7#180nl-30G##
g<- log(0.5*180*180/(n6$fv*60*3.1^3))
g1<- log(310/n6$d_e)

#8#180nl-32G##
h<- log(0.5*180*180/(n9$fv*60*2.3^3))
h1<- log(230/n9$d_e)

#9#180nl-34G##
i<- log(0.5*180*180/(n12$fv*60*1.9^3))
i1<- log(190/n12$d_e)

###
xx<-c(a,b,c,d,e,f,g,h,i)
yy<-c(a1,b1,c1,d1,e1,f1,g1,h1,i1)
pchc<-c(1,2,3,4,5,6,7,22,24)

#画点
points(a,a1,col=yan[1],pch=1,lwd=2,cex=0.8)
points(b,b1,col=yan[2],pch=2,lwd=2,cex=0.8)
points(c,c1,col=yan[3],pch=3,lwd=2,cex=0.8)

points(d,d1,col=yan[4],pch=4,lwd=2,cex=0.8)
points(e,e1,col=yan[5],pch=5,lwd=2,cex=0.8)
points(f,f1,col=yan[6],pch=6,lwd=2,cex=0.8)


points(g,g1,col=yan[7],pch=7,lwd=2,cex=0.8)
points(h,h1,col=yan[8],pch=22,lwd=2,cex=0.8)
points(i,i1,col=yan[9],pch=24,lwd=2,cex=0.8)

##拟合

lines(lowess(a,a1,f=1/4,iter=3),col=yan[1],lwd=1.5,lty=4)
lines(lowess(b,b1,f=1/4,iter=3),col=yan[2],lwd=1.5,lty=4)
lines(lowess(c,c1,f=1/4,iter=3),col=yan[3],lwd=1.5,lty=4)

lines(lowess(d,d1,f=1/4,iter=3),col=yan[4],lwd=1.5,lty=4)
lines(lowess(e,e1,f=1/4,iter=3),col=yan[5],lwd=1.5,lty=4)
lines(lowess(f,f1,f=1/4,iter=3),col=yan[6],lwd=1.5,lty=4)

lines(lowess(g,g1,f=1/4,iter=3),col=yan[7],lwd=1.5,lty=4)
lines(lowess(h,h1,f=1/4,iter=3),col=yan[8],lwd=1.5,lty=4)
lines(lowess(i,i1,f=1/4,iter=3),col=yan[9],lwd=1.5,lty=4)


leg<-c("18nl/min-30G","18nl/min-32G","54nl/min-30G",
       "18nl/min-34G","54nl/min-32G",
       "180nl/min-30G","54nl/min-34G","180nl/min-32G","180nl/min-34G")

legend("topright",legend=leg,col=yan,pch=pchc,bty="n",lwd=1.5,lty=2,inset=.06,cex=0.9)

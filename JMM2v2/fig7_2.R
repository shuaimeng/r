library(xlsx)

#针头为25G
n1<-read.xlsx("he-25g.xlsx",sheetName="2kv18",header=TRUE)
n2<-read.xlsx("he-25g.xlsx",sheetName="2kv54",header=TRUE)
n3<-read.xlsx("he-25g.xlsx",sheetName="2kv180",header=TRUE)


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
plot(n1$fv, n1$he_ra, xlab = expression(log(q["d"])),
     ylab=expression(log(f["e"])),mgp=c(1.1, 0, 0),tck=0.02,
     xlim=c(-14,-2),ylim=c(-2,8),col=0)

###颜色###
yan<-rainbow(9)

####30g针头下###

#1#18nl-30g##
a<-log(0.5*18/(n4$fv*60*3.1^3))

a1<-log((500/n4$fv - n4$tf)/n4$tp)

#2###18nl-32g###
b<-log(0.5*18/(n7$fv*60*2.3^3))
b1<-log((500/n7$fv - n7$tf)/n7$tp)

#3#54nl-30g##
c<-log(0.5*54/(n5$fv*60*3.1^3))

c1<-log((500/n5$fv - n5$tf)/n5$tp)

#4#18nl-34G##
d<-log(0.5*18/(n10$fv*60*1.9^3))

d1<-log((500/n10$fv - n10$tf)/n10$tp)

#5#54nl-32G##
e<-log(0.5*54/(n8$fv*60*2.3^3))
e1<-log((500/n8$fv - n8$tf)/n8$tp)

#6#54nl-34G##
f<-log(0.5*54/(n11$fv*60*1.9^3))

f1<-log((500/n11$fv - n11$tf)/n11$tp)

#7#180nl-30G##
g<-log(0.5*180/(n6$fv*60*3.1^3))
g1<-log((500/n6$fv - n6$tf)/n6$tp)

#8#180nl-32G##
h<-log(0.5*180/(n9$fv*60*2.3^3))
h1<-log((500/n9$fv - n9$tf)/n9$tp)

#9#180nl-34G##
i<-log(0.5*180/(n12$fv*60*1.9^3))
i1<-log((500/n12$fv - n12$tf)/n12$tp)

###
xx<-c(a,b,c,d,e,f,g,h,i)
yy<-c(a1,b1,c1,d1,e1,f1,g1,h1,i1)
pchc<-c(1,2,3,4,5,6,7,22,24)

#画点
points(lowess(a,a1,f=1/4,iter=3),col=yan[1],pch=1,lwd=2,lty=2,cex=0.8)
points(lowess(b,b1,f=1/4,iter=3),col=yan[2],pch=2,lwd=2,lty=2,cex=0.8)
points(lowess(c,c1,f=1/4,iter=3),col=yan[3],pch=3,lwd=2,lty=2,cex=0.8)

points(lowess(d,d1,f=1/4,iter=3),col=yan[4],pch=4,lwd=2,lty=2,cex=0.8)
points(lowess(e,e1,f=1/4,iter=3),col=yan[5],pch=5,lwd=2,lty=2,cex=0.8)
points(lowess(f,f1,f=1/4,iter=3),col=yan[6],pch=6,lwd=2,lty=2,cex=0.8)


points(lowess(g,g1,f=1/4,iter=3),col=yan[7],pch=7,lwd=2,lty=2,cex=0.8)
points(lowess(h,h1,f=1/4,iter=3),col=yan[8],pch=22,lwd=2,lty=2,cex=0.8)
points(lowess(i,i1,f=1/4,iter=3),col=yan[9],pch=24,lwd=2,lty=2,cex=0.8)

##拟合

abline(lm(a1~a),col=yan[1],lty=4)
abline(lm(b1~b),col=yan[2],lty=4)
abline(lm(c1~c),col=yan[3],lty=4)

abline(lm(d1~d),col=yan[4],lty=4)
abline(lm(e1~e),col=yan[5],lty=4)
abline(lm(f1~f),col=yan[6],lty=4)

abline(lm(g1~g),col=yan[7],lty=4)
abline(lm(h1~h),col=yan[8],lty=4)
abline(lm(i1~i),col=yan[9],lty=4)

leg<-c("18nl/min-30G","18nl/min-32G","54nl/min-30G",
       "18nl/min-34G","54nl/min-32G",
       "180nl/min-30G","54nl/min-34G","180nl/min-32G","180nl/min-34G")

legend("topleft",legend=leg,col=yan,pch=pchc,bty="n",lwd=1.5,lty=2,inset=.05,cex=0.8)






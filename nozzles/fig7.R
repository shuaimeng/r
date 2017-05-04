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
plot(n1$fv, n1$he_ra, xlab = expression(paste("log(","Qk","/",f["v"],D^"3",")")),
     ylab=expression(log(f["e"])),mgp=c(1, 0, 0),tck=0.02,
     xlim=c(-6,5),ylim=c(-2,8),col=0)

####30g针头下###

a<-log(500*18/(n4$fv*60*3.1^3))

a1<-log((500/n4$fv - n4$tf)/n4$tp)


b<-log(500*54/(n5$fv*60*3.1^3))

b1<-log((500/n5$fv - n5$tf)/n5$tp)

c<-log(500*180/(n6$fv*60*3.1^3))
c1<-log((500/n6$fv - n6$tf)/n6$tp)


#画点
points(lowess(a,a1,f=1/4,iter=3),col="red",pch=1,lwd=2,lty=2)
points(lowess(b,b1,f=1/4,iter=3),col="red",pch=2,lwd=2,lty=2)
points(lowess(c,c1,f=1/4,iter=3),col="red",pch=15,lwd=2,lty=2)
##拟合
abline(lm(a1~a),col="red",lty=4)
abline(lm(b1~b),col="red",lty=4)
abline(lm(c1~c),col="red",lty=4)

####32g###
d<-log(500*18/(n7$fv*60*2.3^3))
d1<-log((500/n7$fv - n7$tf)/n7$tp)

e<-log(500*54/(n8$fv*60*2.3^3))
e1<-log((500/n8$fv - ne$tf)/n8$tp)

f<-log(500*180/(n9$fv*60*2.3^3))
f1<-log((500/n9$fv - n9$tf)/n9$tp)

points(lowess(d,d1,f=1/4,iter=3),col="blue",pch=1,lwd=2,lty=2)
points(lowess(e,e1,f=1/4,iter=3),col="blue",pch=2,lwd=2,lty=2)
points(lowess(f,f1,f=1/4,iter=3),col="blue",pch=15,lwd=2,lty=2)
#points(lowess(d,nc360$d_eRn,f=1/4,iter=3),col="green3",pch=16,lwd=2,lty=2)

abline(lm(d1~d),col="blue",lty=4)
abline(lm(e1~e),col="blue",lty=4)
abline(lm(f1~f),col="blue",lty=4)

####34G####
g<-log(500*18/(n10$fv*60*1.9^3))

g1<-log((500/n10$fv - n10$tf)/n10$tp)

h<-log(500*54/(n11$fv*60*1.9^3))

h1<-log((500/n11$fv - n11$tf)/n11$tp)

i<-log(500*180/(n12$fv*60*1.9^3))
i1<-log((500/n12$fv - n12$tf)/n12$tp)

points(lowess(g,g1,f=1/4,iter=3),col="black",pch=1,lwd=2,lty=2)
points(lowess(h,h1,f=1/4,iter=3),col="black",pch=2,lwd=2,lty=2)
points(lowess(i,i1,f=1/4,iter=3),col="black",pch=15,lwd=2,lty=2)
#points(lowess(d,nc360$d_eRn,f=1/4,iter=3),col="green3",pch=16,lwd=2,lty=2)

abline(lm(g1~g),col="black",lty=4)
abline(lm(h1~h),col="black",lty=4)
abline(lm(i1~i),col="black",lty=4)

ccc<-c("30G-18nl/min","30G-54nl/min","30G-180nl/min","32G-18nl/min","32G-54nl/min","32G-180nl/min",
       "34G-18nl/min","34G-54nl/min","34G-180nl/min")

coll<-c("red","red","red","blue","blue","blue","black","black","black")

legend("topleft",c("30G-18nl/min","30G-54nl/min","30G-180nl/min","32G-18nl/min","32G-54nl/min","32G-180nl/min",
                   "34G-18nl/min","34G-54nl/min","34G-180nl/min"),bty="n",col=c("red","red","red","blue","blue","blue","black","black","black"),pch=c(1,2,15,1,2,15,1,2,15),lw=2,lty=4)




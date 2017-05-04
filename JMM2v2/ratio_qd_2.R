library(xlsx)


###读取
#针头为30g
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

yan<-rainbow(9)
##画图##
plot(n1$fv, n1$d_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(D/d["d"]),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(500,4000),ylim=c(2,25),col=0)

a1<-1/n1$d_eRn
a<-(n1$fv)

b1<-1/n4$d_eRn
b<-(n4$fv)

c1<-1/n2$d_eRn
  c<-(n2$fv)
  
points(lowess(a,a1,f=1/4,iter=3),col=yan[1],pch=1,lwd=1.5,lty=2,cex=0.8)
points(lowess(b,b1,f=1/4,iter=3),col=yan[2],pch=2,lwd=1.5,lty=2,cex=0.8)
points(lowess(c,c1,f=1/4,iter=3),col=yan[3],pch=3,lwd=1.5,lty=2,cex=0.8)
  
abline(lm(a1~a),col=yan[1],lty=4)
abline(lm(b1~b),col=yan[2],lty=4)
abline(lm(c1~c),col=yan[3],lty=4)


d1<-1/n7$d_eRn
  d<-(n7$fv)
  
  e1<-1/n5$d_eRn
  e<-(n5$fv)
  
  f1<-1/n3$d_eRn
  f<-(n3$fv)
  
  points(lowess(d,d1,f=1/4,iter=3),col=yan[4],pch=4,lwd=1.5,lty=2,cex=0.8)
  points(lowess(e,e1,f=1/4,iter=3),col=yan[5],pch=5,lwd=1.5,lty=2,cex=0.8)
  points(lowess(f,f1,f=1/4,iter=3),col=yan[6],pch=6,lwd=1.5,lty=2,cex=0.8)
  
  
abline(lm(d1~d),col=yan[4],lty=4)
abline(lm(e1~e),col=yan[5],lty=4)
abline(lm(f1~f),col=yan[6],lty=4)



g1<-1/n8$d_eRn
  g<-(n8$fv)
  
  h1<-1/n6$d_eRn
  h<-(n6$fv)
  
  i1<-1/n9$d_eRn
  i<-(n9$fv)
  
  points(lowess(g,g1,f=1/4,iter=3),col=yan[7],pch=7,lwd=1.5,lty=2,cex=0.8)
  points(lowess(h,h1,f=1/4,iter=3),col=yan[8],pch=22,lwd=1.5,lty=2,cex=0.8)
  points(lowess(i,i1,f=1/4,iter=3),col=yan[9],pch=24,lwd=1.5,lty=2,cex=0.8)

abline(lm(g1~g),col=yan[7],lty=4)
abline(lm(h1~h),col=yan[8],lty=4)
abline(lm(i1~i),col=yan[9],lty=4)

leg<-c("18nl/min-30G","18nl/min-32G","54nl/min-30G",
       "18nl/min-34G","54nl/min-32G",
       "180nl/min-30G","54nl/min-34G","180nl/min-32G","180nl/min-34G")

pchc<-c(1,2,3,4,5,6,7,8,9)

legend("topleft",legend=leg,col=yan,pch=pchc,bty="n",lwd=1.5,lty=2,inset=.05,cex=1)


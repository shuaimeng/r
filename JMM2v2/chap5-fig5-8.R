dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/jmm2")

library(xlsx)
#针头为30g
n1<-read.xlsx("he-25g.xlsx",sheetName="2kv18",header=TRUE)
n2<-read.xlsx("he-25g.xlsx",sheetName="2kv54",header=TRUE)
n3<-read.xlsx("he-25g.xlsx",sheetName="2kv180",header=TRUE)
n4<-read.xlsx("he-25g.xlsx",sheetName="22kv54",header=TRUE)
n5<-read.xlsx("he-25g.xlsx",sheetName="22kv180",header=TRUE)

plot(n1$fv, n1$tf, xlab = expression(f["v"](Hz)),
     ylab=expression(f["e"](Hz)),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,300),ylim=c(0,100),col=0)

#a1<-(500/n1$fv - n1$tf)/n1$tp
#lines(n1$fv,a1,col="red",pch=1,lwd=2,lty=2,type="b",cex=0.7)

b1<-(500/n2$fv - n2$tf)/n2$tp
lines(n2$fv,b1,col="red",pch=1,lwd=2,lty=2,type="b",cex=0.7)

c1<-(500/n3$fv - n3$tf)/n3$tp
lines(n3$fv,c1,col="red",pch=2,lwd=2,lty=2,type="b",cex=0.7)

d1<-(500/n4$fv - n4$tf)/n4$tp
lines(n4$fv,d1,col="blue",pch=1,lwd=2,lty=2,type="b",cex=0.7)

e1<-(500/n5$fv - n5$tf)/n5$tp
lines(n5$fv,e1,col="blue",pch=2,lwd=2,lty=2,type="b",cex=0.7)

legend("topright",c(
                    "2kv-54nl/min","2kv-180nl/min","2.2kv-54nl/min","2.2kv-180nl/min"),
       pch=c(1,2,1,2),bty="n",lty=2,col=c("red","red","blue","blue"),inset=.1)

dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/chap5")
library(xlsx)
#针头为30g
n1<-read.xlsx("he-30g.xlsx",sheetName="16kv",header=TRUE)
n2<-read.xlsx("he-30g.xlsx",sheetName="18kv",header=TRUE)
n3<-read.xlsx("he-30g.xlsx",sheetName="2kv180",header=TRUE)
n4<-read.xlsx("he-30g.xlsx",sheetName="22kv",header=TRUE)

#针头为32g
n5<-read.xlsx("he-32g.xlsx",sheetName="18kv",header=TRUE)
n6<-read.xlsx("he-32g.xlsx",sheetName="2kv180",header=TRUE)
n7<-read.xlsx("he-32g.xlsx",sheetName="22kv",header=TRUE)

###布局###
par(mar=c(1.8,2.2,1.4,1),oma=c(2,2,2,2))
layout(matrix(c(1,2,3,4), 2, 1,byrow = TRUE))

###30G###
plot(n1$fv, n1$tf, xlab = expression(italic(f["v"](Hz))),
     ylab=expression(italic(f["e"](Hz))),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,300),ylim=c(0,250),col=0)
mtext("30G",3,line=-1.2,font=2,cex=1)
a1<-(500/n1$fv - n1$tfeva)/n1$tp
lines(n1$fv,a1,col="red",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)

b1<-(500/n2$fv - n2$tfeva)/n2$tp
lines(n2$fv,b1,col="blue",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)

c1<-(500/n3$fv - n3$tfeva)/n3$tp
lines(n3$fv,c1,col="black",pch=3,lwd=1.5,lty=2,type="b",cex=0.7)

d1<-(500/n4$fv - n4$tfeva)/n4$tp
lines(n4$fv,d1,col="green3",pch=4,lwd=1.5,lty=2,type="b",cex=0.7)

legend("topright",c("1.6kv",
                    "1.8kv","2kv","2.2kv"),
       pch=c(1,2,3,4),bty="n",lty=2,col=c("red","blue","black","green3"),inset=.02,cex=0.8)


####32G###

plot(n5$fv, n5$tf, xlab = expression(italic(f["v"](Hz))),
     ylab=expression(italic(f["e"](Hz))),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,300),ylim=c(0,250),col=0)
     mtext("32G",3,line=-1.2,font=2,cex=1)

e1<-(500/n5$fv - n5$tf)/n5$tp
lines(n5$fv,e1,col="red",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)

f1<-(500/n6$fv - n6$tf)/n6$tp
lines(n6$fv,f1,col="blue",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)

g1<-(500/n7$fv - n7$tf)/n7$tp
lines(n7$fv,g1,col="black",pch=3,lwd=1.5,lty=2,type="b",cex=0.7)
legend("topright",c("1.8kv","2kv","2.2kv"),
       pch=c(1,2,3),bty="n",lty=2,col=c("red","blue","black"),inset=.02,cex=0.8)

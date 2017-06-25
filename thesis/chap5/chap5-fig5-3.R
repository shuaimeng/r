dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/chap5")
library(xlsx)

####读取25g和30g针头的180nl/min的tfor和tp####

t25<-read.xlsx("he-25g.xlsx",sheetName="2kv18",header=TRUE)
t30<-read.xlsx("he-30g.xlsx",sheetName="2kv18",header=TRUE)
t252<-read.xlsx("he-25g.xlsx",sheetName="2kv180",header=TRUE)
t302<-read.xlsx("he-30g.xlsx",sheetName="2kv180",header=TRUE)

#ta<-read.xlsx("he-25g.xlsx",sheetName="2kv54",header=TRUE)
#tb<-read.xlsx("he-25g.xlsx",sheetName="2kv54",header=TRUE)

###布局###
par(mar=c(1.8,2.2,1.4,1),oma=c(2,2,2,2))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))

###error bar####
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

####tfor时间####

###25G###
plot(t25$fv, t25$tfeva, xlab = expression(f["v"](Hz)),
     ylab=expression(t["for"](ms)),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,200),ylim=c(0,40),col=0,cex=0.6)

mtext("tfor",col="black",3,line=0.2,font=2,cex=1.2)
lines(t25$fv,t25$tfeva,col="red",pch=1,lwd=2,lty=2,type="b",cex=0.6)
#lines(ta$fv,ta$tfeva,col="blue",pch=2,lwd=2,lty=2,type="b",cex=0.6)
lines(t252$fv,t252$tfeva,col="blue",pch=2,lwd=2,lty=2,type="b",cex=0.6)

error.bar(t25$fv,t25$tfeva,t25$tfstd/2,"red")
error.bar(t252$fv,t252$tfeva,t252$tfstd/2,"blue")

#error.bar(ta$fv,ta$tfeva,ta$tfstd/2,"blue")


###30G###

lines(t30$fv,t30$tfeva,col="black",pch=1,lwd=2,lty=2,type="b",cex=0.6)
#lines(tb$fv,tb$tfeva,col="green3",pch=2,lwd=2,lty=2,type="b",cex=0.6)
lines(t302$fv,t302$tfeva,col="green3",pch=2,lwd=2,lty=2,type="b",cex=0.6)

error.bar(t30$fv,t30$tfeva,t30$tfstd/2,"black")
error.bar(t302$fv,t302$tfeva,t302$tfstd/2,"green3")

#error.bar(tb$fv,tb$tfeva,tb$tfstd/2,"green3")


legend("topright",c("25g-18nl/min","25g-180nl/min","32g-18nl/min","32g-180nl/min"),
       pch=c(1,2,1,2),bty="n",col=c("red","blue","black","green3"),lty=2,inset=.005)

####tp时间####

###25G###
plot(t25$fv, t25$tpeva, xlab = expression(f["v"](Hz)),
     ylab=expression(t["p"](ms)),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,200),ylim=c(0,1),col=0,cex=0.6)
     mtext("tp",col="black",3,line=0.2,font=2,cex=1.2)

lines(t25$fv,t25$tpeva,col="red",pch=1,lwd=1.5,lty=2,type="b",cex=0.6)
#lines(ta$fv,ta$tpeva,col="blue",pch=2,lwd=1.5,lty=2,type="b",cex=0.6)
lines(t252$fv,t252$tpeva,col="blue",pch=2,lwd=1.5,lty=2,type="b",cex=0.6)

error.bar(t25$fv,t25$tpeva,t25$tpstd/2,"red")
#error.bar(ta$fv,ta$tpeva,ta$tpstd/2,"green3")
error.bar(t252$fv,t252$tpeva,t252$tpstd/2,"blue")



###30G###
lines(t302$fv,t302$tpeva,col="black",pch=2,lwd=2,lty=2,type="b",cex=0.6)

lines(t30$fv,t30$tpeva,col="green3",pch=1,lwd=2,lty=2,type="b",cex=0.6)
#lines(tb$fv,tb$tpeva,col="blue",pch=2,lwd=2,lty=2,type="b",cex=0.6)
error.bar(t302$fv,t302$tpeva,t302$tpstd/2,"black")
error.bar(t30$fv,t30$tpeva,t30$tpstd/2,"green3")
#error.bar(tb$fv,tb$tpeva,tb$tpstd/2,"green3")


legend("topright",c("25g-18nl/min","25g-180nl/min","32g-18nl/min","32g-180nl/min"),
       pch=c(1,2,1,2),bty="n",col=c("red","blue","black","green3"),lty=2,inset=.005)

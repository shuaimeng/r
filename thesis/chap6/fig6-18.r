dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/conductivity")

library(xlsx)

# reading datasets

# compare qd and conductivitys
# 18nl/min-Gly1,sorts of

k1<-read.xlsx("gly1.xlsx",sheetName="qd2-18",header=TRUE)
k2<-read.xlsx("gly1.xlsx",sheetName="qd2-19",header=TRUE)
k3<-read.xlsx("gly1.xlsx",sheetName="qd2-20",header=TRUE)

q1<-read.xlsx("gly2.xlsx",sheetName="qd2-18",header=TRUE)
q2<-read.xlsx("gly2.xlsx",sheetName="qd2-19",header=TRUE)
q3<-read.xlsx("gly2.xlsx",sheetName="qd2-20",header=TRUE)

yan<-rainbow(6)

pcc<-c(0,1,2,5,22,23)
yan[2]<-c("yellow3")

error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) !=
     length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

plot(k1$fv,k1$deva, col=0,xlab = expression(italic(f["v"]) (Hz)),
          ylab = expression(italic(d["d"]) (um)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,4000),ylim=c(10,70))

               mtext("180nl/min-droplet",3,line=-1.2,font=2,cex=1)

lines(k1$fv,k1$deva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(k2$fv,k2$deva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(k3$fv,k3$deva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)

lines(q1$fv,q1$deva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)
lines(q2$fv,q2$deva,col=yan[5],lwd=1.5,lty=2,type="b",pch=pcc[5],cex=0.8)
lines(q3$fv,q3$deva,col=yan[6],lwd=1.5,lty=2,type="b",pch=pcc[6],cex=0.8)


error.bar(k1$fv,k1$deva,k1$stdd/2,col=yan[1])
error.bar(k2$fv,k2$deva,k2$stdd/2,col=yan[2])
error.bar(k3$fv,k3$deva,k3$stdd/2,col=yan[3])

error.bar(q1$fv,q1$deva,q1$stdd/2,col=yan[4])
error.bar(q2$fv,q2$deva,q2$stdd/2,col=yan[5])
error.bar(q3$fv,q3$deva,q3$stdd/2,col=yan[6])

leg<-c("Gly1-1.8kv","Gly1-1.9kv","Gly1-2kv"
        ,"Gly2-1.8kv","Gly2-1.9kv","Gly2-2kv")

x1<-c(1500,1500)
y1<-c(0,23)
lines(x1,y1,col="blue",lty=2,lwd=1)
text(1400,15,"fv=2kv",col="blue",font=2)
x2<-c(2000,2000)
y2<-c(0,30)
lines(x2,y2,col="blue",lty=2,lwd=1)
text(2050,16,"fv=3kv",col="blue",font=2)
x3<-c(3000,3000)
y3<-c(0,25)
lines(x3,y3,col="blue",lty=2,lwd=1)
text(2700,15,"fv=3KHz",col="blue",font=2)

legend("topright",legend=leg,pch=pcc,col=yan,inset=.02,bty="n",lwd=1.5,cex=0.8)

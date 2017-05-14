dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/conductivity")

library(rJava)

setwd("/Users/mengmengjiang/37datas")

library(xlsx)

# reading datas
# reading 18nl/min-2kv,180nl/min - 2kv下，四个数据组合
# 检查四组参数下的fp变化；

k1<-read.xlsx("gly1.xlsx",sheetName="qd1-20",header=TRUE)
k2<-read.xlsx("gly1.xlsx",sheetName="qd2-20",header=TRUE)
k3<-read.xlsx("gly2.xlsx",sheetName="qd1-20",header=TRUE)
k4<-read.xlsx("gly2.xlsx",sheetName="qd2-20",header=TRUE)

yan<-c("red","blue","black","green3")

pcc<-c(0,1,2,5)

#
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) !=
     length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

#
plot(k1$fv,k1$fveva, col=0,xlab = expression(italic(f["v"]) (Hz)),
          ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,4000),ylim=c(0,4000))


lines(k1$fv,k1$fveva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
lines(k2$fv,k2$fveva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(k3$fv,k3$fveva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)
lines(k4$fv,k4$fveva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)


error.bar(k1$fv,k1$fveva,k1$stdfv/2,col=yan[1])
error.bar(k2$fv,k2$fveva,k2$stdfv/2,col=yan[2])
error.bar(k3$fv,k3$fveva,k3$stdtf/2,col=yan[3])
error.bar(k4$fv,k4$fveva,k4$stdtf/2,col=yan[4])

x1<-c(800,800)
y1<-c(0,700)
lines(x1,y1,col="blue",lwd=1.5,lty=2)
text(400,400,"fvt=800Hz",col="blue",font=2)

x2<-c(1000,1000)
y2<-c(0,1000)
lines(x2,y2,col="blue",lwd=1.5,lty=2)
text(1500,400,"fvt=1KHz",col="blue",font=2)

x3<-c(2000,2000)
y3<-c(0,2000)
lines(x3,y3,col="blue",lwd=1.5,lty=2)
text(2200,1000,"fpmax=2KHz",font=2)

x4<-c(3000,3000)
y3<-c()


leg<-c("Gly1-18nl/min-2kv","Gly1-180nl/min-2kv","Gly2-18nl/min-2kv","Gly2-180nl/min-2kv")

legend("topleft",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.06,bty="n",cex=0.8)

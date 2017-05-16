dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/viscous")

library(xlsx)

# liquid1下的Q-V组合
# 查看tfor和tp

k1<-read.xlsx("liquid1.xlsx",sheetName="2kv-18",header=TRUE)
k2<-read.xlsx("liquid1.xlsx",sheetName="2.1kv-18",header=TRUE)
k3<-read.xlsx("liquid1.xlsx",sheetName="2.2kv-18",header=TRUE)
k4<-read.xlsx("liquid2.xlsx",sheetName="2kv-18",header=TRUE)
k5<-read.xlsx("liquid2.xlsx",sheetName="2.1kv-18",header=TRUE)
k6<-read.xlsx("liquid2.xlsx",sheetName="2.2kv-18",header=TRUE)

# errorbar

error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
stop("vectors must be same length")
arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

#
yan<-rainbow(6)
pcc<-c(0,1,2,5,22,23)
yan[2]<-c("yellow3")

# plot figures

par(fig=c(0,1,0,1),new=T)

plot(k1$fv,k1$feeva, col=0,xlab = expression(italic(f["v"]) (Hz)),
ylab = expression(italic(f["e"])(Hz)), mgp=c(1.1, 0, 0),tck=0.02,
main = "", xlim = c(0,800),ylim=c(0,80))

mtext("18nl/min-fe",3,line=0,font=2,cex=1.1)

# lines and error

lines(k1$fv,k1$feeva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
lines(k2$fv,k2$feeva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(k3$fv,k3$feeva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)
lines(k4$fv,k4$feeva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)
lines(k5$fv,k5$feeva,col=yan[5],lwd=1.5,lty=2,type="b",pch=pcc[5],cex=0.8)
lines(k6$fv,k6$feeva,col=yan[6],lwd=1.5,lty=2,type="b",pch=pcc[6],cex=0.8)

error.bar(k1$fv,k1$feeva,k1$stdfe/2,col=yan[1])
error.bar(k2$fv,k2$feeva,k2$stdfe/2,col=yan[2])
error.bar(k3$fv,k3$feeva,k3$stdfe/2,col=yan[3])
error.bar(k4$fv,k4$feeva,k4$stdfe/2,col=yan[4])
error.bar(k5$fv,k5$feeva,k5$stdfe/2,col=yan[5])
error.bar(k6$fv,k6$feeva,k6$stdfe/2,col=yan[6])

leg<-c("liquid1-2kv","liquid1-2.1kv","liquid1-2.2kv","liquid2-2kv",
"liquid2-2.1kv","liquid2-2.2kv")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n",cex=0.8)

par(fig=c(0.2,0.99,0.2,0.99),new=T)

plot(k1$fv,k1$feeva, bty="n",col=0,xlab = expression(italic(f["v"]) (Hz)),
ylab = expression(italic(f["e"])(Hz)), mgp=c(1.1, 0, 0),tck=0.02,
main = "", xlim = c(0,800),ylim=c(0,60))



# lines and error

q1<-read.xlsx("liquid1.xlsx",sheetName="2kv-180",header=TRUE)
q2<-read.xlsx("liquid1.xlsx",sheetName="2.1kv-180",header=TRUE)
q3<-read.xlsx("liquid1.xlsx",sheetName="2.2kv-180",header=TRUE)
q4<-read.xlsx("liquid2.xlsx",sheetName="2kv-180",header=TRUE)
q5<-read.xlsx("liquid2.xlsx",sheetName="2.1kv-180",header=TRUE)

lines(q1$fv,q1$feeva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
lines(q2$fv,q2$feeva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(q3$fv,q3$feeva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)
lines(q4$fv,q4$feeva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)
lines(q5$fv,q5$feeva,col=yan[5],lwd=1.5,lty=2,type="b",pch=pcc[5],cex=0.8)

error.bar(q1$fv,q1$feeva,q1$stdfe/2,col=yan[1])
error.bar(q2$fv,q2$feeva,q2$stdfe/2,col=yan[2])
error.bar(q3$fv,q3$feeva,q3$stdfe/2,col=yan[3])
error.bar(q4$fv,q4$feeva,q4$stdfe/2,col=yan[4])
error.bar(q5$fv,q5$feeva,q5$stdfe/2,col=yan[5])

text(400,30,"180nl/min-fe",col="black",font=2)

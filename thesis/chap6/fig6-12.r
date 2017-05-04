etwd("/Users/mengmengjiang/37datas")

library(xlsx)

# reading datasets

# compare qd and conductivitys
# 18nl/min-Gly1,sorts of
# 针对低电导率液体，我们想要看看电压和流量的影响
# 电压为三个，流量为2个，

k1<-read.xlsx("gly2.xlsx",sheetName="qd1-18",header=TRUE)
k2<-read.xlsx("gly2.xlsx",sheetName="qd1-19",header=TRUE)
k3<-read.xlsx("gly2.xlsx",sheetName="qd1-20",header=TRUE)

k4<-read.xlsx("gly2.xlsx",sheetName="qd2-18",header=TRUE)
k5<-read.xlsx("gly2.xlsx",sheetName="qd2-19",header=TRUE)
k6<-read.xlsx("gly2.xlsx",sheetName="qd2-20",header=TRUE)

#
yan<-rainbow(6)
yan[2]<-c("gellow3")
pcc<-c(0,1,2,5,22,23)

#
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) !=
     length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

#
plot(k1$fv,k1$deva, col=0,xlab = expression(italic(f["v"]) (Hz)), 
          ylab = expression(italic(d["d"]) (um)), mgp=c(1.1, 0, 0),tck=0.02, 
               main = "", xlim = c(0,3000),ylim=c(15,40))

lines(k1$fv,k1$deva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
lines(k2$fv,k2$deva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(k3$fv,k3$deva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)

lines(k4$fv,k4$deva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)
lines(k5$fv,k5$deva,col=yan[5],lwd=1.5,lty=2,type="b",pch=pcc[5],cex=0.8)
lines(k6$fv,k6$deva,col=yan[6],lwd=1.5,lty=2,type="b",pch=pcc[6],cex=0.8)


error.bar(k1$fv,k1$deva,k1$stdd/2,col=yan[1])
error.bar(k2$fv,k2$deva,k2$stdd/2,col=yan[2])
error.bar(k3$fv,k3$deva,k3$stdd/2,col=yan[3])

error.bar(k4$fv,k4$deva,k4$stdd/2,col=yan[4])
error.bar(k5$fv,k5$deva,k5$stdd/2,col=yan[5])
error.bar(k6$fv,k6$deva,k6$stdd/2,col=yan[6])

leg<-c("18nl/min-1.8kv","18nl/min-1.9kv","18nl/min-2kv","180nl/min-1.8kv",
        "180nl/min-1.9kv","180nl/min-2kv")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,inset = .06,lty=2,bty="n")



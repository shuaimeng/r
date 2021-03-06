library(xlsx)

# reading datasets

# compare qd and conductivitys
# 18nl/min-Gly1,sorts of

k1<-read.xlsx("gly1.xlsx",sheetName="qd1-18",header=TRUE)
k2<-read.xlsx("gly1.xlsx",sheetName="qd1-19",header=TRUE)
k3<-read.xlsx("gly1.xlsx",sheetName="qd1-20",header=TRUE)

q1<-read.xlsx("gly2.xlsx",sheetName="qd1-18",header=TRUE)
q2<-read.xlsx("gly2.xlsx",sheetName="qd1-19",header=TRUE)
q3<-read.xlsx("gly2.xlsx",sheetName="qd1-20",header=TRUE)

yan<-rainbow(6)

pcc<-c(0,1,2,5,22,23)

error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

plot(k1$fv,k1$deva, col=0,xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(d["d"]) (um)), mgp=c(1.1, 0, 0),tck=0.02, 
     main = "", xlim = c(0,3500),ylim=c(10,50))

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

legend("topright",legend=leg,pch=pcc,col=yan,inset=.1,bty="n",lwd=1.5)


library(xlsx)

#reading datas
#compare d and ratio in qd-1
#sheetName = qd1-18,qd1-19,qd1-20;
# 18nl/min下的液滴直径
# 或者1.8kv下，三种液体在两种qd下的表现；
# qd1-18，qd2-18；
# 液滴比较和ratio比较只能在两个电导率下，即gly1和gly2；


k1<-read.xlsx("gly1.xlsx", sheetName = "qd1-18", header = TRUE)
k2<-read.xlsx("gly1.xlsx", sheetName = "qd2-18", header = TRUE)
k3<-read.xlsx("gly2.xlsx", sheetName = "qd1-18", header = TRUE)
k4<-read.xlsx("gly2.xlsx", sheetName = "qd2-18", header = TRUE)

#
par(mar = c(2,2.4,2,2), oma = c(1,1,1,1))
layout(matrix(c(1,2),2,1,byrow=TRUE))

#
yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

#
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

# Plot-1
plot(k1$fv,k1$tpeva, col=0,xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(d["d"])(um)), mgp=c(1.1, 0, 0),tck=0.02, 
     main = "droplet-1.8kv", xlim = c(0,3000),ylim=c(0,60))

lines(k1$fv,k1$deva,col=yan[1],lwd=1.5,lty=2,pch=pcc[1],type="b",cex=0.8)
lines(k2$fv,k2$deva,col=yan[2],lwd=1.5,lty=2,pch=pcc[2],type="b",cex=0.8)
lines(k3$fv,k3$deva,col=yan[3],lwd=1.5,lty=2,pch=pcc[3],type="b",cex=0.8)
lines(k4$fv,k4$deva,col=yan[4],lwd=1.5,lty=2,pch=pcc[4],type="b",cex=0.8)


error.bar(k1$fv,k1$deva,k1$stdd,col=yan[1])
error.bar(k2$fv,k2$deva,k2$stdd,col=yan[2])
error.bar(k3$fv,k3$deva,k3$stdd,col=yan[3])
error.bar(k4$fv,k4$deva,k4$stdd,col=yan[4])

leg<-c("Gly1-18nl/min","Gly1-180nl/min","Gly2-18nl/min","Gly2-180nl/min")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,inset = .05,bty="n",cex=0.8)

# Plot -2

plot(k1$fv,k1$tpeva, col=0,xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(ratio)), mgp=c(1.1, 0, 0),tck=0.02, 
     main = "ratio-1.8kv", xlim = c(0,3000),ylim=c(5,20))

lines(k1$fv,k1$raeva,col=yan[1],lwd=1.5,lty=2,pch=pcc[1],type="b",cex=0.8)
lines(k2$fv,k2$raeva,col=yan[2],lwd=1.5,lty=2,pch=pcc[2],type="b",cex=0.8)
lines(k3$fv,k3$raeva,col=yan[3],lwd=1.5,lty=2,pch=pcc[3],type="b",cex=0.8)
lines(k4$fv,k4$raeva,col=yan[4],lwd=1.5,lty=2,pch=pcc[4],type="b",cex=0.8)


error.bar(k1$fv,k1$raeva,k1$rastd,col=yan[1])
error.bar(k2$fv,k2$raeva,k2$rastd,col=yan[2])
error.bar(k3$fv,k3$raeva,k3$rastd,col=yan[3])
error.bar(k4$fv,k4$raeva,k4$rastd,col=yan[4])

leg<-c("Gly1-18nl/min","Gly1-180nl/min","Gly2-18nl/min","Gly2-180nl/min")

legend("topleft",legend=leg,col=yan,pch=pcc,lwd=1.5,inset = .05,bty="n",cex=0.8)


library(xlsx)

#reading datas

c1<-read.xlsx("gly1.xlsx", sheetName = "qd2-20", header = TRUE)
c2<-read.xlsx("gly2.xlsx", sheetName = "qd2-20", header = TRUE)
c3<-read.xlsx("gly3.xlsx", sheetName = "qd2-20", header = TRUE)

##error bar##
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}
##

##
par(mfrow = c(2,1), mar = c(2,2.4,1,1), oma = c(1,1,1,1))

##Plot-1

##
yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

##Plot-1
plot(c1$fv,c1$tfeva, col=0,xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(t["for"]) (ms)), mgp=c(1.1, 0, 0),tck=0.02, 
     main = "", xlim = c(0, 500),ylim=c(0,15))

lines(c1$fv,c1$tfeva,col=yan[1],pch=pcc[1],type="b",lwd=1.5,lty=2)
lines(c2$fv,c2$tfeva,col=yan[2],pch=pcc[2],type="b",lwd=1.5,lty=2)
lines(c3$fv,c3$tfeva,col=yan[3],pch=pcc[3],type="b",lwd=1.5,lty=2)

error.bar(c1$fv,c1$tfeva,c1$stdtf/2,col=yan[1])
error.bar(c2$fv,c2$tfeva,c2$stdtf/2,col=yan[2])
error.bar(c3$fv,c3$tfeva,c3$stdtf/2,col=yan[3])

leg<-c("Ethylene","Ethylene 2","Ethylene 3")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,inset=.06,bty="n")

###small figure ###

par(fig=c(0.3,0.98,0.63,0.98),new=T)

plot(c1$fv,c1$tfeva, col=0,bty="n",xlab = "", 
     ylab = "", mgp=c(1.1, 0, 0),tck=0.02, 
     main = "", xlim = c(500, 3500),ylim=c(0,1))

lines(c1$fv,c1$tfeva,col=yan[1],pch=pcc[1],type="b",lwd=1.5,lty=2)
lines(c2$fv,c2$tfeva,col=yan[2],pch=pcc[2],type="b",lwd=1.5,lty=2)
lines(c3$fv,c3$tfeva,col=yan[3],pch=pcc[3],type="b",lwd=1.5,lty=2)

error.bar(c1$fv,c1$tfeva,c1$stdtf/2,col=yan[1])
error.bar(c2$fv,c2$tfeva,c2$stdtf/2,col=yan[2])
error.bar(c3$fv,c3$tfeva,c3$stdtf/2,col=yan[3])

###Plot-2
par(fig=c(0,1,0,0.5),new=T)
plot(c1$fv,c1$tpeva, col=0,xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(t["pulse"]) (ms)), mgp=c(1.1, 0, 0),tck=0.02, 
     main = "", xlim = c(0, 3500),ylim=c(0,0.4))

lines(c1$fv,c1$tpeva,col=yan[1],pch=pcc[1],type="b",lwd=1.5,lty=2)
lines(c2$fv,c2$tpeva,col=yan[2],pch=pcc[2],type="b",lwd=1.5,lty=2)
lines(c3$fv,c3$tpeva,col=yan[3],pch=pcc[3],type="b",lwd=1.5,lty=2)

error.bar(c1$fv,c1$tpeva,c1$stdtp/2,col=yan[1])
error.bar(c2$fv,c2$tpeva,c2$stdtp/2,col=yan[2])
error.bar(c3$fv,c3$tpeva,c3$stdtp/2,col=yan[3])

leg<-c("Ethylene","Ethylene 2","Ethylene 3")
legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,inset=.06,bty="n")










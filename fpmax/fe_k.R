#eject frequency in one pulse
# name: duty cycle

##reading datas##

library(xlsx)

k1<-read.xlsx("duty cycle.xlsx",sheetName = "5",header = TRUE)
k2<-read.xlsx("duty cycle.xlsx",sheetName = "6",header = TRUE)
k3<-read.xlsx("duty cycle.xlsx",sheetName = "8",header = TRUE)
k4<-read.xlsx("duty cycle.xlsx",sheetName = "9",header = TRUE)

#Room#

#par(mfrow=c(2,2),mar=c(2,2.6,2,2),oma=c(1,1,1,1))


###error bar####
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

##颜色color
yan<-c("red","blue","green3","black")

####k=0.5###
plot(k1$fv,k1$feeva, xaxs="i", col=0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(f["e"]) (Hz)),mgp=c(1.1, 0, 0),tck=0.01, main="",
     cex.lab=1,xlim=c(0,500),ylim=c(0,200))


#z1=loess(k1$feeva~k1$fv,span=0.4,degree=2)
#lines(k1$fv, z1$fit, col="red",pch=0,lty=2,type="b",lwd=2)

#z2=loess(k2$feeva~k2$fv,span=0.4,degree=2)
#lines(k2$fv, z2$fit, col="blue",pch=1,lty=2,type="b",lwd=2)

#z3=loess(k3$feeva~k3$fv,span=0.4,degree=2)
#lines(k3$fv, z3$fit, col="green3",pch=2,lty=2,type="b",lwd=2)

#z4=loess(k4$feeva~k4$fv,span=0.4,degree=2)
#lines(k4$fv, z4$fit, col="black",pch=5,lty=2,type="b",lwd=2)

lines(k1$fv, k1$feeva,col="red", lwd=2, pch=0,type="b", lty=2)
lines(k2$fv, k2$feeva,col="blue", lwd=2, pch=1,type="b", lty=2)
lines(k3$fv, k3$feeva,col="green3", lwd=2, pch=2,type="b", lty=2)
lines(k4$fv, k4$feeva,col="black", lwd=2, pch=5,type="b", lty=2)

error.bar(k1$fv,k1$feeva,k1$stdfe/2,col=yan[1])
error.bar(k2$fv,k2$feeva,k2$stdfe/2,col=yan[2])
error.bar(k3$fv,k3$feeva,k3$stdfe/2,col=yan[3])
error.bar(k4$fv,k4$feeva,k4$stdfe/2,col=yan[4])

legend("topright",c("k=0.5","k=0.6","k=0.8","k=0.9"),col=c("red","blue","green3","black"),
       pch=c(0,1,2,5),lwd=2,lty=2,inset=.05,bty="n")

###small figure###
par(fig=c(0.2,0.97,0.2,0.99), new=T)

plot(k1$fv,k1$feeva, xaxs="i", col=0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(f["e"]) (Hz)),mgp=c(1.1, 0, 0),tck=0.01, main="",
     cex.lab=1,xlim=c(500,3500),ylim=c(0,5))

lines(k1$fv, k1$feeva,col="red", lwd=2, pch=0,type="b", lty=2)
lines(k2$fv, k2$feeva,col="blue", lwd=2, pch=1,type="b", lty=2)
lines(k3$fv, k3$feeva,col="green3", lwd=2, pch=2,type="b", lty=2)
lines(k4$fv, k4$feeva,col="black", lwd=2, pch=5,type="b", lty=2)



text(2400,3,"fe=1",col="blue",font=2)











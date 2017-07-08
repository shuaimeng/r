dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/conductivity")

library(xlsx)

# reading datasets

# compare qd and conductivitys
# Gly1,18nl/min - 1.8kv; 180nl/min - 2kv;
# Gly2,18nl/min - 2kv; 180nl/min - 1.8kv;
#

k1<-read.xlsx("gly1.xlsx",sheetName="qd1-18",header=TRUE)
k2<-read.xlsx("gly1.xlsx",sheetName="qd2-20",header=TRUE)

k3<-read.xlsx("gly2.xlsx",sheetName="qd1-20",header=TRUE)
k4<-read.xlsx("gly2.xlsx",sheetName="qd2-18",header=TRUE)

#
yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

par(mfrow = c(2,1), mar = c(1.8,2.2,0.8,1), oma = c(1,1,1,1))


#error
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) !=
     length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

#
plot(k1$fv,k1$deva, col=0,xlab = expression(italic(f["v"]) (Hz)),
          ylab = expression(italic(d["d"]) (um)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,4000),ylim=c(0,60))

               mtext("Small droplets of Q-V",3,line=-1.2,font=2,cex=1)

points(k1$fv,k1$deva,col=yan[1],lty=2,pch=pcc[1],cex=0.8)
points(k2$fv,k2$deva,col=yan[2],lty=2,pch=pcc[2],cex=0.8)
points(k3$fv,k3$deva,col=yan[3],lty=2,pch=pcc[3],cex=0.8)
points(k4$fv,k4$deva,col=yan[4],lty=2,pch=pcc[4],cex=0.8)


error.bar(k1$fv,k1$deva,k1$stdd/2,col=yan[1])
error.bar(k2$fv,k2$deva,k2$stdd/2,col=yan[2])
error.bar(k3$fv,k3$deva,k3$stdd/2,col=yan[3])
error.bar(k4$fv,k4$deva,k4$stdd/2,col=yan[4])

fit1=lm(k1$deva~k1$fv)
fit2=lm(k2$deva~k2$fv)
fit3=lm(k3$deva~k3$fv)
fit4=lm(k4$deva~k4$fv)

abline(fit1,col=yan[1],lwd=1.5,lty=2)
abline(fit2,col=yan[2],lwd=1.5,lty=2)
abline(fit3,col=yan[3],lwd=1.5,lty=2)
abline(fit4,col=yan[4],lwd=1.5,lty=2)

leg<-c("Gly1:18nl/min-1.8kv","Gly1:180nl/min-2kv","Gly2:18nl/min-2kv","Gly2:180nl/min-1.8kv")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,inset=.01,cex=0.8,bty="n")

inter<-c(coef(fit1)[1],coef(fit2)[1],coef(fit3)[1],coef(fit4)[1])
slope<-c(coef(fit1)[2],coef(fit2)[2],coef(fit3)[2],coef(fit4)[2])

k1<-read.xlsx("gly1.xlsx",sheetName="qd1-18",header=TRUE)
#k2<-read.xlsx("gly1.xlsx",sheetName="qd1-19",header=TRUE)
k2<-read.xlsx("gly1.xlsx",sheetName="qd2-20",header=TRUE)

k3<-read.xlsx("gly2.xlsx",sheetName="qd1-20",header=TRUE)
k4<-read.xlsx("gly2.xlsx",sheetName="qd2-18",header=TRUE)
#k6<-read.xlsx("gly2.xlsx",sheetName="qd1-20",header=TRUE)



plot(k1$fv,k1$raeva, col=0,xlab = expression(italic(f["v"]) (Hz)),
          ylab = expression(italic(ratio)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,3500),ylim=c(5,25))

               mtext("large ratio",3,line=-1.2,font=2,cex=1)

lines(k1$fv,k1$raeva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
lines(k2$fv,k2$raeva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(k3$fv,k3$raeva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)
lines(k4$fv,k4$raeva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)
#lines(k5$fv,k5$raeva,col=yan[5],lwd=1.5,lty=2,type="b",pch=pcc[5],cex=0.8)
#lines(k6$fv,k6$raeva,col=yan[6],lwd=1.5,lty=2,type="b",pch=pcc[6],cex=0.8)

    error.bar(k1$fv,k1$raeva,k1$rastd/2,col=yan[1])
    error.bar(k2$fv,k2$raeva,k2$rastd/2,col=yan[2])
        error.bar(k3$fv,k3$raeva,k3$rastd/2,col=yan[3])
        error.bar(k4$fv,k4$raeva,k4$rastd/2,col=yan[4])
          #  error.bar(k5$fv,k5$raeva,k5$rastd/2,col=yan[5])
          #  error.bar(k6$fv,k6$raeva,k6$rastd/2,col=yan[6])

                x1<-c(1500,1500)
                y1<-c(0,10)
                lines(x1,y1,col="red",lwd=1,lty=2)
                text(1100,6,"ratio>10",col="blue",font=2)

                x2<-c(2500,2500)
                y2<-c(0,15)
                      lines(x2,y2,col="red",lwd=1,lty=2)
                      text(2800,7,"ratio>15",col="blue",font=2)

                      abline(h=15,col="red",lwd=1,lty=2)

                    leg<-c("Gly1:18nl/min-1.8kv","Gly1:180nl/min-2kv","Gly2:18nl/min-2kv","Gly2:180nl/min-1.8kv")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset= .02,bty = "n",cex=0.8)

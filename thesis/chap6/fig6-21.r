dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/conductivity")

library(xlsx)

# reading datas
# reading 18nl/min-2kv,180nl/min - 2kv
# Gly1 and Gly2
# compare 18nl/min in two liquids

k1<-read.xlsx("gly1.xlsx",sheetName="qd2-18",header=TRUE)
k2<-read.xlsx("gly1.xlsx",sheetName="qd2-19",header=TRUE)
k3<-read.xlsx("gly1.xlsx",sheetName="qd2-20",header=TRUE)

k4<-read.xlsx("gly2.xlsx",sheetName="qd2-18",header=TRUE)
k5<-read.xlsx("gly2.xlsx",sheetName="qd2-19",header=TRUE)
k6<-read.xlsx("gly2.xlsx",sheetName="qd2-20",header=TRUE)

yan<-rainbow(6)
pcc<-c(0,1,2,5,22,23)

error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) !=
     length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

plot(k1$fv,k1$raeva, col=0,xlab = expression(italic(f["v"]) (Hz)),
          ylab = expression(italic(ratio)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(0,3500),ylim=c(5,25))

lines(k1$fv,k1$raeva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
lines(k2$fv,k2$raeva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
lines(k3$fv,k3$raeva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)
lines(k4$fv,k4$raeva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)
lines(k5$fv,k5$raeva,col=yan[5],lwd=1.5,lty=2,type="b",pch=pcc[5],cex=0.8)
lines(k6$fv,k6$raeva,col=yan[6],lwd=1.5,lty=2,type="b",pch=pcc[6],cex=0.8)

    error.bar(k1$fv,k1$raeva,k1$rastd/2,col=yan[1])
    error.bar(k2$fv,k2$raeva,k2$rastd/2,col=yan[2])
        error.bar(k3$fv,k3$raeva,k3$rastd/2,col=yan[3])
        error.bar(k4$fv,k4$raeva,k4$rastd/2,col=yan[4])
            error.bar(k5$fv,k5$raeva,k5$rastd/2,col=yan[5])
            error.bar(k6$fv,k6$raeva,k6$rastd/2,col=yan[6])

                x1<-c(1500,1500)
                y1<-c(0,10)
                    lines(x1,y1,col="red",lwd=1,lty=2)
                    text(1300,6,"ratio>10",col="blue",font=2)

                        x2<-c(2500,2500)
                        y2<-c(0,15)
                            lines(x2,y2,col="red",lwd=1,lty=2)
                            text(2800,7,"ratio>15",col="blue",font=2)

                                abline(h=10,col="red",lwd=1,lty=2)
                                abline(h=15,col="red",lwd=1,lty=2)

                                    leg<-c("Gly1-1.8kv","Gly1-1.9kv","Gly1-2kv","Gly2-1.8kv",
                                                "Gly2-1.9kv","Gly2-2kv")

                                    legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset
                                           = .02,bty = "n",cex=0.8)

dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/print")

library(xlsx)

# reading ux and sy

k1<-read.xlsx("doty.xlsx",sheetName="600",header=TRUE)
k2<-read.xlsx("doty.xlsx",sheetName="1khz",header=TRUE)
k3<-read.xlsx("doty.xlsx",sheetName="2khz",header=TRUE)

# par

#par(mfrow = c(2,1), mar = c(2,2.4,2,2), oma = c(1,1,1,1))
#layout(matrix(c(1,2), 2, 1,byrow = TRUE))

# errorbar
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
stop("vectors must be same length")
arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

# color setting

yan<-c("red","blue","black")
pcc<-c(0,1,2)
Uy<-c(50,100,150)

# plot

par(mfrow = c(2,1), mar = c(2,2.4,2,2), oma = c(1,1,1,1))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))

plot(k1$uy,k1$syeva, col=0,xlab = expression(italic(U["y"]) (um)),
          ylab = expression(italic(S["y"]) (um)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(50,150),ylim=c(-20,70))

               mtext("Sy",3,line=0.2,font=2,cex=1.2)

               lines(k1$uy,k1$syeva,lwd=1.5,lty=2,col=yan[1],pch=pcc[1],type="b")
               lines(k2$uy,k2$syeva,lwd=1.5,lty=2,col=yan[2],pch=pcc[2],type="b")
               lines(k3$uy,k3$syeva,lwd=1.5,lty=2,col=yan[3],pch=pcc[3],type="b")

               error.bar(k1$uy,k1$syeva,k1$systd/2,col=yan[1])
               error.bar(k2$uy,k2$syeva,k2$systd/2,col=yan[2])
               error.bar(k3$uy,k3$syeva,k3$systd/2,col=yan[3])

               leg<-c("600Hz","1KHz","2KHz")

               legend("topleft",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n")


plot(k1$uy,k1$syeva, col=0,xlab = expression(italic(U["y"]) (um)),
         ylab = expression(italic(S["y"]+Y) (um)), mgp=c(1.1, 0, 0),tck=0.02,
              main = "", xlim = c(50,150),ylim=c(0,150))

              mtext("Sy+Ye",3,line=0.2,font=2,cex=1.2)

              z1<-(Uy-k1$deva)
              z2<-(Uy-k2$deva)
              z3<-(Uy-k3$deva)

              lines(k1$uy,z1,lwd=1.5,lty=2,col=yan[1],pch=pcc[1],type="b")
              lines(k2$uy,z2,lwd=1.5,lty=2,col=yan[2],pch=pcc[2],type="b")
              lines(k3$uy,z3,lwd=1.5,lty=2,col=yan[3],pch=pcc[3],type="b")

              #error.bar(k1$uy,k1$syeva,k1$systd/2,col=yan[1])
              #error.bar(k2$uy,k2$syeva,k2$systd/2,col=yan[2])
              #error.bar(k3$uy,k3$syeva,k3$systd/2,col=yan[3])

              leg<-c("600Hz","1KHz","2KHz")

              legend("topleft",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n")

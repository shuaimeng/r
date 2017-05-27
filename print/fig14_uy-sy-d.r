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
uy<-c(50,100,150)
# plot
par(mfrow = c(2,1), mar = c(2,2.4,2,2), oma = c(1,1,1,1))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))

plot(uy,k1$syeva, col=0,xlab = expression(italic(U["y"]) (um)),
          ylab = expression(italic(Diff)(um)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "", xlim = c(50,150),ylim=c(0,60))

               mtext("Differ as Uy-Sy-D",3,line=0.2,font=2,cex=1.2)

               z1<-(uy-(k1$syeva+k1$deva))
               z2<-(uy-(k2$syeva+k2$deva))
               z3<-(uy-(k3$syeva+k3$deva))

               lines(uy,z1,lwd=1.5,lty=2,col=yan[1],pch=pcc[1],type="b")
               lines(uy,z2,lwd=1.5,lty=2,col=yan[2],pch=pcc[2],type="b")
               lines(uy,z3,lwd=1.5,lty=2,col=yan[3],pch=pcc[3],type="b")

               #error.bar(uy,z1,(k1$systd+k1$stdd)/2,col=yan[1])
               #error.bar(uy,z2,(k2$systd+k2$stdd)/2,col=yan[2])
               #error.bar(uy,z3,(k3$systd+k3$stdd)/2,col=yan[3])

               leg<-c("600Hz","1KHz","2KHz")

               legend("topleft",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n")

               plot(uy,k1$syeva, col=0,xlab = expression(italic(U["y"]) (um)),
                         ylab = expression(italic(ratio_Sy)), mgp=c(1.1, 0, 0),tck=0.02,
                              main = "", xlim = c(50,150),ylim=c(0,1))

                              mtext("error ratio in Sy",3,line=0.2,font=2,cex=1.2)

                              z4<-(uy-(k1$syeva+k1$deva))/uy
                              z5<-(uy-(k2$syeva+k2$deva))/uy
                              z6<-(uy-(k3$syeva+k3$deva))/uy

                              lines(uy,z4,lwd=1.5,lty=2,col=yan[1],pch=pcc[1],type="b")
                              lines(uy,z5,lwd=1.5,lty=2,col=yan[2],pch=pcc[2],type="b")
                              lines(uy,z6,lwd=1.5,lty=2,col=yan[3],pch=pcc[3],type="b")

                              #error.bar(uy,z1,(k1$systd+k1$stdd)/2,col=yan[1])
                              #error.bar(uy,z2,(k2$systd+k2$stdd)/2,col=yan[2])
                              #error.bar(uy,z3,(k3$systd+k3$stdd)/2,col=yan[3])

                              leg<-c("600Hz","1KHz","2KHz")

                              legend("topleft",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n")

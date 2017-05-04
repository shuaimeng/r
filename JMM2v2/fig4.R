library(xlsx)

#读取弯月面高度
n1<-read.xlsx("height.xlsx",sheetName="25g",header=TRUE)
n2<-read.xlsx("height.xlsx",sheetName="30g",header=TRUE)
n3<-read.xlsx("height.xlsx",sheetName="32g",header=TRUE)
n4<-read.xlsx("height.xlsx",sheetName="34g",header=TRUE)

n5<-read.xlsx("height.xlsx",sheetName="25g1",header=TRUE)
n6<-read.xlsx("height.xlsx",sheetName="30g1",header=TRUE)
n7<-read.xlsx("height.xlsx",sheetName="32g1",header=TRUE)
n8<-read.xlsx("height.xlsx",sheetName="34g1",header=TRUE)
#布局
par(mar=c(1.8,2.2,1.4,1),oma=c(2,2,2,2))
layout(matrix(c(1,2), 1, 2,byrow = TRUE))
###error bar####
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

###画图###
plot(n1$no, n1$eva, xlab = expression(f["v"](Hz)),
     ylab=expression(h["m"](um)),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,1000),ylim=c(0,450),col=0)

lines(n1$no,n1$eva,col="red",pch=1,lwd=2,lty=2,type="b",cex=0.7)
lines(n2$no,n2$eva,col="blue",pch=2,lwd=2,lty=2,type="b",cex=0.7)
lines(n3$no,n3$eva,col="black",pch=15,lwd=2,lty=2,type="b",cex=0.7)
lines(n4$no,n4$eva,col="green3",pch=16,lwd=2,lty=2,type="b",cex=0.7)

###error

error.bar(n1$no,n1$eva,n1$std/2,"red")
error.bar(n2$no,n2$eva,n2$std/2,"blue")
error.bar(n3$no,n3$eva,n3$std/2,"black")
error.bar(n4$no,n4$eva,n4$std/2,"green3")

legend("center",c("25g-18nl/min",
                    "30g-18nl/min","32g-18nl/min","34g-18nl/min"),
       pch=c(1,2,15,16),bty="n",col=c("red","blue","black","green3"),lty=2,inset=.06)

###180n/min###

plot(n5$no, n5$eva, xlab = expression(f["v"](Hz)),
     ylab=expression(h["m"](um)),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,1000),ylim=c(0,450),col=0)

lines(n5$no,n5$eva,col="red",pch=1,lwd=2,lty=2,type="b",cex=0.7)
lines(n6$no,n6$eva,col="blue",pch=2,lwd=2,lty=2,type="b",cex=0.7)
lines(n7$no,n7$eva,col="black",pch=15,lwd=2,lty=2,type="b",cex=0.7)
lines(n8$no,n8$eva,col="green3",pch=16,lwd=2,lty=2,type="b",cex=0.7)

###error

error.bar(n5$no,n5$eva,n5$std/2,"red")
error.bar(n6$no,n6$eva,n6$std/2,"blue")
error.bar(n7$no,n7$eva,n7$std/2,"black")
error.bar(n8$no,n8$eva,n8$std/2,"green3")

legend("center",c("25g-180nl/min",
                    "30g-180nl/min","32g-180nl/min","34g-180nl/min"),
       pch=c(1,2,15,16),bty="n",col=c("red","blue","black","green3"),lty=2,inset=.06)

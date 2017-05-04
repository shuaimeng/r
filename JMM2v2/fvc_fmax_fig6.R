library(xlsx)

###读取fvc和fmax的数据

vc<-read.xlsx("fvc.xlsx",sheetName="2kv1",header=TRUE)
max<-read.xlsx("fmax.xlsx",sheetName="2kv",header=TRUE)

###布局###
par(mar=c(1.8,2.2,1.4,1),oma=c(2,2,2,2))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))


####fvc转换电压频率###
plot(vc$q, vc$X25, xlab = expression(Q(nl/min)),
     ylab=expression(f["vc"](Hz)),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,400),ylim=c(0,1000),col=0)

lines(vc$q,vc$X25,col="red",pch=1,lwd=2,lty=2,type="b")
lines(vc$q,vc$X30,col="blue",pch=2,lwd=2,lty=2,type="b")
#lines(vc$q,vc$X32,col="black",pch=15,lwd=2,lty=2,type="b")
lines(vc$q,vc$X34,col="green3",pch=15,lwd=2,lty=2,type="b")

legend("topright",c("25g",
                    "30g","34g"),
       pch=c(1,2,15),bty="n",col=c("red","blue","green3"),lty=2,inset=.03)


####fmax最大电压频率###
plot(max$q, max$X25, xlab = expression(Q(nl/min)),
     ylab=expression(f["max"](Hz)),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,400),ylim=c(0,4000),col=0)

lines(max$q,max$X25,col="red",pch=1,lwd=2,lty=2,type="b")
lines(max$q,max$X30,col="blue",pch=2,lwd=2,lty=2,type="b")
#lines(max$q,max$X32,col="black",pch=15,lwd=2,lty=2,type="b")
lines(max$q,max$X34,col="green3",pch=15,lwd=2,lty=2,type="b")

legend("topright",c("25g",
                    "30g","34g"),
       pch=c(1,2,15),bty="n",col=c("red","blue","green3"),lty=2,inset=.03)

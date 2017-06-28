dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/voltage")

#对单个内容进行画图分析，尝试记录单个内容的pdf图片格式
#文件名：voltage_stable , OV电压与BV电压之差，即stable 稳定电压与三种液体之间随流量、极间距离、针头直径变化的影响

library(xlsx)

#读取v~Q的数据
eq<-read.xlsx("voltage.xls",sheetName="ethanol_d",header=TRUE)
aq<-read.xlsx("voltage.xls",sheetName="acetone_d",header=TRUE)
iq<-read.xlsx("voltage.xls",sheetName="iso_d",header=TRUE)

plot(eq$d, eq$va,  col=0, xaxs="i", xlim=c(0.5,4.5), ylim=c(1, 3.3),xlab=expression(italic(Distance)(mm)),mgp=c(1, 0,0),tck=0.01,cex.lab=1.1,ylab=expression(italic(V)(kv)))

mtext("Distance",col="black",3,line=-1,font=2,cex=1)

###error bar####
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

###lines##
yan<-c("red","red","blue","blue","green3","green3")
pch<-c(1,2,1,2,1,2)

lines(eq$d,eq$vaeva,col=yan[1],pch=1,lwd=2,lty=4,type="b")
lines(eq$d,eq$vbeva,col=yan[2],pch=2,lwd=2,lty=4,type="b")
lines(aq$d,aq$vaeva,col=yan[3],pch=1,lwd=2,lty=4,type="b")
lines(aq$d,aq$vbeva,col=yan[4],pch=2,lwd=2,lty=4,type="b")
lines(iq$d,iq$vaeva,col=yan[5],pch=1,lwd=2,lty=4,type="b")
lines(iq$d,iq$vbeva,col=yan[6],pch=2,lwd=2,lty=4,type="b")

error.bar(eq$d,eq$vaeva,eq$vastd/2,col=yan[1])
error.bar(eq$d,eq$vbeva,eq$vbstd/2,col=yan[2])

error.bar(aq$d,aq$vaeva,aq$vastd/2,col=yan[3])
error.bar(aq$d,aq$vbeva,aq$vbstd/2,col=yan[4])

error.bar(iq$d,iq$vaeva,iq$vastd/2,col=yan[5])
error.bar(iq$d,iq$vbeva,iq$vbstd/2,col=yan[6])

leg<-c("ethanol-Von","ethanol-Vbr","acetone-Von","acetone-Vbr","iso-Von","iso-Vbr")

legend("bottomright",legend=leg, col=yan, pch=c(1,2,1,2,1,2),bty="n",lwd=2,lty=2,inset=.01,cex=0.8)

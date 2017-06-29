dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/voltage")


##raeding datas of flow rates
eq<-read.xlsx("voltage.xls",sheetName="ethanol_q",header=TRUE)
aq<-read.xlsx("voltage.xls",sheetName="acetone_q",header=TRUE)
iq<-read.xlsx("voltage.xls",sheetName="iso_q",header=TRUE)

##
yan<-c("red","blue","green3")

## layout

par(mfrow = c(2,2), mar = c(2,2.4,0.8,1), oma = c(1,1,1,1))
layout(matrix(c(1,2,3),3,1,byrow = TRUE))

## flow rates
plot(eq$f, eq$va,  col=0, xaxs="i", xlim=c(-0.002, 0.032), ylim=c(1, 3),
     xlab=expression(italic(Q)(nl/min)),mgp=c(1, 0, 0),tck=0.01,cex.lab=1.1,
     ylab=expression(italic(V)(kv)))

mtext("Flow rate",col="black",3,line=-1,font=2,cex=1)

###lines##
yan<-c("red","red","blue","blue","green3","green3")
pch<-c(1,2,1,2,1,2)

lines(eq$f,eq$seva,col=yan[1],pch=0,lwd=2,lty=4,type="b")
lines(eq$f,aq$seva,col=yan[2],pch=1,lwd=2,lty=4,type="b")
lines(aq$f,iq$seva,col=yan[3],pch=2,lwd=2,lty=4,type="b")

leg<-c("ethanol","acetone","iso")

legend("bottomleft",legend=leg, col=yan, pch=c(0,1,2),bty="n",lwd=2,lty=2,inset=.01,cex=0.8)

## Distance

## Nozzle diameter

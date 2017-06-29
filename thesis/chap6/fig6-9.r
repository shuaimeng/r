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
plot(eq$f, eq$va,  col=0, xaxs="i", xlim=c(-0.002, 0.032), ylim=c(0.4,1.2),
     xlab=expression(italic(Q)(nl/min)),mgp=c(1, 0, 0),tck=0.01,cex.lab=1.1,
     ylab=expression(italic(V)(kv)))

mtext("Flow rate",col="black",3,line=-1.2,font=2,cex=0.9)

lines(eq$f,eq$seva,col=yan[1],pch=0,lwd=2,lty=4,type="b")
lines(aq$f,aq$seva,col=yan[2],pch=1,lwd=2,lty=4,type="b")
lines(iq$f,iq$seva,col=yan[3],pch=2,lwd=2,lty=4,type="b")

leg<-c("ethanol","acetone","iso")

legend("bottomright",legend=leg, col=yan, pch=c(0,1,2),bty="n",lwd=2,lty=2,inset=.01,cex=1)

## Distance

eq<-read.xlsx("voltage.xls",sheetName="ethanol_d",header=TRUE)
aq<-read.xlsx("voltage.xls",sheetName="acetone_d",header=TRUE)
iq<-read.xlsx("voltage.xls",sheetName="iso_d",header=TRUE)

plot(eq$d, eq$va,  col=0, xaxs="i", xlim=c(0.5,4.5), ylim=c(0.6,1.4),xlab=expression(italic(Distance)(mm)),mgp=c(1, 0,0),tck=0.01,cex.lab=1.1,ylab=expression(italic(V)(kv)))

mtext("Distance",col="black",3,line=-1.2,font=2,cex=0.9)

lines(eq$d,eq$seva,col=yan[1],pch=0,lwd=2,lty=4,type="b")
lines(aq$d,aq$seva,col=yan[2],pch=1,lwd=2,lty=4,type="b")
lines(iq$d,iq$seva,col=yan[3],pch=2,lwd=2,lty=4,type="b")

leg<-c("ethanol","acetone","iso")

legend("bottomleft",legend=leg, col=yan, pch=c(0,1,2),bty="n",lwd=2,lty=2,inset=.01,cex=1)

## Nozzle diameter ###

eq<-read.xlsx("voltage.xls",sheetName="ethanol_r",header=TRUE)
aq<-read.xlsx("voltage.xls",sheetName="acetone_r",header=TRUE)
iq<-read.xlsx("voltage.xls",sheetName="iso_r",header=TRUE)

plot(eq$r, eq$va,  col=0, xaxs="i", xlim=c(0.25,0.85), ylim=c(0.6,1.4),xlab=expression(paste(italic(Nozzle)," ",italic(diameter),(mm))),mgp=c(1, 0,0),tck=0.01,cex.lab=1.1,ylab=expression(italic(V)(kv)))

mtext("Nozzles",col="black",3,line=-1.2,font=2,cex=0.9)

lines(eq$r,eq$seva,col=yan[1],pch=0,lwd=2,lty=4,type="b")
lines(aq$r,aq$seva,col=yan[2],pch=1,lwd=2,lty=4,type="b")
lines(iq$r,iq$seva,col=yan[3],pch=2,lwd=2,lty=4,type="b")

leg<-c("ethanol","acetone","iso")

legend("topleft",legend=leg, col=yan, pch=c(0,1,2),bty="n",lwd=2,lty=2,inset=.01,cex=1)

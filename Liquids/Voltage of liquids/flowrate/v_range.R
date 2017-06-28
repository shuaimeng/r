library(xlsx)

#读取v~Q的数据
eq<-read.xlsx("voltage.xls",sheetName="ethanol_q",header=TRUE)
aq<-read.xlsx("voltage.xls",sheetName="acetone_q",header=TRUE)
iq<-read.xlsx("voltage.xls",sheetName="iso_q",header=TRUE)

ed<-read.xlsx("voltage.xls",sheetName="ethanol_d",header=TRUE)
ad<-read.xlsx("voltage.xls",sheetName="acetone_d",header=TRUE)
id<-read.xlsx("voltage.xls",sheetName="iso_d",header=TRUE)

er<-read.xlsx("voltage.xls",sheetName="ethanol_r",header=TRUE)
ar<-read.xlsx("voltage.xls",sheetName="acetone_r",header=TRUE)
ir<-read.xlsx("voltage.xls",sheetName="iso_r",header=TRUE)

###布局

par(mar=c(1.8,2.2,1.4,1),oma=c(2,2,2,2))
layout(matrix(c(1,2,3),3,1,byrow=TRUE))

##流量
plot(eq$f, eq$va,  col=0, xaxs="i", xlim=c(-0.002, 0.032), ylim=c(0.4, 1.5), 
     xlab="Q (ml/min)",main="Flow rate",mgp=c(1, 0, 0),tck=0.02,cex.lab=1.1,
     ylab=expression(V(kv)))

lines(lowess(eq$f,eq$seva,f=2/3,iter=3), col="red", pch=1,lwd=2,lty=4,type="b")
lines(lowess(aq$f,aq$seva,f=2/3,iter=3), col="blue", pch=2,lwd=2,lty=4,type="b")
lines(lowess(iq$f,iq$seva,f=2/3,iter=3), col="green3", pch=3,lwd=2,lty=4,type="b")

leg<-c("ethanol","acetone","iso")
legend("topright",legend=leg,bty="n",pch=c(1,2,3),col=c("red","blue","green3"),lty=4,inset=.06)

##极间距离
plot(ed$d, ed$va,  col=0, xaxs="i", xlim=c(0.5, 4.5), ylim=c(0.6, 1.5),  
     xlab="Distance (mm)",main="Distance",mgp=c(1, 0, 0),tck=0.02,cex.lab=1.1,
     ylab=expression(V(kv)))

lines(lowess(ed$d,ed$seva,f=2/3,iter=3), col="red", pch=1,lwd=2,lty=4,type="b")
lines(lowess(ad$d,ad$seva,f=2/3,iter=3), col="blue", pch=2,lwd=2,lty=4,type="b")
lines(lowess(id$d,id$seva,f=2/3,iter=3), col="green3", pch=3,lwd=2,lty=4,type="b")

leg<-c("ethanol","acetone","iso")
legend("topright",legend=leg,bty="n",pch=c(1,2,3),col=c("red","blue","green3"),lty=4,inset=.06)

##针头
plot(er$r, er$va,  col=0, xaxs="i",  xlim=c(0.25, 0.85), ylim=c(0.6, 1.5), 
     xlab="Nozzle diameter (mm)",main="Nozzle",mgp=c(1, 0, 0),tck=0.02,cex.lab=1.1,
     ylab=expression(V(kv)))

lines(lowess(er$r,er$seva,f=2/3,iter=3), col="red", pch=1,lwd=2,lty=4,type="b")
lines(lowess(ar$r,ar$seva,f=2/3,iter=3), col="blue", pch=2,lwd=2,lty=4,type="b")
lines(lowess(ir$r,ir$seva,f=2/3,iter=3), col="green3", pch=3,lwd=2,lty=4,type="b")

leg<-c("ethanol","acetone","iso")
legend("topright",legend=leg,bty="n",pch=c(1,2,3),col=c("red","blue","green3"),lty=4,inset=.06)
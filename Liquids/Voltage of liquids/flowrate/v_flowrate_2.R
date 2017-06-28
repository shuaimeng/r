library(xlsx)

#读取v~Q的数据
eq<-read.xlsx("voltage.xls",sheetName="ethanol_q",header=TRUE)
aq<-read.xlsx("voltage.xls",sheetName="acetone_q",header=TRUE)
iq<-read.xlsx("voltage.xls",sheetName="iso_q",header=TRUE)

plot(eq$f, eq$va,  col=0, xaxs="i", xlim=c(-0.002, 0.032), ylim=c(0.4, 1.4), 
     xlab="Q (ml/min)",main="Voltage range",mgp=c(1, 0, 0),tck=0.02,cex.lab=1.1,
     ylab=expression(V(kv)))

lines(lowess(eq$f,eq$seva,f=2/3,iter=3), col="red", pch=1,lwd=2,lty=4,type="b")
lines(lowess(aq$f,aq$seva,f=2/3,iter=3), col="blue", pch=2,lwd=2,lty=4,type="b")
lines(lowess(iq$f,iq$seva,f=2/3,iter=3), col="green3", pch=3,lwd=2,lty=4,type="b")

leg<-c("ethanol","acetone","iso")
legend("topright",legend=leg,bty="n",pch=c(1,2,3),col=c("red","blue","green3"),lty=4,inset=.06)
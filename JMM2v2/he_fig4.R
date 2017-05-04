library(xlsx)

#四个针头的弯月面高度
he25<-read.xlsx("he.xlsx",sheetName="25g",header=TRUE)
he30<-read.xlsx("he.xlsx",sheetName="30g",header=TRUE)
he32<-read.xlsx("he.xlsx",sheetName="32g",header=TRUE)
he34<-read.xlsx("he.xlsx",sheetName="34g",header=TRUE)


###布局###
# par(mar=c(2,2,1.4,1),oma=c(2,2,2,2))
# layout(matrix(c(1,1,2,3), 2, 2,byrow = TRUE))


# ###画图：18nl/min时的弯月面高度
# plot(he25$fv, he25$X18, xlab = expression(f["v"](Hz)),
#      ylab=expression(h["m"](um)),mgp=c(1, 0, 0),tck=0.02,xlim=c(0,1000),ylim=c(0,450),col=0)
# 
# lines(he25$fv,he25$X18,col="red",pch=1,lwd=2,lty=2,type="b",cex=1)
# lines(he30$fv,he30$X18,col="blue",pch=2,lwd=2,lty=2,type="b",cex=1)
# lines(he32$fv,he32$X18,col="black",pch=15,lwd=2,lty=2,type="b",cex=1)
# lines(he34$fv,he34$X18,col="green3",pch=16,lwd=2,lty=2,type="b",cex=1)
# 
# title(main="18nlmin",line=0.5)
# 
# legend("topright",c("25g",
#                     "30g","32g","34g"),
#        pch=c(1,2,15,16),bty="n",col=c("red","blue","black","green3"),inset=.1)
# 
# 
# ####画图54nl/min
# plot(he25$fv, he25$X54, xlab = expression(f["v"](Hz)),
#      ylab=expression(h["m"](um)),mgp=c(1, 0, 0),tck=0.02,xlim=c(0,1000),ylim=c(0,450),col=0)
# 
# lines(he25$fv,he25$X54,col="red",pch=1,lwd=2,lty=2,type="b",cex=1)
# lines(he30$fv,he30$X54,col="blue",pch=2,lwd=2,lty=2,type="b",cex=1)
# lines(he32$fv,he32$X54,col="black",pch=15,lwd=2,lty=2,type="b",cex=1)
# lines(he34$fv,he34$X54,col="green3",pch=16,lwd=2,lty=2,type="b",cex=1)
# 
# title(main="54nlmin",line=0.5)
# 
# legend("topright",c("25g",
#                     "30g","32g","34g"),
#        pch=c(1,2,15,16),bty="n",col=c("red","blue","black","green3"),inset=.1)
# 

####画图180nlmin###

plot(he25$fv, he25$X180, xlab = expression(f["v"](Hz)),
     ylab=expression(h["m"](um)),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,1000),ylim=c(0,450),col=0)

lines(he25$fv,he25$X180,col="red",pch=1,lwd=2,lty=2,type="b",cex=1)
lines(he30$fv,he30$X180,col="blue",pch=2,lwd=2,lty=2,type="b",cex=1)
lines(he32$fv,he32$X180,col="black",pch=15,lwd=2,lty=2,type="b",cex=1)
lines(he34$fv,he34$X180,col="green3",pch=16,lwd=2,lty=2,type="b",cex=1)

#title(main="180nlmin",line=0.5)


legend("topright",c("25g",
                    "30g","32g","34g"),
       pch=c(1,2,15,16),bty="n",col=c("red","blue","black","green3"),lty=2,inset=.1)

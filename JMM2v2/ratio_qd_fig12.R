library(xlsx)


###读取
#针头为30g
n1<-read.xlsx("he-30g.xlsx",sheetName="2kv18",header=TRUE)
n2<-read.xlsx("he-30g.xlsx",sheetName="2kv54",header=TRUE)
n3<-read.xlsx("he-30g.xlsx",sheetName="2kv180",header=TRUE)

#针头为32g
n4<-read.xlsx("he-32g.xlsx",sheetName="2kv18",header=TRUE)
n5<-read.xlsx("he-32g.xlsx",sheetName="2kv54",header=TRUE)
n6<-read.xlsx("he-32g.xlsx",sheetName="2kv180",header=TRUE)

#针头为34g
n7<-read.xlsx("he-34g.xlsx",sheetName="2kv18",header=TRUE)
n8<-read.xlsx("he-34g.xlsx",sheetName="2kv54",header=TRUE)
n9<-read.xlsx("he-34g.xlsx",sheetName="2kv180",header=TRUE)

yan<-rainbow(9)
##画图##
plot(n1$fv, n1$d_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(D/d["d"]),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(600,3400),ylim=c(2,25),col=0)


lines(lowess(n1$fv,1/n1$d_eRn,f=1/4,iter=3),col=yan[1],pch=1,lwd=1.5,lty=2,type="b",cex=0.8)
lines(lowess(n4$fv,1/n4$d_eRn,f=1/4,iter=3),col=yan[2],pch=2,lwd=1.5,lty=2,type="b",cex=0.8)
lines(lowess(n2$fv,1/n2$d_eRn,f=1/4,iter=3),col=yan[3],pch=3,lwd=1.5,lty=2,type="b",cex=0.8)

lines(lowess(n7$fv,1/n7$d_eRn,f=1/4,iter=3),col=yan[4],pch=4,lwd=1.5,lty=2,type="b",cex=0.8)
lines(lowess(n5$fv,1/n5$d_eRn,f=1/4,iter=3),col=yan[5],pch=5,lwd=1.5,lty=2,type="b",cex=0.8)
lines(lowess(n3$fv,1/n3$d_eRn,f=1/4,iter=3),col=yan[6],pch=6,lwd=1.5,lty=2,type="b",cex=0.8)

lines(lowess(n8$fv,1/n8$d_eRn,f=1/4,iter=3),col=yan[7],pch=7,lwd=1.5,lty=2,type="b",cex=0.8)
lines(lowess(n6$fv,1/n6$d_eRn,f=1/4,iter=3),col=yan[8],pch=22,lwd=1.5,lty=2,type="b",cex=0.8)
lines(lowess(n9$fv,1/n9$d_eRn,f=1/4,iter=3),col=yan[9],pch=24,lwd=1.5,lty=2,type="b",cex=0.8)

leg<-c("18nl/min-30G","18nl/min-32G","54nl/min-30G",
       "18nl/min-34G","54nl/min-32G",
       "180nl/min-30G","54nl/min-34G","180nl/min-32G","180nl/min-34G")
pchc<-c(1,2,3,4,5,6,7,8,9)

legend("topleft",legend=leg,col=yan,pch=pchc,bty="n",lwd=1.5,lty=2,inset=.05,cex=1)


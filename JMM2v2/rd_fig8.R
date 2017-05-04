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

# #针头为25G
 n10<-read.xlsx("he-25g.xlsx",sheetName="2kv18",header=TRUE)
 n11<-read.xlsx("he-25g.xlsx",sheetName="2kv54",header=TRUE)
 n12<-read.xlsx("he-25g.xlsx",sheetName="2kv180",header=TRUE)


###布局###
par(mar=c(2,2,1.4,1),oma=c(2,2,2,2))
layout(matrix(c(1,1,2,3), 2, 2,byrow = TRUE))

####18nl/min###
plot(n1$fv, n1$d_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(d["d"](um)),mgp=c(1, 0, 0),tck=0.02,xlim=c(0,3400),ylim=c(0,80),col=0)

title(main="18nlmin",line=0.5)
#30g,32g,34g##
lines(lowess(n10$fv,n10$d_r,f=1/4,iter=3),col="green3",pch=1,lwd=1.5,lty=2,type="b",cex=0.8)

lines(lowess(n1$fv,n1$d_e,f=1/4,iter=3),col="red",pch=2,lwd=1.5,lty=2,type="b",cex=0.8)
lines(lowess(n4$fv,n4$d_e,f=1/4,iter=3),col="blue",pch=3,lwd=1.5,lty=2,type="b",cex=0.8)
lines(lowess(n7$fv,n7$d_e,f=1/4,iter=3),col="black",pch=16,lwd=1.5,lty=2,type="b",cex=0.8)

legend("topright",c("25G","30g","32g","34g"),col=c("green3","red","blue","black"),pch=c(1,2,15,16),lwd=1.5,lty=2,bty="n",inset=.05)

####54nl/min###
plot(n2$fv, n2$d_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(d["d"](um)),mgp=c(1, 0, 0),tck=0.02,xlim=c(0,3000),ylim=c(0,80),col=0)

title(main="54nlmin",line=0.5)
#30g,32g,34g##
lines(lowess(n11$fv,n11$d_r,f=1/4,iter=3),col="green3",pch=1,lwd=1.5,lty=2,type="b",cex=0.8)

lines(lowess(n2$fv,n2$d_e,f=1/4,iter=3),col="red",pch=2,lwd=1.5,lty=2,type="b",cex=0.8)
lines(lowess(n5$fv,n5$d_e,f=1/4,iter=3),col="blue",pch=15,lwd=1.5,lty=2,type="b",cex=0.8)
lines(lowess(n8$fv,n8$d_e,f=1/4,iter=3),col="black",pch=16,lwd=1.5,lty=2,type="b",cex=0.8)

legend("topright",c("25G","30g","32g","34g"),col=c("green3","red","blue","black"),pch=c(1,2,15,16),lwd=1.5,lty=2,bty="n",inset=.05)


####180nl/min###
plot(n3$fv, n3$d_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(d["d"](um)),mgp=c(1, 0, 0),tck=0.02,xlim=c(0,3500),ylim=c(0,80),col=0)

title(main="180nlmin",line=0.5)
#30g,32g,34g##
lines(lowess(n12$fv,n12$d_r,f=1/4,iter=3),col="green3",pch=1,lwd=1.5,lty=2,type="b",cex=0.8)

lines(lowess(n3$fv,n3$d_e,f=1/4,iter=3),col="red",pch=2,lwd=1.5,lty=2,type="b",cex=0.8)
lines(lowess(n6$fv,n6$d_e,f=1/4,iter=3),col="blue",pch=15,lwd=1.5,lty=2,type="b",cex=0.8)
lines(lowess(n9$fv,n9$d_e,f=1/4,iter=3),col="black",pch=16,lwd=1.5,lty=2,type="b",cex=0.8)

legend("topright",c("25G","30g","32g","34g"),col=c("green3","red","blue","black"),pch=c(1,2,15,16),lwd=1.5,lty=2,bty="n",inset=.05)

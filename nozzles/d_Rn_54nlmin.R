library(xlsx)

#读取fv~he的数据
#在同三个nozzle内（30g，32g，34g）内，9组不同
#不同流量不同针头下的数据

#针头为30g
na<-read.xlsx("he-30g.xlsx",sheetName="2kv18",header=TRUE)
nb<-read.xlsx("he-30g.xlsx",sheetName="2kv54",header=TRUE)
nc<-read.xlsx("he-30g.xlsx",sheetName="2kv180",header=TRUE)

na16<-read.xlsx("he-30g.xlsx",sheetName="16kv",header=TRUE)
na18<-read.xlsx("he-30g.xlsx",sheetName="18kv",header=TRUE)
na22<-read.xlsx("he-30g.xlsx",sheetName="22kv",header=TRUE)
na360<-read.xlsx("he-30g.xlsx",sheetName="2kv360",header=TRUE)

#针头为32g
nd<-read.xlsx("he-32g.xlsx",sheetName="2kv18",header=TRUE)
ne<-read.xlsx("he-32g.xlsx",sheetName="2kv54",header=TRUE)
nf<-read.xlsx("he-32g.xlsx",sheetName="2kv180",header=TRUE)

nb18<-read.xlsx("he-32g.xlsx",sheetName="18kv",header=TRUE)
nb22<-read.xlsx("he-32g.xlsx",sheetName="22kv",header=TRUE)

#针头为34g
ng<-read.xlsx("he-34g.xlsx",sheetName="2kv18",header=TRUE)
nh<-read.xlsx("he-34g.xlsx",sheetName="2kv54",header=TRUE)
ni<-read.xlsx("he-34g.xlsx",sheetName="2kv180",header=TRUE)

nc18<-read.xlsx("he-34g.xlsx",sheetName="18kv",header=TRUE)
nc360<-read.xlsx("he-34g.xlsx",sheetName="2kv360",header=TRUE)


#针头为25G
nj<-read.xlsx("he-25g.xlsx",sheetName="2kv18",header=TRUE)
nk<-read.xlsx("he-25g.xlsx",sheetName="2kv54",header=TRUE)
nl<-read.xlsx("he-25g.xlsx",sheetName="2kv180",header=TRUE)

nd1<-read.xlsx("he-25g.xlsx",sheetName="22kv54",header=TRUE)
nd2<-read.xlsx("he-25g.xlsx",sheetName="22kv180",header=TRUE)

#par(mfrow = c(2,2), mar = c(2,2.6,2,2), oma = c(1,1,1,1))


###画图###
###
plot(na$fv, na$he_ra, xlab = expression(log(q["d"])),
     ylab=expression(D/d["d"]),mgp=c(1, 0, 0),tck=0.02,
     xlim=c(-6,5),ylim=c(0,16),col=0)

#30g
#a<-log(500*18/(na$fv*60*3.1^3))
a<-log(500*54/(nb$fv*60*3.1^3))
#a<-log(500*180/(nc$fv*60*3.1^3))

#points(lowess(a,na$d_eRn,f=1/4,iter=3),col="red",pch=1,lwd=2,lty=2)
points(lowess(a,1/nb$d_eRn,f=1/4,iter=3),col="red",pch=1,lwd=2,lty=2)
#points(lowess(a,nc$d_eRn,f=1/4,iter=3),col="red",pch=1,lwd=2,lty=2)

#32g
#b<-log(500*18/(nd$fv*60*2.3^3))
b<-log(500*54/(ne$fv*60*2.3^3))
#b<-log(500*180/(nf$fv*60*2.3^3))

#points(lowess(b,nd$d_eRn,f=1/4,iter=3),col="blue",pch=2,lwd=2,lty=2)
points(lowess(b,1/ne$d_eRn,f=1/4,iter=3),col="blue",pch=2,lwd=2,lty=2)
#points(lowess(c,nf$d_eRn,f=1/4,iter=3),col="blue",pch=2,lwd=2,lty=2)

#34g
#c<-log(500*18/(ng$fv*60*1.9^3))
c<-log(500*54/(nh$fv*60*1.9^3))
#c<-log(500*180/(ni$fv*60*1.9^3))

#points(lowess(c,ng$d_eRn,f=1/4,iter=3),col="black",pch=15,lwd=2,lty=2)
points(lowess(c,1/nh$d_eRn,f=1/4,iter=3),col="black",pch=15,lwd=2,lty=2)
#points(lowess(c,ni$d_eRn,f=1/4,iter=3),col="black",pch=15,lwd=2,lty=2)

title(main="d/D ~ Q_e in 54nlmin",line=0.5)

legend("bottom",c("30g","32g","34g"),
       pch=c(1,2,15),bty="n",col=c("red","blue","black"),inset=.1)



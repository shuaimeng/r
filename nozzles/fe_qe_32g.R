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
plot(na$fv, na$he_ra, xlab = expression(paste("log(","Qk","/",f["v"],D^"3",")")),
     ylab=expression(log(f["e"])),mgp=c(1, 0, 0),tck=0.02,
     xlim=c(-6,5),ylim=c(-2,8),col=0)


a<-log(500*18/(nd$fv*60*2.3^3))
a1<-log((500/nd$fv - nd$tf)/nd$tp)

b<-log(500*54/(ne$fv*60*2.3^3))
b1<-log((500/ne$fv - ne$tf)/ne$tp)

c<-log(500*180/(nf$fv*60*2.3^3))
c1<-log((500/nf$fv - nf$tf)/nf$tp)
#d<-log(500*360/(nc360$fv*60*1.9^3))

points(lowess(a,a1,f=1/4,iter=3),col="red",pch=1,lwd=2,lty=2)
points(lowess(b,b1,f=1/4,iter=3),col="blue",pch=2,lwd=2,lty=2)
points(lowess(c,c1,f=1/4,iter=3),col="black",pch=15,lwd=2,lty=2)
#points(lowess(d,nc360$d_eRn,f=1/4,iter=3),col="green3",pch=16,lwd=2,lty=2)

abline(lm(a1~a),col="red",lty=4)
abline(lm(b1~b),col="blue",lty=4)
abline(lm(c1~c),col="black",lty=4)

title(main="32G",line=0.5)

legend("bottomright",c("18nlmin","54nlmin","180nlmin"),
       pch=c(1,2,15),bty="n",col=c("red","blue","black"),inset=.1)



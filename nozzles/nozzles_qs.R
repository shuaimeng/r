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

par(mfrow = c(2,2), mar = c(2,2.6,2,2), oma = c(1,1,1,1))


###画图###

plot(na$fv, na$he_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(h["m"](um)),mgp=c(1, 0, 0),tck=0.02,ylim=c(0,300),col=0)


#25g
#points(lowess(nj$fv,nj$he_r,f=1/4,iter=3),col="red",pch=1,lwd=2,lty=2)
#points(lowess(nk$fv,nk$he_r,f=1/4,iter=3),col="red",pch=1,lwd=2,lty=2)
#points(lowess(nl$fv,nl$he_r,f=1/4,iter=3),col="green3",pch=3,lwd=2,lty=2)
#points(lowess(na360$fv,na360$he_r,f=1/4,iter=3),col="green3",pch=4,lwd=2,lty=2)



#30g
points(lowess(na$fv,na$he_r,f=1/4,iter=3),col="red",pch=1,lwd=2,lty=2)
points(lowess(nb$fv,nb$he_r,f=1/4,iter=3),col="blue",pch=1,lwd=2,lty=2)
points(lowess(nc$fv,nc$he_r,f=1/4,iter=3),col="green3",pch=1,lwd=2,lty=2)
#points(lowess(na360$fv,na360$he_r,f=1/4,iter=3),col="green3",pch=4,lwd=2,lty=2)

#32g
points(lowess(nd$fv,nd$he_r,f=1/4,iter=3),col="red",pch=2,lwd=2,lty=2)
points(lowess(ne$fv,ne$he_r,f=1/4,iter=3),col="blue",pch=2,lwd=2,lty=2)
points(lowess(nf$fv,nf$he_r,f=1/4,iter=3),col="green3",pch=2,lwd=2,lty=2)


#34g
points(lowess(ng$fv,ng$he_r,f=1/4,iter=3),col="red",pch=15,lwd=2,lty=2)
points(lowess(nh$fv,nh$he_r,f=1/4,iter=3),col="blue",pch=15,lwd=2,lty=2)
points(lowess(ni$fv,ni$he_r,f=1/4,iter=3),col="green3",pch=15,lwd=2,lty=2)
#points(lowess(nc360$fv,nc360$he_r,f=1/4,iter=3),col="green3",pch=4,lwd=2,lty=2)


title(main="Meniscus height in All",line=0.5)

legend("top",c("30g-18nlmin","30g-54nlmin","30g-180nlmin",
                  "32g-18nlmin","32g-54nlmin","32g-180nlmin",
                  "34g-18nlmin","34g-54nlmin","34g-180nlmin"),
       pch=c(1,1,1,2,2,2,15,15,15),bty="n",col=c("red","blue","green3",
                                                  "red","blue","green3",
                                                  "red","blue","green3"),inset=.02)



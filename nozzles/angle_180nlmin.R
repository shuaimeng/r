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
plot(na$fv, na$an, xlab = expression(f["v"](Hz)),
     ylab=expression(Angle),mgp=c(1, 0, 0),
     tck=0.02,xlim=c(0,3500),ylim=c(10,60),col=0)


#25g
#lines(lowess(nj$fv,(atan(nj$an)*180/pi),f=1/4,iter=4),col="red",pch=1,lwd=2,lty=2,type="b")
#lines(lowess(nk$fv,(atan(nk$an)*180/pi),f=1/4,iter=3),col="red",pch=1,lwd=2,lty=2,type="b")
lines(lowess(nl$fv,(atan(nl$an)*180/pi),f=1/4,iter=3),col="red",pch=1,lwd=2,lty=2,type="b")
#lines(lowess(na360$fv,na360$an,f=1/4,iter=3),col="green3",pch=4,lwd=2,lty=2,type="b")



#30g
#lines(lowess(na$fv,(atan(na$an)*180/pi),f=1/4,iter=3),col="blue",pch=2,lwd=2,lty=2,type="b")
#lines(lowess(nb$fv,(atan(nb$an)*180/pi),f=1/4,iter=3),col="blue",pch=2,lwd=2,lty=2,type="b")
lines(lowess(nc$fv,(atan(nc$an)*180/pi),f=1/4,iter=3),col="blue",pch=2,lwd=2,lty=2,type="b")
#lines(lowess(na360$fv,na360$an,f=1/4,iter=3),col="blue",pch=2,lwd=2,lty=2,type="b")

#32g
#lines(lowess(nd$fv,(atan(nd$an)*180/pi),f=1/4,iter=3),col="black",pch=15,lwd=2,lty=2,type="b")
#lines(lowess(ne$fv,(atan(ne$an)*180/pi),f=1/4,iter=3),col="black",pch=15,lwd=2,lty=2,type="b")
lines(lowess(nf$fv,(atan(nf$an)*180/pi),f=1/4,iter=3),col="black",pch=15,lwd=2,lty=2,type="b")


#34g
#lines(lowess(ng$fv,(atan(ng$an)*180/pi),f=1/4,iter=3),col="green3",pch=16,lwd=2,lty=2,type="b")
#lines(lowess(nh$fv,(atan(nh$an)*180/pi),f=1/4,iter=3),col="green3",pch=16,lwd=2,lty=2,type="b")
lines(lowess(ni$fv,(atan(ni$an)*180/pi),f=1/4,iter=3),col="green3",pch=16,lwd=2,lty=2,type="b")
#lines(lowess(nc360$fv,nc360$an,f=1/4,iter=3),col="green3",pch=16,lwd=2,lty=2,type="b")


title(main="Angles in 180nlmin",line=0.5)

legend("top",c("25g","30g","32g","34g"),
       pch=c(1,2,15,16),bty="n",col=c("red","blue","black","green3"),inset=.1)



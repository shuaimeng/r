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
plot(na$fv, na$d_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(f["e"](Hz)),mgp=c(1, 0, 0),tck=0.02,xlim=c(0,500),ylim=c(0,250),col=0)


#25g
#lines(lowess(nj$fv,((500/nj$fv - nj$tf)/nj$tp),f=1/4,iter=3),col="red",pch=1,lwd=2,lty=2)
lines(nk$fv,((500/nk$fv - nk$tf)/nk$tp),col="red",pch=1,lwd=2,lty=2,type="b")
#lines(nd1$fv,nd1$d_r,col="red",pch=15,lwd=2,lty=2)
#lines(nd2$fv,nd2$d_r,col="blue",pch=16,lwd=2,lty=2)



#30g
#lines(lowess(na$fv,((500/na$fv - na$tf)/na$tp),f=1/4,iter=3),col="blue",pch=2,lwd=2,lty=2,type="b")
lines(nb$fv,((500/nb$fv - nb$tf)/nb$tp),col="blue",pch=2,lwd=2,lty=2,type="b")
#lines(lowess(nc$fv,nc$d_r,f=1/4,iter=3),col="black",pch=15,lwd=2,lty=2,type="b")
#lines(lowess(na22$fv,na22$d_r,f=1/4,iter=3),col="green3",pch=16,lwd=2,lty=2,type="b")

#32g
#lines(lowess(nd$fv,((500/nd$fv - nd$tf)/nd$tp),f=1/4,iter=3),col="black",pch=15,lwd=2,lty=2,type="b")
lines(ne$fv,((500/ne$fv - ne$tf)/ne$tp),col="black",pch=15,lwd=2,lty=2,type="b")
#lines(lowess(nb22$fv,nb22$d_r,f=1/4,iter=3),col="black",pch=15,lwd=2,lty=2,type="b")


#34g
#lines(lowess(ng$fv,((500/ng$fv - ng$tf)/ng$tp),f=1/4,iter=3),col="green3",pch=16,lwd=2,lty=2,type="b")
lines(nh$fv,((500/nh$fv - nh$tf)/nh$tp),col="green3",pch=16,lwd=2,lty=2,type="b")
#lines(lowess(ni$fv,ni$d_r,f=1/4,iter=3),col="black",pch=15,lwd=2,lty=2,type="b")
#lines(lowess(nc360$fv,nc360$d_r,f=1/4,iter=3),col="green3",pch=16,lwd=2,lty=2,type="b")

title(main="Fe in 54nlmin",line=0.5)

legend("topright",c("25g",
                    "30g","32g","34g"),
       pch=c(1,2,15,16),bty="n",col=c("red","blue","black","green3"),inset=.1)



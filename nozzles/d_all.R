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
     ylab=expression(d["d"](um)),mgp=c(1, 0, 0),tck=0.02,xlim=c(0,3500),ylim=c(0,100),col=0)


#25g
#points(nj$fv,nj$d_r,col="red",pch=1,lwd=2,lty=2)
#points(nk$fv,nk$d_r,col="blue",pch=2,lwd=2,lty=2)
#points(nl$fv,nl$d_r,col="black",pch=15,lwd=2,lty=2)
#points(na360$fv,na360$d_r,col="green3",pch=16,lwd=2,lty=2,type="b")



#30g
lines(lowess(na$fv,na$d_e,f=1/4,iter=3),col="red",pch=1,lwd=2,lty=2,type="b")
#arrows(na$fv,(na$d_e+0.5*na$sd),na$fv,(na$d_e-0.5*na$sd), length=0.05,angle=90,code=3)

lines(lowess(nb$fv,nb$d_e,f=1/4,iter=3),col="red",pch=2,lwd=2,lty=2,type="b")
#arrows(nb$fv,(nb$d_e+0.5*nb$sd),nb$fv,(nb$d_e-0.5*nb$sd), length=0.05,angle=90,code=3)

lines(lowess(nc$fv,nc$d_e,f=1/4,iter=3),col="red",pch=15,lwd=2,lty=2,type="b")
#arrows(nc$fv,(nc$d_e+0.5*nc$sd),nc$fv,(nc$d_e-0.5*nc$sd), length=0.05,angle=90,code=3)

#lines(lowess(na360$fv,na360$d_r,f=1/4,iter=3),col="green3",pch=16,lwd=2,lty=2,type="b")

#32g
lines(lowess(nd$fv,nd$d_e,f=1/4,iter=3),col="blue",pch=1,lwd=2,lty=2,type="b")
lines(lowess(ne$fv,ne$d_e,f=1/4,iter=3),col="blue",pch=2,lwd=2,lty=2,type="b")
lines(lowess(nf$fv,nf$d_e,f=1/4,iter=3),col="blue",pch=15,lwd=2,lty=2,type="b")


#34g
lines(lowess(ng$fv,ng$d_e,f=1/4,iter=3),col="black",pch=1,lwd=2,lty=2,type="b")
lines(lowess(nh$fv,nh$d_e,f=1/4,iter=3),col="black",pch=2,lwd=2,lty=2,type="b")
lines(lowess(ni$fv,ni$d_e,f=1/4,iter=3),col="black",pch=15,lwd=2,lty=2,type="b")
#lines(lowess(nc360$fv,nc360$d_r,f=1/4,iter=3),col="green3",pch=4,lwd=2,lty=2,type="b")

title(main="Droplet in all",line=0.5)

legend("topright",c("30g-18","30g-54","30g-180","32g-18","32g-54",
                       "32g-180","34g-18","34g-54","34g-180"),
       pch=c(1,2,15,1,2,15,1,2,15),bty="n",col=c("red","red","red","blue",
                                                 "blue","blue","black","black","black"),inset=.05)



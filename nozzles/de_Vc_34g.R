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
     ylab=expression(d["d"](um)),mgp=c(1, 0, 0),tck=0.02,xlim=c(0,3500),ylim=c(0,80),col=0)


lines(lowess(nc18$fv,nc18$d_e,f=1/4,iter=3),col="red",pch=1,lwd=2,lty=2,type="b")
#arrows(nd$fv,(nd$d_e+0.5*nd$sd),nd$fv,(nd$d_e-0.5*nd$sd), length=0.05,angle=90,code=3)


lines(lowess(ni$fv,ni$d_e,f=1/4,iter=3),col="blue",pch=2,lwd=2,lty=2,type="b")
#arrows(ne$fv,(ne$d_e+0.5*ne$sd),ne$fv,(ne$d_e-0.5*ne$sd), length=0.05,angle=90,code=3)


#arrows(nf$fv,(nf$d_e+0.5*nf$sd),nf$fv,(nf$d_e-0.5*nf$sd), length=0.05,angle=90,code=3)








title(main="Droplet in 34G&Vc",line=0.5)

legend("bottomright",c("1.8kv","2kv"),
       pch=c(1,2),bty="n",col=c("red","blue"),inset=.1)



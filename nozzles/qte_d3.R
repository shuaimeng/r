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


###不同流量下
plot(na$fv, na$d_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(d["d"](um)),mgp=c(1, 0, 0),
     tck=0.02,xlim=c(0,3500),ylim=c(-20,-8),col=0)

q<-c(18,54,180)
#34G
points(ng$fv,log((q[1]*0.5/(ng$fv*(ng$X2ra^3)))),col="red",pch=1)
points(nh$fv,log((q[2]*0.5/(nh$fv*(nh$X2ra^3)))),col="red",pch=2)
points(ni$fv,log((q[3]*0.5/(ni$fv*(ni$X2ra^3)))),col="red",pch=15)
#30G
points(na$fv,log((q[1]*0.5/(na$fv*(na$X2ra^3)))),col="blue",pch=1)
points(nb$fv,log((q[2]*0.5/(nb$fv*(nb$X2ra^3)))),col="blue",pch=2)
points(nc$fv,log((q[3]*0.5/(nc$fv*(nc$X2ra^3)))),col="blue",pch=15)
points(na360$fv,log((q[3]*0.5/(na360$fv*(na360$X2ra^3)))),col="blue",pch=16)



#32G
points(nd$fv,log((q[1]*0.5/(nd$fv*(nd$X2ra^3)))),col="black",pch=1)
points(ne$fv,log((q[2]*0.5/(ne$fv*(ne$X2ra^3)))),col="black",pch=2)
points(nf$fv,log((q[3]*0.5/(nf$fv*(nf$X2ra^3)))),col="black",pch=15)

#25g
points(nj$fv,log((q[1]*0.5/(nj$fv*(nj$X2ra^3)))),col="green3",pch=1)
points(nk$fv,log((q[2]*0.5/(nk$fv*(nk$X2ra^3)))),col="green3",pch=2)
points(nl$fv,log((q[3]*0.5/(nl$fv*(nl$X2ra^3)))),col="green3",pch=15)

###不同针头下
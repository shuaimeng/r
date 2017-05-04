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

#颜色

coll<-c("black","red","green3","blue","cyan",
        "magenta","yellow","darkgreen","gray" )

#标示

pchc<-c(1,2,5,6,16,17,18,19,20)

#he在几个组合下的情况
plot(na$fv, na$he_ra, xlab = expression(f["v"],Hz),
     ylab=expression(h["m"]),mgp=c(1, 0, 0),tck=0.02,ylim=c(0,60),col=0)

title(main="Meniscus height/Q/Rn system",cex.main=1.1,line=0.5)

lines(na$fv,na$d_r,pch=pchc[1],col=coll[1],lwd=1.5)
lines(nb$fv,nb$d_r,pch=pchc[2],col=coll[2],lwd=1.5)
lines(nc$fv,nc$d_r,pch=pchc[3],col=coll[3],lwd=1.5)

lines(nd$fv,nd$d_r,pch=pchc[4],col=coll[4],lwd=1.5)
lines(ne$fv,ne$d_r,pch=pchc[5],col=coll[5],lwd=1.5)
lines(nf$fv,nf$d_r,pch=pchc[6],col=coll[6],lwd=1.5)

lines(ng$fv,ng$d_r,pch=pchc[7],col=coll[7],lwd=1.5)
lines(nh$fv,nh$d_r,pch=pchc[8],col=coll[8],lwd=1.5)
lines(ni$fv,ni$d_r,pch=pchc[9],col=coll[9],lwd=1.5)

legend("bottomright",c("A","B","C","D","E","F","G","H","I"),
                    col=coll,inset=.1, bty="n", pch=pchc)


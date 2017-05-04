library(xlsx)

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

###布局###
par(mar=c(2,2,1.4,1),oma=c(2,2,2,2))
layout(matrix(c(1,1,1,1,1,1,1,1,2,2,3,3,2,2,3,3), 4, 4,byrow = TRUE))
###画图###
#par(fig=c(0,1,0.5,1),new=F)
plot(na$fv, na$d_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(f["e"](Hz)),mgp=c(1, 0, 0),tck=0.02,xlim=c(0,500),ylim=c(0,250),col=0)


#25g
lines(nj$fv,((500/nj$fv - nj$tf)/nj$tp),col="red",pch=1,lwd=2,lty=2,type="b")
#30g
lines(na$fv,((500/na$fv - na$tf)/na$tp),col="blue",pch=2,lwd=2,lty=2,type="b")
#32g
lines(nd$fv,((500/nd$fv - nd$tf)/nd$tp),col="black",pch=15,lwd=2,lty=2,type="b")
#34g
lines(ng$fv,((500/ng$fv - ng$tf)/ng$tp),col="green3",pch=16,lwd=2,lty=2,type="b")

title(main="18nlmin",line=0.5)

legend("topright",c("25g",
                    "30g","32g","34g"),
       pch=c(1,2,15,16),bty="n",col=c("red","blue","black","green3"),inset=.1)

###54nlmin
#par(fig=c(0,1,0.5,1),new=F)
plot(na$fv, na$d_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(f["e"](Hz)),mgp=c(1, 0, 0),tck=0.02,xlim=c(0,500),ylim=c(0,250),col=0)

#25g
lines(nk$fv,((500/nk$fv - nk$tf)/nk$tp),col="red",pch=1,lwd=2,lty=2,type="b")
#30g
lines(nb$fv,((500/nb$fv - nb$tf)/nb$tp),col="blue",pch=2,lwd=2,lty=2,type="b")
#32g
lines(ne$fv,((500/ne$fv - ne$tf)/ne$tp),col="black",pch=15,lwd=2,lty=2,type="b")
#34g
lines(nh$fv,((500/nh$fv - nh$tf)/nh$tp),col="green3",pch=16,lwd=2,lty=2,type="b")

title(main="54nlmin",line=0.5)

legend("topright",c("25g",
                    "30g","32g","34g"),
       pch=c(1,2,15,16),bty="n",col=c("red","blue","black","green3"),inset=.1)

###180nlmin
#par(fig=c(0.5,1,0,0.5),new=F)
plot(na$fv, na$d_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(f["e"](Hz)),mgp=c(1, 0, 0),tck=0.02,xlim=c(0,500),ylim=c(0,250),col=0)
#25g
lines(nl$fv,((500/nl$fv - nl$tf)/nl$tp),col="red",pch=1,lwd=2,lty=2,type="b")
#30g
lines(nc$fv,((500/nc$fv - nc$tf)/nc$tp),col="blue",pch=2,lwd=2,lty=2,type="b")
#32g
lines(nf$fv,((500/nf$fv - nf$tf)/nf$tp),col="black",pch=15,lwd=2,lty=2,type="b")
#34g
lines(ni$fv,((500/ni$fv - ni$tf)/ni$tp),col="green3",pch=16,lwd=2,lty=2,type="b")

title(main="180nlmin",line=0.5)

legend("topright",c("25g",
                    "30g","32g","34g"),
       pch=c(1,2,15,16),bty="n",col=c("red","blue","black","green3"),inset=.1)




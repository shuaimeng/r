dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/jmm2")
library(xlsx)

#针头为25G
nj<-read.xlsx("he-25g.xlsx",sheetName="2kv18",header=TRUE)
nk<-read.xlsx("he-25g.xlsx",sheetName="2kv54",header=TRUE)
nl<-read.xlsx("he-25g.xlsx",sheetName="2kv180",header=TRUE)

#nd1<-read.xlsx("he-25g.xlsx",sheetName="22kv54",header=TRUE)
#nd2<-read.xlsx("he-25g.xlsx",sheetName="22kv180",header=TRUE)

#针头为30g
na<-read.xlsx("he-30g.xlsx",sheetName="2kv18",header=TRUE)
nb<-read.xlsx("he-30g.xlsx",sheetName="2kv54",header=TRUE)
nc<-read.xlsx("he-30g.xlsx",sheetName="2kv180",header=TRUE)

#na16<-read.xlsx("he-30g.xlsx",sheetName="16kv",header=TRUE)
#na18<-read.xlsx("he-30g.xlsx",sheetName="18kv",header=TRUE)
#na22<-read.xlsx("he-30g.xlsx",sheetName="22kv",header=TRUE)
#na360<-read.xlsx("he-30g.xlsx",sheetName="2kv360",header=TRUE)

#针头为32g
nd<-read.xlsx("he-32g.xlsx",sheetName="2kv18",header=TRUE)
ne<-read.xlsx("he-32g.xlsx",sheetName="2kv54",header=TRUE)
nf<-read.xlsx("he-32g.xlsx",sheetName="2kv180",header=TRUE)

#nb18<-read.xlsx("he-32g.xlsx",sheetName="18kv",header=TRUE)
#nb22<-read.xlsx("he-32g.xlsx",sheetName="22kv",header=TRUE)

#针头为34g
ng<-read.xlsx("he-34g.xlsx",sheetName="2kv18",header=TRUE)
nh<-read.xlsx("he-34g.xlsx",sheetName="2kv54",header=TRUE)
ni<-read.xlsx("he-34g.xlsx",sheetName="2kv180",header=TRUE)

#nc18<-read.xlsx("he-34g.xlsx",sheetName="18kv",header=TRUE)
#nc360<-read.xlsx("he-34g.xlsx",sheetName="2kv360",header=TRUE)

###布局###
par(mar=c(2,2.2,1.4,1),oma=c(2,2,2,2))
layout(matrix(c(1,1,2,3), 2, 2,byrow = TRUE))

###error bar####
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

####18nl/min####
plot(nj$fv, nj$feeva, xlab = expression(f["v"](Hz)),
     ylab=expression(f["e"](Hz)),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,500),ylim=c(0,250),col=0)
#25g
lines(nj$fv,nj$feeva,col="red",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)
#30g
lines(na$fv,na$feeva,col="blue",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)
#32g
lines(nd$fv,nd$feeva,col="black",pch=15,lwd=1.5,lty=15,type="b",cex=0.7)
#34g
lines(ng$fv,ng$feeva,col="green3",pch=16,lwd=1.5,lty=2,type="b",cex=0.7)

error.bar(nj$fv,nj$feeva,nj$festd/2,"red")
error.bar(na$fv,na$feeva,na$festd/2,"blue")
error.bar(nd$fv,nd$feeva,nd$festd/2,"black")
error.bar(ng$fv,ng$feeva,ng$festd/2,"green3")

title(main="18nlmin",line=0.5)

legend("topright",c("25g",
                    "30g","32g","34g"),
       pch=c(1,2,15,16),bty="n",lty=2,col=c("red","blue","black","green3"),inset=.1)

###54nl/min####
plot(nk$fv, nk$d_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(f["e"](Hz)),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,500),ylim=c(0,250),col=0)

#25g
lines(nk$fv,nk$feeva,col="red",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)
#30g
lines(nb$fv,nb$feeva,col="blue",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)
#32g
lines(ne$fv,ne$feeva,col="black",pch=15,lwd=1.5,lty=2,type="b",cex=0.7)
#34g
lines(nh$fv,nh$feeva,col="green3",pch=16,lwd=1.5,lty=2,type="b",cex=0.7)


error.bar(nk$fv,nk$feeva,nk$festd/2,"red")
error.bar(nb$fv,nb$feeva,nb$festd/2,"blue")
error.bar(ne$fv,ne$feeva,ne$festd/2,"black")
error.bar(nh$fv,nh$feeva,nh$festd/2,"green3")

title(main="54nlmin",line=0.5)

legend("topright",c("25g",
                    "30g","32g","34g"),
       pch=c(1,2,15,16),bty="n",lty=2,col=c("red","blue","black","green3"),inset=.1)

####180nlmin####
plot(nl$fv, nl$d_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(f["e"](Hz)),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,500),ylim=c(0,250),col=0)
#25g
lines(nl$fv,nl$feeva,col="red",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)
#30g
lines(nc$fv,nc$feeva,col="blue",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)
#32g
lines(nf$fv,nf$feeva,col="black",pch=15,lwd=1.5,lty=2,type="b",cex=0.7)
#34g
lines(ni$fv,ni$feeva,col="green3",pch=16,lwd=1.5,lty=2,type="b",cex=0.7)

error.bar(nl$fv,nl$feeva,nl$festd/2,"red")
error.bar(nc$fv,nc$feeva,nc$festd/2,"blue")
error.bar(nf$fv,nf$feeva,nf$festd/2,"black")
error.bar(ni$fv,ni$feeva,ni$festd/2,"green3")

title(main="180nlmin",line=0.5)

legend("topright",c("25g",
                    "30g","32g","34g"),
       pch=c(1,2,15,16),bty="n",lty=2,col=c("red","blue","black","green3"),inset=.1)

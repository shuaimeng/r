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
layout(matrix(c(1,2,3,4), 2, 2,byrow = TRUE))

###error bar####
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

####25G####
plot(nj$fv, nj$feeva, xlab = expression(f["v"](Hz)),
     ylab=expression(f["e"](Hz)),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,200),ylim=c(0,250),col=0)
#18
lines(nk$fv,nk$feeva,col="red",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)

#54
lines(nj$fv,nj$feeva,col="blue",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)

#180
lines(nl$fv,nl$feeva,col="black",pch=15,lwd=1.5,lty=15,type="b",cex=0.7)
#34g
#lines(ng$fv,ng$feeva,col="green3",pch=16,lwd=1.5,lty=2,type="b",cex=0.7)

error.bar(nk$fv,nk$feeva,nk$festd/2,"red")
error.bar(nj$fv,nj$feeva,nj$festd/2,"blue")

error.bar(nl$fv,nl$feeva,nl$festd/2,"black")
#error.bar(ng$fv,ng$feeva,ng$festd/2,"green3")

title(main="25G",line=0.5)

legend("topright",c("18nl/min",
                    "54nl/min","180nl/min"),
       pch=c(1,2,15),bty="n",lty=2,col=c("red","blue","black"),inset=.1)

###30G####
plot(na$fv, na$d_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(f["e"](Hz)),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,200),ylim=c(0,250),col=0)

#25g
lines(na$fv,na$feeva,col="red",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)
#30g
lines(nc$fv,nc$feeva,col="blue",pch=15,lwd=1.5,lty=2,type="b",cex=0.7)

#32g
lines(nb$fv,nb$feeva,col="black",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)

#34g
#lines(nh$fv,nh$feeva,col="green3",pch=16,lwd=1.5,lty=2,type="b",cex=0.7)


error.bar(na$fv,na$feeva,na$festd/2,"red")
error.bar(nc$fv,nc$feeva,nc$festd/2,"blue")
error.bar(nb$fv,nb$feeva,nb$festd/2,"black")

#error.bar(nh$fv,nh$feeva,nh$festd/2,"green3")

title(main="30G",line=0.5)

legend("topright",c("18nl/min",
                    "54nl/min","180nl/min"),
       pch=c(1,2,15),bty="n",lty=2,col=c("red","blue","black"),inset=.1)


####32G####
plot(nd$fv, nd$d_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(f["e"](Hz)),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,200),ylim=c(0,250),col=0)
#25g
lines(nd$fv,nd$feeva,col="red",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)
#30g
lines(ne$fv,ne$feeva,col="blue",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)
#32g
lines(nf$fv,nf$feeva,col="black",pch=15,lwd=1.5,lty=2,type="b",cex=0.7)
#34g
#lines(ni$fv,ni$feeva,col="green3",pch=16,lwd=1.5,lty=2,type="b",cex=0.7)

error.bar(nd$fv,nd$feeva,nd$festd/2,"red")
error.bar(ne$fv,ne$feeva,ne$festd/2,"blue")
error.bar(nf$fv,nf$feeva,nf$festd/2,"black")
#error.bar(ni$fv,ni$feeva,ni$festd/2,"green3")

title(main="32G",line=0.5)

legend("topright",c("18nl/min",
                    "54nl/min","180nl/min"),
       pch=c(1,2,15),bty="n",lty=2,col=c("red","blue","black"),inset=.1)


####34G####
plot(ng$fv, ng$d_ra, xlab = expression(f["v"](Hz)),
     ylab=expression(f["e"](Hz)),mgp=c(1.1, 0, 0),tck=0.02,xlim=c(0,200),ylim=c(0,250),col=0)
#25g
lines(ng$fv,ng$feeva,col="red",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)
#30g
lines(nh$fv,nh$feeva,col="blue",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)
#32g
lines(ni$fv,ni$feeva,col="black",pch=15,lwd=1.5,lty=2,type="b",cex=0.7)
#34g
#lines(ni$fv,ni$feeva,col="green3",pch=16,lwd=1.5,lty=2,type="b",cex=0.7)

error.bar(ng$fv,ng$feeva,ng$festd/2,"red")
error.bar(nh$fv,nh$feeva,nh$festd/2,"blue")
error.bar(ni$fv,ni$feeva,ni$festd/2,"black")
#error.bar(ni$fv,ni$feeva,ni$festd/2,"green3")

title(main="34G",line=0.5)

legend("topright",c("18nl/min",
                    "54nl/min","180nl/min"),
       pch=c(1,2,15),bty="n",lty=2,col=c("red","blue","black"),inset=.1)

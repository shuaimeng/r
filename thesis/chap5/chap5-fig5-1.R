dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/chap5")

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
#par(mar=c(2,2.2,1.4,1),oma=c(2,2,2,2))
#layout(matrix(c(1,2,3,4), 2, 2,byrow = TRUE))

###error bar####
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

####25G####
par(fig=c(0,0.5,0.5,1),mar = c(1.8,2,0.8,1), oma = c(1,1,1,1),new=F)
plot(nj$fv, nj$feeva, xlab = expression(f["v"](Hz)),
     ylab=expression(italic(f["e"])(Hz)),mgp=c(1, 0, 0),tck=0.01,main = "", cex.lab = 1, cex.axis = 1,xlim=c(0,200),ylim=c(0,100),col=0)

mtext("25G",3,line=0,font=2,cex=0.9)
#18
lines(nk$fv,nk$feeva,col="red",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)

#54
lines(nj$fv,nj$feeva,col="blue",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)

#180
lines(nl$fv,nl$feeva,col="green3",pch=15,lwd=1.5,lty=15,type="b",cex=0.7)
#34g
#lines(ng$fv,ng$feeva,col="green3",pch=16,lwd=1.5,lty=2,type="b",cex=0.7)

error.bar(nk$fv,nk$feeva,nk$festd/2,"red")
error.bar(nj$fv,nj$feeva,nj$festd/2,"blue")
error.bar(nl$fv,nl$feeva,nl$festd/2,"green3")
#error.bar(ng$fv,ng$feeva,ng$festd/2,"green3")


###小图###
par(fig=c(0.12,0.49,0.65,0.99),new=T)
plot(nj$fv, nj$feeva, bty="n",xlab = expression(italic(f["v"])(Hz)),
     ylab="",mgp=c(1, 0, 0),tck=0.005,xlim=c(0,1000),cex.axis=0.8,cex.lab=0.8,ylim=c(0,100),col=0)

lines(nk$fv,nk$feeva,col="red",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)
lines(nj$fv,nj$feeva,col="blue",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)
lines(nl$fv,nl$feeva,col="green3",pch=15,lwd=1.5,lty=15,type="b",cex=0.7)

legend("topright",c("18nl/min",
                    "54nl/min","180nl/min"),
       pch=c(1,2,15),bty="n",lty=2,col=c("red","blue","green3"),inset=.01,cex=0.85)

###30G####
par(fig=c(0.5,1,0.5,1), new=T)
plot(na$fv, na$d_ra, xlab = expression(italic(f["v"])(Hz)),
     ylab=expression(italic(f["e"])(Hz)),mgp=c(1, 0, 0),tck=0.01,main = "", cex.lab = 1, cex.main = 1,xlim=c(0,200),ylim=c(0,250),col=0)

     mtext("30G",3,line=0,font=2,cex=0.9)


#25g
lines(na$fv,na$feeva,col="red",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)
#30g
lines(nc$fv,nc$feeva,col="blue",pch=15,lwd=1.5,lty=2,type="b",cex=0.7)
#32g
lines(nb$fv,nb$feeva,col="green3",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)

#34g
#lines(nh$fv,nh$feeva,col="green3",pch=16,lwd=1.5,lty=2,type="b",cex=0.7)


error.bar(na$fv,na$feeva,na$festd/2,"red")
error.bar(nc$fv,nc$feeva,nc$festd/2,"blue")
error.bar(nb$fv,nb$feeva,nb$festd/2,"green3")

#error.bar(nh$fv,nh$feeva,nh$festd/2,"green3")

###小图###
par(fig=c(0.6,0.99,0.65,0.99),new=T)
plot(na$fv, na$d_ra, bty="n",xlab = expression(italic(f["v"])(Hz)),ylab="",mgp=c(1, 0, 0),tck=0.005,cex.axis=0.8,cex.lab=0.8,xlim=c(0,3000),ylim=c(0,250),col=0)
lines(na$fv,na$feeva,col="red",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)
lines(nc$fv,nc$feeva,col="blue",pch=15,lwd=1.5,lty=2,type="b",cex=0.7)
lines(nb$fv,nb$feeva,col="green3",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)

legend("topright",c("18nl/min",
                    "54nl/min","180nl/min"),
       pch=c(1,2,15),bty="n",lty=2,col=c("red","blue","green3"),cex=0.85,inset=.01)


####32G####
par(fig=c(0,0.5,0,0.5), new=T)
plot(nd$fv, nd$d_ra, xlab = expression(italic(f["v"])(Hz)),
     ylab=expression(italic(f["e"])(Hz)),mgp=c(1, 0, 0),tck=0.02,main = "", cex.lab = 1, cex.axis = 1,xlim=c(0,200),ylim=c(0,250),col=0)

     mtext("32G",3,line=0,font=2,cex=0.9)

#25g
lines(nd$fv,nd$feeva,col="red",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)
#30g
lines(nf$fv,nf$feeva,col="blue",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)
#32g
lines(ne$fv,ne$feeva,col="green3",pch=15,lwd=1.5,lty=2,type="b",cex=0.7)
#34g
#lines(ni$fv,ni$feeva,col="green3",pch=16,lwd=1.5,lty=2,type="b",cex=0.7)

error.bar(nd$fv,nd$feeva,nd$festd/2,"red")
error.bar(nf$fv,nf$feeva,nf$festd/2,"blue")
error.bar(ne$fv,ne$feeva,ne$festd/2,"green3")
#error.bar(ni$fv,ni$feeva,ni$festd/2,"green3")

###小图###
par(fig=c(0.12,0.49,0.15,0.49),new=T)
plot(nd$fv, nd$d_ra, bty="n",xlab = expression(italic(f["v"])(Hz)),ylab="",cex.axis=0.8,cex.lab=0.8,mgp=c(1, 0, 0),tck=0.005,xlim=c(0,3500),ylim=c(0,250),col=0)
lines(nd$fv,nd$feeva,col="red",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)
lines(nf$fv,nf$feeva,col="blue",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)
lines(ne$fv,ne$feeva,col="green3",pch=15,lwd=1.5,lty=2,type="b",cex=0.7)

legend("topright",c("18nl/min",
                    "54nl/min","180nl/min"),
       pch=c(1,2,15),bty="n",lty=2,col=c("red","blue","green3"),cex=0.85,inset=.01)


####34G####
par(fig=c(0.5,1,0,0.5), new=T)
plot(ng$fv, ng$d_ra, xlab = expression(italic(f["v"])(Hz)),
     ylab=expression(italic(f["e"])(Hz)),mgp=c(1, 0, 0),tck=0.02,main = "", cex.lab = 1, cex.main = 1,xlim=c(0,200),ylim=c(0,250),col=0)

     mtext("34G",3,line=0,font=2,cex=0.9)

#25g
lines(ng$fv,ng$feeva,col="red",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)
#30g
lines(nh$fv,nh$feeva,col="blue",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)
#32g
lines(ni$fv,ni$feeva,col="green3",pch=15,lwd=1.5,lty=2,type="b",cex=0.7)
#34g
#lines(ni$fv,ni$feeva,col="green3",pch=16,lwd=1.5,lty=2,type="b",cex=0.7)

error.bar(ng$fv,ng$feeva,ng$festd/2,"red")
error.bar(nh$fv,nh$feeva,nh$festd/2,"blue")
error.bar(ni$fv,ni$feeva,ni$festd/2,"green3")
#error.bar(ni$fv,ni$feeva,ni$festd/2,"green3")

###小图###
par(fig=c(0.58,0.99,0.15,0.49),new=T)
plot(ng$fv, ng$d_ra, bty="n",xlab = expression(italic(f["v"])(Hz)),ylab="",mgp=c(1, 0, 0),tck=0.005,cex.axis=0.8,cex.lab=0.8,xlim=c(0,3500),ylim=c(0,250),col=0)
lines(ng$fv,ng$feeva,col="red",pch=1,lwd=1.5,lty=2,type="b",cex=0.7)
lines(nh$fv,nh$feeva,col="blue",pch=2,lwd=1.5,lty=2,type="b",cex=0.7)
lines(ni$fv,ni$feeva,col="green3",pch=15,lwd=1.5,lty=2,type="b",cex=0.7)

legend("topright",c("18nl/min",
                    "54nl/min","180nl/min"),
       pch=c(1,2,15),bty="n",lty=2,col=c("red","blue","green3"),cex=0.85,inset=.01)

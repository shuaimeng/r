library(xlsx)

#reading datas

c1<-read.xlsx("gly1.xlsx", sheetName = "qd2-20", header = TRUE)
c2<-read.xlsx("gly2.xlsx", sheetName = "qd2-20", header = TRUE)
c3<-read.xlsx("gly3.xlsx", sheetName = "qd2-20", header = TRUE)

##error bar##
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}
##


##
yan<-c("red","blue","black")
pcc<-c(0,1,2)

##Plot-1
plot(c1$fv,c1$fveva, col=0,xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(f["p"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02, 
     main = "", xlim = c(0, 4000),ylim=c(0,4000))

lines(c1$fv,c1$fveva,col=yan[1],lwd=2,lty=2,type="b",pch=pcc[1])
lines(c2$fv,c2$fveva,col=yan[2],lwd=2,lty=2,type="b",pch=pcc[2])
lines(c3$fv,c3$fveva,col=yan[3],lwd=2,lty=2,type="b",pch=pcc[3])

error.bar(c1$fv,c1$fveva,c1$stdfv/2,col=yan[1])
error.bar(c2$fv,c2$fveva,c2$stdfv/2,col=yan[2])
error.bar(c3$fv,c3$fveva,c3$stdfv/2,col=yan[3])

x1<-c(1000,1000)
y1<-c(0,1000)
x2<-c(1500,1500)
y2<-c(0,1500)
x3<-c(4000,4000)
y3<-c(0,4000)

lines(x1,y1,col="black",lwd=1.5,lty=2)
lines(x2,y2,col="blue",lwd=1.5,lty=2)
lines(x3,y3,col="red",lwd=1.5,lty=2)
text(650,400,"fpmax=1KHz",col="black",font=2)
text(2000,700,"fpmax=1.5KHz",col="blue",font=2)
text(3600,2000,"fpmax=4KHz",col="red",font=2)




leg<-c("Ethylene","Ethylene 2","Ethylene 3")
legend("topleft",legend=leg,col=yan,pch=pcc,lwd=1.5,inset=.06,bty="n")










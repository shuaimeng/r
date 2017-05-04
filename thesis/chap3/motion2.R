library(xlsx)
#读取数据
#柱状图，分析速度与间距的微小差距
q <- read.xlsx("cha3space.xlsx", sheetName = "shui", header = TRUE)
par(mgp = c(2, 0.5, 0),tck=0.02)
mycolor<-gray(1:4/5)

data<-c(q$X20mm1[21],q$X50mm2[21],q$X100mm1[21],q$X150mm1[21])
coll<-c("red","blue","green3","black")

#errorbar函数
error.bar <- function(x, y, upper, lower=upper, length=0.1){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower, angle=90, code=3, length=length)
}

means<-data
sd<-c(q$X20mm1[22],q$X50mm2[22],q$X100mm1[22],q$X150mm1[22])

barx<-barplot(data,width=0.5,space=0.3,col=mycolor,names.arg=c("20mm/s","50mm/s","100mm/s","150mm/s"),xlab = expression(italic(U["x"]) (mm/s)), ylab = expression(italic(S["d"])(um)),xlim = c(0, 3), ylim=c(0,200))
#legend("topleft",c("20mm/s","50mm/s","100mm/s","150mm/s"),col=rainbow(4))

error.bar(barx,means, sd)

abline(h=0.4*q$X50mm2[21],lty=3,col="red",lwd=1.5)
abline(h=q$X50mm2[21],lty=3,col="red",lwd=1.5)
abline(h=2*q$X50mm2[21],lty=3,col="red",lwd=1.5)
abline(h=3*q$X50mm2[21],lty=3,col="red",lwd=1.5)

abline(h=q$X100mm2[21],lty=3,col="blue",lwd=1.5)
abline(h=1.5*q$X100mm2[21],lty=3,col="blue",lwd=1.5)
abline(h=0.5*q$X100mm2[21],lty=3,col="blue",lwd=1.5)
abline(h=0.2*q$X100mm2[21],lty=3,col="blue",lwd=1.5)

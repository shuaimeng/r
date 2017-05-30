dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/max fp")

library(xlsx)

# reading execl

k1<-read.xlsx("gly1.xlsx",sheetName="qd2-20",header=TRUE)


plot(k1$fv,k1$deva,col="0",xlab = expression(italic(f["v"]) (Hz)),
          ylab =expression(italic(U["s"]) (mm/s)), mgp=c(1.1, 0, 0),tck=0.02,
               main = "",xlim = c(0,4000),ylim=c(0,100))

points(k1$fv,k1$deva,col="red",pch=1)

z1=loess(k1$deva~k1$fv,span=0.5,degree=2)

lines(k1$fv,z1$fit,col="red",lwd=1.5,lty=2,type="b")

abline(lm(k1$deva~k1$fv),col="blue",lwd=1.5,lty=2)

fv<-1:4000 # 自己拟合的曲线


mtext("Critical Velocity Us",3,line=0.2,font=2,cex=0.9)

f<-lm(k1$deva~k1$fv)

a<-f$coefficients[1]
b<-f$coefficients[2]

usa<-10*b/7 # 斜率
usb<-10*a/7 # 截距

z<-usa*fv+usb

lines(fv,z,col="black",lwd=2.5,lty=5)

text(2000,75,"Us fitting",col="black",font=2)

x<-c(600,1000,2000)
y<-c(66,60,50)

lines(x,y,col="green3",lwd=2.5,lty=5)

leg<-c("Droplet","D size fit","Us fit","Us real")
legend("topright",legend=leg,col=c("red","blue","black","green3"),lwd=1.5,
bty="n",inset=.02)

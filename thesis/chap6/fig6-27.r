dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/viscous")

library(xlsx)

# liquid1下，2kv-18；2kv-180；2.1kv-18;2.1kv-180;2.2kv-18;2.2kv-180;


#fvc1<-c(500,,200,500,200,500)

#fpmax1<-c(500,533,700,700,700,700)

# liquid12下，2kv-18,2kv-90,2kv-180;2.1kv-18;2.1kv-90;2.1kv-180;
# 2.2kv-18;2.2kv-90;

#fvc2<-c(200,50,,100,50,50,50,50)
#fpmax2<-c(500,50,10,500,200,50,700,500)

# liquid1,2kv

fvc2kv<-c(500,NA,NA)
fp2kv<-c(700,NA,NA)

# liquid11,2.1kv
fvc21kv<-c(200,500,500)
fp21kv<-c(700,700,700)

# liquid1,2.2kv
fvc22kv<-c(200,500,500)
fp22kv<-c(700,700,700)

# liquid2-2kv
vc2kv<-c(200,50,NA)
p2kv<-c(500,50,10)

# liquid2-2.1kv
vc21kv<-c(100,50,50)
p21kv<-c(500,200,50)

# liquid2-2.2kv
vc22kv<-c(50,50,NA)
p22kv<-c(700,500,NA)


q<-c(18,90,180)
par(mfrow = c(2,1), mar = c(2,2.2,0.8,1), oma = c(1,1,1,1))

layout(matrix(c(1,2),2,1,byrow=TRUE))

yan<-rainbow(6)
yan[2]<-c("yellow3")
pcc<-c(0,1,2,3,5,22,23)

# plot fvc
plot(q,fvc2kv,xlab = expression(italic(Q) (nl/min)),
ylab = expression(italic(f["vc"])(Hz)), mgp=c(1.1, 0, 0),tck=0.02,
main = "", xlim = c(0,200),ylim=c(0,600))

mtext("fvc",3,line=-1,font=2,cex=1)

lines(q,fvc2kv,col=yan[1],pch=pcc[1],type="b",lwd=1.5,lty=2)
lines(q,fvc21kv,col=yan[2],pch=pcc[2],type="b",lwd=1.5,lty=2)
lines(q,fvc22kv,col=yan[3],pch=pcc[3],type="b",lwd=1.5,lty=2)
lines(q,vc2kv,col=yan[4],pch=pcc[4],type="b",lwd=1.5,lty=2)
lines(q,vc21kv,col=yan[5],pch=pcc[5],type="b",lwd=1.5,lty=2)
lines(q,vc22kv,col=yan[6],pch=pcc[6],type="b",lwd=1.5,lty=2)

leg<-c("liquid1-2kv","liquid1-2.1kv","liquid1-2.2kv","liquid2-2kv",
"liquid2-2.1kv","liqudi2-2.2kv")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,cex=0.8,inset=.01,bty="n")

# plot2 fpmax2

plot(q,fvc2kv,xlab = expression(italic(Q) (nl/min)),
ylab = expression(italic(f["pmax"])(Hz)), mgp=c(1.1, 0, 0),tck=0.02,
main = "", xlim = c(0,200),ylim=c(0,800))

mtext("fpmax",3,line=-1,font=2,cex=1)

lines(q,fp2kv,col=yan[1],pch=pcc[1],type="b",lwd=1.5,lty=2)
lines(q,fp21kv,col=yan[2],pch=pcc[2],type="b",lwd=1.5,lty=2)
lines(q,fp22kv,col=yan[3],pch=pcc[3],type="b",lwd=1.5,lty=2)
lines(q,p2kv,col=yan[4],pch=pcc[4],type="b",lwd=1.5,lty=2)
lines(q,p21kv,col=yan[5],pch=pcc[5],type="b",lwd=1.5,lty=2)
lines(q,p22kv,col=yan[6],pch=pcc[6],type="b",lwd=1.5,lty=2)

leg<-c("liquid1-2kv","liquid1-2.1kv","liquid1-2.2kv","liquid2-2kv",
"liquid2-2.1kv","liqudi2-2.2kv")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.01,cex=0.8,bty="n")

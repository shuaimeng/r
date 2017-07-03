
dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/maxfp")

library(xlsx)

k1<-read.xlsx("t_for.xlsx", sheetName = "15nl", header = TRUE)
k2<-read.xlsx("t_for.xlsx", sheetName = "27nl", header = TRUE)
k3<-read.xlsx("t_for.xlsx", sheetName = "54nl", header = TRUE)
k4<-read.xlsx("t_for.xlsx", sheetName = "180nl", header = TRUE)

v<-4.66e-13  #弯月面体积大小

q<-c(2.5e-14, 4.5e-13, 9e-13, 3e-12)   #流量从1.5到180

k<-c(0.2,0.3,0.4,0.5) #占空比

pchc<-c(19,22,23,24)

cc<-c("k=0.2", "k=0.3","k=0.4","k=0.5")

mycolors<-c("red","blue", "darkgreen", "yellow3")

h<-0.3e-3 #弯月面变形大小

duty<-1-k

par(mfrow=c(2,2), mgp = c(1.3, 0, 0),tck=0.02,mar=c(2.1,2.4,1,1), oma=c(2,2,2,2))


#######占空比0.2####
plot(k1[,1],  (v+(duty[1]*q[1]))/(k1[,1]*k1[,2]^2),lwd=1.5,cex=0.6,lty=2, log="x",xlab=expression(log(italic(f["v"])) (Hz)), ylab=expression(italic(F)(N)), main="1.5nl/min", col=0, pch=pchc[1], ylim=c(0,3e-14))

lines(lowess(k1[,1],  (v+(duty[1]*q[1]))/(k1[,1]*k1[,2]^2)),type="b",col=mycolors[1], pch=pchc[1],lwd=1.5,cex=0.6,lty=2)

for(i in 1:3){

  points(k1[,1], (v+(duty[1]*q[i+1]))/(k1[,1]*k1[,i+2]^2),pch=pchc[i+1], lwd=1.5,cex=0.6,lty=2,col=0)
  lines(lowess(k1[,1], (v+(duty[1]*q[i+1]))/(k1[,1]*k1[,i+2]^2)), type="b",lwd=1.5, pch=pchc[i+1],cex=0.6,col=mycolors[i+1], lty=2)
}

legend("topleft",cc, col=mycolors, pch=pchc,lty=2, lwd=2, bty="n",cex=0.8)

abline(v=250, col="red", lwd=2, lty=3)

text(200, 2e-14,"250Hz", col="red", font=2, cex=1)

#####占空比0.3####
plot(k2[,1],  (v+(duty[2]*q[1]))/(k2[,1]*k2[,2]^2), log="x",lwd=1.5,cex=0.6,lty=2,xlab=expression(log(italic(f["v"])) (Hz)), ylab=expression(italic(F)(N)), main="27nl/min", col=0, pch=pchc[1], ylim=c(0,3e-14))

lines(lowess(k2[,1],  (v+(duty[2]*q[1]))/(k2[,1]*k2[,2]^2)),type="b",col=mycolors[1],pch=pchc[1], lwd=1.5,cex=0.6,lty=2)

for(i in 1:3){

  points(k2[,1], (v+(duty[2]*q[i+1]))/(k2[,1]*k2[,i+2]^2),pch=pchc[i+1],lwd=1.5,cex=0.6,lty=2,col=0)
  lines(lowess(k2[,1], (v+(duty[2]*q[i+1]))/(k2[,1]*k2[,i+2]^2)),type="b",lwd=1.5,pch=pchc[i+1],cex=0.6,lty=2,col=mycolors[i+1])
}

legend("topleft",cc, col=mycolors, pch=pchc, lwd=2, bty="n",cex=0.8)

abline(v=250, col="red", lwd=2,lty=3)
abline(v=300, col="blue", lwd=2,lty=3)


text(100, 1e-14,"250Hz",col="red", font=2, cex=1)
text(200, 1.5e-14,"300Hz",font=2, col="blue", cex=1)


###占空比0.4###
plot(k3[,1],  (v+(duty[3]*q[1]))/(k3[,1]*k3[,2]^2), log="x", lwd=1.5,cex=0.6,lty=2,xlab=expression(log(italic(f["v"])) (Hz)), ylab=expression(italic(F)(N)), main="54nl/min", col=0, pch=pchc[1], ylim=c(0,3e-14))

lines(lowess(k3[,1],  (v+(duty[3]*q[1]))/(k3[,1]*k3[,2]^2)),type="b", col=mycolors[1],pch=pchc[1], lwd=1.5,cex=0.6,lty=2)

for(i in 1:3){

  points(k3[,1], (v+(duty[3]*q[i+1]))/(k3[,1]*k3[,i+2]^2),pch=pchc[i+1],lwd=1.5,cex=0.6,lty=2,col=0)
  lines(lowess(k3[,1], (v+(duty[3]*q[i+1]))/(k3[,1]*k3[,i+2]^2)),type="b",lwd=1.5,pch=pchc[i+1],cex=0.6,lty=2, col=mycolors[i+1])
}

legend("topleft",cc,col=mycolors, pch=pchc, lwd=1.5, bty="n",cex=0.8)

abline(v=250, col="red", lwd=2,lty=3)
abline(v=500, col="blue", lwd=2,lty=3)

text(100, 1e-14,"250Hz", col="red", font=2, cex=1)
text(200, 1.5e-14,"500Hz",font=2, col="blue", cex=1)


####占空比0.5####
plot(k4[,1],  (v+(duty[4]*q[1]))/(k4[,1]*k4[,2]^2),log="x",wd=1.5,cex=0.6,lty=2, xlab=expression(log(italic(f["v"])) (Hz)), ylab=expression(italic(F)(N)), main="180nl/min", col=0, pch=pchc[1], ylim=c(0,3e-14))

lines(lowess(k3[,1],  (v+(duty[3]*q[1]))/(k3[,1]*k3[,2]^2)),type="b", col=mycolors[1],pch=pchc[1],lwd=1.5,cex=0.6,lty=2)

for(i in 1:3){

  points(k3[,1], (v+(duty[3]*q[i+1]))/(k3[,1]*k3[,i+2]^2),pch=pchc[i+1], lwd=1.5,cex=0.6,lty=2,col=0)
  lines(lowess(k4[,1], (v+(duty[4]*q[i+1]))/(k4[,1]*k4[,i+2]^2)),type="b",pch=pchc[i+1], col=mycolors[i+1],lwd=1.5,cex=0.6,lty=2)
}
legend("topleft",cc,col=mycolors, pch=pchc, lwd=1.5, bty="n",cex=0.8)

abline(v=300, col="red", lwd=2,lty=3)
abline(v=900, col="blue", lwd=2,lty=3)

text(50, 1e-14,"300Hz", col="red", font=2, cex=1)
text(200, 1.5e-14,"900Hz",font=2, col="blue", cex=1)

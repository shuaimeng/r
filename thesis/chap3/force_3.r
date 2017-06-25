library(xlsx)

 library(RColorBrewer)
 
 #options(digits=2)
 ##读取t_for的大小
k1<-read.xlsx("t_for.xls", sheetName = "0.2", header = TRUE)
k2<-read.xlsx("t_for.xls", sheetName = "0.3", header = TRUE)
k3<-read.xlsx("t_for.xls", sheetName = "0.4", header = TRUE)
k4<-read.xlsx("t_for.xls", sheetName = "0.5", header = TRUE)

v<-4.66e-13  #弯月面体积大小

q<-c(2.5e-14, 4.5e-13, 9e-13, 3e-12)   #流量从1.5到180

k<-c(0.2,0.3,0.4,0.5) #占空比

pchc<-c(19,22,23,24)

mycolors<-c("red","blue", "darkgreen", "yellow3")

h<-0.3e-3 #弯月面变形大小

duty<-1-k

par(mfrow=c(2,2), mar=c(4,2,2,2), oma=c(2,2,2,2))


#######占空比0.2####
plot(k1[,1],  (v+(duty[1]*q[1]))/(k1[,1]*k1[,2]^2), log="x",lwd=2, xlab=expression(log(italic(f["v"])) (Hz)), ylab=expression(italic(F)), main="k=0.2", col=0, pch=pchc[1], ylim=c(0,8e-14))

lines(lowess(k1[,1],  (v+(duty[1]*q[1]))/(k1[,1]*k1[,2]^2)), col=mycolors[1], lwd=2.5,lty=2)

for(i in 1:3){

points(k1[,1], (v+(duty[1]*q[i+1]))/(k1[,1]*k1[,i+2]^2),pch=pchc[i+1], lwd=2, col=0)
lines(lowess(k1[,1], (v+(duty[1]*q[i+1]))/(k1[,1]*k1[,i+2]^2)), lwd=2.5, col=mycolors[i+1], lty=2)
}

legend("topleft",c("1.5nl/min", "27nl/min","54nl/min","180nl/min"), type="b", col=mycolors, pch=pchc,lty=2, lwd=2, bty="n")

abline(v=250, col="red", lwd=2, lty=3)
#abline(h= (v+(duty[1]*q[2]))/(k1[11,1]*k1[11,3]^2), col="blue", lwd=2, lty=3)
#abline(h= (v+(duty[1]*q[3]))/(k1[11,1]*k1[11,4]^2), col="darkgreen", lwd=2,lty=3)
#abline(h= (v+(duty[1]*q[4]))/(k1[11,1]*k1[11,5]^2), col="yellow3", lty=3,lwd=2)
text(200, 2e-14,"250Hz", col="red", font=2, cex=1)
#text(20, 1.2e-14,(v+(duty[1]*q[2]))/(k1[11,1]*k1[11,3]^2),font=2, col="blue", cex=1)
#text(20, 1.4e-14, (v+(duty[1]*q[4]))/(k1[11,1]*k1[11,5]^2), font=2, col="darkgreen", cex=1)
#text(20, 1.6e-14,(v+(duty[1]*q[4]))/(k1[11,1]*k1[11,5]^2) ,font=2,col="yellow3", cex=1)

#####占空比0.3####
plot(k2[,1],  (v+(duty[2]*q[1]))/(k2[,1]*k2[,2]^2), log="x",lwd=2, xlab=expression(log(italic(f["v"])) (Hz)), ylab=expression(italic(F)), main="k=0.3", col=0, pch=pchc[1], ylim=c(0,3e-14))

lines(lowess(k2[,1],  (v+(duty[2]*q[1]))/(k2[,1]*k2[,2]^2)), col=mycolors[1], lwd=2.5,lty=2)

for(i in 1:3){

points(k2[,1], (v+(duty[2]*q[i+1]))/(k2[,1]*k2[,i+2]^2),pch=pchc[i+1], lwd=2, col=0)
lines(lowess(k2[,1], (v+(duty[2]*q[i+1]))/(k2[,1]*k2[,i+2]^2)), lwd=2.5, col=mycolors[i+1], lty=2)
}

legend("topleft",c("1.5nl/min", "27nl/min","54nl/min","180nl/min"), type="b",col=mycolors, pch=pchc, lwd=2, bty="n")

abline(v=250, col="red", lwd=2,lty=3)
abline(v=300, col="blue", lwd=2,lty=3)
#abline(h= (v+(duty[2]*q[2]))/(k2[11,1]*k2[11,3]^2), col="blue", lwd=2, lty=3)
#abline(h= (v+(duty[2]*q[3]))/(k2[11,1]*k2[11,4]^2), col="darkgreen", lwd=2,lty=3)
#abline(h= (v+(duty[2]*q[4]))/(k2[11,1]*k2[11,5]^2), col="yellow3", lty=3,lwd=2)

text(100, 1e-14,"250Hz",col="red", font=2, cex=1)
text(200, 1.5e-14,"300Hz",font=2, col="blue", cex=1)
#text(20, 1.4e-14,(v+(duty[2]*q[3]))/(k2[11,1]*k2[11,4]^2) ,font=2, col="darkgreen", cex=1)
#text(20, 1.6e-14,(v+(duty[2]*q[4]))/(k2[11,1]*k2[11,5]^2),font=2,col="yellow3", cex=1)

###占空比0.4###
plot(k3[,1],  (v+(duty[3]*q[1]))/(k3[,1]*k3[,2]^2), log="x", lwd=2, xlab=expression(log(italic(f["v"])) (Hz)), ylab=expression(italic(F)), main="k=0.4", col=0, pch=pchc[1], ylim=c(0,3e-14))

lines(lowess(k3[,1],  (v+(duty[3]*q[1]))/(k3[,1]*k3[,2]^2)), col=mycolors[1], lwd=2.5,lty=2)

for(i in 1:3){

points(k3[,1], (v+(duty[3]*q[i+1]))/(k3[,1]*k3[,i+2]^2),pch=pchc[i+1], lwd=2, col=0)
lines(lowess(k3[,1], (v+(duty[3]*q[i+1]))/(k3[,1]*k3[,i+2]^2)), lwd=2.5, col=mycolors[i+1], lty=2)
}

legend("topleft",c("1.5nl/min", "27nl/min","54nl/min","180nl/min"), type="b",col=mycolors, pch=pchc, lwd=2, bty="n")

abline(v=250, col="red", lwd=2,lty=3)
abline(v=500, col="blue", lwd=2,lty=3)
#abline(h= (v+(duty[3]*q[2]))/(k3[11,1]*k3[11,3]^2), col="blue", lwd=2, lty=3)
#abline(h= (v+(duty[3]*q[3]))/(k3[11,1]*k3[11,4]^2), col="darkgreen", lwd=2,lty=3)
#abline(h= (v+(duty[3]*q[4]))/(k3[11,1]*k3[11,5]^2), col="yellow3", lty=3,lwd=2)
text(100, 1e-14,"250Hz", col="red", font=2, cex=1)
text(200, 1.5e-14,"500Hz",font=2, col="blue", cex=1)
#text(20, 1.4e-14,(v+(duty[3]*q[3]))/(k3[11,1]*k3[11,4]^2),font=2, col="darkgreen", cex=1)
#text(20, 1.6e-14,(v+(duty[3]*q[4]))/(k3[11,1]*k3[11,5]^2),font=2,col="yellow3", cex=1)



####占空比0.5####
plot(k4[,1],  (v+(duty[4]*q[1]))/(k4[,1]*k4[,2]^2),log="x", lwd=2, xlab=expression(log(italic(f["v"])) (Hz)), ylab=expression(italic(F)), main="k=0.5", col=0, pch=pchc[1], ylim=c(0,3e-14))

lines(lowess(k3[,1],  (v+(duty[3]*q[1]))/(k3[,1]*k3[,2]^2)), col=mycolors[1], lwd=2.5,lty=2)

for(i in 1:3){

points(k3[,1], (v+(duty[3]*q[i+1]))/(k3[,1]*k3[,i+2]^2),pch=pchc[i+1], lwd=2, col=0)
lines(lowess(k4[,1], (v+(duty[4]*q[i+1]))/(k4[,1]*k4[,i+2]^2)), lwd=2.5, col=mycolors[i+1], lty=2)
}
legend("topleft",c("1.5nl/min", "27nl/min","54nl/min","180nl/min"), type="b",col=mycolors, pch=pchc, lwd=2, bty="n")

abline(v=300, col="red", lwd=2,lty=3)
abline(v=900, col="blue", lwd=2,lty=3)
#abline(h= (v+(duty[4]*q[2]))/(k4[11,1]*k4[11,3]^2), col="blue", lwd=2, lty=3)
#abline(h= (v+(duty[4]*q[3]))/(k4[11,1]*k4[11,4]^2), col="darkgreen", lwd=2,lty=3)
#abline(h= (v+(duty[4]*q[4]))/(k4[11,1]*k4[11,5]^2), col="yellow3", lty=3,lwd=2)
text(50, 1e-14,"300Hz", col="red", font=2, cex=1)
text(200, 1.5e-14,"900Hz",font=2, col="blue", cex=1)
#text(20, 1.4e-14,(v+(duty[4]*q[3]))/(k4[11,1]*k4[11,4]^2),font=2, col="darkgreen", cex=1)
#text(20, 1.6e-14,(v+(duty[4]*q[4]))/(k4[11,1]*k4[11,5]^2),font=2,col="yellow3", cex=1)

#mtext("External forces with Q & K in fv & tfor"，side=1, line=0, col="red", cex=1, adj=1,outer=TRUE)
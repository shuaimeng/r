setwd("D:/Dropbox/Data analyze/Rdocuments/datas")
library(xlsx)
 library(RColorBrewer)
 
 ##读取t_for的大小
 k1<-read.xlsx("t_for.xls", sheetName = "0.2-2", header = TRUE)
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

#par(mfrow=c(2,2), mar=c(4,2,2,2), oma=c(2,4,2,2))


#######流量1####
plot(k1[,1],  (duty[1]*q[1])/(k1[,1]*k1[,2]^2), log="x", lwd=2, xlab=expression(log(italic(f["v"])) (Hz)), ylab=expression(italic(F)), main="External forces k=0.2 & Q=180nl/min", col=mycolors[1], pch=pchc[1], ylim=c(0,5e-14))

lines(lowess(k1[,1],  (duty[1]*q[1])/(k1[,1]*k1[,2]^2)), col=mycolors[1], lwd=2.5,lty=2)

for(i in 1:3){

points(lowess(k1[,1], (duty[1]*q[i+1])/(k1[,1]*k1[,i+2]^2)),pch=pchc[i+1], lwd=2, col=mycolors[i+1])
lines(lowess(k1[,1], (duty[1]*q[i+1])/(k1[,1]*k1[,i+2]^2)), lwd=2.5, col=mycolors[i+1], lty=2)
}

legend("topright",c("1.5nl/min", "27nl/min","54nl/min","180nl/min"), inset=0.02, col=mycolors, pch=pchc, lwd=2, bty="n")

abline(h= (duty[1]*q[1])/(k1[11,1]*k1[11,2]^2), col="red", lwd=2,lty=3)
abline(h= (duty[1]*q[2])/(k1[11,1]*k1[11,3]^2), col="blue", lwd=2, lty=3)
abline(h= (duty[1]*q[3])/(k1[11,1]*k1[11,4]^2), col="darkgreen", lwd=2,lty=3)
abline(h= (duty[1]*q[4])/(k1[11,1]*k1[11,5]^2), col="yellow3", lty=3,lwd=2)
text(20, 1.5e-14,(duty[1]*q[1])/(k1[11,1]*k1[11,2]^2), col="red", font=2, cex=1)
text(20, 1.8e-14,(duty[1]*q[2])/(k1[11,1]*k1[11,3]^2), ,font=2, col="blue", cex=1)
text(20, 2.1e-14,(duty[1]*q[3])/(k1[11,1]*k1[11,4]^2), ,font=2, col="darkgreen", cex=1)
text(20, 2.4e-14,(duty[1]*q[4])/(k1[11,1]*k1[11,5]^2), ,font=2,col="yellow3", cex=1)
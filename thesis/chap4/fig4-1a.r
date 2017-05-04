#setwd("D:/Dropbox/Data analyze/Rdocuments/datas")
library(xlsx)
 library(RColorBrewer)
 
 #读取数据
#k1<-read.xlsx("t_for.xls", sheetName = "0.2", header = TRUE)
#k2<-read.xlsx("t_for.xls", sheetName = "0.3", header = TRUE)
#k3<-read.xlsx("t_for.xls", sheetName = "0.4", header = TRUE)
#k4<-read.xlsx("t_for.xls", sheetName = "0.5", header = TRUE)
fv<-5:3500

q<-c(2.5e-14, 4.5e-13, 9e-13, 3e-12) #不同的流量下

k<-c(0.8,0.7,0.6,0.5) #不同占空比下无电场时间比例，即1-k_i

v<-4.66e-13  #泰勒锥的体积总量

#jpeg(file="figure2.jpg")

par(mfrow=c(2,2), mar=c(4,2,2,2), oma=c(2,4,2,2))

mycolors<-c("red", "blue", "darkgreen", "yellow3")

c1<- 0.2 * 4.66e-13 #弯月面体积，用以标识体积增量占泰勒锥体积的大小
#c2<- 0.1 * 4.66e-13
#c3<- 0.05 * 4.66e-13
#c4<-0.4 * 4.66e-13
#c5<- 0.6 * 4.66e-13
c<-4.66e-13  #泰勒锥体积



#####占空比为0.2时######
plot(fv, (k[1]*q[1]/fv+v), col=mycolors[1], log="x", type="l", xlab = expression(log(italic(f["v"])) (Hz)), ylab = expression(italic(volume["increase"](m^3))), main="k=0.2", lwd=2.5, ylim=c(4e-13, 10e-13))#y轴的边界，在不同的占空比k下应该相差不大，最大应该是V_m的2倍，即10e-13左右

for (i in 1:3){
lines(fv,  (k[1]*q[i+1]/fv+v), lwd=2.5, col=mycolors[i+1] )
}
title("k=0.2")
legend("topright", c("1.5nl/min","27nl/min","54nl/min","180nl/min"), inset=0.02, col=mycolors, lwd=2.5, lty=1, cex=1.1, bty="n")

abline(h=c, col="red", lty=2, lwd=2)
abline(h=1.2*c, col="blue", lty=2, lwd=2)
abline(h=1.5*c, col="darkgreen",lty=2, lwd=2)

#text(50, 2.5e-14, "5% V_M,red", col="blue", cex=1.2, font=2)
#text(50, 4e-14, "10% V_M,blue", col="blue", cex=1.2, font=2)

#####占空比k=0.3######
plot(fv, (k[2]*q[1]/fv+v), col=mycolors[1], log="x", type="l", xlab = expression(log(italic(f["v"])) (Hz)), ylab = expression(italic(volume["increase"](m^3))), main="k=0.3", lwd=2.5, ylim=c(4e-13, 10e-13))

for (i in 1:3){
lines(fv,  (k[2]*q[i+1]/fv+v), lwd=2.5, col=mycolors[i+1] )
}
title("k=0.3")
legend("topright",  c("1.5nl/min","27nl/min","54nl/min","180nl/min"), inset=0.02, col=mycolors, lwd=2.5, lty=1, cex=1.1, bty="n")

abline(h=c, col="red", lty=2, lwd=2)
abline(h=1.2*c, col="blue", lty=2, lwd=2)
abline(h=1.5*c, col="darkgreen",lty=2, lwd=2)

#text(50, 1.8e-13, "20% V_M,green", col="blue", cex=1.2, font=2)
#text(50, 1.2e-13, "10% V_M,blue", col="blue", cex=1.2, font=2)
#text(50, 0.75e-14, "5% V_M,red", col="blue", cex=1.2, font=2)

#####占空比k=0.4######
plot(fv, (k[3]*q[1]/fv+v), col=mycolors[1], log="x", type="l", xlab = expression(log(italic(f["v"])) (Hz)), ylab = expression(italic(volume["increase"](m^3))), main="k=0.4", lwd=2.5 , ylim=c(4e-13, 10e-13))

for (i in 1:3){
lines(fv,  (k[3]*q[i+1]/fv+v), lwd=2.5, col=mycolors[i+1] )
}
title("k=0.4")
legend("topright",  c("1.5nl/min","27nl/min","54nl/min","180nl/min"), inset=0.02, col=mycolors, lwd=2.5, lty=1, cex=1.1, bty="n")

abline(h=c, col="red", lty=2, lwd=2)
abline(h=1.2*c, col="blue", lty=2, lwd=2)
abline(h=1.5*c, col="darkgreen",lty=2, lwd=2)

#text(50, 5e-13, "20% V_M, green", col="blue", cex=1.2, font=2)
#text(50, 4e-13, "10% V_M, blue", col="blue", cex=1.2, font=2)
#text(50, 3e-13, "5% V_M, red", col="blue", cex=1.2, font=2)

#####占空比k=0.5######
plot(fv, (k[4]*q[1]/fv+v), col=mycolors[1], log="x", type="l", xlab = expression(log(italic(f["v"])) (Hz)), ylab = expression(italic(volume["increase"](m^3))), main="k=0.5", lwd=2.5 , ylim=c(4e-13, 10e-13))

for (i in 1:3){
lines(fv, (k[4]*q[i+1]/fv+v), lwd=2.5, col=mycolors[i+1] )
}
title("k=0.5")
legend("topright",  c("1.5nl/min","27nl/min","54nl/min","180nl/min"), inset=0.02, col=mycolors, lwd=2.5, lty=1, cex=1.1, bty="n")

abline(h=c, col="red", lty=2, lwd=2)
abline(h=1.2*c, col="blue", lty=2, lwd=2)
abline(h=1.5*c, col="darkgreen",lty=2, lwd=2)

#text(50, 1.6e-12, "60% V_M,yellow", col="blue", cex=1.2, font=2)
#text(50, 1.2e-12, "50% V_M,green", col="blue", cex=1.2, font=2)
#text(50, 0.8e-12, "20% V_M, blue", col="blue", cex=1.2, font=2)
#text(50, 0.5e-12, "5% V_M, red", col="blue", cex=1.2, font=2)

#dev.off()
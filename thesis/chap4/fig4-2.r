#setwd("D:/Dropbox/Data analyze/Rdocuments/datas")
library(xlsx)
 library(RColorBrewer)



 fv<-5:3500 #电压频率

q<-c(2.5e-14, 4.5e-13, 9e-13, 3e-12) #不同的流量下

k<-c(0.5,0.6,0.7,0.8) #不同占空比下无电场时间比例，即1-k_i

v<-4.66e-13  #泰勒锥的体积总量

mycolors<-c("red", "blue", "darkgreen", "yellow3")

pchall<-c(21,22,23,24)

######
par(fig=c(0,1,0,1), new=FALSE)
plot(fv, (k[1]*q[1]/fv+v), mgp = c(2, 0.5, 0),tck=0.02,col=mycolors[1], log="x", type="b", xlab = expression(log(italic(f["v"])) (Hz)),
     ylab = expression(italic(V["ne"]+V(m^3))), main="", lwd=2, pch=pchall[1], lty=2, ylim=c(4.4e-13, 8e-13))

#画出占空比为0.5，流量为1.5nl/min时的弯月面体积，说明最小值是什么

###流量为1.5nl/min时####
for (i in 1:3){
lines(fv,  (k[i+1]*q[1]/fv+v), lwd=1.5, type="b",col="red", pch=pchall[i+1],lty=2,cex=0.6)
}
#画出，流量为最小，占空比从大到小，体积从小到大变化的曲线，其中：颜色均为red，pch的改变代表着占空比的改变

###流量为27nl/min时####
par(fig=c(0,1,0,1))
for (i in 1:4){
lines(fv,  (k[i]*q[2]/fv+v), lwd=1.5, type="b", col="blue", pch=pchall[i] ,lty=2,cex=0.6)
}

###流量为54nl/min时####
for (i in 1:4){
lines(fv,  (k[i]*q[3]/fv+v), lwd=1.5, type="b", col="darkgreen", pch=pchall[i] ,lty=2,cex=0.6)
}

###流量为180nl/min时####
for (i in 1:4){
lines(fv,  (k[i]*q[4]/fv+v), lwd=1.5, type="b", col="yellow3", pch=pchall[i] ,lty=2,cex=0.6)
}

da<-c("k0.5-Q1.5nlmin", "k0.4-Q1.5nlmin", "k0.3-Q1.5nlmin", "k0.2-Q1.5nlmin", "k0.5-Q27nlmin", "k0.4-Q27nlmin", "k0.3-Q27nlmin", "k0.2-Q27nlmin","k0.5-54nlmin", "k0.4-Q54nlmin", "k0.3-Q54nlmin", "k0.2-Q54nlmin","k0.5-Q180nlmin", "k0.4-Q180nlmin", "k0.3-Q180nlmin", "k0.2-Q180nlmin")

mycolorsss<-c("red","red","red","red","blue","blue","blue","blue","darkgreen","darkgreen","darkgreen","darkgreen","yellow3","yellow3","yellow3","yellow3")

pchss<-c(21,22,23,24,21,22,23,24,21,22,23,24,21,22,23,24)

legend("topright",  da, inset=0.08, col=mycolorsss, pch=pchss,  lwd=1.5, lty=2, cex=0.8, bty="n")

abline(v=20, col="red", lwd=2,lty=3)
abline(v=45, col="blue", lwd=2,lty=3)
#abline(v=125, col="darkgreen", lwd=2,lty=3)

#################################################
par(fig=c(0.35, 0.98,0.20,0.98), new=TRUE)

plot(fv, (k[1]*q[1]/fv+v), col=mycolors[1], mgp = c(2, 0.5, 0),tck=0.02,log="x", type="l", xlab = "125Hz ~ 1KHz", ylab ="", lwd=2, lty=2, xlim=c(125,1000), ylim=c(4.66e-13, 5e-13))


#画出占空比为0.5，流量为1.5nl/min时的弯月面体积，说明最小值是什么

###流量为1.5nl/min时####
for (i in 1:3){
lines(fv,  (k[i+1]*q[1]/fv+v), lwd=2, col="red", lty=1)
}
#画出，流量为最小，占空比从大到小，体积从小到大变化的曲线，其中：颜色均为red，pch的改变代表着占空比的改变

###流量为27nl/min时####
for (i in 1:4){
lines(fv,  (k[i]*q[2]/fv+v), lwd=2, col="blue", lty=1)
}

###流量为54nl/min时####
for (i in 1:4){
lines(fv,  (k[i]*q[3]/fv+v), lwd=2,col="darkgreen", lty=1)
}

###流量为180nl/min时####
for (i in 1:4){
lines(fv,  (k[i]*q[4]/fv+v), lwd=2,col="yellow3", lty=1)
}

abline(h=5.126e-13, col="red", lwd=1.5, lty=4)
abline(h=5.592e-13, col="blue", lwd=1.5, lty=4)

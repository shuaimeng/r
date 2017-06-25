dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/jmm2-v1")
library(xlsx)
#读取数据
t2 <- read.xlsx("t_for.xls", sheetName = "0.2", header = TRUE)
t3 <- read.xlsx("t_for.xls", sheetName = "0.3", header = TRUE)
t4 <- read.xlsx("t_for.xls", sheetName = "0.4", header = TRUE)
t5 <- read.xlsx("t_for.xls", sheetName = "0.5", header = TRUE)

p2 <- read.xlsx("t_pulse.xls", sheetName = "single_k2", header = TRUE)
p3 <- read.xlsx("t_pulse.xls", sheetName = "single_k3", header = TRUE)
p4 <- read.xlsx("t_pulse.xls", sheetName = "single_k4", header = TRUE)
p5 <- read.xlsx("t_pulse.xls", sheetName = "single_k5", header = TRUE)

kv<-c("0.2","0.3","0.4","0.5")

zz<-c("X1.5","X27","X54","X180")#不同流量下

coll<-c("green4","black","red","blue")

pccc<-c(0,1,2,5)

fe<-(1000/t2$fv-t2$zz[1])/p2$zz[1]

##################################画图--占空比k = 0.2#######################
par(fig=c(0,0.5,0.5,1),mar = c(2,2.4,2,2), oma = c(1,1,1,1),new=F)

plot(t2$fv, q2$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1.3, 0, 0),tck=0.03, main = "k = 0.2", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 50),ylim=c(0,200))

for(i in 1:4){

points(q2$fv,(1000/t2$fv-t2$zz[i])/p2$zz[i],col=coll[i],pch=pccc[i],cex=0.8)

}

for(i in 1:4){
lines(q2$fv,(1000/t2$fv-t2$zz[i])/p2$zz[i], col=coll[i], lwd=2, type="l", lty=2)
}

######小图######
par(fig=c(0.12,0.49,0.65,0.99),new=T)

plot(q2$fv, q2$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1.3, 0, 0),tck=0.03, main = "", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 150),ylim=c(0,200))

for(i in 1:4){

  points(q2$fv,(1000/t2$fv-t2$zz[i])/p2$zz[i],col=coll[i],pch=pccc[i],cex=0.8)

}

for(i in 1:4){
  lines(q2$fv,(1000/t2$fv-t2$zz[i])/p2$zz[i], col=coll[i], lwd=2, type="l", lty=2)
}


#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("green4", "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")


##################################画图--占空比k = 0.3#######################
par(fig=c(0.5,1,0.5,1), new=T)


plot(q3$fv, q3$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1.3, 0, 0),tck=0.03,main = "k = 0.3", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 50),ylim =c(0,200))

for(i in 1:4){

  points(q3$fv,(1000/t3$fv-t3$zz[i])/p3$zz[i],col=coll[i],pch=pccc[i],cex=0.8)

}

for(i in 1:4){
  lines(q2$fv,(1000/t3$fv-t3$zz[i])/p3$zz[i], col=coll[i], lwd=2, type="l", lty=2)
}


####小图####
par(fig=c(0.62,0.99,0.65,0.99),new=T)

plot(q3$fv, q3$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1.3, 0, 0),tck=0.03,main = "", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 150),ylim =c(0,200))

for(i in 1:4){

  points(q3$fv,(1000/t3$fv-t3$zz[i])/p3$zz[i],col=coll[i],pch=pccc[i],cex=0.8)

}

for(i in 1:4){
  lines(q2$fv,(1000/t3$fv-t3$zz[i])/p3$zz[i], col=coll[i], lwd=2, type="l", lty=2)
}



#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("green4", "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")


##################################画图--占空比k = 0.4#######################
par(fig=c(0,0.5,0,0.5), new=T)


plot(q4$fv, q4$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)),mgp=c(1.3, 0, 0),tck=0.03, main = "k = 0.4", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 50),ylim=c(0,200))

for(i in 1:4){

  points(q3$fv,(1000/t4$fv-t4$zz[i])/p4$zz[i],col=coll[i],pch=pccc[i],cex=0.8)

}

for(i in 1:4){
  lines(q2$fv,(1000/t4$fv-t4$zz[i])/p4$zz[i], col=coll[i], lwd=2, type="l", lty=2)
}

###小图###
par(fig=c(0.12,0.49,0.15,0.49),new=T)

plot(q4$fv, q4$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)),mgp=c(1.3, 0, 0),tck=0.03, main = "", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 150),ylim=c(0,200))

for(i in 1:4){

  points(q3$fv,(1000/t4$fv-t4$zz[i])/p4$zz[i],col=coll[i],pch=pccc[i],cex=0.8)

}

for(i in 1:4){
  lines(q2$fv,(1000/t4$fv-t4$zz[i])/p4$zz[i], col=coll[i], lwd=2, type="l", lty=2)
}

#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("green4", "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")

##################################画图--占空比k = 0.5#######################
########k=0.5######
par(fig=c(0.5,1,0,0.5), new=T)

plot(q5$fv, q5$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1.3, 0, 0),tck=0.03,main = "k = 0.5", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 50),ylim=c(0,200))


for(i in 1:4){

  points(q3$fv,(1000/t5$fv-t5$zz[i])/p5$zz[i],col=coll[i],pch=pccc[i],cex=0.8)

}

for(i in 1:4){
  lines(q2$fv,(1000/t5$fv-t5$zz[i])/p5$zz[i], col=coll[i], lwd=2, type="l", lty=2)
}

###小图###
par(fig=c(0.6,0.99,0.15,0.49),new=T)

plot(q5$fv, q5$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1.3, 0, 0),tck=0.03,main = "", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 150),ylim=c(0,200))

for(i in 1:4){

  points(q3$fv,(1000/t5$fv-t5$zz[i])/p5$zz[i],col=coll[i],pch=pccc[i],cex=0.8)

}

for(i in 1:4){
  lines(q2$fv,(1000/t5$fv-t5$zz[i])/p5$zz[i], col=coll[i], lwd=2, type="l", lty=2)
}
#区域划线
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("green4", "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")

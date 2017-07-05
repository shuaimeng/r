#t_pulse是单次射出所需的时间
#t_pulse，随着电压频率fv的上升而改变；随着流量而改变；

#设定工作目录
#setwd("D:/data")
dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/chap4")
library(xlsx)
library(RColorBrewer)

#读取数据
s2<-read.xlsx("t_pulse.xls", sheetName = "single_k2", header = TRUE)
s3<-read.xlsx("t_pulse.xls", sheetName = "single_k3", header = TRUE)
s4<-read.xlsx("t_pulse.xls", sheetName = "single_k4", header = TRUE)
s5<-read.xlsx("t_pulse.xls", sheetName = "single_k5", header = TRUE)

#保存数据
#pdf("t_pulse_K_mixed.pdf")

par(mfrow = c(2,2), mar = c(2,2,0.8,1), oma = c(1,1,1,1))
mycolors <- c("green4", "black", "red", "blue")
pchc <- c(0,1,2,5)

##################################画图--占空比k为0.2#######################
plot(s2$fv, s2$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["p"]) (ms)),mgp=c(0.8, 0, 0),tck=0.01,  main = "", cex.lab = 1,
     cex.axis = 1, yaxs = "r", xlim = c(0, 1000), cex=0.7,ylim = c(0, 1))
     mtext("kv = 0.2",3,line=0,font=2,cex=0.9)

for (i in 1:4){
  points(s2$fv, s2[,i+1],  col=mycolors[i], cex=0.7,pch=pchc[i], lwd = 1)
}

abline(0.45, -0.00088, lty = 3, col = "red", lwd = 2)
abline(0.9, -0.001, lty = 3, col = "red", lwd = 2)
text(500, 1, "0.45ms ~ 0.9ms", col ="blue", cex =1, font =2)
#text(20, 0.95, "(a)", col ="black", cex =1.2, font =2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"),
       col = mycolors, inset = .01,cex = 0.85, pch =pchc, bty = "n")

#################画图--占空比k为0.3#######################
plot(s3$fv, s3$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["p"]) (ms)),cex=0.7, mgp=c(0.8, 0, 0),tck=0.01, main = "",
     cex.lab = 1, cex.axis = 1, yaxs = "r",
     xlim = c(0, 1000), ylim = c(0, 1))

     mtext("kv = 0.3",3,line=0,font=2,cex=0.9)


for (i in 1:4){
  points(s3$fv, s3[,i+1],  cex=0.7,col=mycolors[i], pch=pchc[i], lwd = 1)
}

abline(0.50, -0.00088, lty = 3, col = "red", lwd = 2)
abline(0.9, -0.001, lty = 3, col = "red", lwd = 2)
text(500, 1, "0.5ms ~ 0.9ms", col ="blue", cex =1, font =2)
#text(20, 0.95, "(b)", col ="black", cex =1.2, font =2)
legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"),
       inset = .01, col = mycolors, cex = 0.85, pch =pchc, bty = "n")

############画图--占空比k为0.4#######################
plot(s4$fv, s4$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["p"]) (ms)),cex=0.7, mgp=c(0.8, 0, 0),tck=0.01, main = "",
     cex.lab = 1, cex.axis = 1, yaxs = "r",
     xlim = c(0, 2000), ylim = c(0, 1))

     mtext("kv = 0.4",3,line=0,font=2,cex=0.9)


for (i in 1:4){
  points(s4$fv, s4[,i+1], cex=0.7, col=mycolors[i], pch=pchc[i], lwd = 1)
}

abline(0.50, -0.00088, lty = 3, col = "red", lwd = 2)
abline(0.9, -0.001, lty = 3, col = "red", lwd = 2)
text(1000, 1, "0.5ms ~ 0.9ms", col ="blue", cex =1, font =2)
#text(20, 1.5, "(c)", col ="black", cex =1.2, font =2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"),
       inset = .01, col = mycolors, cex = 0.85, pch =pchc, bty = "n")

##################################画图--占空比k为0.5#######################
plot(s5$fv, s5$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["p"]) (ms)),cex=0.7,mgp=c(0.8, 0, 0),tck=0.01,  main = "",
     cex.lab = 1, cex.axis = 1, yaxs = "r",
     xlim = c(0, 3500), ylim = c(0, 1))

mtext("kv = 0.5",3,line=0,font=2,cex=0.9)


for (i in 1:4){
  points(s5$fv, s5[,i+1],cex=0.7,  col=mycolors[i], pch=pchc[i], lwd = 1)
}

abline(0.55, -0.00088, lty = 3, col = "red", lwd = 2)
abline(0.95, -0.001, lty = 3, col = "red", lwd = 2)
text(1600, 1, "0.55ms ~ 0.95ms", col ="blue", cex =1, font =2)
#text(20, 1.7, "(d)", col ="black", cex =1.2, font =2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"),
       inset = .01, col = mycolors, cex = 0.85, pch =pchc, bty = "n")

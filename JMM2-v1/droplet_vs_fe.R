dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/jmm2-v1")

library(xlsx)
library(plotrix)
#读取数据
q2 <- read.xlsx("f_eject_2.xls", sheetName = "single_k2", header = TRUE)
#q3 <- read.xlsx("f_eject_2.xls", sheetName = "single_k3", header = TRUE)
#q4 <- read.xlsx("f_eject_2.xls", sheetName = "single_k4", header = TRUE)
#q5 <- read.xlsx("f_eject_2.xls", sheetName = "single_k5", header = TRUE)

k2 <- read.xlsx("dvsfv.xls", sheetName = "k2", header = TRUE)
#k3 <- read.xlsx("dvsfv.xls", sheetName = "k3", header = TRUE)
#k4 <- read.xlsx("dvsfv.xls", sheetName = "k4", header = TRUE)
#k5 <- read.xlsx("dvsfv.xls", sheetName = "k5", header = TRUE)


#plot(q2$fv, q2$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     #ylab = expression(italic(f["e"]) (Hz)), mgp=c(1.3, 0, 0),tck=0.03,
     #main = "k = 0.2", cex.lab = 1.2, cex.main = 1.5,
     #xlim = c(0, 50),ylim=c(0,200))
x<-1:15
x<-as.double(x)
y<-2:16
y<-as.double(y)
z<-20:35
z<-as.double(z)

twoord.plot(x,y,x,z,xlim=c(0,20),lylim=c(0,20),
            rylim=c(0,35), xlab=expression(italic(f["v"]) (Hz)),
            expression(italic(f["e"]) (Hz)),
            rylab=expression(italic(d) (um)),main="k = 0.2",
            cex.lab = 1.2, cex.main = 1.5,col = "green4")

#lines(q2$fv, q2$X1.5, col="green4", lwd=2, type="l", lty=2)
#lines(k2$fv, k2$X15, col="green4", lwd=2, type="l", lty=2)

#lines(q2$fv, q2$X27, col="black", lwd=2, type="l", lty=2)
#lines(k2$fv, k2$X270, col="black", lwd=2, type="l", lty=2)

#lines(q2$fv, q2$X54, col="red", lwd=2, type="l", lty=2)
#lines(k2$fv, k2$X540, col="red", lwd=2, type="l", lty=2)

#lines(q2$fv, q2$X180, col="blue", lwd=2, type="l", lty=2)
#lines(k2$fv, k2$X1800, col="blue", lwd=2, type="l", lty=2)

legend("topright", c("1.5nl/min","1.5nl/min", "27nl/min","27nl/min",
                     "54nl/min","54nl/min", "180nl/min","180nl/min"),
       col = c("green4","green4", "black","black", "red","red", "blue", "blue"),
       lwd = 2, lty = 2, cex = 1.2, inset = .1, bty = "n")

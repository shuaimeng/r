dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/jmm2-v1")
library(xlsx)
#读取数据
q2 <- read.xlsx("t_for.xls", sheetName = "0.2", header = TRUE)
q3 <- read.xlsx("t_for.xls", sheetName = "0.3", header = TRUE)
q4 <- read.xlsx("t_for.xls", sheetName = "0.4", header = TRUE)
q5 <- read.xlsx("t_for.xls", sheetName = "0.5", header = TRUE)


par(fig=c(0,1,0,1), new = F)

plot(q5$fv, q5$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)),
     mgp=c(1.3, 0, 0),tck=0.03,
     main = "k = 0.5", cex.lab = 1.2,
     cex.main = 1.5, xlim = c(0, 3500),ylim=c(0,40))

#z1=loess(q2$X1.5~q2$fv,span=0.1,degree=2)
lines(lowess(q5$fv, q5$X1.5), col="green4", lwd=2, type="l", lty=2)
#z2=loess(q2$X27~q2$fv,span=0.1,degree=2)
lines(lowess(q5$fv, q5$X27), col="black", lwd=2, type="l", lty=2)
#z3=loess(q2$X54~q2$fv,span=0.1,degree=2)
lines(lowess(q5$fv, q5$X54), col="red", lwd=2, type="l", lty=2)
#z4=loess(q2$X180~q2$fv,span=0.1,degree=2)
lines(lowess(q5$fv, q5$X180), col="blue", lwd=2, type="l", lty=2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min",
        "180nl/min"), col = c("green4",
      "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 1.2, inset = .12, bty = "n")

#####小图###


par(fig = c(0.15,0.95,0.15,0.95), new  = TRUE)


plot(q5$fv, q5$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)),
     ylab = expression(italic(t["for"]) (ms)),
     mgp=c(1.3, 0, 0),tck=0.03,
      cex.lab = 1.2,
     cex.main = 1.5, xlim = c(0, 500),ylim=c(0,40))


lines(lowess(q5$fv, q5$X1.5,f=2/3,iter=3), col="green4", lwd=2, type="l", lty=2)
lines(lowess(q5$fv, q5$X27,f=2/3,iter=3), col="black", lwd=2, type="l", lty=2)
lines(lowess(q5$fv, q5$X54,f=2/3,iter=3), col="red", lwd=2, type="l", lty=2)
lines(lowess(q5$fv, q5$X180,f=2/3,iter=3), col="blue", lwd=2, type="l", lty=2)

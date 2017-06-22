library(xlsx)
#读取数据
q2 <- read.xlsx("t_for.xls", sheetName = "0.2", header = TRUE)
q3 <- read.xlsx("t_for.xls", sheetName = "0.3", header = TRUE)
q4 <- read.xlsx("t_for.xls", sheetName = "0.4", header = TRUE)
q5 <- read.xlsx("t_for.xls", sheetName = "0.5", header = TRUE)

par(mfrow = c(2,2), mar = c(2,2.4,2,2), oma = c(1,1,1,1))
#######k=0.2#######
plot(q2$fv, q2$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(t["for"]) (ms)), mgp=c(1.3, 0, 0),tck=0.03, 
     main = "k = 0.2", cex.lab = 1.2, cex.main = 1.5,
     xlim = c(0, 250),ylim=c(0,40))

points(q2$fv,q2$X1.5,col="green4",pch=0,cex=0.6)
points(q2$fv,q2$X27,col="black",pch=1,cex=0.6)
points(q2$fv,q2$X54,col="red",pch=2,cex=0.6)
points(q2$fv,q2$X180,col="blue",pch=5,cex=0.6)

lines(lowess(q2$fv, q2$X1.5,f=0.1,iter=3),col="green4", lwd=2, type="l", lty=2)
lines(lowess(q2$fv, q2$X27,f=0.1,iter=3),col="black", lwd=2, type="l", lty=2)
lines(lowess(q2$fv,q2$X54,f=0.1,iter=3),col="red", lwd=2, type="l", lty=2)
lines(lowess(q2$fv, q2$X180,f=0.1,iter=3),col="blue", lwd=2, type="l", lty=2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", 
                     "180nl/min"), col = c("green4", 
                                           "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 1, inset = .12, bty = "n")


########k=0.3#######
plot(q3$fv, q3$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(t["for"]) (ms)), mgp=c(1.3, 0, 0),tck=0.03, 
     main = "k = 0.3", cex.lab = 1.2, cex.main = 1.5,
     xlim = c(0, 250),ylim=c(0,40))

points(q3$fv,q3$X1.5,col="green4",pch=0,cex=0.6)
points(q3$fv,q3$X27,col="black",pch=1,cex=0.6)
points(q3$fv,q3$X54,col="red",pch=2,cex=0.6)
points(q3$fv,q3$X180,col="blue",pch=5,cex=0.6)

lines(lowess(q3$fv, q3$X1.5,f=0.1,iter=3),col="green4", lwd=2, type="l", lty=2)
lines(lowess(q3$fv, q3$X27,f=0.1,iter=3),col="black", lwd=2, type="l", lty=2)
lines(lowess(q3$fv, q3$X54,f=0.1,iter=3),col="red", lwd=2, type="l", lty=2)
lines(lowess(q3$fv, q3$X180,f=0.1,iter=3),col="blue", lwd=2, type="l", lty=2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", 
                     "180nl/min"), col = c("green4", 
                                           "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 1, inset = .12, bty = "n")
########k=0.4######
plot(q4$fv, q4$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(t["for"]) (ms)), mgp=c(1.3, 0, 0),tck=0.03, 
     main = "k = 0.4", cex.lab = 1.2, cex.main = 1.5,
     xlim = c(0, 250),ylim=c(0,40))

points(q4$fv,q4$X1.5,col="green4",pch=0,cex=0.6)
points(q4$fv,q4$X27,col="black",pch=1,cex=0.6)
points(q4$fv,q4$X54,col="red",pch=2,cex=0.6)
points(q4$fv,q4$X180,col="blue",pch=5,cex=0.6)

lines(q4$fv, q4$X1.5, col="green4", lwd=2, type="l", lty=2)
lines(q4$fv, q4$X27,col="black", lwd=2, type="l", lty=2)
lines(q4$fv, q4$X54,col="red", lwd=2, type="l", lty=2)
lines(q4$fv, q4$X180,col="blue", lwd=2, type="l", lty=2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", 
                     "180nl/min"), col = c("green4", 
                                           "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 1, inset = .12, bty = "n")
########k=0.5######

plot(q5$fv, q5$X1.5, xaxs = "i", col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(t["for"]) (ms)), mgp=c(1.3, 0, 0),tck=0.03, 
     main = "k = 0.5", cex.lab = 1.2, cex.main = 1.5,
     xlim = c(0, 250),ylim=c(0,40))

points(q5$fv,q5$X1.5,col="green4",pch=0,cex=0.6)
points(q5$fv,q5$X27,col="black",pch=1,cex=0.6)
points(q5$fv,q5$X54,col="red",pch=2,cex=0.6)
points(q5$fv,q5$X180,col="blue",pch=5,cex=0.6)

lines(q5$fv, q5$X1.5,col="green4", lwd=2, type="l", lty=2)
lines(q5$fv, q5$X27, col="black", lwd=2, type="l", lty=2)
lines(q5$fv, q5$X54,col="red", lwd=2, type="l", lty=2)
lines(q5$fv, q5$X180,col="blue", lwd=2, type="l", lty=2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", 
                     "180nl/min"), col = c("green4", 
                                           "black", "red", "blue"), pch = c(0,1,2,5),
       lwd = 2, lty = 2, cex = 1, inset = .12, bty = "n")
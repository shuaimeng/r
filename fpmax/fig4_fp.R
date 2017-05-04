library(xlsx)

#Reading datas: f_elect.xls

q1<-read.xlsx("f_eject.xls", sheetName = "eject_q15", header = TRUE)
q2<-read.xlsx("f_eject.xls", sheetName = "eject_q27", header = TRUE)
q3<-read.xlsx("f_eject.xls", sheetName = "eject_q54", header = TRUE)
q4<-read.xlsx("f_eject.xls", sheetName = "eject_q180", header = TRUE)

#X0.2
#X0.3
#X0.4
#X0.5

par(mfrow = c(2,2), mar = c(2,2.4,2,2), oma = c(1,1,1,1))


yan<-c("red","blue","black","green3")

pcc<-c(0,1,2,5)

leg<-c("kv=0.2","kv=0.3","kv=0.4","kv=0.5")

###kv=0.2

plot(q1$fv,q1$X0.2,col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.01, 
     main = "1.5nl/min", cex.lab = 1.2,
     xlim = c(0, 1200),ylim=c(0,1500))

lines(q1$fv,q1$X0.2,col=yan[1],lwd=2,pch=pcc[1],type="b",lty=2)
lines(q1$fv,q1$X0.3,col=yan[2],lwd=2,pch=pcc[2],type="b",lty=2)
lines(q1$fv,q1$X0.4,col=yan[3],lwd=2,pch=pcc[3],type="b",lty=2)
lines(q1$fv,q1$X0.5,col=yan[4],lwd=2,pch=pcc[4],type="b",lty=2)

legend("topleft",legend=leg,pch=pcc,col=yan,bty = "n",lwd=1.5,inset=.06)

###kv=0.3

plot(q2$fv,q2$X0.2,col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.01, 
     main = "27nl/min", cex.lab = 1.2,
     xlim = c(0, 1200),ylim=c(0,1500))

lines(q2$fv,q2$X0.2,col=yan[1],lwd=2,pch=pcc[1],type="b",lty=2)
lines(q2$fv,q2$X0.3,col=yan[2],lwd=2,pch=pcc[2],type="b",lty=2)
lines(q2$fv,q2$X0.4,col=yan[3],lwd=2,pch=pcc[3],type="b",lty=2)
lines(q2$fv,q2$X0.5,col=yan[4],lwd=2,pch=pcc[4],type="b",lty=2)

legend("topleft",legend=leg,pch=pcc,col=yan,bty = "n",lwd=1.5,inset=.06)

###kv=0.4

plot(q3$fv,q3$X0.2,col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.01, 
     main = "54nl/min", cex.lab = 1.2,
     xlim = c(0, 1200),ylim=c(0,2000))

lines(q3$fv,q3$X0.2,col=yan[1],lwd=2,pch=pcc[1],type="b",lty=2)
lines(q3$fv,q3$X0.3,col=yan[2],lwd=2,pch=pcc[2],type="b",lty=2)
lines(q3$fv,q3$X0.4,col=yan[3],lwd=2,pch=pcc[3],type="b",lty=2)
lines(q3$fv,q3$X0.5,col=yan[4],lwd=2,pch=pcc[4],type="b",lty=2)

legend("topleft",legend=leg,pch=pcc,col=yan,bty = "n",lwd=1.5,inset=.06)

###kv=0.5

plot(q1$fv,q1$X0.2,col = 0, xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(f["e"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.01, 
     main = "180nl/min", cex.lab = 1.2,
     xlim = c(0, 3500),ylim=c(0,3500))

lines(q4$fv,q4$X0.2,col=yan[1],lwd=2,pch=pcc[1],type="b",lty=2)
lines(q4$fv,q4$X0.3,col=yan[2],lwd=2,pch=pcc[2],type="b",lty=2)
lines(q4$fv,q4$X0.4,col=yan[3],lwd=2,pch=pcc[3],type="b",lty=2)
lines(q4$fv,q4$X0.5,col=yan[4],lwd=2,pch=pcc[4],type="b",lty=2)

legend("topleft",legend=leg,pch=pcc,col=yan,bty = "n",lwd=1.5,inset=.06)







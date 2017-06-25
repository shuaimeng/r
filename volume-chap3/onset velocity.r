library(xlsx)
 library(RColorBrewer)
 
 mycolors<-c("red","blue","darkgreen","yellow3")
 
 pchc<-c(21,22,23,24)
 
q<-c(2.5e-14, 4.5e-13, 9e-13, 3e-12)  #流量

k<-c(0.2,0.3,0.4,0.5) #占空比

Rn<-c(0.845e-3, 0.715e-3, 0.46e-3, 0.305e-3, 0.26e-3, 0.21e-3,0.17e-3,0.15e-3,0.13e-3,0.12e-3,0.105e-3,0.09e-3,0.08e-3) #针头内径
Rnn<-1000*Rn

#对应于14G，15G，18G，20G，21G，22G，23G，24G，25G，26G，27G，28G，30G

par(fig=c(0,1,0,1), new=FALSE)

plot(Rnn, 1000*(q[1]/(pi*Rn^2)),mgp = c(1.5, 0.5, 0),tck=0.02,
     type="b", xlab=expression(italic(r["n"](mm))), ylab=expression(italic(U["o"](mm/s))), main="", lwd=2, lty=1, col="red",pch=21,cex=0.6, ylim=c(0,5e-2)) 


lines(Rnn, 1000*(q[2]/(pi*Rn^2)), type="b",lwd=2, col=mycolors[2], cex=0.6,pch=pchc[2], lty=1)
lines(Rnn, 1000*(q[3]/(pi*Rn^2)), type="b",lwd=2, col=mycolors[3], cex=0.6,pch=pchc[3], lty=1)
lines(Rnn, 1000*(q[4]/(pi*Rn^2)), type="b",lwd=2, col=mycolors[4], cex=0.6,pch=pchc[4], lty=1)


#######
par(fig=c(0.3,0.98,0.2,0.98), new=TRUE)

Rn2<-c(0.12e-3,0.105e-3,0.09e-3,0.08e-3) #针头内径
Rn22<-1000*Rn2

plot(Rn22, 1000*(q[1]/(pi*Rn2^2)), cex=0.6,mgp = c(1.5, 0.5, 0),tck=0.02,type="b", xlab="30G\\28G\\27G\\26G(mm)", ylab=expression(italic(U["o"](mm/s))), main="", lwd=2, lty=1, col="red",pch=21, ylim=c(0,20e-2)) 


lines(Rn22, 1000*(q[2]/(pi*Rn2^2)),cex=0.6, type="b",lwd=2, col=mycolors[2], pch=pchc[2], lty=1)
lines(Rn22, 1000*(q[3]/(pi*Rn2^2)),cex=0.6, type="b",lwd=2, col=mycolors[3], pch=pchc[3], lty=1)
lines(Rn22, 1000*(q[4]/(pi*Rn2^2)), cex=0.6,type="b",lwd=2, col=mycolors[4], pch=pchc[4], lty=1)

legend("topright",c("1.5nl/min","27nl/min","54nl/min","180nl/min"), inset=0.06, cex=0.95,col=mycolors, pch=pchc,lwd=2, lty=3,bty="n")

#######



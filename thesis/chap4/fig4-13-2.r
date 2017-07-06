## fvc和fpmax

fvc2<-c(300,300,200,200)
fvc3<-c(300,500,310,200)
fvc4<-c(400,600,600,700)
fvc5<-c(400,711,800,1110)

fpmax2<-c(1000,600,500,600)
fpmax3<-c(600,500,800,800)
fpmax4<-c(400,600,1000,2000)
fpmax5<-c(400,700,1000,3500)

par(mfrow = c(2,1), mar = c(2,2.2,0.3,1), oma = c(1,1,1,1))
##
yan<-c("red","blue","black","green3")
x<-c(1.5,27,54,180)
pcc<-c(0,1,2,5)

plot(x,fvc2, col=0,xlab = expression(italic(Q) (nl/min)),
     ylab = expression(italic(f["vc"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02,
     main = "", xlim = c(0, 180),ylim=c(0,1200))

     mtext("fvc",3,line=-1,font=2,cex=0.9)

     lines(x,fvc2,col=yan[1],pch=pcc[1],lwd=1.5,lty=2,type="b")
     lines(x,fvc3,col=yan[2],pch=pcc[2],lwd=1.5,lty=2,type="b")
     lines(x,fvc4,col=yan[3],pch=pcc[3],lwd=1.5,lty=2,type="b")
     lines(x,fvc5,col=yan[4],pch=pcc[4],lwd=1.5,lty=2,type="b")

     leg1<-c("kv=0.2","kv=0.3","kv=0.4","kv=0.5")

    legend("topleft",legend=leg1,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n",cex=0.8)


    plot(x,fpmax2, col=0,xlab = expression(italic(Q) (nl/min)),
         ylab = expression(italic(f["pmax"]) (Hz)), mgp=c(1.1, 0, 0),tck=0.02,
         main = "", xlim = c(0, 180),ylim=c(0,3500))

         mtext("fpmax",3,line=-1,font=2,cex=0.9)

         lines(x,fpmax2,col=yan[1],pch=pcc[1],lwd=1.5,lty=2,type="b")
         lines(x,fpmax3,col=yan[2],pch=pcc[2],lwd=1.5,lty=2,type="b")
         lines(x,fpmax4,col=yan[3],pch=pcc[3],lwd=1.5,lty=2,type="b")
         lines(x,fpmax5,col=yan[4],pch=pcc[4],lwd=1.5,lty=2,type="b")

         leg1<-c("kv=0.2","kv=0.3","kv=0.4","kv=0.5")

        legend("topleft",legend=leg1,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n",cex=0.8)

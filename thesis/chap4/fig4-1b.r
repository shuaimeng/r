
       #par(mfrow=c(2,1), mgp = c(1.5, 0.5, 0),tck=0.02)

       V<- 4.66*10^(-13)

       #V是基础弯月面体积

       vne1<- 0.5*q[1]/fv + 4.66*10^(-13)


       vne2<- (3*10^(-12))*(1-k)/fv

       #vne是体积增量

       fv<-c(1:200)
       q<-c(1.5*10^(-12),8.33*10^(-12),16.67*10^(-12),
            1.5/60*10^(-12),27/60*10^(-12),54/60*10^(-12),3*10^(-12))
       k<-c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8)

       #fv,q,k分别为电压频率，流量和占空比

       plot(fv,vne1, mgp = c(1.5, 0.5, 0),tck=0.02,type="b",pch=1,cex=0.6,lwd=1.5,lty=2,xlab = expression(italic(f["v"])(Hz)),
            ylab = expression (V["ne"]+V(m^3)),xlim=c(0,200),ylim=c(4.66*10^(-13), 9*10^(-13)))

       coll<-rainbow(7)
       pcc<-c(1,2,3,4,5,6,7)

       for(i in 2:7){
         lines(fv,(0.5*q[i]/fv + 4.66*10^(-13)),col=coll[i],pch=pcc[i],cex=0.6, type="b",lwd=1.5,
               lty=2)
       }

       abline(h=(V+0.05*V),col="red",lwd=1.5,lty=4)
       abline(h=(V+0.1*V),col="red",lwd=1.5,lty=4)
       abline(h=(V+0.2*V),col="red",lwd=1.5,lty=4)
       abline(h=(V+0.6*V),col="red",lwd=1.5,lty=4)

       legend("topright",c("1.5nl/s","8.33nl/s","16.67nl/s",
                           "1.5nl/min","27nl/min","54nl/min",
                           "180nl/min"),col=c("black",
         coll[2],coll[3],coll[4],coll[5],coll[6],coll[7]),
         inset = .06,pch=c(1,2,3,4,5,6,7),bty = "n",lty=2,lwd=1.5)

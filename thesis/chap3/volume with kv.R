
#par(mfrow=c(2,1), mgp = c(1.5, 0.5, 0),tck=0.02)

V<- 4.66*10^(-13)

#V是基础弯月面体积

vne1<- 0.5*q[1]/fv + 4.66*10^(-13)


vne2<- (3*10^(-12))*0.9/fv + 4.66*10^(-13)

vne3<-(q[7]*(1-k))/fv+4.66*10^(-13)

#vne是体积增量

fv<-c(1:200)
q<-c(1.5*10^(-12),8.33*10^(-12),16.67*10^(-12),
     1.5/60*10^(-12),27/60*10^(-12),54/60*10^(-12),3*10^(-12))
k<-c(0.1,0.3,0.5,0.7,0.8)

#fv,q,k分别为电压频率，流量和占空比

coll<-rainbow(5)


plot(fv,vne2, col=coll[1],mgp = c(1.5, 0.5, 0),tck=0.02,type="b",pch=1,cex=0.6,lwd=1.5,lty=2,xlab = expression(italic(f["v"])(Hz)),
     ylab = expression (V["ne"]+V(m^3)),xlim=c(0,200),ylim=c(4.66*10^(-13), 9*10^(-13)))


pcc<-c(1,2,3,4,5)

for(i in 2:5){
  lines(fv,(q[7]*(1-k[i])/fv + 4.66*10^(-13)),col=coll[i],pch=pcc[i],cex=0.6, type="b",lwd=1.5,
        lty=2)
}

abline(h=(V+0.05*V),col="blue",lwd=1.5,lty=4)
abline(h=(V+0.1*V),col="blue",lwd=1.5,lty=4)
abline(h=(V+0.2*V),col="blue",lwd=1.5,lty=4)
abline(h=(V+0.6*V),col="blue",lwd=1.5,lty=4)

legend("topright",c("k=0.1","k=0.3","k=0.5",
                    "k=0.7","k=0.8"),col=coll,
       inset = .1,pch=pcc,bty = "n",lty=2,lwd=1.5)
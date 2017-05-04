setwd("/Users/mengmengjiang/37datas")
library(xlsx)

# liquid-1
fpm1_18<-c(3,3.5,3)
fpm1_180<-c(0.1,2,4)

# voltage: 1.8kv,1.9kv,2kv

v<-c(1.8,1.9,2)

# liquid-2
fpm2_18<-c(3,1.7,2)
fpm2_180<-c(3,1.5,1.5)

yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

plot(v,fpm1_18, col=0,xlab = expression(italic(V) (Kv)), 
          ylab = expression(italic(f["pmax"])(KHz)), mgp=c(1.1, 0, 0),tck=0.02, 
               main = "", xlim = c(1.8,2),ylim=c(0,4))
     
 #axis(side=1,at=1:3,tck=-0.2,labels=c("1.8kv","1.9kv","2kv"))

 lines(v,fpm1_18,col=yan[1],pch=pcc[1],lwd=1.5,type="b",lty=2)
 lines(v,fpm1_180,col=yan[2],pch=pcc[2],lwd=1.5,type="b",lty=2)
  lines(v,fpm2_18,col=yan[3],pch=pcc[3],lwd=1.5,type="b",lty=2)
  lines(v,fpm2_180,col=yan[4],pch=pcc[4],lwd=1.5,type="b",lty=2)

   leg<-c("Gly1-18nl/min","Gly1-180nl/min","Gly2-18ml/min","Gly2-180nl/min")
   legend("bottomright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset = .03,bty
          = "n",cex=0.8)



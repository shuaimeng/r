dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

setwd("/Users/mengmengjiang/all datas/voltage")
library(xlsx)

# 32G 0+2kv 18nl/min

x<-c(2,2.5,3,3.5,4)

y0<-c(33/60,33/60,33.4/60,34/60,34/60)

y1<-c(34/60,35/60,34.5/60,34.5/60,35/60) # 32G,0+2kv,18nl/min

y2<-c(39/80,40/80,42/80,41/80,41/80) # 32G,V1,18nl/min

y3<-c(41/78,40/80,41/80,43/79,38/79) # 32G,V2,18nl/min

y4<-c(39/79,39/79,40/79,40/81,40/81) # 32G,V3,18nl/min

y5<-c(40/79,38/79,43/82,44/80,40/81) # 32G,V1,180nl/min

y6<-c(35/80,34/80,35/80,35/80,36/80) # 32G,V2,180nl/min

y7<-c(36/81,36/81,36/81,36/81,37/81) # 32G,V3,180nl/min

yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

par(mfrow = c(2,1), mar = c(2,2.4,2,2), oma = c(1,1,1,1))


plot(x,y1, col=0,xlab = expression(italic(f["v"]) (KHz)),
     ylab = expression(italic(height/D)), mgp=c(1.1, 0, 0),tck=0.02,
     main = "", xlim = c(2,4),ylim=c(0.3,0.6))

        mtext("height/D-18nl/min",3,line=0.2,font=2,cex=1.2)

        lines(x,y0,col=yan[1],pch=pcc[1],type="b",lwd=2,lty=2)
        lines(x,y2,col=yan[2],pch=pcc[2],type="b",lwd=2,lty=2)
        lines(x,y3,col=yan[3],pch=pcc[3],type="b",lwd=2,lty=2)
        lines(x,y4,col=yan[4],pch=pcc[4],type="b",lwd=2,lty=2)



        leg<-c("0+2kv-18nl/min","1.7kv+2kv-18nl/min",
        "1.8kv-2kv-18nl/min","1.9kv-2kv-18nl/min")

        legend("bottomright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n")

        plot(x,y1, col=0,xlab = expression(italic(f["v"]) (KHz)),
             ylab = expression(italic(height/D)), mgp=c(1.1, 0, 0),tck=0.02,
             main = "", xlim = c(2,4),ylim=c(0.3,0.6))

                mtext("height/D-180nl/min",3,line=0.2,font=2,cex=1.2)

                lines(x,y1,col=yan[1],pch=pcc[1],type="b",lwd=2,lty=2)
                lines(x,y5,col=yan[2],pch=pcc[2],type="b",lwd=2,lty=2)
                lines(x,y6,col=yan[3],pch=pcc[3],type="b",lwd=2,lty=2)
                lines(x,y7,col=yan[4],pch=pcc[4],type="b",lwd=2,lty=2)


        leg2<-c("0-2kv-180nl/min","1.7kv-2kv-180nl/min",
        "1.8kv-2kv-180nl/min","1.9kv-2kv-180nl/min")
        legend("bottomright",legend=leg,col=yan,pch=pcc,lwd=1.5,lty=2,inset=.02,bty="n")

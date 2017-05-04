etwd("/Users/mengmengjiang/37datas")

library(xlsx)

##reading datas
# Gly1
# 18nl/min and 180nl/min
# 1.8kv ~ 2kv

k1<-read.xlsx("gly1.xlsx",sheetName="qd1-18",header=TRUE)
k2<-read.xlsx("gly1.xlsx",sheetName="qd1-19",header=TRUE)
k3<-read.xlsx("gly1.xlsx",sheetName="qd1-20",header=TRUE)

k4<-read.xlsx("gly1.xlsx",sheetName="qd2-18",header=TRUE)
k5<-read.xlsx("gly1.xlsx",sheetName="qd2-19",header=TRUE)
k6<-read.xlsx("gly1.xlsx",sheetName="qd2-20",header=TRUE)

# color
yan<-rainbow(6)
yan[2]<-c("yellow3")

pcc<-c(0,1,2,5,22,23)

#Plot

par(mar = c(2,2.4,2,2), oma = c(1,1,1,1))
layout(matrix(c(1,2),2,1,byrow = TRUE))

#error

error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) !=
     length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

#Plot

par(fig=c(0,1,0.5,1),new=T)

plot(k1$fv,k1$tfeva, col=0,xlab = expression(italic(f["v"]) (Hz)), 
          ylab = expression(italic(t["for"]) (ms)), mgp=c(1.1, 0, 0),tck=0.02, 
               main = "tfor-Gly1", xlim = c(0,500),ylim=c(0,40))

    lines(k1$fv,k1$tfeva,col=yan[1],lwd=1.5,lty=2,type="b",pch=pcc[1],cex=0.8)
    lines(k2$fv,k2$tfeva,col=yan[2],lwd=1.5,lty=2,type="b",pch=pcc[2],cex=0.8)
        lines(k3$fv,k3$tfeva,col=yan[3],lwd=1.5,lty=2,type="b",pch=pcc[3],cex=0.8)
        lines(k4$fv,k4$tfeva,col=yan[4],lwd=1.5,lty=2,type="b",pch=pcc[4],cex=0.8)
            lines(k5$fv,k5$tfeva,col=yan[5],lwd=1.5,lty=2,type="b",pch=pcc[5],cex=0.8)
            lines(k6$fv,k6$tfeva,col=yan[6],lwd=1.5,lty=2,type="b",pch=pcc[6],cex=0.8)
                
                
                error.bar(k1$fv,k1$tfeva,k1$stdtf/2,col=yan[1])
                error.bar(k2$fv,k2$tfeva,k2$stdtf/2,col=yan[2])
                    error.bar(k3$fv,k3$tfeva,k3$stdtf/2,col=yan[3])
                    
                    error.bar(k4$fv,k4$tfeva,k4$stdtf/2,col=yan[4])
                        error.bar(k5$fv,k5$tfeva,k5$stdtf/2,col=yan[5])
                        error.bar(k6$fv,k6$tfeva,k6$stdtf/2,col=yan[6])
                            
                            leg<-c("18nl/min-1.8kv","18nl/min-1.9kv","18nl/min-2kv","180nl/min-1.8kv",
                                        "180nl/min-1.9kv","180nl/min-2kv")

                            legend("topright",legend=leg,lwd=1.5,lty=2,pch=pcc,col=yan,inset
                                   = .05,bty="n",cex=0.8)

# small plot

                                par(fig=c(0.12,0.98,0.65,0.99),new=T)

                                plot(k1$fv,k1$tfeva,bty="n",col=0,xlab ="", 
                                          ylab ="", mgp=c(1.1, 0, 0),tck=0.02, 
                                               main = "", xlim =
                                                   c(500,3500),ylim=c(0,1),cex.axis=0.8)

                                               lines(k1$fv,k1$tfeva,col=yan[1],lwd=1.5,lty=2,pch=pcc[1],type="b",cex=0.8)
                                lines(k2$fv,k2$tfeva,col=yan[2],lwd=1.5,lty=2,pch=pcc[2],type="b",cex=0.8)
                                lines(k3$fv,k3$tfeva,col=yan[3],lwd=1.5,lty=2,pch=pcc[3],type="b",cex=0.8)
                                lines(k4$fv,k4$tfeva,col=yan[4],lwd=1.5,lty=2,pch=pcc[4],type="b",cex=0.8)
                                lines(k5$fv,k5$tfeva,col=yan[5],lwd=1.5,lty=2,pch=pcc[5],type="b",cex=0.8)
                                lines(k6$fv,k6$tfeva,col=yan[6],lwd=1.5,lty=2,pch=pcc[6],type="b",cex=0.8)

                                error.bar(k1$fv,k1$tfeva,k1$stdtf,col=yan[1])
                                error.bar(k2$fv,k2$tfeva,k2$stdtf,col=yan[2])
                                error.bar(k3$fv,k3$tfeva,k3$stdtf,col=yan[3])
                                error.bar(k4$fv,k4$tfeva,k4$stdtf,col=yan[4])
                                error.bar(k5$fv,k5$tfeva,k5$stdtf,col=yan[5])
                                error.bar(k6$fv,k6$tfeva,k6$stdtf,col=yan[6])

##Plot-2

# Create a plot

                                par(fig=c(0,1,0,0.5),new=T)

                                plot(k1$fv,k1$tpeva, col=0,xlab =
                                     expression(italic(f["v"]) (Hz)), 
                                      ylab = expression(italic(t["p"]) (ms)),
                                     mgp=c(1.1, 0, 0),tck=0.02, 
                                          main = "tp-Gly1", xlim =
                                              c(0,500),ylim=c(0.1,0.6))


                                          lines(k1$fv,k1$tpeva,col=yan[1],lwd=1.5,lty=2,pch=pcc[1],type="b",cex=0.8)
                                lines(k2$fv,k2$tpeva,col=yan[2],lwd=1.5,lty=2,pch=pcc[2],type="b",cex=0.8)
                                lines(k3$fv,k3$tpeva,col=yan[3],lwd=1.5,lty=2,pch=pcc[3],type="b",cex=0.8)
                                lines(k4$fv,k4$tpeva,col=yan[4],lwd=1.5,lty=2,pch=pcc[4],type="b",cex=0.8)
                                lines(k5$fv,k5$tpeva,col=yan[5],lwd=1.5,lty=2,pch=pcc[5],type="b",cex=0.8)
                                lines(k6$fv,k6$tpeva,col=yan[6],lwd=1.5,lty=2,pch=pcc[6],type="b",cex=0.8)

                                error.bar(k1$fv,k1$tpeva,k1$stdtp,col=yan[1])
                                error.bar(k2$fv,k2$tpeva,k2$stdtp,col=yan[2])
                                error.bar(k3$fv,k3$tpeva,k3$stdtp,col=yan[3])
                                error.bar(k4$fv,k4$tpeva,k4$stdtp,col=yan[4])
                                error.bar(k5$fv,k5$tpeva,k5$stdtp,col=yan[5])
                                error.bar(k6$fv,k6$tpeva,k6$stdtp,col=yan[6])

                                leg<-c("18nl/min-1.8kv","18nl/min-1.9kv","18nl/min-2kv","180nl/min-1.8kv",
                                            "180nl/min-1.9kv","180nl/min-2kv")

                                legend("topright",legend=leg,lwd=1.5,lty=2,pch=pcc,col=yan,inset
                                       = .04,bty="n",cex=0.8)


# small plot

                                par(fig=c(0.12,0.98,0.15,0.48),new=T)


                                plot(k1$fv,k1$tpeva, bty="n",col=0,xlab = "", 
                                          ylab = "", mgp=c(1.1, 0, 0),tck=0.02, 
                                               main = "", xlim =
                                                   c(500,3500),ylim=c(0.1,0.4))


                                               lines(k1$fv,k1$tpeva,col=yan[1],lwd=1.5,lty=2,pch=pcc[1],type="b",cex=0.8)
                                lines(k2$fv,k2$tpeva,col=yan[2],lwd=1.5,lty=2,pch=pcc[2],type="b",cex=0.8)
                                lines(k3$fv,k3$tpeva,col=yan[3],lwd=1.5,lty=2,pch=pcc[3],type="b",cex=0.8)
                                lines(k4$fv,k4$tpeva,col=yan[4],lwd=1.5,lty=2,pch=pcc[4],type="b",cex=0.8)
                                lines(k5$fv,k5$tpeva,col=yan[5],lwd=1.5,lty=2,pch=pcc[5],type="b",cex=0.8)
                                lines(k6$fv,k6$tpeva,col=yan[6],lwd=1.5,lty=2,pch=pcc[6],type="b",cex=0.8)

                                error.bar(k1$fv,k1$tpeva,k1$stdtp,col=yan[1])
                                error.bar(k2$fv,k2$tpeva,k2$stdtp,col=yan[2])
                                error.bar(k3$fv,k3$tpeva,k3$stdtp,col=yan[3])
                                error.bar(k4$fv,k4$tpeva,k4$stdtp,col=yan[4])
                                error.bar(k5$fv,k5$tpeva,k5$stdtp,col=yan[5])
                                error.bar(k6$fv,k6$tpeva,k6$stdtp,col=yan[6])



library(xlsx)

##reading

tf1<-read.xlsx("t_for.xlsx", sheetName = "15nl", header = TRUE)
tf2<-read.xlsx("t_for.xlsx", sheetName = "180nl", header = TRUE)

##tp:tpeva, stdtp and teva，stdt;

tp1<-read.xlsx("t_pulse.xlsx", sheetName = "single_q_15", header = TRUE)
tp2<-read.xlsx("t_pulse.xlsx", sheetName = "single_q180", header = TRUE)

##tfor:tfeva,stdtf;teva,stdt;

##
par(mfrow = c(2,1), mar = c(2,2.4,1,1), oma = c(1,1,1,1))

##error bar##
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("vectors must be same length")
  arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}
##
yan<-c("red","blue","black","green3")
pcc<-c(0,1,2,5)

##plot1##
#par(fig=c(0,1,0.5,1),mar = c(2,2.4,1,1), oma = c(1,1,1,1),new=F)

plot(tf1$fv,tf1$X0.2,axis="",col = 0,xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(t["for"]) (ms)), mgp=c(1.1, 0, 0),tck=0.02, 
     main = "", xlim = c(0, 200),ylim=c(0,50))

lines(tf1$fv,tf1$tfeva, col=yan[1],pch=pcc[1],lwd=1.5,type="b",lty=2)
lines(tf1$fv,tf1$teva, col=yan[2],pch=pcc[2],lwd=1.5,type="b",lty=2)
lines(tf2$fv,tf2$tfeva, col=yan[3],pch=pcc[3],lwd=1.5,type="b",lty=2)
lines(tf2$fv,tf2$teva, col=yan[4],pch=pcc[4],lwd=1.5,type="b",lty=2)

error.bar(tf1$fv,tf1$tfeva,tf1$stdtf/2,col=yan[1])
error.bar(tf1$fv,tf1$teva,tf1$stdt/2,col=yan[2])
error.bar(tf2$fv,tf2$tfeva,tf2$stdtf/2,col=yan[3])
error.bar(tf2$fv,tf2$teva,tf2$stdt/2,col=yan[4])



leg<-c("1.5nl/min-0.2","1.5nl/min-0.5","180nl/min-0.2","180nl/min-0.5")

legend("topright",legend=leg,col=yan,pch=pcc,lwd=1.5,inset=.06,bty="n")

## small figure##

par(fig=c(0.3,0.98,0.63,0.98),new=T)

plot(tf1$fv,tf1$X0.2, bty="n",col = 0,xlab = "", 
     ylab = "", mgp=c(1.1, 0, 0),tck=0.02, 
     main = "", xlim = c(200, 3500),ylim=c(0,2))

#lines(tf1$fv,tf1$tfeva, col=yan[1],pch=pcc[1],lwd=1.5,type="b",lty=2,cex=0.7)
#lines(tf1$fv,tf1$teva, col=yan[2],pch=pcc[2],lwd=1.5,type="b",lty=2,cex=0.7)
lines(tf2$fv,tf2$tfeva, col=yan[3],pch=pcc[3],lwd=1.5,type="b",lty=2,cex=0.7)
lines(tf2$fv,tf2$teva, col=yan[4],pch=pcc[4],lwd=1.5,type="b",lty=2,cex=0.7)

error.bar(tf2$fv,tf2$tfeva,tf2$stdtf/2,col=yan[3])
error.bar(tf2$fv,tf2$teva,tf2$stdt/2,col=yan[4])

x1<-c(600,600)
y1<-c(0,0.3)
lines(x1,y1,col="black",lwd=1.5,lty=2)



###plot2##
par(fig=c(0,1,0,0.5),new=T)
plot(tf1$fv,tf1$X0.2,axis="",col = 0,xlab = expression(italic(f["v"]) (Hz)), 
     ylab = expression(italic(t["pulse"]) (ms)), mgp=c(1.1, 0, 0),tck=0.02, 
     main = "", xlim = c(0, 200),ylim=c(0,3))



lines(tp1$fv,tp1$tpeva, col=yan[1],pch=pcc[1],lwd=1.5,type="b",lty=2)
lines(tp1$fv,tp1$teva, col=yan[2],pch=pcc[2],lwd=1.5,type="b",lty=2)
lines(tp2$fv,tp2$tpeva, col=yan[3],pch=pcc[3],lwd=1.5,type="b",lty=2)
lines(tp2$fv,tp2$teva, col=yan[4],pch=pcc[4],lwd=1.5,type="b",lty=2)

error.bar(tp1$fv,tp1$tpeva,tp1$stdtp/2,col=yan[1])
error.bar(tp1$fv,tp1$teva,tp1$stdt/2,col=yan[2])
error.bar(tp2$fv,tp2$tpeva,tp2$stdtp/2,col=yan[3])
error.bar(tp2$fv,tp2$teva,tp2$stdt/2,col=yan[4])

leg<-c("1.5nl/min-0.2","1.5nl/min-0.5","180nl/min-0.2","180nl/min-0.5")

legend("topright",legend=leg,col=c("red","blue","black","green3"),pch=c(2,5),lwd=1.5,inset = .06,bty="n")

### Small figures ####

par(fig=c(0.05,0.7,0.16,0.49),new=T)

plot(tf1$fv,tf1$X0.2,bty="n",col = 0,xlab = "", 
     ylab = "", mgp=c(1.1, 0, 0),tck=0.02, 
     main = "", xlim = c(200, 3500),ylim=c(0,0.5))

#lines(tp1$fv,tp1$tpeva, col=yan[1],pch=pcc[1],lwd=1.5,type="b",lty=2,cex=0.7)
lines(tp2$fv,tp2$tpeva, col=yan[3],pch=pcc[3],lwd=1.5,type="b",lty=2,cex=0.7)
lines(tp2$fv,tp2$teva, col=yan[4],pch=pcc[4],lwd=1.5,type="b",lty=2,cex=0.7)

#error.bar(tp1$fv,tp1$tpeva,tp1$stdtp/2,col=yan[1])
error.bar(tp2$fv,tp2$tpeva,tp2$stdtp/2,col=yan[3])
error.bar(tp2$fv,tp2$teva,tp2$stdt/2,col=yan[4])

lines(x1,y1,col="black",lwd=1.5,lty=2)




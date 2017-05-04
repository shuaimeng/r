library(xlsx)
#读取数据
q <- read.xlsx("cha3space.xlsx", sheetName = "shui", header = TRUE)
par(mgp = c(1.5, 0.5, 0),tck=0.02)
#不同横向速度时的间距比较
plot(q$ux[1:10],q$X50mm1[1:10],type="l",lwd=2,lty=2,col="red",xlab = expression(italic(No.)), ylab = expression(italic(S["d"])(um)), 
main = "",cex.lab = 1.2, cex.main = 1.3,xlim = c(0, 15),ylim=c(0,200))

#计算50mm的半值
ave50<-(q$X50mm1-q$X50mm1[21])

arrows(q$ux[1:10],(q$X50mm1[1:10]-ave50[1:10]/2),q$ux[1:10],(q$X50mm1[1:10]+ave50[1:10]/2),angle=90,length=0.05,code=3)

#计算100mm的半值
lines(q$ux[1:5],q$X100mm1[1:5],type="l",lwd=2,lty=2,col="blue")
ave100<-(q$X100mm1-q$X100mm1[21])
arrows(q$ux[1:5],(q$X100mm1[1:5]-ave100[1:5]/2),q$ux[1:5],(q$X100mm1[1:5]+ave100[1:5]/2),angle=90,length=0.05,code=3)

#计算150mm的半值
lines(q$ux[1:4],q$X150mm1[1:4],type="l",lwd=2,lty=2,col="green3")
ave150<-(q$X150mm1-q$X150mm1[21])
arrows(q$ux[1:4],(q$X150mm1[1:4]-ave150[1:4]/2),q$ux[1:4],(q$X150mm1[1:5]+ave150[1:4]/2),angle=90,length=0.05,code=3)

#计算20mm的半值
lines(q$ux[1:15],q$X20mm1[1:15],type="l",lwd=2,lty=2,col="black")
ave20<-(q$X20mm1-q$X20mm1[21])
arrows(q$ux[1:15],(q$X20mm1[1:15]-ave20[1:15]/2),q$ux[1:15],(q$X20mm1[1:15]+ave20[1:15]/2),angle=90,length=0.05,code=3)

#计算40mm的半值
lines(q$ux[1:19],q$X40mm2[1:19],type="l",lwd=2,lty=2,col="yellow3")
ave40<-(q$X40mm2-q$X40mm2[21])
arrows(q$ux[1:19],(q$X40mm2[1:19]-ave40[1:19]/2),q$ux[1:19],(q$X40mm2[1:19]+ave40[1:19]/2),angle=90,length=0.05,code=3)



legend("topright",c("20mm/s","40mm/s","50mm/s","100mm/s","150mm/s"),col=c("black","yellow3","red","blue","green3"), type="l",lty=2,inset = .1, bty = "n")

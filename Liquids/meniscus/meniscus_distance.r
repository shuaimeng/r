#弯月面Meniscus的高度和角度随流量，极间距离，电压变化而变化
#针头三种液体，ethanol，acetone， isoproply
#height高度和angle角度，在一张图上，分为上下部分
#三张图，分别对应三种x轴，流量，极间距离，电压
#两张大图，分别对应height和angle
#函数名为men_ah & men_aa, men_ah & men_aa，men_ih & men_ia

#设定工作区间
setwd("D:/data")
library(xlsx)

#读取数据

men_ah<-read.xlsx("meniscus.xls",sheetName="distance_h",header=TRUE)
men_aa<-read.xlsx("meniscus.xls",sheetName="distance_a", header=TRUE)

#规划figure界面
par(mfrow=c(2,1), mar=c(4,4,2,2), oma=c(1,1,1,1))

#############针对distance极间距离###########

#保存pdf
#pdf("men_distance.pdf")

################################画图-高度曲线###########################
plot(men_ah$distance, men_ah$ethanol, col=0, xaxs="i", xlim=c(0, 4.2), ylim=c(0, 0.9), 
xlab="Distance (mm)", cex.lab=1, ylab="Height of Meniscus (mm)", main="Height with H in meniscus")

lines(lowess(men_ah$distance, men_ah$ethanol), col="red", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_ah$distance, men_ah$acetone), col="blue", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_ah$distance, men_ah$iso), col="darkgreen", pch=21, lwd=2, type="b", lty=2)

legend("topleft", c("ethanol", "acetone", "isoproply"), inset=.02, col=c("red", "blue", "darkgreen"), pch=21, lwd=2, lty=2, cex=0.9)

##############################画图--角度曲线############################
plot(men_aa$distance, men_aa$ethanol, col=0, xaxs="i", xlim=c(0, 4.2), ylim=c(45, 100), 
xlab="Distance (mm)", cex.lab=1, ylab="Taylor Angle （°）", main="Angle with H in meniscus")

lines(lowess(men_aa$distance, men_aa$ethanol), col="red", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_aa$distance, men_aa$acetone), col="blue", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_aa$distance, men_aa$iso), col="darkgreen", pch=21, lwd=2, type="b", lty=2)

legend("bottomleft", c("ethanol", "acetone", "isoproply"), inset=.02, col=c("red", "blue", "darkgreen"), pch=21, lwd=2, lty=2, cex=0.9)

#dev.off()
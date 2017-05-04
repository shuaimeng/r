#弯月面Meniscus的高度和角度随流量，极间距离，电压变化而变化
#针头三种液体，ethanol，acetone， isoproply
#height高度和angle角度，在一张图上，分为上下部分
#三张图，分别对应三种x轴，流量，极间距离，电压
#两张大图，分别对应height和angle
#函数名为men_eh & men_ea, men_ah & men_aa，men_ih & men_ia

#设定工作区间
setwd("D:/data")
library(xlsx)

#读取数据
men_eh<-read.xlsx("meniscus.xls",sheetName="flowrate_h",header=TRUE)
men_ea<-read.xlsx("meniscus.xls",sheetName="flowrate_a",header=TRUE)

men_ah<-read.xlsx("meniscus.xls",sheetName="distance_h",header=TRUE)
men_aa<-read.xlsx("meniscus.xls",sheetName="distance_a", header=TRUE)

men_ih<-read.xlsx("meniscus.xls",sheetName="voltage_h", header=TRUE)
men_ia<-read.xlsx("meniscus.xls",sheetName="voltage_a", header=TRUE)

#规划figure界面
par(mfrow=c(2,1), mar=c(4,4,2,2), oma=c(1,1,1,1))

#保存pdf
pdf("men_flowrate.pdf")

################################画图-高度曲线###########################
plot(men_eh$flowrate, men_eh$ethanol, col=0, xaxs="i", xlim=c(-0.002, 0.026), ylim=c(0.2, 0.8), 
xlab="Flow rate (nl/min)", cex.lab=1, ylab="Height of Meniscus (mm)", main="Height with Q in meniscus")

lines(lowess(men_eh$flowrate, men_eh$ethanol), col="red", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_eh$flowrate, men_eh$acetone), col="blue", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_eh$flowrate, men_eh$iso), col="darkgreen", pch=21, lwd=2, type="b", lty=2)

legend("topleft", c("ethanol", "acetone", "isoproply"), inset=.02, col=c("red", "blue", "darkgreen"), pch=21, lwd=2, lty=2, cex=0.9)

##############################画图--角度曲线############################
plot(men_ea$flowrate, men_ea$ethanol, col=0, xlim=c(-0.002, 0.026), ylim=c(45, 100), 
xlab="Flow rate (nl/min)", cex.lab=1, ylab="Taylor Angle (mm)", main="Angle with Q in meniscus")

lines(lowess(men_ea$flowrate, men_ea$ethanol), col="red", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_ea$flowrate, men_ea$acetone), col="blue", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_ea$flowrate, men_ea$iso), col="darkgreen", pch=21, lwd=2, type="b", lty=2)

legend("bottomleft", c("ethanol", "acetone", "isoproply"), inset=.02, col=c("red", "blue", "darkgreen"), pch=21, lwd=2, lty=2, cex=0.9)

dev.off()
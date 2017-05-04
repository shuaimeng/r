#弯月面Meniscus的高度和角度随流量，极间距离，电压变化而变化
#针头三种液体，ethanol，acetone， isoproply
#height高度和angle角度，在一张图上，分为上下部分
#三张图，分别对应三种x轴，流量，极间距离，电压
#两张大图，分别对应height和angle
#函数名为men_ih & men_ia, men_ih & men_ia，men_ih & men_ia

#设定工作区间
setwd("D:/data")
library(xlsx)

#读取数据

men_ih<-read.xlsx("meniscus.xls",sheetName="voltage_h", header=TRUE)
men_ia<-read.xlsx("meniscus.xls",sheetName="voltage_a", header=TRUE)

#规划figure界面
par(mfrow=c(2,1), mar=c(4,4,2,2), oma=c(1,1,1,1))

#############针对voltage极间距离###########

#保存pdf
#pdf("men_voltage.pdf")

################################画图-高度曲线###########################
plot(men_ih$voltage, men_ih$ethanol, col=0, xaxs="i", xlim=c(1.3, 2.6), ylim=c(0, 1.3), 
xlab="Voltage (HV)", cex.lab=1, ylab="Height of Meniscus (mm)", main="Height with V in meniscus")

lines(lowess(men_ih$voltage, men_ih$ethanol), col="red", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_ih$voltage, men_ih$acetone), col="blue", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_ih$voltage, men_ih$iso), col="darkgreen", pch=21, lwd=2, type="b", lty=2)

legend("topright", c("ethanol", "acetone", "isoproply"), inset=.02, col=c("red", "blue", "darkgreen"), pch=21, lwd=2, lty=2, cex=0.9)

##############################画图--角度曲线############################
plot(men_ia$voltage, men_ia$ethanol, col=0, xaxs="i", xlim=c(1.3, 2.6), ylim=c(45, 150), 
xlab="Voltage (HV)", cex.lab=1, ylab="Taylor Angle （°）", main="Angle with H in meniscus")

lines(lowess(men_ia$voltage, men_ia$ethanol), col="red", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_ia$voltage, men_ia$acetone), col="blue", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_ia$voltage, men_ia$iso), col="darkgreen", pch=21, lwd=2, type="b", lty=2)

legend("topleft", c("ethanol", "acetone", "isoproply"), inset=.02, col=c("red", "blue", "darkgreen"), pch=21, lwd=2, lty=2, cex=0.9)

#dev.off()
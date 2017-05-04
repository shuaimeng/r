#弯月面Meniscus的高度和角度随流量，极间距离，针头直径变化而变化
#针头三种液体，ethanol，acetone， isoproply
#height高度和angle角度，在一张图上，分为上下部分
#三张图，分别对应三种x轴，流量，极间距离，电压
#固定电压数值为2.0kv
#用mtext函数标记其他相关参数信息
#函数名为men_ih & men_ea, men_ih & men_ia，men_ih & men_ia

#设定工作区间
setwd("D:/data")
library(xlsx)

#读取数据
men_ih<-read.xlsx("set_voltage.xls", sheetName="radius_h", header=TRUE)
men_ia<-read.xlsx("set_voltage.xls", sheetName="radius_a", header=TRUE)

#规划figure界面
par(mfrow=c(2,1), mar=c(4,4,2,2), oma=c(2,1,1,1))



#保存pdf
pdf("set_voltage_radius.pdf")

################################画图-高度曲线###########################
plot(men_ih$radius, men_ih$ethanol, col=0, xaxs="i", xlim=c(0.3, 0.85), ylim=c(0.2, 0.6), 
xlab="Diameter (mm)", cex.lab=1, ylab="Height of Meniscus (mm)", main="Height with Rn in meniscus")

lines(lowess(men_ih$radius, men_ih$ethanol), col="red", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_ih$radius, men_ih$acetone), col="blue", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_ih$radius, men_ih$iso), col="darkgreen", pch=21, lwd=2, type="b", lty=2)

legend("topleft", c("ethanol", "acetone", "isoproply"), inset=.02, col=c("red", "blue", "darkgreen"), pch=21, lwd=2, lty=2, cex=0.9)

##############################画图--角度曲线############################
plot(men_ia$radius, men_ia$ethanol, col=0, xaxs="i", xlim=c(0.3, 0.85), ylim=c(50, 140), 
xlab="Diameter (mm)", cex.lab=1, ylab="Taylor Angle (°)", main="Angle with Rn in meniscus")

lines(lowess(men_ia$radius, men_ia$ethanol), col="red", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_ia$radius, men_ia$acetone), col="blue", pch=21, lwd=2, type="b", lty=2)

lines(lowess(men_ia$radius, men_ia$iso), col="darkgreen", pch=21, lwd=2, type="b", lty=2)

legend("topright", c("ethanol", "acetone", "isoproply"), inset=.02, col=c("red", "blue", "darkgreen"), pch=21, lwd=2, lty=2, cex=0.9)

mtext("Voltage is set at 2.0 kv", 1, line=1, col="black", cex=1.3, font=2, outer=TRUE)

###标注信息


dev.off()
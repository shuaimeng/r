#研究ethanol乙醇的各方面的数据，乙醇的电导率在三者中最小
#随着流量、极间距离、针头半径不断变化的弯月面的高度和角度

#设定工作区间
setwd("D:/data")
library(xlsx)

#读取数据
#与流量变化有关的数据
men_qh<-read.xlsx("acetone.xls", sheetName="flowrate_h", header=TRUE)
men_qa<-read.xlsx("acetone.xls", sheetName="flowrate_a", header=TRUE)

#读取与极间距离有关的数据
men_dh<-read.xlsx("acetone.xls", sheetName = "distance_h", header = TRUE)
men_da<-read.xlsx("acetone.xls", sheetName = "distance_a", header = TRUE)

#读取与针头直径相关的数据
men_rh<-read.xlsx("acetone.xls", sheetName = "radius_h", header = TRUE)
men_ra<-read.xlsx("acetone.xls", sheetName = "radius_a", header = TRUE)

#规划figure界面
par(mfrow=c(2,1), mar=c(4,4,2,2), oma=c(2,1,1,1))

#按照流量、极间距离、针头直径相关划分为3张figure，每张两图

#保存pdf
pdf("acetone_distance.pdf")

#########################研究ethanol与distance的关系#################

################################画图-高度曲线###########################
plot(men_dh$voltage, men_dh$X1, col=0, xaxs="i", xlim=c(1.0, 3.1), ylim=c(0.1, 1.1), 
xlab="Distance (mm)", cex.lab=1, ylab="Height of Meniscus (mm)", main="Height with H  of Ethanol")

lines(lowess(men_dh$voltage, men_dh$X1), col="#458B74", pch=21, lwd=3, type="b", lty=2)

lines(lowess(men_dh$voltage, men_dh$X1.5), col="#FF00FF", pch=22, lwd=3, type="b", lty=2)

lines(lowess(men_dh$voltage, men_dh$X2), col="#EE0000", pch=23, lwd=3, type="b", lty=2)

lines(lowess(men_dh$voltage, men_dh$X3), col="#EEAD0E", pch=24, lwd=3, type="b", lty=2)

lines(lowess(men_dh$voltage, men_dh$X4), col="#27408B", pch=25, lwd=3, type="b", lty=2)

legend("topright", c("1mm", "1.5mm", "2mm", "3mm", "4mm"), inset=.02, col=c("#458B74", "#FF00FF", "#EE0000", "#EEAD0E", "#27408B"), pch=c(21,22,23,24,25), lwd=3, lty=2, cex=1.3)

##############################画图--角度曲线############################
plot(men_da$voltage, men_da$X1, col=0, xaxs="i", xlim=c(1.0, 3.1), ylim=c(50, 145), 
xlab="Distance (mm)", cex.lab=1, ylab="Taylor Angle (°)", main="Angle with H of Ethanol")

lines(lowess(men_da$voltage, men_da$X1), col="#458B74", pch=21, lwd=3, type="b", lty=2)

lines(lowess(men_da$voltage, men_da$X1.5), col="#FF00FF", pch=22, lwd=3, type="b", lty=2)

lines(lowess(men_da$voltage, men_da$X2), col="#EE0000", pch=23, lwd=3, type="b", lty=2)

lines(lowess(men_da$voltage, men_da$X3), col="#EEAD0E", pch=24, lwd=3, type="b", lty=2)

lines(lowess(men_da$voltage, men_da$X4), col="#27408B", pch=25, lwd=3, type="b", lty=2)

legend("topleft", c("1mm", "1.5mm", "2mm", "3mm", "4mm"), inset=.02, col=c("#458B74", "#FF00FF", "#EE0000", "#EEAD0E", "#27408B"), pch=c(21,22,23,24,25), lwd=3, lty=2, cex=1.3)

mtext("Distance 2mm | Nozzle 24G | Flowrate 0.006nl/min", 1, line=1, col="black", cex=1, font=2, outer=TRUE)

###标注信息


dev.off()
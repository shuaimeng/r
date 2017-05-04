#研究iso异丙醇的各方面的数据，乙醇的电导率在三者中最小
#随着流量、极间距离、针头半径不断变化的弯月面的高度和角度
#设定工作区间
setwd("D:/data")
library(xlsx)

#读取数据
#与流量变化有关的数据
men_qh<-read.xlsx("iso.xls", sheetName="flowrate_h", header=TRUE)
men_qa<-read.xlsx("iso.xls", sheetName="flowrate_a", header=TRUE)

#读取与极间距离有关的数据
men_dh<-read.xlsx("iso.xls", sheetName = "distance_h", header = TRUE)
men_da<-read.xlsx("iso.xls", sheetName = "distance_a", header = TRUE)

#读取与针头直径相关的数据
men_rh<-read.xlsx("iso.xls", sheetName = "radius_h", header = TRUE)
men_ra<-read.xlsx("iso.xls", sheetName = "radius_a", header = TRUE)

#规划figure界面
par(mfrow=c(2,1), mar=c(4,4,2,2), oma=c(2,1,1,1))

#按照流量、极间距离、针头直径相关划分为3张figure，每张两图

#保存pdf
pdf("iso_diameter.pdf")

#########################研究ethanol与nozzle diameter 的关系#################

################################画图-高度曲线###########################
plot(men_rh$voltage, men_rh$X0.81, col=0, xaxs="i", xlim=c(1.3, 2.7), ylim=c(0.1, 1.3), 
xlab="Diameter (mm)", cex.lab=1, ylab="Height of Meniscus (mm)", main="Height with Rn  of Ethanol")

lines(lowess(men_rh$voltage, men_rh$X0.81), col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

lines(lowess(men_rh$voltage, men_rh$X0.71), col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

lines(lowess(men_rh$voltage, men_rh$X0.55), col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

lines(lowess(men_rh$voltage, men_rh$X0.45), col="#EEAD0E", pch=24, lwd=2.5, type="b", lty=2)

lines(lowess(men_rh$voltage, men_rh$X0.35), col="#27408B", pch=25, lwd=2.5, type="b", lty=2)

legend("topright", c("0.81mm", "0.71mm", "0.55mm", "0.45mm", "0.35mm"), inset=.02, col=c("#458B74", "#FF00FF", "#EE0000", "#EEAD0E", "#27408B"), pch=c(21,22,23,24,25), lwd=2.5, lty=2, cex=1.3)

##############################画图--角度曲线############################
plot(men_ra$voltage, men_ra$X0.81, col=0, xaxs="i", xlim=c(1.3, 2.7), ylim=c(40, 155), 
xlab="Diameter (mm)", cex.lab=1, ylab="Taylor Angle (°)", main="Angle with Rn of Ethanol")

lines(lowess(men_ra$voltage, men_ra$X0.81), col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

lines(lowess(men_ra$voltage, men_ra$X0.71), col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

lines(lowess(men_ra$voltage, men_ra$X0.55), col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

lines(lowess(men_ra$voltage, men_ra$X0.45), col="#EEAD0E", pch=24, lwd=2.5, type="b", lty=2)

lines(lowess(men_ra$voltage, men_ra$X0.35), col="#27408B", pch=25, lwd=2.5, type="b", lty=2)

legend("topleft", c("0.81mm", "0.71mm", "0.55mm", "0.45mm", "0.35mm"), inset=.02, col=c("#458B74", "#FF00FF", "#EE0000", "#EEAD0E", "#27408B"), pch=c(21,22,23,24,25), lwd=2.5, lty=2, cex=1.3)

mtext("Distance 2mm | Nozzle 24G | Flowrate 0.006nl/min", 1, line=1, col="black", cex=1.3, font=2, outer=TRUE)

###标注信息


dev.off()
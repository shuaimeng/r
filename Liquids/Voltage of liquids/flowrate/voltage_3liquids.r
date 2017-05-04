#对三种液体的不同ov，bv进行比较，放在一起
#文件名：voltage_3liquids ,  
#ov and bv电压，6条曲线，在不同的x轴上显示，比如，随着流量，极间距离和针头直径的变化
#三张图，1，1,2,3

######################读取文件模块###################
setwd("D:/data")
library(xlsx)

#读取数据
de_q<-read.xlsx("voltage.xls",sheetName="ethanol_q",header=TRUE)
da_q<-read.xlsx("voltage.xls",sheetName="acetone_q",header=TRUE)
di_q<-read.xlsx("voltage.xls",sheetName="iso_q",header=TRUE)

de_h<-read.xlsx("voltage.xls",sheetName="ethanol_h", header=TRUE)
da_h<-read.xlsx("voltage.xls",sheetName="acetone_h", header=TRUE)
di_h<-read.xlsx("voltage.xls",sheetName="iso_h", header=TRUE)

de_r<-read.xlsx("voltage.xls",sheetName="ethanol_r", header=TRUE)
da_r<-read.xlsx("voltage.xls",sheetName="acetone_r", header=TRUE)
di_r<-read.xlsx("voltage.xls",sheetName="iso_r", header=TRUE)

#规划figure界面
par(mfrow=c(2,2), mar=c(6,4,2,2), oma=c(2,2,2,2))
#layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE))

#保存pdf
#pdf("voltage_3liquids.pdf")

###############################随流量变化，6条曲线#############################
#乙醇
#OV

plot(de_q$flowrate, de_q$OV,  col=0, xaxs="i", xlim=c(-0.002, 0.032), ylim=c(1, 3), 
xlab="Flow rate (nl/min)", cex.lab=1.1, ylab="Voltage (HV)", main="Voltage changes with Q")

model_qov <- loess(de_q$OV ~ de_q$flowrate)
fit <- fitted(model_qov)
ord <- order(de_q$flowrate)

lines(de_q$flowrate[ord], fit[ord], type="b", col="red", lwd=2.5, lty=2)

#BV
#points(de_q$flowrate, de_q$BV,  pch=6, col=0, xaxs="i", xlim=c(-0.002, 0.032), ylim=c(2, 3), 
#xlab="Flow rate (nl/min)", cex.lab=1.1, ylab="Break Voltage (HV)", main="Break Voltage changes with Flowrate")

model_qbv <- loess(de_q$BV ~ de_q$flowrate)
fit <- fitted(model_qbv)
ord <- order(de_q$flowrate)

lines(de_q$flowrate[ord], fit[ord], type="b", col="red", lwd=2.5, lty=2)

#丙酮
#OV
model_aov <- loess(da_q$OV ~ da_q$flowrate)
fit <- fitted(model_aov)
ord <- order(da_q$flowrate)

lines(da_q$flowrate[ord], fit[ord], type="b", col="blue", pch=23, lwd=2.5, lty=2) 

#BV
model_abv <- loess(da_q$BV ~ da_q$flowrate)
fit <- fitted(model_abv)
ord <- order(da_q$flowrate)

lines(da_q$flowrate[ord], fit[ord], type="b", col="blue", pch=23, lwd=2.5, lty=2)

#异丙醇
#OV
model_iov <- loess(di_q$OV ~ di_q$flowrate)
fit <- fitted(model_iov)
ord <- order(di_q$flowrate)

lines(di_q$flowrate[ord], fit[ord], type="b", col="darkgreen", pch=24, lwd=2.5, lty=2)

#BV
model_ibv <- loess(di_q$BV ~ di_q$flowrate)
fit <- fitted(model_ibv)
ord <- order(di_q$flowrate)

lines(di_q$flowrate[ord], fit[ord], type="b", col="darkgreen", pch=24, lwd=2.5, lty=2) 

box("figure", lty="dotted", col="blue")

#图例
#legend("center", c("Ethanol OV", "Ethanol BV"，"Acetone OV"，"Acetone BV", "Isoproply OV"， "Isoproply BV"),  pch=c(6, 6, 23，23, 24, 24), col=c("red", "red", "blue","blue", "darkgreen", "darkgreen"), lty=2, lwd=2, cex=1)

##############################图裂#################################
#图例

plot(de_q$flowrate, de_q$BV,  yaxt="n", xaxt= "n", col=0,  xlab="", ylab="", xlim=c(-0.002, 0.032), ylim=c(1, 3), main="Legend")
text(0.002, 2.8, "Up Red - Ethanol", line=6, col="red", adj=0, cex=1.2)
text(0.002, 2.5, "Down Red - Ethanol", line=5, col="red", adj=0, cex=1.2)
text(0.002, 2.2, "Up Blue - Acetone", line=4, col="blue", adj=0, cex=1.2)
text(0.002, 1.9, "Down blue - Acetone", line=3, col="blue", adj=0, cex=1.2)
text(0.002, 1.6, "Up Green - Isoproply", line=2, col="darkgreen", adj=0, cex=1.2)
text(0.002, 1.3, "Down Green - Isoproply", line=1, col="darkgreen", adj=0, cex=1.2)
#legend(0.012,2.5, c("Ethanol OV", "Ethanol BV"，"Acetone OV"，"Acetone BV", "Isoproply OV"， "Isoproply BV"),  pch=c(6, 6, 23，23, 24, 24), col=c("red", "red", "blue","blue", "darkgreen", "darkgreen"), lty=2, lwd=2, cex=1)

box("figure", lty="dotted", col="blue")

###############################随极间距离变化，6条曲线#############################
#乙醇
#OV
plot(de_h$distance, de_h$OV,  col=0, xaxs="i", xlim=c(0, 4.2), ylim=c(1, 3.2), 
xlab="Distance (mm)", cex.lab=1.1, ylab="Voltage (HV)", main="Voltages changes with H")

model_hov <- loess(de_h$OV ~ de_h$distance)
fit <- fitted(model_hov)
ord <- order(de_h$distance)

lines(de_h$distance[ord], fit[ord], type="b", col="red", lwd=2.5, lty=2) 

#BV
model_hBV <- loess(de_h$BV ~ de_h$distance)
fit <- fitted(model_hBV)
ord <- order(de_h$distance)

lines(de_h$distance[ord], fit[ord], type="b", col="red", lwd=2.5, lty=2) 

#丙酮
#OV
model_aov <- loess(da_h$OV ~ da_h$distance)
fit <- fitted(model_aov)
ord <- order(da_h$distance)

lines(da_h$distance[ord], fit[ord], type="b", col="blue", pch=23, lwd=2.5, lty=2)

#BV
model_aBV <- loess(da_h$BV ~ da_h$distance)
fit <- fitted(model_aBV)
ord <- order(da_h$distance)

lines(da_h$distance[ord], fit[ord], type="b", col="blue", pch=23, lwd=2.5, lty=2) 

#异丙醇
#OV
model_iov <- loess(di_h$OV ~ di_h$distance)
fit <- fitted(model_iov)
ord <- order(di_h$distance)

lines(di_h$distance[ord], fit[ord], type="b", col="darkgreen", pch=24, lwd=2.5, lty=2)

#BV
model_iBV <- loess(di_h$BV ~ di_h$distance)
fit <- fitted(model_iBV)
ord <- order(di_h$distance)

lines(di_h$distance[ord], fit[ord], type="b", col="darkgreen", pch=24, lwd=2.5, lty=2)

box("figure", lty="dotted", col="blue")

#图例
#legend("center", c("Ethanol OV", "Ethanol BV"， "Acetone OV"，"Acetone BV", "Isoproply OV"， "Isoproply BV"),  pch=c(6, 6,23，23, 24, 24), col=c("red", "red", "blue","blue", "darkgreen", "darkgreen"), lty=2, lwd=2.5, cex=1)

###############################随针头直径变化，6条曲线#############################
#乙醇
#OV
plot(de_r$radius, de_r$OV,  col=0, xaxs="i", xlim=c(0.2, 0.9), ylim=c(1, 3.2), 
xlab="Outer Diameter (mm)", cex.lab=1.1, ylab="Voltage (HV)", main="Voltages changes with D")

model_eov <- loess(de_r$OV ~ de_r$radius)
fit <- fitted(model_eov)
ord <- order(de_r$radius)

lines(de_r$radius[ord], fit[ord], type="b", col="red", lwd=2.5, lty=2)
#BV
model_ebv <- loess(de_r$BV ~ de_r$radius)
fit <- fitted(model_ebv)
ord <- order(de_r$radius)

lines(de_r$radius[ord], fit[ord], type="b", col="red", lwd=2.5, lty=2)

#丙酮
#OV
model_aov <- loess(da_r$OV ~ da_r$radius)
fit <- fitted(model_aov)
ord <- order(da_r$radius)

lines(da_r$radius[ord], fit[ord], type="b", col="blue", pch=23, lwd=2.5, lty=2)
#BV
model_abv <- loess(da_r$BV ~ da_r$radius)
fit <- fitted(model_abv)
ord <- order(da_r$radius)

lines(da_r$radius[ord], fit[ord], type="b", col="blue", pch=23, lwd=2.5, lty=2) 

#异丙醇
#OV
model_iov <- loess(di_r$OV ~ di_r$radius)
fit <- fitted(model_iov)
ord <- order(di_r$radius)

lines(di_r$radius[ord], fit[ord], type="b", col="darkgreen", pch=24, lwd=2.5, lty=2) 
#BV
model_ibv <- loess(di_r$BV ~ di_r$radius)
fit <- fitted(model_ibv)
ord <- order(di_r$radius)

lines(di_r$radius[ord], fit[ord], type="b", col="darkgreen", pch=24, lwd=2.5, lty=2)

box("figure", lty="dotted", col="blue")


#对单个内容进行画图分析，尝试记录单个内容的pdf图片格式
#文件名：distance_bv , break voltge 启动电压与三种液体之间随流量、极间距离、针头直径变化的影响

######################读取文件模块###################
setwd("D:/data")
library(xlsx)

#读取v~h的数据
de_h<-read.xlsx("voltage.xls",sheetName="ethanol_d", header=TRUE)
da_h<-read.xlsx("voltage.xls",sheetName="acetone_d", header=TRUE)
di_h<-read.xlsx("voltage.xls",sheetName="iso_d", header=TRUE)


#保存pdf
pdf("distance_3liquids_bv.pdf")
#画图-乙醇

plot(de_h$distance, de_h$BV,  col=0, xaxs="i", xlim=c(0, 4.2), ylim=c(2, 3.2), 
xlab="Distance (mm)",  mgp=c(1, 0, 0),
tck=0.02,
cex.lab=1.1, ylab=expression(V["bv"](kv))
)

title(main="Break Voltage changes with distance",line=0.5,cex.main=1.1)

model_hBV <- loess(de_h$BV ~ de_h$distance)
fit <- fitted(model_hBV)
ord <- order(de_h$distance)

lines(de_h$distance[ord], fit[ord], type="b", col="red", lwd=2.5, lty=2) # 乙醇的拟合曲线

#画图-丙酮
#points(da_h$distance, da_h$BV,  pch=23, col="blue")

model_aBV <- loess(da_h$BV ~ da_h$distance)
fit <- fitted(model_aBV)
ord <- order(da_h$distance)

lines(da_h$distance[ord], fit[ord], type="b", col="blue", pch=23, lwd=2.5, lty=2) # 丙酮的拟合曲线

#画图-异丙醇
#points(di_h$distance, di_h$BV,  pch=23, col="green")

model_iBV <- loess(di_h$BV ~ di_h$distance)
fit <- fitted(model_iBV)
ord <- order(di_h$distance)

lines(di_h$distance[ord], fit[ord], type="b", col="darkgreen", pch=24, lwd=2.5, lty=2) # 异丙醇的拟合曲线

#图例标注
legend("bottomright", bty= "n", c("Ethanol", "Acetone", "Isoproply"), inset=.1,  pch=c(6, 23, 24), col=c("red", "blue", "darkgreen"), lty=2, lwd=2.5, cex=1)

dev.off()
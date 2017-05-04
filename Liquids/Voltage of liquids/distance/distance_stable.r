#对单个内容进行画图分析，尝试记录单个内容的pdf图片格式
#文件名：distance_stable , 电压差与三种液体之间随流量、极间距离、针头直径变化的影响

######################读取文件模块###################
#setwd("D:/data")
library(xlsx)

#读取distance~voltage的数据
de_h<-read.xlsx("voltage.xls",sheetName="ethanol_d", header=TRUE)
da_h<-read.xlsx("voltage.xls",sheetName="acetone_d", header=TRUE)
di_h<-read.xlsx("voltage.xls",sheetName="iso_d", header=TRUE)


#保存pdf
pdf("distance_3liquids_stable.pdf")
#画图-乙醇

plot(de_h$distance, de_h$stable,  col=0, xaxs="i", 
     xlim=c(0, 4.2), ylim=c(0.6, 1.3), 
xlab="Distance (mm)",cex.lab=1.1, mgp=c(1, 0, 0),
tck=0.02,
ylab=expression(V["stable"](kv)))

title(main="Voltage range changes with distance",line=0.5,cex.main=1.1)

model_esv <- loess(de_h$stable ~ de_h$distance)
fit <- fitted(model_esv)
ord <- order(de_h$distance)

lines(de_h$distance[ord], fit[ord], type="b", pch=6, col="red", lwd=2.5, lty=2) 

#画图-丙酮
#points(da_h$distance, da_h$BV,  pch=23, col="blue")

model_asv <- loess(da_h$stable ~ da_h$distance)
fit <- fitted(model_asv)
ord <- order(da_h$distance)

lines(da_h$distance[ord], fit[ord], type="b", col="blue", pch=23, lwd=2.5, lty=2) # 丙酮的拟合曲线

#画图-异丙醇
#points(di_h$distance, di_h$BV,  pch=23, col="green")

model_isv <- loess(di_h$stable ~ di_h$distance)
fit <- fitted(model_isv)
ord <- order(di_h$distance)

lines(di_h$distance[ord], fit[ord], type="b", col="darkgreen", pch=24, lwd=2.5, lty=2) # 异丙醇的拟合曲线

#图例标注
legend("bottomright",bty="n", c("Ethanol", "Acetone", "Isoproply"), inset=.1, 
       pch=c(6, 23, 24), col=c("red", "blue", "darkgreen"), 
       lty=2, lwd=2.5, cex=1)

dev.off()
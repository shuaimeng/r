#对单个内容进行画图分析，尝试记录单个内容的pdf图片格式
#文件名：voltage_stable , OV电压与BV电压之差，即stable 稳定电压与三种液体之间随流量、极间距离、针头直径变化的影响

######################读取文件模块###################
#setwd("D:/data")
library(xlsx)

#读取v~Q的数据
de_q<-read.xlsx("voltage.xls",sheetName="ethanol_q",header=TRUE)
da_q<-read.xlsx("voltage.xls",sheetName="acetone_q",header=TRUE)
di_q<-read.xlsx("voltage.xls",sheetName="iso_q",header=TRUE)


#保存pdf
pdf("voltage_3liquids_stable.pdf")

#画图-乙醇
plot(de_q$flowrate, de_q$stable,  pch=6, col=0, xaxs="i", xlim=c(-0.002, 0.032), ylim=c(0.3, 1.2), 
xlab="Q(ml/min)", mgp=c(1, 0, 0),
tck=0.02,cex.lab=1.1, 
ylab=expression(V["stable"](kv)))

title(main="Stable voltage zones with Q",line=0.5,cex.main=1.1)

model_qsv <- loess(de_q$stable ~ de_q$flowrate)
fit <- fitted(model_qsv)
ord <- order(de_q$flowrate)

lines(de_q$flowrate[ord], fit[ord], type="b", col="red", lwd=2.5, lty=2) # 乙醇的拟合曲线

#画图-丙酮
#points(da_q$flowrate, da_q$OV,  pch=23, col="blue")

model_asv <- loess(da_q$stable ~ da_q$flowrate)
fit <- fitted(model_asv)
ord <- order(da_q$flowrate)

lines(da_q$flowrate[ord], fit[ord], type="b", col="blue", pch=23, lwd=2.5, lty=2) # 丙酮的拟合曲线

#画图-异丙醇
#points(di_q$flowrate, di_q$OV,  pch=23, col="green")

model_isv <- loess(di_q$stable ~ di_q$flowrate)
fit <- fitted(model_isv)
ord <- order(di_q$flowrate)

lines(di_q$flowrate[ord], fit[ord], type="b", col="darkgreen", pch=24, lwd=2.5, lty=2) # 异丙醇的拟合曲线

#图例标注
legend("bottomright", c("Ethanol", "Acetone", "Isoproply"), bty= "n",
       inset=.1,  pch=c(6, 23, 24), col=c("red", "blue", "darkgreen"), lty=2, lwd=2.5, cex=1)

dev.off()
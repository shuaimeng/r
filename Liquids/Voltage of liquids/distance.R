library(xlsx)

#读取v~h的数据
de_h<-read.xlsx("voltage.xls",sheetName="ethanol_d", header=TRUE)
da_h<-read.xlsx("voltage.xls",sheetName="acetone_d", header=TRUE)
di_h<-read.xlsx("voltage.xls",sheetName="iso_d", header=TRUE)

par(mfrow = c(2,2), mar = c(2,2.6,2,2), oma = c(1,1,1,1))

#pdf("distance_3liquids.pdf")

###ov##
plot(de_h$distance, de_h$OV,  col=0, xaxs="i", xlim=c(0, 4.2), ylim=c(1, 3), 
     xlab="Distance (mm)", mgp=c(1, 0, 0),
     tck=0.02,cex.lab=1.1, ylab=expression(V["os"](kv)))

title(main="Onset Voltage",line=0.5,cex.main=1.1)

model_hov <- loess(de_h$OV ~ de_h$distance)
fit <- fitted(model_hov)
ord <- order(de_h$distance)

lines(de_h$distance[ord], fit[ord], type="b", col="red", lwd=2.5, lty=2) # 乙醇的拟合曲线

#画图-丙酮
#points(da_h$distance, da_h$OV,  pch=23, col="blue")

model_aov <- loess(da_h$OV ~ da_h$distance)
fit <- fitted(model_aov)
ord <- order(da_h$distance)

lines(da_h$distance[ord], fit[ord], type="b", col="blue", pch=23, lwd=2.5, lty=2) # 丙酮的拟合曲线

#画图-异丙醇
#points(di_h$distance, di_h$OV,  pch=23, col="green")

model_iov <- loess(di_h$OV ~ di_h$distance)
fit <- fitted(model_iov)
ord <- order(di_h$distance)

lines(di_h$distance[ord], fit[ord], type="b", col="darkgreen", pch=24, lwd=2.5, lty=2) # 异丙醇的拟合曲线

#图例标注
legend("topright", bty="n", 
       c("Ethanol", "Acetone", "Isoproply"), 
       inset=.1,  pch=c(6, 23, 24), 
       col=c("red", "blue", "darkgreen"),
       lty=2, lwd=2.5, cex=1)
####bv###
plot(de_h$distance, de_h$BV,  col=0, xaxs="i", xlim=c(0, 4.2), ylim=c(2, 3.2), 
     xlab="Distance (mm)",  mgp=c(1, 0, 0),
     tck=0.02,
     cex.lab=1.1, ylab=expression(V["bv"](kv))
)

title(main="Break Voltage",line=0.5,cex.main=1.1)

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
legend("bottomright", bty= "n",
       c("Ethanol", "Acetone", "Isoproply"), 
       inset=.1,  pch=c(6, 23, 24), 
       col=c("red", "blue", "darkgreen"),
       lty=2, lwd=2.5, cex=1)
##stable###

plot(de_h$distance, de_h$stable,  col=0, xaxs="i", 
     xlim=c(0, 4.2), ylim=c(0.6, 1.3), 
     xlab="Distance (mm)",cex.lab=1.1, mgp=c(1, 0, 0),
     tck=0.02,
     ylab=expression(V["stable"](kv)))

title(main="Voltage range",line=0.5,cex.main=1.1)

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

#dev.off()

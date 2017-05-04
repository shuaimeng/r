library(xlsx)

#读取v~h的数据
de_r<-read.xlsx("voltage.xls",sheetName="ethanol_r", header=TRUE)
da_r<-read.xlsx("voltage.xls",sheetName="acetone_r", header=TRUE)
di_r<-read.xlsx("voltage.xls",sheetName="iso_r", header=TRUE)

par(mfrow = c(2,2), mar = c(2,2.6,2,2), oma = c(1,1,1,1))

#pdf("diameter_3liquids.pdf")

plot(de_r$radius, de_r$OV,  col=0, xaxs="i", xlim=c(0.2, 0.9), ylim=c(1, 2.5), 
     xlab="OD(mm)", cex.lab=1.1, mgp=c(1, 0, 0),
     tck=0.02,
     ylab=expression(V["os"](kv)))

title(main="Onset Voltage",line=0.5,cex.main=1.1)

model_eov <- loess(de_r$OV ~ de_r$radius)
fit <- fitted(model_eov)
ord <- order(de_r$radius)

lines(de_r$radius[ord], fit[ord], type="b", col="red", lwd=2.5, lty=2) # 乙醇的拟合曲线

#画图-丙酮
#points(da_r$radius, da_r$OV,  pch=23, col="blue")

model_aov <- loess(da_r$OV ~ da_r$radius)
fit <- fitted(model_aov)
ord <- order(da_r$radius)

lines(da_r$radius[ord], fit[ord], type="b", col="blue", pch=23, lwd=2.5, lty=2) # 丙酮的拟合曲线

#画图-异丙醇
#points(di_r$radius, di_r$OV,  pch=23, col="green")

model_iov <- loess(di_r$OV ~ di_r$radius)
fit <- fitted(model_iov)
ord <- order(di_r$radius)

lines(di_r$radius[ord], fit[ord], type="b", col="darkgreen", pch=24, lwd=2.5, lty=2) # 异丙醇的拟合曲线

#图例标注
legend("topright", bty="n",
       c("Ethanol", "Acetone", "Isoproply"),
       inset=.1,  pch=c(6, 23, 24), 
       col=c("red", "blue", "darkgreen"), 
       lty=2, lwd=2.5, cex=1)

###########bv########
plot(de_r$radius, de_r$BV,  col=0, xaxs="i", xlim=c(0.2, 0.9), ylim=c(1.8, 3.5), 
     xlab="OD(mm)", cex.lab=1.1, mgp=c(1, 0, 0),
     tck=0.02,ylab=expression(V["bv"](kv)))

title( main="Break Voltage",line=0.5,cex.main=1.1)

model_ebv <- loess(de_r$BV ~ de_r$radius)
fit <- fitted(model_ebv)
ord <- order(de_r$radius)

lines(de_r$radius[ord], fit[ord], type="b", col="red", lwd=2.5, lty=2) # 乙醇的拟合曲线

#画图-丙酮
#points(da_r$radius, da_r$BV,  pch=23, col="blue")

model_abv <- loess(da_r$BV ~ da_r$radius)
fit <- fitted(model_abv)
ord <- order(da_r$radius)

lines(da_r$radius[ord], fit[ord], type="b", col="blue", pch=23, lwd=2.5, lty=2) # 丙酮的拟合曲线

#画图-异丙醇
#points(di_r$radius, di_r$BV,  pch=23, col="green")

model_ibv <- loess(di_r$BV ~ di_r$radius)
fit <- fitted(model_ibv)
ord <- order(di_r$radius)

lines(di_r$radius[ord], fit[ord], type="b", col="darkgreen", pch=24, lwd=2.5, lty=2) # 异丙醇的拟合曲线

#图例标注
legend("bottomright",bty="n",
       c("Ethanol", "Acetone", "Isoproply"), inset=.1,
       pch=c(6, 23, 24), col=c("red", "blue", "darkgreen")
       , lty=2, lwd=2.5, cex=1)

###########stable#########
plot(de_r$radius, de_r$stable,  col=0, xaxs="i", xlim=c(0.2, 0.9), ylim=c(0.6, 1.3), 
     xlab="OD(mm)", cex.lab=1.1, mgp=c(1, 0, 0),
     tck=0.02,
     ylab=expression(V["stable"](kv)))

title(main="Vollage range",line=0.5,cex.main=1.1)

model_esv <- loess(de_r$stable ~ de_r$radius)
fit <- fitted(model_esv)
ord <- order(de_r$radius)

lines(de_r$radius[ord], fit[ord], type="b", col="red", lwd=2.5, lty=2) # 乙醇的拟合曲线

#画图-丙酮
#points(da_r$radius, da_r$stable,  pch=23, col="blue")

model_asv <- loess(da_r$stable ~ da_r$radius)
fit <- fitted(model_asv)
ord <- order(da_r$radius)

lines(da_r$radius[ord], fit[ord], type="b", col="blue", pch=23, lwd=2.5, lty=2) # 丙酮的拟合曲线

#画图-异丙醇
#points(di_r$radius, di_r$stable,  pch=23, col="green")

model_isv <- loess(di_r$stable ~ di_r$radius)
fit <- fitted(model_isv)
ord <- order(di_r$radius)

lines(di_r$radius[ord], fit[ord], type="b", col="darkgreen", pch=24, lwd=2.5, lty=2) # 异丙醇的拟合曲线

#图例标注
legend("bottomright", bty="n",
       c("Ethanol", "Acetone", "Isoproply"), 
       inset=.1,  pch=c(6, 23, 24), 
       col=c("red", "blue", "darkgreen"), lty=2, 
       lwd=2.5, cex=1)

#dev.off()
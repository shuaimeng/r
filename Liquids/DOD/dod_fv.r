#dod方法下的射出频率与参数之间的关系
#########说明########
#乙二醇液体
#voltage_pluse，说明高峰电压和基准电压下的射出时间ms
#duty_pluse，随着fv电压频率上升，占空比不同时的射出时间
#height，不同占空比下，随fv上升，弯月面高度的变化
#angle，同上，弯月面锥角的变化
#flowrate_pulse，不同占空比下，随流量变化的射出时间
#flowrate_height，此时的弯月面高度
#flowrate_angle，弯月面角度的变化
#setduty_pulse, 固定占空比为50%时，不同电压频率下，不同流量下的射出时间
#setduty_height，同上，弯月面高度
#setduty_angle，同上，弯月面锥角

#####第一组：随电压频率上升，不同占空比下的射出时间和弯月面信息#####
#####第二组：固定电压频率下，不同流量，不同占空比下的射出时间和弯月面信息####
#####第三组：固定占空比下，不同流量，不同电压频率的射出时间和弯月面信息####

#设定工作区间
setwd("D:/data")
library(xlsx)

#读取数据
vp<-read.xlsx("dod_v_pulse.xls", sheetName= "voltage_pulse", header=TRUE)
dp<-read.xlsx("dod_v_pulse.xls", sheetName= "duty_pulse", header = TRUE)
hei<-read.xlsx("dod_v_pulse.xls", sheetName = "height", header = TRUE)
ang<-read.xlsx("dod_v_pulse.xls", sheetName = "angle", header = TRUE)

#规划区域
par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(2,1,1,1))

#保存pdf
#pdf("dod_fv.pdf")

################################画图-高峰电压与基准电压曲线###########################
plot(vp$voltage, vp$X1.6, col=0, xaxs="i", xlim=c(1.8, 2.5), ylim=c(0.3, 1.2), 
xlab="Hight voltage (HV)", cex.lab=1, ylab="Pulse time (ms)", main="Pulse time in voltage groups")

lines(lowess(vp$voltage, vp$X1.6), col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

lines(lowess(vp$voltage, vp$X1.65), col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

lines(lowess(vp$voltage, vp$X1.7), col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

legend("topright", c("1.6kv", "1.65kv", "1.7kv"), inset=.05, col=c("#458B74", "#FF00FF", "#EE0000"), pch=c(21,22,23), lwd=1.5, lty=2, cex=1.2, bty="n")

################################画图-占空比改变配合fv改变的pulse时间###########################
plot(dp$fv, dp$X0.1, col=0, xaxs="i", xlim=c(0, 105), ylim=c(0.05, 0.6), 
xlab="Voltage frequency (Hz)", cex.lab=1, ylab="Pulse time (ms)", main="Pulse time in various fv & k")

lines(lowess(dp$fv, dp$X0.1), col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

lines(lowess(dp$fv, dp$X0.2), col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

lines(lowess(dp$fv, dp$X0.3), col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

lines(lowess(dp$fv, dp$X0.5), col="#EEAD0E", pch=24, lwd=2.5, type="b", lty=2)

lines(lowess(dp$fv, dp$X0.8), col="#27408B", pch=25, lwd=2.5, type="b", lty=2)

legend("bottomleft", c("k=0.1", "k=0.2", "k=0.3", "k=0.5", "k=0.8"), inset=.05, col=c("#458B74", "#FF00FF", "#EE0000", "#EEAD0E", "#27408B"), pch=c(21,22,23,24,25), lwd=1.5, lty=2, cex=1.2, bty="n")

#################################画图--弯月面高度#############################
plot(hei$fv, hei$X0.1, col=0, xaxs="i", xlim=c(0, 105), ylim=c(0.2, 0.4), 
xlab="Voltage frequency (Hz)", cex.lab=1, ylab="Height of Meniscus (mm)", main="Meniscus height in various fv & k")

lines(lowess(hei$fv, hei$X0.1), col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

lines(lowess(hei$fv, hei$X0.2), col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

lines(lowess(hei$fv, hei$X0.3), col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

lines(lowess(hei$fv, hei$X0.5), col="#EEAD0E", pch=24, lwd=2.5, type="b", lty=2)

lines(lowess(hei$fv, hei$X0.8), col="#27408B", pch=25, lwd=2.5, type="b", lty=2)

legend("bottomright", c("k=0.1", "k=0.2", "k=0.3", "k=0.5", "k=0.8"), inset=.05, col=c("#458B74", "#FF00FF", "#EE0000", "#EEAD0E", "#27408B"), pch=c(21,22,23,24,25), lwd=1.5, lty=2, cex=1.2, bty="n")

###############################画图--弯月面角度#############################
plot(ang$fv, ang$X0.1, col=0, xaxs="i", xlim=c(0, 105), ylim=c(65, 100), 
xlab="Voltage frequency (Hz)", cex.lab=1, ylab="Taylor Angle (°)", main="Meniscus Angle in various fv & k")

lines(lowess(ang$fv, ang$X0.1), col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

lines(lowess(ang$fv, ang$X0.2), col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

lines(lowess(ang$fv, ang$X0.3), col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

lines(lowess(ang$fv, ang$X0.5), col="#EEAD0E", pch=24, lwd=2.5, type="b", lty=2)

lines(lowess(ang$fv, ang$X0.8), col="#27408B", pch=25, lwd=2.5, type="b", lty=2)

legend("topright", c("k=0.1", "k=0.2", "k=0.3", "k=0.5", "k=0.8"), inset=.05, col=c("#458B74", "#FF00FF", "#EE0000", "#EEAD0E", "#27408B"), pch=c(21,22,23,24,25), lwd=1.5, lty=2, cex=1.2, bty="n")

mtext("乙二醇 | H = 1mm | Nozzle 24G | Q = 0.0002nl/min | Fv = 20Hz | Duty = 20%", 1, line=1, col="black", cex=1.3, font=2, outer=TRUE)

#dev.off()



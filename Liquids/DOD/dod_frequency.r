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

setp<-read.xlsx("dod_v_pulse.xls", sheetName = "setduty_pulse", header = TRUE)
seth<-read.xlsx("dod_v_pulse.xls", sheetName = "setduty_height", header = TRUE)
seta<-read.xlsx("dod_v_pulse.xls", sheetName = "setduty_angle", header = TRUE)
#规划区域
par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(2,1,1,1))

#保存pdf
#pdf("dod_frequency.pdf")

#固定占空比为20%

################################画图-流量与pulse射出时间的关系###########################
plot(setp$flowrate, setp$X10, col=0, xaxs="i", xlim=c(0, 0.001), ylim=c(0.2, 0.5), 
xlab="Flow rate (ml/min)", cex.lab=1.2, ylab="Pulse time (ms)", main="Pulse time in various fv", cex.main = 1.5)

model1 = loess(setp$X10~setp$flowrate)
lines(setp$flowrate,  model1$fit, col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

model2 = loess(setp$X25~setp$flowrate)
lines(setp$flowrate,  model2$fit, col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

model3 = loess(setp$X50~setp$flowrate)
lines(setp$flowrate,  model3$fit, col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

model4 = loess(setp$X75~setp$flowrate)
lines(setp$flowrate, model4$fit, col="#EEAD0E", pch=24, lwd=2.5, type="b", lty=2)

legend("bottomright", c("10Hz", "25Hz", "50Hz", "75Hz"), inset=.05, col=c("#458B74", "#FF00FF", "#EE0000", "#EEAD0E"), pch=c(21,22,23, 24), lwd=1.5, lty=2, cex=1.2, bty="n")

################################画图-信息###########################

plot(setp$flowrate, setp$X10,  yaxt="n", xaxt= "n", col=0,  xlab="", ylab="", xlim=c(0,0.001), ylim=c(1, 3), main="Information", cex.main = 1.5)
text(0.00025, 2.8, "Liquids - Ethylene glycol", col="black", adj=0, cex=1.5)
text(0.00025, 2.5, "Distance - 1mm", col="black", adj=0, cex=1.5)
text(0.00025, 2.2, "Nozzle - 24G - 0.55mm", col="black", adj=0, cex=1.5)
text(0.00025, 1.9, "Flowrate -  0.0002ml/min", col="black", adj=0, cex=1.5)
text(0.00025, 1.6, "Voltage frequency - 20Hz", col="black", adj=0, cex=1.5)
text(0.00025, 1.3, "Duty cycle - 20%", col="black", adj=0, cex=1.5)


#legend("bottomleft", c("k=0.1", "k=0.2", "k=0.3", "k=0.5", "k=0.8"), inset=.05, col=c("#458B74", "#FF00FF", "#EE0000", "#EEAD0E", "#27408B"), pch=c(21,22,23,24,25), lwd=1.5, lty=2, cex=1.2, bty="n")

#################################画图--弯月面高度#############################
plot(seth$flowrate, seth$X10, col=0, xaxs="i", xlim=c(0, 0.001), ylim=c(0.3, 0.4), 
xlab="Flow rate (ml/min)", cex.lab=1.2, ylab="Height of Meniscus (mm)", main="Meniscus height in various fv", cex.main = 1.5)

lines(lowess(seth$flowrate, seth$X10), col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

lines(lowess(seth$flowrate, seth$X25), col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

lines(lowess(seth$flowrate, seth$X50), col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

lines(lowess(seth$flowrate, seth$X75), col="#EEAD0E", pch=24, lwd=2.5, type="b", lty=2)

legend("bottomright", c("10Hz", "25Hz", "50Hz", "75Hz"), inset=.05, col=c("#458B74", "#FF00FF", "#EE0000", "#EEAD0E"), pch=c(21,22,23,24), lwd=1.5, lty=2, cex=1.2, bty="n")

###############################画图--弯月面角度#############################
plot(seta$flowrate, seta$X10, col=0, xaxs="i",xlim=c(0, 0.001), ylim=c(65, 90), 
xlab="Flow rate (ml/min)", cex.lab=1.2, ylab="Taylor fale (°)", main="Meniscus Angle in various fv", cex.main = 1.5)

lines(lowess(seta$flowrate, seta$X10), col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

lines(lowess(seta$flowrate, seta$X25), col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

lines(lowess(seta$flowrate, seta$X50), col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

lines(lowess(seta$flowrate, seta$X75), col="#EEAD0E", pch=24, lwd=2.5, type="b", lty=2)

legend("topright", c("10Hz", "25Hz", "50Hz", "75Hz"), inset=.05, col=c("#458B74", "#FF00FF", "#EE0000", "#EEAD0E"), pch=c(21,22,23,24), lwd=1.5, lty=2, cex=1.2, bty="n")

#mtext("乙二醇 | H = 1mm | Nozzle 24G | Q = 0.0002ml/min | Fv = 20Hz | Duty = 20%", 1, line=1, col="black", cex=1.3, font=2, outer=TRUE)

#dev.off()
#测试对数log坐标轴下的数据
#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
ek2<-read.xlsx("t_pulse.xls", sheetName = "eject_k2", header = TRUE)
#ek3<-read.xlsx("t_pulse.xls", sheetName = "eject_k3", header = TRUE)
#ek4<-read.xlsx("t_pulse.xls", sheetName = "eject_k4", header = TRUE)
#ek5<-read.xlsx("t_pulse.xls", sheetName = "eject_k5", header = TRUE)

fv <- log10(ek2$fv)

plot(fv, ek2$X1.5, col = 0, xlab = "Voltage frequency (Hz)", ylab = "Eject time t_eject (ms)", main = "Eject time in Q = 1.5nl/min", cex.lab = 1.1, cex.main = 1.2, xlim = c(0, 4), ylim = c(0, 80)

lines(fv, ek2$X1.5, col="#458B74", lwd=2, type="l", lty=2)

lines(fv, ek2$X27, col="#FF00FF", lwd=2, type="l", lty=2)

lines(fv, ek2$X54, col="#EE0000", lwd=2, type="l", lty=2)

lines(fv, ek2$X180, col="#27408B", lwd=2, type="l", lty=2)

#区域划线
legend("topleft", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"),lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

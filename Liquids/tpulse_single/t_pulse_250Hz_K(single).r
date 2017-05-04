#t_pulse是单次射出所需的时间
#t_pulse，随着电压频率fv的上升而改变；随着流量而改变；

#设定工作目录
setwd("D:/data")
library(xlsx)
 library(RColorBrewer)

#读取数据
s2<-read.xlsx("t_pulse.xls", sheetName = "single_k2", header = TRUE)
s3<-read.xlsx("t_pulse.xls", sheetName = "single_k3", header = TRUE)
s4<-read.xlsx("t_pulse.xls", sheetName = "single_k4", header = TRUE)
s5<-read.xlsx("t_pulse.xls", sheetName = "single_k5", header = TRUE)

#保存数据
#pdf("t_pulse_K_mixed.pdf")

par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(2,2,2,2))
mycolors <- c("red", "blue", "black", "darkgreen")

##################################画图--占空比k为0.2#######################
plot(s2$fv, s2$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "t_pulse (ms)", main = "k = 0.2", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0, 250), ylim = c(0.2, 1))

for (i in 1:4){
points(s2$fv, s2[,i+1],  col=mycolors[i], pch=1, lwd = 2)
}

abline(0.45, -0.00088, lty = 3, col = "red", lwd = 2)
abline(0.8, -0.001, lty = 3, col = "red", lwd = 2)
text(130, 0.8, "0.45ms ~ 0.8ms", col ="blue", cex =1.2, font =2)
text(20, 0.95, "(a)", col ="black", cex =1.2, font =2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = mycolors, cex = 1, pch =21, bty = "n")

##################################画图--占空比k为0.3#######################
plot(s2$fv, s2$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "t_pulse (ms)", main = "k = 0.3", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0, 250), ylim = c(0.2, 1))

for (i in 1:4){
points(s3$fv, s3[,i+1],  col=mycolors[i], pch=1, lwd = 2)
}

abline(0.55, -0.00088, lty = 3, col = "red", lwd = 2)
abline(0.9, -0.001, lty = 3, col = "red", lwd = 2)
text(130, 0.9, "0.55ms ~ 0.9ms", col ="blue", cex =1.2, font =2)
text(20, 0.95, "(b)", col ="black", cex =1.2, font =2)
##################################画图--占空比k为0.4#######################
plot(s2$fv, s2$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "t_pulse (ms)", main = "k = 0.4", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0, 250), ylim = c(0.2, 1.6))

for (i in 1:4){
points(s3$fv, s3[,i+1],  col=mycolors[i], pch=1, lwd = 2)
}

abline(0.53, -0.00088, lty = 3, col = "red", lwd = 2)
abline(0.88, -0.001, lty = 3, col = "red", lwd = 2)
text(130, 1, "0.53ms ~ 0.88ms", col ="blue", cex =1.2, font =2)
text(20, 1.5, "(c)", col ="black", cex =1.2, font =2)

legend("topright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), inset = 0.03, col = mycolors, cex = 1, pch =21, bty = "n")

##################################画图--占空比k为0.5#######################
plot(s2$fv, s2$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "t_pulse (ms)", main = "k = 0.5", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0, 250), ylim = c(0.2, 1.8))

for (i in 1:4){
points(s4$fv, s4[,i+1],  col=mycolors[i], pch=1, lwd = 2)
}

abline(0.53, -0.00088, lty = 3, col = "red", lwd = 2)
abline(0.88, -0.001, lty = 3, col = "red", lwd = 2)
text(130, 1, "0.53ms ~ 0.88ms", col ="blue", cex =1.2, font =2)
text(20, 1.7, "(d)", col ="black", cex =1.2, font =2)
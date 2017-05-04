#t_pulse是单次射出所需的时间
#t_pulse，随着电压频率fv的上升而改变；随着流量而改变；

#设定工作目录
setwd("D:/data")
library(xlsx)
 library(RColorBrewer)

#读取数据
s2<-read.xlsx("t_pulse.xls", sheetName = "single_q_15", header = TRUE)
s3<-read.xlsx("t_pulse.xls", sheetName = "single_q27", header = TRUE)
s4<-read.xlsx("t_pulse.xls", sheetName = "single_q54", header = TRUE)
s5<-read.xlsx("t_pulse.xls", sheetName = "single_q180", header = TRUE)

#保存数据
#pdf("t_pulse_K_mixed.pdf")

par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(2,2,2,2))
mycolors <- c("red", "blue", "black", "darkgreen")

##################################画图--占空比q-1.5#######################
plot(s2$fv, s2$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "t_pulse (ms)", main = "Q = 1.5nl/min", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0, 250), ylim = c(0.2, 1))

for (i in 1:4){
points(s2$fv, s2[,i+1],  col=mycolors[i], pch=1, lwd = 2)
}

abline(0.55, -0.00088, lty = 3, col = "red", lwd = 2)
abline(0.95, -0.001, lty = 3, col = "red", lwd = 2)
text(130, 0.9, "0.55ms ~ 0.95ms", col ="blue", cex =1.2, font =2)
text(20, 0.98, "(a)", col ="black", cex =1.2, font =2)
legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = mycolors, cex = 1, pch =21, bty = "n")

##################################画图--占空比q为27n/min##############################################
plot(s2$fv, s2$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "t_pulse (ms)", main = "Q = 27nl/min", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0, 250), ylim = c(0.2, 1))

for (i in 1:4){
points(s3$fv, s3[,i+1],  col=mycolors[i], pch=1, lwd = 2)
}

abline(0.5, -0.00088, lty = 3, col = "red", lwd = 2)
abline(0.85, -0.001, lty = 3, col = "red", lwd = 2)
text(130, 0.9, "0.5ms ~ 0.85ms", col ="blue", cex =1.2, font =2)
text(20, 0.98, "(b)", col ="black", cex =1.2, font =2)
##################################画图--占空比q为54#######################
plot(s2$fv, s2$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "t_pulse (ms)", main = "Q = 54nl/min", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0, 250), ylim = c(0.2, 1.6))

for (i in 1:4){
points(s3$fv, s3[,i+1],  col=mycolors[i], pch=1, lwd = 2)
}

abline(0.53, -0.00088, lty = 3, col = "red", lwd = 2)
abline(0.88, -0.001, lty = 3, col = "red", lwd = 2)
text(130, 1, "0.53ms ~ 0.88ms", col ="blue", cex =1.2, font =2)
text(20, 1.5, "(c)", col ="black", cex =1.2, font =2)
legend("topright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = mycolors, cex = 1, pch =21, bty = "n")

##################################画图--占空比q为180nl/min#######################
plot(s2$fv, s2$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "t_pulse (ms)", main = "Q = 180nl/min", cex.lab = 1, cex.main = 1.3, yaxs = "r", xlim = c(0, 250), ylim = c(0.2, 1.8))

for (i in 1:4){
points(s4$fv, s4[,i+1],  col=mycolors[i], pch=1, lwd = 2)
}

abline(0.53, -0.00088, lty = 3, col = "red", lwd = 2)
abline(0.88, -0.001, lty = 3, col = "red", lwd = 2)
text(130, 1, "0.53ms ~ 0.88ms", col ="blue", cex =1.2, font =2)
text(20, 1.7, "(d)", col ="black", cex =1.2, font =2)
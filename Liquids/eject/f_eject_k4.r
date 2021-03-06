#研究f_eject射出次数和频率
#分为eject单次射出，即单脉冲内射出的次数
#还有eject，总体射出频率

#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
#k4 <- read.xlsx("f_eject.xls", sheetName = "eject_k4", header = TRUE)
#k4 <- read.xlsx("f_eject.xls", sheetName = "eject_k4", header = TRUE)
k4 <- read.xlsx("f_eject.xls", sheetName = "eject_k4", header = TRUE)
#k5 <- read.xlsx("f_eject.xls", sheetName = "eject_k5", header = TRUE)

#保存数据
#pdf("f_e0.4.pdf")

#画图
#设定空间位置
par(fig=c(0,1,0,1), new = F)

##################################画图--占空比k为0.2#######################
plot(k4$fv, k4$X1.5, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Frequency in 1s (Hz)", main = "Eject frequency in duty = 0.4", cex.lab = 1.2, cex.main = 1.5, xlim = c(0, 2050), ylim = c(70, 2050))

#model1 = loess(k4$X1.5 ~ k4$fv, span = 0.8 , degree = 2)
lines(k4$fv, k4$X1.5,  col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

#model2 = loess(k4$X27 ~ k4$fv, span = 0.8, degree = 2)
lines(k4$fv, k4$X27, col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

#model3 = loess(k4$X54 ~ k4$fv, span = 0.8, degree = 2)
lines(k4$fv, k4$X54, col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

#model4 = loess(k4$X180 ~ k4$fv, span = 0.8, degree =2)
lines(k4$fv, k4$X180, col="#27408B", pch=24, lwd=2.5, type="b", lty=2)

#区域划线


legend("bottomright", c("1.5nl/min", "27nl/min", "54nl/min", "180nl/min"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.2, inset = .03, bty = "n")

abline(v=500, lty = 3, col ="red", lwd = 3)
abline(v=300, lty = 3, col ="red", lwd = 3)
text(350, 700, "300Hz", col = "blue", cex = 1.5, font = 2)
text(550, 700, "500Hz", col = "blue", cex = 1.5, font = 2)

#dev.off()

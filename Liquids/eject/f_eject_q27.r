#研究f_eject射出次数和频率
#分为eject单次射出，即单脉冲内射出的次数
#还有eject，总体射出频率

#设定工作目录
setwd("D:/data")
library(xlsx)

#读取数据
#q2 <- read.xlsx("f_eject.xls", sheetName = "eject_q15", header = TRUE)
q3 <- read.xlsx("f_eject.xls", sheetName = "eject_q27", header = TRUE)
#q4 <- read.xlsx("f_eject.xls", sheetName = "eject_q54", header = TRUE)
#q5 <- read.xlsx("f_eject.xls", sheetName = "eject_q180", header = TRUE)

#保存数据
#pdf("f_eject_27.pdf")

#画图
#设定空间位置
par(fig=c(0,1,0,1), new = F)

##################################画图--占空比k为0.2#######################
plot(q3$fv, q3$X0.2, xaxs = "i", col = 0, xlab = "Voltage frequency (Hz)", ylab = "Frequency in 1s (Hz)", main = "Eject frequency in Q = 27nl/min", cex.lab = 1.1, cex.main = 1.2, xlim = c(0, 1050), ylim = c(70, 1050))

#model1 = loess(q3$X1.5 ~ q3$fv, span = 0.8 , degree = 2)
lines(q3$fv, q3$X0.2,  col="#458B74", pch=21, lwd=2.5, type="b", lty=2)

#model2 = loess(q3$X27 ~ q3$fv, span = 0.8, degree = 2)
lines(q3$fv, q3$X0.3, col="#FF00FF", pch=22, lwd=2.5, type="b", lty=2)

#model3 = loess(q3$X54 ~ q3$fv, span = 0.8, degree = 2)
lines(q3$fv, q3$X0.4, col="#EE0000", pch=23, lwd=2.5, type="b", lty=2)

#model4 = loess(q3$X180 ~ q3$fv, span = 0.8, degree =2)
lines(q3$fv, q3$X0.5, col="#27408B", pch=24, lwd=2.5, type="b", lty=2)

#区域划线


legend("bottomright", c("k = 0.2", "k = 0.3", "k = 0.4", "k = 0.5"), col = c("#458B74", "#FF00FF", "#EE0000", "#27408B"), pch = c(21, 22, 23, 24), lwd = 2, lty = 2, cex = 1.1, inset = .05, bty = "n")

abline(v=600, lty = 3, col ="red", lwd = 3)
#abline(v=200, lty = 3, col ="red", lwd = 3)
#abline(h = 600, lty = 3, col = "green3", lwd = 3)
text(680, 700, "600Hz", col = "blue", cex = 1.5, font = 2)
#text(1050, 1800, "1000Hz", col = "blue", cex = 1.5, font = 2)

#dev.off()

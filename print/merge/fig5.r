dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

setwd("/Users/mengmengjiang/all datas/print")

library(xlsx)

# reading ux and sd

k1<-read.xlsx("rong.xlsx",sheetName="600",header=TRUE)
k2<-read.xlsx("rong.xlsx",sheetName="1khz",header=TRUE)
k3<-read.xlsx("rong.xlsx",sheetName="2khz",header=TRUE)
k4<-read.xlsx("dotx.xlsx",sheetName="600",header=TRUE)
k5<-read.xlsx("dotx.xlsx",sheetName="1khz",header=TRUE)
k6<-read.xlsx("dotx.xlsx",sheetName="2khz",header=TRUE)

# errorbar
error.bar <- function(x, y, upper, coll,lower=upper, length=0.05,...){
if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
stop("vectors must be same length")
arrows(x,y+upper, x, y-lower,col=coll, angle=90, code=3, length=length, ...)
}

# color setting

yan<-c("red","blue","black")
pcc<-c(0,1,2)

# par

par(mfrow = c(2,1), mar = c(2,2.4,2,2), oma = c(1,1,1,1))
layout(matrix(c(1,2), 2, 1,byrow = TRUE))

# 液滴原来的尺寸
d1<-sum(k4$deva)/5
d2<-sum(k5$deva)/3
d3<-sum(k6$deva)/3

y1<-c(d1,d1)
y2<-c(d2,d2,d2,d2)
y3<-c(d3,d3,d3,d3)

# 次数的比较，n1，n2和n3

n1<-k1$deva/y1
n2<-k2$deva/y2
n3<-k3$deva/y3

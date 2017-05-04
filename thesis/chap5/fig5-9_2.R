


#25G
x1<-c(2,2.2)
y1<-c(0.8,0.8)
#30G
x2<-c(1.6,1.8,2,2.2)
y2<-c(0.8,1.8,2.8,2.9)
#32G
x3<-c(1.8,2,2.2)
y3<-c(2.8,3.5,0.4)
#34G
x4<-c(1.8,2)
y4<-c(2,3)

data<-c(0,0.8,0,0, 0,1.8,2.8,2, 0.8,2.8,3.5,3, 0.8,2.9,0.4,0)

mycolor<-c("red","blue","black","green3","red","blue","black","green3",
           "red","blue","black","green3",
           "red","blue","black","green3")

name<-c("1.6kv","1.8kv","2kv","2.2kv","1.6kv","1.8kv","2kv","2.2kv",
        "1.6kv","1.8kv","2kv","2.2kv","1.6kv","1.8kv","2kv","2.2kv")

barplot(data,width=0.5,space=0.3,col=mycolor,names.arg=name,
        xlab = expression(italic(Voltage(kv)), ylab = expression(italic(f["max"])(KHz)),
                          xlim = c(1.4, 2.4), ylim=c(0,4)))

#lines(x1,y1,col="red",type="b",pch=1,lwd=2,lty=2)
#lines(x2,y2,col="blue",type="b",pch=2,lwd=2,lty=2)
#lines(x3,y3,col="black",type="b",pch=3,lwd=2,lty=2)
#lines(x4,y4,col="green3",type="b",pch=4,lwd=2,lty=2)
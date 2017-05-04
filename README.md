# r
r language coding

## 内容

这里记录的是我的R语言相关的编程内容。其中，thesis是大论文中用到的各种画图的r coding。

其中，调用xlsx，需要配置一下java环境：

```r
dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

```

### Nozzles

nozzles文件夹包含使用多种尺寸针头进行试验的结果。

#### 针头选择

+ 25G；外径-510mu
+ 30G；外径-310mu
+ 32G；外径-190mu
+ 34G；外径-60mu

#### 流量选择

+ 18nl/min；
+ 54nl/min；
+ 180nl/min；

#### 重点内容

+ ratio：针头液滴直径比：针头外径/液滴直径；
+ he_ra: 弯月面高度；
+ tfor： 变形时间；
+ tp：   射出时间；
+ rd：   液滴尺寸；
+ angle：弯月面锥角；
+ fp：   射出频率；
+ fe：   单脉冲射出频率；

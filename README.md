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
+ fe：   单脉冲射出频率；i

### Liquids

三种液体下的打印实现：乙醇，异丙醇，丙酮。

涉及了DOD技术，电压适用区间等核心参数。

#### 三种液体

acetone：丙酮；
ethanol：乙醇；
iso：    异丙醇；

#### 关注内容

**DOD**：drop on demand。

**voltage of liquids**: 测量了ov电压和bv电压在不同液体下的
表现。

**meniscus**：研究三种液体，流量变化下，各参数与弯月面高度
和角度的关系。

**diameter**：不同针头尺寸下电压ov和bvd的关系。

**distance**：不同极间距离下，ov与bv电压的关系。

**fp emission**: fe与fv关系，在不同占空比和流量下的表现。

**tfor**：tfor时间在不同占空比和流量下的表现。

**tpulse eject_k**: tp x fe的总时间，不同占空比。

**tpulse eject_q**: tp x fe的总时间，不同流量下。

**tpulse_single**: 单射出时间tp。

**fp 1s**: 1s内的打印频率。不同的流量和占空比的情况。

**droplet size**：液滴尺寸与fv的关系。不同Q和K的表现。

### Voltage

讨论电压施加方式不同时的打印效果。其中，包含：Va+Vb的电压
配置方式，以及与普通的0+Va进行比较。

+ 26g-fp：26g针头下的打印频率fp；
+ voltage-dod: 两种电压配置方式下打印频率的比较；

涉及xlsx：

1. qd1.xlsx; 26G-18nl/min
  + V1: 1.7kv-2kv;
  + V2: 1.9kv-2kv;
  + V3: 1.95kv-2kv;

2. qd2.xlsx; 26G-180nl/min
  + V1: 1.7kv-2kv;
  + V2: 1.8kv-2kv;
  + V3: 1.9kv-2kv;

3. qd3.xlsx; 32G-18nl/min
  + V1: 1.7kv-2kv;
  + V2: 1.8kv-2kv;
  + V3: 1.9kv-2kv;

4. qd4.xlsx; 32G-180nl/min
  + V1: 1.7kv-2kv;
  + V2: 1.8kv-2kv;
  + V3: 1.9kv-2kv;

### volume

thesis中涉及到弯月面体积变化的coding。

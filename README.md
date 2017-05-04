# r
r language coding

## 内容

这里记录的是我的R语言相关的编程内容。其中，thesis是大论文中用到的各种画图
的r coding。

其中，调用xlsx，需要配置一下java环境：

```r
dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)

```

# CSM API

## 工具VI(Utility VIs)

## 状态字符串操作

### CSM - Compact Multiple States.vi

将多个状态紧凑成单个字符串以供输入使用

-- <b>Controls(输入控件)</b> --
- <b>Multiple States</b>: CSM状态字符串数组

-- <b>Indicators(输出控件)</b> --
- <b>States</b>: 包含多行CSM状态字符串的字符串

### CSM - Break Down Multiple States String.vi

将包含多行CSM状态字符串的字符串切割成CSM状态字符串数组

-- <b>Controls(输入控件)</b> --
- <b>States</b>: 包含多行CSM状态字符串的字符串

-- <b>Indicators(输出控件)</b> --
- <b>Multiple States</b>: CSM状态字符串数组

### CSM - Build Exit Messages of CSMs.vi

输入CSM模块名称，拼接生成退出消息("Macro: Exit")。

> Ref: 消息拼接API

-- <b>Controls(输入控件)</b> --
- <b>CSMs</b>: CSM模块名称数组
- <b>State with Arguments("Macro: Exit“)</b>: 退出消息

-- <b>Indicators(输出控件)</b> --
- <b>States</b>: 拼接生成的CSM消息字符串
- <b>State With Arguments ("Macro: Exit“)</b>:Controls

### CSM - Filter Duplicate Messages By Name.vi

过滤重复的消息，只保留最新的消息。

> Ref: 消息拼接API

-- <b>Controls(输入控件)</b> --
- <b>States</b>: 输入的消息字符串
- <b>Whole Messages in Check?(T)</b>: 是否检查整个消息字符串。如果是 FALSE，则只检查消息名称。

-- <b>Indicators(输出控件)</b> --
- <b>Filtered States</b>: 过滤后的消息字符串
- <b>States Out</b>:Indicators
- <b>Whole Messages In Check? (T)</b>:Controls

### CSM - Remove Duplicated Following Messages.vi

-- <b>Controls(输入控件)</b> --
- <b>Current State</b>:
- <b>Remaining States</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Remaining States Left</b>:
- <b>Current State</b>:Controls
- <b>Remaining States Left</b>:Indicators

## 数据类型字符串描述

### CSM Data Type String.vi

获取输入数据对应的数据类型描述字符串，通常用在参数描述中，用于判断参数携带的参数类型。

-- <b>Controls(输入控件)</b> --
- <b>Data</b>: 输入数据

-- <b>Indicators(输出控件)</b> --
- <b>Data Type String</b>:数据类型描述字符串

### CSM Data Type String to Enum.vi

从数据类型描述字符串中LabVIEW 定义的数据类型枚举。

> [!NOTE] 
> **多态VI(Polymorphic VI)选项**
>
> - CSM Data Type String to Enum(String).vi
> - CSM Data Type String to Enum(TypeEnum).vi
> - CSM Data Type String to Enum(RefnumEnum).vi

#### CSM Data Type String to Enum(String).vi

从数据类型描述字符串中LabVIEW 定义的数据类型枚举，子类型使用字符串描述。

-- <b>Controls(输入控件)</b> --
- <b>Data Type String</b>:输入的数据类型描述字符串

-- <b>Indicators(输出控件)</b> --
- <b>Primary Type</b>:数据类型枚举
- <b>Secondary Type String</b>:如果是复合的数据类型，返回子类型字符串，例如Array 数据类型中的元素类型。
- <b>Array Dim</b>:如果是数组数据类型，返回数组维度。

#### CSM Data Type String to Enum(TypeEnum).vi

从数据类型描述字符串中LabVIEW 定义的数据类型枚举，并返回Array子类型使用枚举。

-- <b>Controls(输入控件)</b> --
- <b>Data Type String</b>:输入的数据类型描述字符串

-- <b>Indicators(输出控件)</b> --
- <b>Primary Type</b>:数据类型枚举
- <b>Secondary Type String</b>:Array子类型枚举
- <b>Array Dim</b>:如果是数组数据类型，返回数组维度。

#### CSM Data Type String to Enum(RefnumEnum).vi

从数据类型描述字符串中LabVIEW 定义的数据类型枚举，并返回Refnum子类型使用枚举。

-- <b>Controls(输入控件)</b> --
- <b>Data Type String</b>:输入的数据类型描述字符串

-- <b>Indicators(输出控件)</b> --
- <b>Primary Type</b>:数据类型枚举
- <b>Secondary Type String</b>:Refnum子类型枚举
- <b>Array Dim</b>:如果是数组数据类型，返回数组维度。

## 其他工具VI

### uuid.vi

根据标准方法生成 <b>Universally Unique Identifier(UUID)</b>。 例如:
- 59703F3AD837
- 106A470BA5EC
- 9B781DB313AF

-- <b>Indicators(输出控件)</b> --
- <b>UUID</b>: 生成的 UUID

### Global Log To String.vi

全局日志(Global Log)数据簇转换为字符串。

-- <b>Controls(输入控件)</b> --
- <b>Log</b>: 全局日志数据簇

-- <b>Indicators(输出控件)</b> --
- <b>Log String</b>: 全局日志字符串

### Global Log To String(Source Time).vi

将全局日志(Global Log)数据簇转换为字符串，使用发送时间作为时间戳。

-- <b>Controls(输入控件)</b> --
- <b>Log</b>: 全局日志数据簇
- <b>Format String</b>:时间戳格式

-- <b>Indicators(输出控件)</b> --
- <b>Log String</b>: 全局日志字符串

### Global Log History Cacher.vi

保存当前输入的字符串到缓存，缓存的历史字符串，当超出最大长度限制时，最先进入的缓存字符串将被覆盖。用于调试CSM的历史状态。

-- <b>Controls(输入控件)</b> --
- <b>Global Log Data</b>: 收到的Global Log信息数据包
- <b>Length (10000)</b>:缓存的历史字符串最大字符串长度
- <b>Level (Normal)</b>:处理等级，Normal为正常处理，更高的等级会省略不同的信息，以提高处理速度
- <b>Time Format String</b>:时间戳格式
- <b>With Periodic Info? (T)</b>:是否折叠周期性的log
- <b>Remove Immediately? (F)</b>:是否立即移除周期性的折叠信息
- <b>Reset?</b>:重置标志
- <b>Settings</b>:周期性的log配置信息，可以设置检测周期与周期性阈值，来判断是否折叠

-- <b>Indicators(输出控件)</b> --
- <b>String Cache</b>:缓存的历史字符串

### Auto Processing Level.vi

根据当前全局日志队列的日志数量，动态的推算推荐的日志处理等级。

-- <b>Controls(输入控件)</b> --
- <b>#Left In Q</b>:全局日志队列中剩余的日志数量
- <b>Debounce Period (5s)</b>:日志处理升级时间，在指定时间内全局日志失踪在增加，将提高处理等级
- <b>Period (0.1s)</b>:检测周期，默认100ms
- <b>Reset? (F)</b>:重置标志

-- <b>Controls(输入控件)</b> --
- <b>Level</b>:处理等级，Normal为正常处理，更高的等级会省略不同的信息，以提高处理速度
- <b>LogInQ Changing Speed (#/s)</b>:当前全局日志队列的日志变化速度
- <b>Since Upgraded (S)</b>:自从上次升级处理等级以来的时间

### String History Cacher.vi

保存当前输入的字符串到缓存，缓存的历史字符串，当超出最大长度限制时，最先进入的缓存字符串将被覆盖。用于调试CSM的历史状态。

-- <b>Controls(输入控件)</b> --
- <b>String</b>: 待缓存字符串
- <b>length</b>: 缓存的历史字符串最大字符串长度
- <b>Include Timestamp? (T)</b>: 是否在每行开头包含时间戳。
- <b>Format String</b>:时间戳的格式

-- <b>Indicators(输出控件)</b> --
- <b>String Cache</b>: 缓存的历史字符串

### Random Change Flag.vi

生成一个随机的数值，用于标记状态的变化，CSM中为了提高效率，有些地方的缓存(cache)利用这个标记来判断是否需要更新。

-- <b>Indicators(输出控件)</b> --
- <b>Random Change Flag</b>: 生成的随机数值

### State Triggered Reason.vi

从 `Parse State Queue++.vi` 的输出 Additional Information 和 Source CSM 推断出触发当前状态的原因。

结果可能是：
- LocalCall: 本地调用，非外部触发
- Message: 外部消息触发
- Broadcast: 由广播触发

-- <b>Controls(输入控件)</b> --
- <b>Additional Information</b>:此状态的额外信息
- <b>Source CSM</b>:源模块信息

-- <b>Indicators(输出控件)</b> --
- <b>Additional Information (dup)</b>:输入的额外信息副本
- <b>Source CSM (dup)</b>:输入的源模块信息副本
- <b>Reason</b>:触发当前状态的原因

### Format Timestamp.vi

格式化时间戳为指定的字符串格式, 此VI为CSM Global Log 中使用。

-- <b>Controls(输入控件)</b> --
- <b>Timestamp</b>:时间戳，单位为秒
- <b>Format String</b>:时间戳格式字符串，例如："%<%Y/%m/%d %H:%M:%S%3u>T"

-- <b>Indicators(输出控件)</b> --
- <b>String</b>:格式化后的时间戳字符串
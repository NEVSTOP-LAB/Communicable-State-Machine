# CSM API

## 工具VI(Utility VIs)

## 状态字符串操作

### CSM - Compact Multiple States.vi
将多个状态紧凑成单个字符串以供输入使用。

> - Ref: CSM 消息拼接API

-- <b>输入控件(Controls)</b> --
- <b>Multiple States</b>: CSM状态字符串数组。

-- <b>输出控件(Indicators)</b> --
- <b>States</b>: 包含多行CSM状态字符串的字符串。

### CSM - Break Down Multiple States String.vi
将包含多行CSM状态字符串的字符串切割成CSM状态字符串数组。

-- <b>输入控件(Controls)</b> --
- <b>States</b>: 包含多行CSM状态字符串的字符串。

-- <b>输出控件(Indicators)</b> --
- <b>Multiple States</b>: CSM状态字符串数组。

### CSM - Build Exit Messages of CSMs.vi
输入CSM模块名称，拼接生成退出消息(`Macro: Exit`)。

> - Ref: CSM 消息拼接API

-- <b>输入控件(Controls)</b> --
- <b>CSMs</b>: CSM模块名称数组。
- <b>State with Arguments("Macro: Exit")</b>: 退出消息。

-- <b>输出控件(Indicators)</b> --
- <b>States</b>: 拼接生成的CSM消息字符串。

### CSM - Filter Duplicate Messages By Name.vi
过滤重复的消息，只保留最新的消息。

> - Ref: CSM 的状态队列操作API

-- <b>输入控件(Controls)</b> --
- <b>States</b>: 输入的消息字符串。
- <b>Whole Messages in Check?(T)</b>: 是否检查整个消息字符串。如果是FALSE，则只检查消息名称。

-- <b>输出控件(Indicators)</b> --
- <b>Filtered States</b>: 过滤后的消息字符串。

### CSM - Remove Duplicated Following Messages.vi

> - Ref: CSM 的状态队列操作API

-- <b>输入控件(Controls)</b> --
- <b>Current State</b>:
- <b>Remaining States</b>:

-- <b>输出控件(Indicators)</b> --
- <b>Remaining States Left</b>:
- <b>Current State</b>: Controls
- <b>Remaining States Left</b>: Indicators

## 数据类型字符串描述

### CSM Data Type String.vi
获取输入数据对应的数据类型描述字符串，通常用在参数描述中，用于判断参数携带的参数类型。

-- <b>输入控件(Controls)</b> --
- <b>Data</b>: 输入数据。

-- <b>输出控件(Indicators)</b> --
- <b>Data Type String</b>: 数据类型描述字符串。

### CSM Data Type String to Enum.vi
从数据类型描述字符串中LabVIEW定义的数据类型枚举。

> [!NOTE]
> <b>多态VI(Polymorphic VI)选项</b>
> - CSM Data Type String to Enum(String).vi
> - CSM Data Type String to Enum(TypeEnum).vi
> - CSM Data Type String to Enum(RefnumEnum).vi

#### CSM Data Type String to Enum(String).vi
从数据类型描述字符串中LabVIEW定义的数据类型枚举，子类型使用字符串描述。

-- <b>输入控件(Controls)</b> --
- <b>Data Type String</b>: 输入的数据类型描述字符串。

-- <b>输出控件(Indicators)</b> --
- <b>Primary Type</b>: 数据类型枚举。
- <b>Secondary Type String</b>: 如果是复合的数据类型，返回子类型字符串，例如Array数据类型中的元素类型。
- <b>Array Dim</b>: 如果是数组数据类型，返回数组维度。

#### CSM Data Type String to Enum(TypeEnum).vi
从数据类型描述字符串中LabVIEW定义的数据类型枚举，并返回Array子类型使用枚举。

-- <b>输入控件(Controls)</b> --
- <b>Data Type String</b>: 输入的数据类型描述字符串。

-- <b>输出控件(Indicators)</b> --
- <b>Primary Type</b>: 数据类型枚举。
- <b>Secondary Type String</b>: Array子类型枚举。
- <b>Array Dim</b>: 如果是数组数据类型，返回数组维度。

#### CSM Data Type String to Enum(RefnumEnum).vi
从数据类型描述字符串中LabVIEW定义的数据类型枚举，并返回Refnum子类型使用枚举。

-- <b>输入控件(Controls)</b> --
- <b>Data Type String</b>: 输入的数据类型描述字符串。

-- <b>输出控件(Indicators)</b> --
- <b>Primary Type</b>: 数据类型枚举。
- <b>Secondary Type String</b>: Refnum子类型枚举。
- <b>Array Dim</b>: 如果是数组数据类型，返回数组维度。

## 其他工具VI

### uuid.vi
根据标准方法生成Universally Unique Identifier (UUID)。 例如:
- 59703F3AD837
- 106A470BA5EC
- 9B781DB313AF

-- <b>输出控件(Indicators)</b> --
- <b>UUID</b>: 生成的UUID。

### String History Cacher.vi
保存当前输入的字符串到缓存，缓存的历史字符串，当超出最大长度限制时，最先进入的缓存字符串将被覆盖。用于调试CSM的历史状态。

-- <b>输入控件(Controls)</b> --
- <b>String</b>: 待缓存字符串。
- <b>length</b>: 缓存的历史字符串最大字符串长度。
- <b>Include Timestamp? (T)</b>: 是否在每行开头包含时间戳。
- <b>Format String</b>: 时间戳的格式。

-- <b>输出控件(Indicators)</b> --
- <b>String Cache</b>: 缓存的历史字符串。

### Random Change Flag.vi
生成一个随机的数值，用于标记状态的变化，CSM中为了提高效率，有些地方的缓存(cache)利用这个标记来判断是否需要更新。

-- <b>输出控件(Indicators)</b> --
- <b>Random Change Flag</b>: 生成的随机数值。

### State Triggered Reason.vi
从Parse State Queue++ VI的输出<b>Additional Information</b>和<b>Source CSM</b>推断出触发当前状态的原因。

结果可能是:
- <b>LocalCall</b>: 本地调用，非外部触发
- <b>Message</b>: 外部消息触发
- <b>Broadcast</b>: 由广播触发

-- <b>输入控件(Controls)</b> --
- <b>Additional Information</b>: 此状态的额外信息。
- <b>Source CSM</b>: 源模块信息。

-- <b>输出控件(Indicators)</b> --
- <b>Additional Information (dup)</b>: 输入的额外信息副本。
- <b>Source CSM (dup)</b>: 输入的源模块信息副本。
- <b>Reason</b>: 触发当前状态的原因。

### Format Timestamp.vi
格式化时间戳为指定的字符串格式, 此VI为CSM Global Log中使用。

-- <b>输入控件(Controls)</b> --
- <b>Timestamp</b>: 时间戳，单位为秒。
- <b>Format String</b>: 时间戳格式字符串，例如: `%<%Y/%m/%d %H:%M:%S%3u>T`。

-- <b>输出控件(Indicators)</b> --
- <b>String</b>: 格式化后的时间戳字符串。

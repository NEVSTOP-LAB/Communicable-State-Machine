# CSM API

## 工具VI(Utility VIs)

### CSM - Compact Multiple States.vi

将多个状态紧凑成单个字符串以供输入使用

-- <b>输入控件</b> --
- <b>Multiple States</b>: CSM状态字符串数组

-- <b>输出控件</b> --
- <b>States</b>: 包含多行CSM状态字符串的字符串

### CSM - Break Down Multiple States String.vi

将包含多行CSM状态字符串的字符串切割成CSM状态字符串数组

-- <b>输入控件</b> --
- <b>States</b>: 包含多行CSM状态字符串的字符串

-- <b>输出控件</b> --
- <b>Multiple States</b>: CSM状态字符串数组

### CSM - Build Exit Messages of CSMs.vi

输入CSM模块名称，拼接生成退出消息("Macro: Exit")。

> Ref: 消息拼接API

-- <b>输入控件</b> --
- <b>CSMs</b>: CSM模块名称数组
- <b>State with Arguments("Macro: Exit“)</b>: 退出消息

-- <b>输出控件</b> --
- <b>States</b>: 拼接生成的CSM消息字符串

### CSM - Filter Duplicate Messages By Name.vi

过滤重复的消息，只保留最新的消息。

> Ref: 消息拼接API

-- <b>输入控件</b> --
- <b>States</b>: 输入的消息字符串
- <b>Whole Messages in Check?(T)</b>: 是否检查整个消息字符串。如果是 FALSE，则只检查消息名称。

-- <b>输出控件</b> --
- <b>Filtered States</b>: 过滤后的消息字符串

### CSM - Filter Messages to Non-Existing Modules.vi

过滤发送给不存在的模块的消息。
这个VI中会使用 CSM - List Modules.vi 获取所有活动的CSM模块，然后过滤掉发送给不存在模块的消息。

-- <b>输入控件</b> --
- <b>States</b>: 输入的消息字符串

-- <b>输出控件</b> --
- <b>Filtered States</b>: 过滤后的消息字符串

### CSM - Remove Duplicated Following Messages.vi

-- <b>输入控件</b> --
- <b>Current State</b>:
- <b>Remaining States</b>:

-- <b>输出控件</b> --
- <b>Remaining States Left</b>:

### CSM Data Type String to Enum.vi

### CSM Data Type String.vi

-- <b>输入控件</b> --
- <b>Data</b>:

-- <b>输出控件</b> --
- <b>Data Type String</b>:

### Replace Tag with Array.vi

-- <b>输入控件</b> --
- <b>Enum</b>:
- <b>replace string</b>:
- <b>single-line text</b>:

-- <b>输出控件</b> --
- <b>States</b>:

### CSM Data Type String to Enum(RefnumEnum).vi

-- <b>输入控件</b> --
- <b>Data Type String</b>:

-- <b>输出控件</b> --
- <b>Array Dim</b>:
- <b>Secondary Type</b>:
- <b>Primary Type</b>:

### CSM Data Type String to Enum(String).vi

-- <b>输入控件</b> --
- <b>Data Type String</b>:

-- <b>输出控件</b> --
- <b>Array Dim</b>:
- <b>Secondary Type String</b>:
- <b>Primary Type</b>:

### CSM Data Type String to Enum(TypeEnum).vi

-- <b>输入控件</b> --
- <b>Data Type String</b>:

-- <b>输出控件</b> --
- <b>Array Dim</b>:
- <b>Secondary Type</b>:
- <b>Primary Type</b>:

### Build Error Cluster.vi

创建一个错误簇(error cluster)，以标准 LabVIEW 的方式从调用 VI 的调用链中构建源字符串。构建的源字符串形式为：
"<B>调用的 VI</B> 在 <B>调用 VI 的调用者</B>-><B>调用 VI 的调用者的调用者</B>->等等...->等等..."
可选的 'String to Prepend to source ("")' 字符串输入可用于在源字符串中添加额外的描述信息。如果存在这个字符串，它将用括号括起来，并添加到源字符串之前。

-- <b>输入控件</b> --
- <b>code</b>: 错误码
- <b>String to Prepend to source ("")</b>: 错误信息字符串

### Build Internal State String.vi

构建包含 JKI 状态机状态、参数等信息的字符串。

-- <b>输入控件</b> --s
- <b>State</b>: 状态字符串
- <b>Arguments ("")</b>: <b>State</b>的参数
- <b>Arg-State ("")</b>: 发送此消息的模块在发送此消息时处于的状态
- <b>Source ("")</b>: 发送此消息的模块名称

-- <b>输出控件</b> --
- <b>CSM Message String</b>: 拼接生成的 CSM 消息字符串

### String History Cacher.vi

保存当前输入的字符串到缓存，缓存的历史字符串，当超出最大长度限制时，最先进入的缓存字符串将被覆盖。用于调试CSM的历史状态。

-- <b>输入控件</b> --
- <b>String</b>: 待缓存字符串
- <b>length</b>: 缓存的历史字符串最大字符串长度
- <b>Include Timestamp(F)</b>: 是否在每行开头包含时间戳。

-- <b>输出控件</b> --
- <b>String Cache</b>: 缓存的历史字符串

### Trim Both Whitespace.vi

开头、结尾或两者同时移除所有 ASCII 空白字符(空格、制表符、回车和换行)。

-- <b>输入控件</b> --
- <b>string</b>: 待处理字符串

-- <b>输出控件</b> --
- <b>trimmed string</b>: 处理后的字符串

### uuid.vi

根据标准方法生成 <b>Universally Unique Identifier(UUID)</b>。 例如:
- 59703F3AD837
- 106A470BA5EC
- 9B781DB313AF

-- <b>输出控件</b> --
- <b>UUID</b>: 生成的 UUID

### Random Change Flag.vi

生成一个随机的数值，用于标记状态的变化，CSM中为了提高效率，有些地方的缓存(cache)利用这个标记来判断是否需要更新。

-- <b>输出控件</b> --
- <b>Random Change Flag</b>: 生成的随机数值

### Global Log To String.vi

全局日志(Global Log)数据簇转换为字符串。

-- <b>输入控件</b> --
- <b>Log</b>: 全局日志数据簇

-- <b>输出控件</b> --
- <b>Log String</b>: 全局日志字符串

### U8 Data to Hex Str.vi

-- <b>输入控件</b> --
- <b>u8 Data[]</b>:

-- <b>输出控件</b> --
- <b>HEX String (0-9,A-F)</b>:

# CSM API

## 管理接口(Management API)

> [!NOTE] CSM 工作模式
> 1. Stand-alone: 独立工作模式。不输入模块名称，将自动生成一个随机ID, 用于标识模块。
> 2. CSM: 普通 CSM 模块。
> 3. Action Worker: 工作者模式。在模块名称后添加“#”，以标记此模块为工作者，其与具有相同名称的其他工作者共享相同的消息队列。
> 4. Chain Node: 链式节点。在模块名称后添加“$”，以标记此模块为链式节点，同一个链上的消息，将依次传递，直到某个节点处理消息。

### CSM - Start Async Call.vi

异步调用模板代码的VI片段

### CSM - Synchronized Call.vi

同步调用模板代码的VI片段

### CSM - Module VI Reference.vi

通过 发送 "VI Reference" 同步消息，查询获取 CSM 模块的 VI 引用。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称
- <b>Current Module("" to generate a ID)</b>: 查询CSM模块的标记, 为空时，将生成一个唯一的ID
- <b>Response Timeout(5000ms)</b>: 同步消息超时时间，默认 5000 ms

-- <b>输出控件</b> --
- <b>CSM Module VIRef</b>: CSM 模块的 VI 引用

### CSM - Check If Module Exists.vi

检查 CSM 模块是否存在

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称

-- <b>输出控件</b> --
- <b>Exist?</b>: 返回模式是否存在
- <b>CSM Name(dup)</b>: 返回 <b>CSM Name</b>

### CSM - List Modules.vi

列出所有活动的CSM模块。

> Ref: CSM 工作模式

-- <b>输入控件</b> --
- <b>Exclude Standalone CSM(T)</b>: 是否包含独立工作模式的模块

-- <b>输出控件</b> --
- <b>Module Names</b>: CSM 模块名称列表

### CSM - Module Status.vi

获取CSM模块的状态，包括：工作模式、工作者数量、消息队列中的待处理消息个数。

> Ref: CSM 工作模式

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称.

-- <b>输出控件</b> --
- <b>Mode</b>: 返回模块的工作模式
- <b>#As Worker</b>: 工作者模式下，此模块的工作者数量
- <b>#msg to be processed</b>: CSM消息队列中的待处理消息个数
- <b>CSM Name(dup)</b>: 返回 <b>CSM Name</b>

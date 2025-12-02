# CSM API

## 管理接口(Management API)

>[!NOTE] CSM 运行的模式


> [!NOTE] CSM 工作模式
> 1. Stand-alone: 独立工作模式。不输入模块名称，将自动生成一个随机ID, 用于标识模块。
> 2. CSM: 普通 CSM 模块。
> 3. Action Worker: 工作者模式。在模块名称后添加“#”，以标记此模块为工作者，其与具有相同名称的其他工作者共享相同的消息队列。
> 4. Chain Node: 链式节点。在模块名称后添加“$”，以标记此模块为链式节点，同一个链上的消息，将依次传递，直到某个节点处理消息。

### CSM - Check If Module Exists.vi

检查 CSM 模块是否存在。当 CSM 模块运行在工作者模式或责任链模式下，当组成模块的所有节点退出后，模块才会被标记为不存在。

-- <b>Controls(输入控件)</b> --
- <b>CSM Name</b>: CSM 模块名称

-- <b>Indicators(输出控件)</b> --
- <b>Exist?</b>: 返回模式是否存在
- <b>CSM Name (dup)</b>: 输入的CSM模块名称副本

### CSM - List Modules.vi

列出所有活动的CSM模块。

> Ref: CSM 工作模式

-- <b>Controls(输入控件)</b> --
- <b>Exclude Standalone CSM(T)</b>: 是否包含独立工作模式的模块
- <b>Scope (Normal)</b>:Controls
- <b>With Instance? (F)</b>:Controls

-- <b>Indicators(输出控件)</b> --
- <b>Module Names</b>: CSM 模块名称列表

### CSM - Module VI Reference.vi

通过 发送 "VI Reference" 同步消息，查询获取 CSM 模块的 VI 引用。

-- <b>Controls(输入控件)</b> --
- <b>CSM Name</b>: CSM 模块名称
- <b>Current Module("" to generate a ID)</b>: 查询CSM模块的标记, 为空时，将生成一个唯一的ID
- <b>Response Timeout (-2 Using Global Settings)</b>: 同步调用的超时时间，默认为-2，使用全局设置。你可以通过"CSM - Set TMO of Sync-Reply.vi" 设置全局超时时间。
- <b>Force? (F)</b>:Controls

-- <b>Indicators(输出控件)</b> --
- <b>CSM Module VIRef</b>: CSM 模块的 VI 引用
- <b>Current Module ("" to Generate an ID)</b>:Controls



### CSM - Module Status.vi

获取CSM模块的状态，包括：工作模式、工作者数量、消息队列中的待处理消息个数。

> Ref: CSM 工作模式

-- <b>Controls(输入控件)</b> --
- <b>CSM Name</b>: CSM 模块名称.

-- <b>Indicators(输出控件)</b> --
- <b>Mode</b>: 返回模块的工作模式
- <b>#As Worker</b>: 工作者模式下，此模块的工作者数量
- <b>#msg to be processed</b>: CSM消息队列中的待处理消息个数
- <b>CSM Name (dup)</b>: 返回 <b>CSM Name</b>
- <b>#Elements In Queue</b>:Indicators
- <b>#Instance</b>:Indicators

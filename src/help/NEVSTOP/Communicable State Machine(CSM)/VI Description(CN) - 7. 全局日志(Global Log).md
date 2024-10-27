# CSM API

## 全局日志(Global Log)

> [!NOTE] CSM 全局日志功能
> CSM 全局日志功能，用于记录全局状态更改事件，用于调试、监控等场景。
>
> 可以记录的信息包括：
> 1. CSM 状态机的状态修改
> 2. CSM 模块间的消息通讯，包括数据返回
> 3. CSM 模块的状态发布
> 4. CSM 模块的创建和销毁
> 5. CSM 模块的状态订阅和取消订阅
> 6. CSM 模块处理的错误信息
> 7. 用户自定义事件
>
> 调试工具主要基于全局日志功能API进行开发，用户可以根据自己的需要，开发调试工具。

### CSM - Global Log Event.vi

获取 CSM 全局状态用户事件句柄

> Ref: CSM 全局日志功能

-- <b>输出控件</b> --
- <b>CSM Global Log Event</b>: CSM 全局状态用户事件句柄

### CSM - Destroy Global Log Event.vi

释放 CSM 全局状态用户事件句柄

> Ref: CSM 全局日志功能

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>: CSM 全局状态用户事件句柄

### CSM - Generate User Global Log.vi

生成用户全局事件，用途调试等场景。

-- <b>输入控件</b> --
- <b>Log</b>: 事件名称
- <b>Arguments</b>: 事件参数
- <b>From Who</b>: 来源
- <b>ModuleName</b>: 模块名称

### CSM - Global Log Error Handler.vi

CSM 错误处理函数。如果发生错误，错误信息将通过 CSM Global log 发布，在调试工具、后台 log 记录中都能记录。

-- <b>输入控件</b> --
- <b>Place("" to use VI's Name)</b>: 标记发生错误的地点
- <b>Clear Error(T)</b>: 是否清除错误，默认清除

### CSM - Set Log Filter Rules.vi

设置全局的过滤规则。这个规则应用在发送源头，当 log 满足过滤规则时，将不会在源头被发送，因此任何工具也将不能再检测到这个 log 记录。

### CSM - List Log Filter Rules As Strings.vi

列出全局的过滤规则。

-- <b>输出控件</b> --
- <b>Rule Strings</b>: 过滤规则字符串

### CSM - Convert Filter Rules.vi

将过滤规则簇列表转换为过滤规则类实例。

### CSM - Filter Global Log.vi

根据规则判断是否log被过滤。这个VI 的过滤判断发生在订阅端，因此不会影响其他工具的订阅。

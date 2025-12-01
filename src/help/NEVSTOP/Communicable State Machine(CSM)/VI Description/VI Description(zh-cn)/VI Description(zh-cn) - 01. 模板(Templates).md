# CSM API

## 模板(Templates)

> [!NOTE] CSM Name 规则
> - CSM 模块名称应该是唯一的，否则会导致 CSM 进入 "Critical Error" 状态。
> - 如果输入为 ""，将使用 UUID 作为模块名称。该模块被标记为独立模式，不会包含在模块列表中。
> - 如果输入以 '#' 结尾，则该模块将在工作模式下运行。具有相同名称的模块将共享同一消息队列。任何外部消息将由其中一个模块处理，取决于哪个模块空闲。

> [!NOTE] CSM 初始化状态
> - 默认值和 JKISM 状态机保持一致, 是 "Macro: Initialize"。
> - 通常不会修改此状态，作为输入的目的是为了方便外部程序化修改初始化状态。

### CSM Module Template.vi

用于创建具有无用户界面的 CSM 模块的模板

> Ref: CSM Name 规则
> Ref: CSM 初始化状态

-- <b>输入控件</b> --
- <b>Name("" to use uuid)</b>: CSM 模块名称
- <b>Init State("Macro: Initialize")</b>: CSM 初始化状态, 默认为 "Macro: Initialize"

### CSM User Interface(UI) Module Template.vi

用于创建具有用户界面的 CSM 模块的模板，模板中包含用户事件结构用于响应用户操作。

> Ref: CSM Name 规则
> Ref: CSM 初始化状态

-- <b>输入控件</b> --
- <b>Name("" to use uuid)</b>: CSM 模块名称
- <b>Init State("Macro: Initialize")</b>: CSM 初始化状态, 默认为 "Macro: Initialize"

### CSM Module Template - Tiny.vi

用于创建具有无用户界面的 CSM 模块的模板。此模板的代码比较紧凑。

> Ref: CSM Name 规则
> Ref: CSM 初始化状态

-- <b>输入控件</b> --
- <b>Name("" to use uuid)</b>: CSM 模块名称
- <b>Init State("Macro: Initialize")</b>: CSM 初始化状态, 默认为 "Macro: Initialize"

### CSM User Interface(UI) Module Template - Tiny.vi

用于创建具有用户界面的 CSM 模块的模板，模板中包含用户事件结构用于响应用户操作。此模板的代码比较紧凑。

> Ref: CSM Name 规则
> Ref: CSM 初始化状态

-- <b>输入控件</b> --
- <b>Name("" to use uuid)</b>: CSM 模块名称
- <b>Init State("Macro: Initialize")</b>: CSM 初始化状态, 默认为 "Macro: Initialize"

### 模板支持

#### CSM - Get New State Notifier Event.vi

获取用户事件句柄。用在包含事件结构的 CSM 模块中。包含事件结构的 CSM 模块，通常都在事件结构处等待，这个事件用于收到新的消息时中断在事件结构中的等待，继续执行。

-- <b>输入控件</b> --
- <b>Name("" to use uuid) in</b>: CSM 模块名称

-- <b>输出控件</b> --
- <b>New State Notifier Event</b>: 用户事件句柄，用来当收到消息时，使用CSM模块中断在事件结构中的等待

#### Timeout Selector.vi

用于包含用户事件结构的模板中

-- <b>输入控件</b> --
- <b>Timeout Expected</b>: 预期的超时设置
- <b>Remaining States</b>: 如果还有剩余的状态，输出将为 0，否则输出为预期值

-- <b>输出控件</b> --
- <b>Timeout</b>: 仲裁后使用的超时设置

#### 模板错误处理

##### CSM Critical Error.vi

生成 CSM 模块的严重错误消息，通常是由于模块名称重复导致的。

-- <b>输入控件</b> --
- <b>Arguments(as Reason)</b>: 错误原因
- <b>CSM Name</b>: CSM 模块名称

##### CSM No Target Error.vi

当必须要输入 CSM 模块名称但输入了空字符串时，生成 CSM 模块的目标模块不存在错误消息。

##### CSM Target Error.vi

生成 CSM 模块的消息目标模块不存在错误消息。

-- <b>输入控件</b> --
- <b>Arguments(as CSM Name)</b>: 连接参数，传递的内容是目标模块名称

##### CSM Target Timeout Error.vi

生成 CSM 模块的消息目标模块超时错误消息。

-- <b>输入控件</b> --
- <b>Arguments(as CSM Name)</b>: 连接参数，传递的内容是目标模块名称

##### CSM Unhandled State Error.vi

生成 CSM 模块的未处理状态错误消息。可能的情况：
- 内部消息轮转中使用了本模块未定义的状态时报错(和 JKISM 行为一致)
- 收到外部发送本模块未定义的状态时报错

-- <b>输入控件</b> --
- <b>Undefined State</b>: 未定义的状态
- <b>CSM Name</b>: CSM 模块名称


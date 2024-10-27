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

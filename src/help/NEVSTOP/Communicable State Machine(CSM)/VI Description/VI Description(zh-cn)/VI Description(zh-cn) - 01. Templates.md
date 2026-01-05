# 模板

> [!NOTE]
> <b>CSM名称规则</b>
>
> - CSM模块名称必须唯一，否则将导致CSM进入`Critical Error`状态。
> - 若输入为空字符串("")，系统将使用UUID作为模块名称。该模块会被标记为独立模式，不会包含在模块列表中。
> - 协作者模式规则：若输入以`#`结尾，则会实例化一个协作者模式节点，多个节点可共同组成一个协作者模式模块。
> - 责任链模式规则：若输入以`$`加数字结尾，则会实例化一个责任链模式节点，多个节点可共同组成一个责任链模式模块。
> - 系统级模块规则：若输入以`.`开头，则该模块为系统级模块。在默认参数下，此类模块不会被CSM - List Modules VI列出，适用于实例化后台运行的模块。
> - 子模块规则：`.`也允许出现在名称之中，将模块名称分为多个部分，每个部分之间用`.`分隔。CSM中并没有严格意义上的子模块，仅通过模块名称中的`.`来标记不同模块的逻辑关系，从实际运行角度来看认为是独立的模块。唯一区别在于可以通过CSM - List Submodules VI，获取逻辑上的子模块列表。

> [!NOTE]
> <b>CSM初始化状态("Macro：Initialize")</b>
>
> - 默认值与JKISM状态机保持一致，为`Macro：Initialize`。
> - 该状态用于初始化CSM模块的状态机，CSM模块仅在完成该宏状态后，才会处理外部发送的消息。

> [!NOTE]
> <b>CSM退出状态("Macro：Exit")</b>
>
> - 默认值与JKISM状态机保持一致，为"Macro：Exit"。
> - 该状态用于退出CSM模块的状态机，CSM模块进入该状态后，将不会再处理外部发送的消息。

## CSM User Interface(UI) Module Template.vi
用于创建带用户界面的CSM模块的模板，该模板包含用于响应用户操作的用户事件结构。

> - Ref: CSM名称规则
> - Ref: CSM初始化状态
> - Ref: CSM退出状态

-- <b>输入控件(Controls)</b> --
- <b>Name ("" to use UUID)</b>：CSM模块名称。请参考<b>CSM名称规则</b>。

## CSM Module Template.vi
用于创建无用户界面的CSM模块的模板, 这个模板是最常使用的CSM模板，在模板中还包含了一个用于调试中退出模块的事件响应循环，请在模块调试完成后，将其删除。

> - Ref: CSM名称规则
> - Ref: CSM初始化状态
> - Ref: CSM退出状态

-- <b>输入控件(Controls)</b> --
- <b>Name ("" to use UUID)</b>：CSM模块名称。请参考<b>CSM名称规则</b>。

## CSM Module Template - Tiny.vi
用于创建无用户界面的CSM模块的紧凑代码模板。该模板功能与CSM Module Template VI完全相同，区别仅在于代码更加紧凑。

> - Ref: CSM名称规则
> - Ref: CSM初始化状态
> - Ref: CSM退出状态

-- <b>输入控件(Controls)</b> --
- <b>Name ("" to use UUID)</b>：CSM模块名称。请参考<b>CSM名称规则</b>。

## CSM User Interface(UI) Module Template - Tiny.vi
用于创建带用户界面的CSM模块的紧凑代码模板，该模板包含用于响应用户操作的用户事件结构。该模板功能与CSM User Interface(UI) Module Template VI完全相同，区别仅在于代码更加紧凑.

> - Ref: CSM名称规则
> - Ref: CSM初始化状态
> - Ref: CSM退出状态

-- <b>输入控件(Controls)</b> --
- <b>Name ("" to use UUID)</b>：CSM模块名称。请参考<b>CSM名称规则</b>。

## CSM DQMH-Style Template.vi
用于创建一个DQMH风格的CSM模块模板，该结构将响应用户操作的用户事件结构外置在独立的循环中，主要用于处理一些复杂的用户操作场景。例如:
- 用户界面操作非常复杂，需要组合逻辑完成协同工作，例如鼠标按下拖动并释放后触发某事件。
- 用户界面需要响应会快速产生的事件，如鼠标移动、窗口大小调整等。这些事件中如果生成消息，会迅速产生多条重复消息。

用户操作的用户事件结构循环通过CSM - Flood of Events Handler Side Loop VI模板创建。用户也可以通过组合CSM - Flood of Events Handler Side Loop VI与CSM Module Template VI来创建完整的DQMH风格的CSM模块模板。

<b>参考范例</b>：`[CSM-Example]\4. Advance Examples\CSMLS - Continuous Loop in CSM Example.vi`。

> - Ref: CSM名称规则
> - Ref: CSM初始化状态
> - Ref: CSM退出状态

-- <b>输入控件(Controls)</b> --
- <b>Name ("" to use UUID)</b>：CSM模块名称。请参考<b>CSM名称规则</b>。

## 其他代码片段

### CSM - Start Async Call.vi
异步启动CSM模块的代码片段。拖至程序框图后，请将VI静态引用改为目标CSM模块。

<b>参考范例</b>：`[CSM-Example]\3. Caller is Other Framework Scenario\CSM Example - Caller is NOT a CSM.vi`。

### CSM - Synchronized Call.vi
同步调用CSM模块的代码片段。实质上是把CSM模块当作子VI直接调用。

<b>参考范例</b>：`[CSM-Example]\2. Caller is CSM Scenario\CSM Example - Caller is a CSM.vi`。

### CSM - Flood of Events Handler Side Loop.vi
该模板是DQMH风格的CSM模块的用户事件结构循环模板，主要用于处理用户界面操作非常复杂，需要组合逻辑完成协同工作的场景。

<b>参考范例</b>：`[CSM-Example]\4. Advance Examples\CSMLS - Continuous Loop in CSM Example.vi`。

### CSM - Global Log Queue Monitoring Loop.vi
此模板用于创建一个全局日志队列监控循环，用于查询监控全局日志队列中的消息。

<b>参考范例</b>：`[CSM-Example]\4. Advance Examples\2. Chain of Responsibility Example\Chain of Responsibility Example.vi`。

### CSM - Global Log Event Monitoring Loop.vi
此模板用于创建一个全局日志事件监控循环，用于查询监控全局日志队列中的消息。

<b>参考范例</b>：`[CSM-Example]\4. Advance Examples\4. Global Log Filter Example\`中的任一范例。

## 模板支持

### CSM - Get New State Notifier Event.vi
获取用户事件句柄，适用于包含事件结构的CSM模块。包含事件结构的CSM模块通常会在事件结构处等待，此事件用于在收到新消息时中断事件结构中的等待，使模块继续执行。

-- <b>输入控件(Controls)</b> --
- <b>Name ("" to use UUID)</b>：CSM模块名称。请参考<b>CSM名称规则</b>。

-- <b>输出控件(Indicators)</b> --
- <b>New State Notifier Event</b>：用户事件句柄，用于在收到消息时中断CSM模块在事件结构中的等待。

### Timeout Selector.vi
适用于包含用户事件结构的模板, 如果超时为-1时，<b>Remaining States</b>中依然还有剩余状态，那么超时值将被修改为0，以保证立刻跳出用户事件结构(user event structure)，并继续处理剩余状态。

-- <b>输入控件(Controls)</b> --
- <b>Timeout Expected</b>：预期的超时设置。
- <b>Remaining States</b>：若还有剩余状态，则输出为0；否则输出为预期值。

-- <b>输出控件(Indicators)</b> --
- <b>Timeout</b>：仲裁后使用的超时设置。

### 模板错误处理

#### CSM Critical Error.vi
生成CSM严重错误描述的错误簇。严重错误为CSM框架发生的严重错误消息，无法有用户代码处理回复，常见原因是模块名称重复。

-- <b>输入控件(Controls)</b> --
- <b>CSM Name</b>：CSM模块名称。
- <b>Arguments (As Reason)</b>：错误原因。

#### CSM No Target Error.vi
生成CSM无目标消息错误描述的错误簇。无目标消息错误发生在CSM尝试发送一个消息，但目标模块名称为空字符串。

#### CSM Target Error.vi
生成CSM消息目标模块不存在的错误描述的错误簇。目标模块不存在错误发生在CSM尝试发送一个消息到一个不存在的目标模块时。

-- <b>输入控件(Controls)</b> --
- <b>Arguments (As CSM Name)</b>：连接参数，传递目标模块名称。

#### CSM Target Timeout Error.vi
生成CSM消息目标模块超时的错误描述的错误簇。目标模块超时错误发生在CSM尝试发送一个同步消息到一个目标模块，但在指定的超时时间内未收到回复时。

-- <b>输入控件(Controls)</b> --
- <b>Arguments (As CSM Name)</b>：连接参数，传递目标模块名称。

#### CSM Unhandled State Error.vi
生成 CSM 未处理状态的错误描述的错误簇。CSM未处理状态的错误可能的情况包括：
- 内部消息轮转中使用了本模块未定义的状态时(与JKISM行为一致)。
- 收到外部发送至本模块的消息未定义时。

-- <b>输入控件(Controls)</b> --
- <b>Undefined State</b>：未定义的状态。
- <b>CSM Name</b>：CSM模块名称。

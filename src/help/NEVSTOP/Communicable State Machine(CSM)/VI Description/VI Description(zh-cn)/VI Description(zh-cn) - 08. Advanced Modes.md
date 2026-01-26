# 高级模式

> [!NOTE]
> <b>名称拼接API</b>
>
> 这个VI只操作了模块名称字符串，并没有实际功能，当熟悉CSM规则后，可以直接输入对应的名称字符串和规则符号，不是必须调用此API。

## 系统级模块 (System-Level Module API)

> [!NOTE]
> <b>CSM系统级模块</b>
>
> 系统级模块的其他CSM功能，均与普通模块相同，和普通模块唯一的区别，在于默认的CSM - List Modules VI不会列出系统级模块。因此它通常用于实现一些后台运行的功能模块，而在统一处理普通模块操作逻辑时，可以避免对这些后台运行逻辑的干扰。
>
> CSM系统级模块通常以`.`开头，例如: `.MainApp`、`.BackgroundTask`等，`.`是名称的一部分，消息发送、订阅等操作需要的名称也要包含`.`。例如：您可以将主程序循环命名为`.MainApp`，就可以通过CSM - List Modules VI来获取所有普通模块的列表，而不会列出`.MainApp`，如果主程序需要退出其他全部模块，就可以发送`Macro: Exit`给CSM - List Modules VI的结果，这样就可以退出所有普通模块，而不会影响系统级模块的运行。
>
> 协作者模式、责任链模式的CSM模块名称，也可以以`.`开头，作为系统级模块运行。

### CSM - Mark As System-Level Module.vi
在输入字符串前添加`.`，即可将此模块标记为系统级模块，例如输入为`UIModule`，输出为`.UIModule`。

<b>参考范例</b>:  `0. Base Concepts\7. System-Level Module.vi`。

> - Ref: 名称拼接API
> - Ref: CSM系统级模块

-- <b>输入控件(Controls)</b> --
- <b>CSM Name</b>: CSM模块名称。

-- <b>输出控件(Indicators)</b> --
- <b>CSM Name (Marked As System-Level Module)</b>: 添加`.`标记的CSM模块名称。

## 子模块

> [!NOTE]
> <b>CSM子模块</b>
>
> CSM中并没有严格意义上的子模块，仅通过模块名称中的`.`来标记不同模块的逻辑关系，从实际运行角度来看，每个模块都是独立且没有层级关系的。
> 例如:
> 模块`ModuleA`和`ModuleA.SubmoduleB`是两个不同的模块，从代码逻辑上看，它们是完全独立的，互不干扰。
> 但可以通过CSM - List Submodules VI来获取模块`ModuleA`的所有逻辑上的子模块，包括`ModuleA.SubmoduleB`。
>
> 需要注意的是，ModuleA也可以不实际存在，仅作为逻辑分组，例如:
> 模块Group.SubModuleA和Group.SubModuleB是两个不同的模块，从代码逻辑上看，它们是完全独立的，互不干扰。
> 但可以通过CSM - List Submodules VI来获取`Group`的所有逻辑上的子模块，包括`Group.SubModuleA`和`Group.SubModuleB`。
>
> 协作者模式、责任链模式的CSM模块名称, 也可以包含`.`, 因为只是逻辑分组，不影响模块的运行。

### Concatenate Submodule Name.vi
拼接生成子模块名。

-- <b>输入控件(Controls)</b> --
- <b>CSM Name</b>: CSM模块名称。
- <b>Name</b>: 要拼接的名称。

-- <b>输出控件(Indicators)</b> --
- <b>Submodule Name</b>: 拼接生成的子模块名。

## 工作者模式 (Work Mode API)
> [!NOTE]
> <b>CSM工作者模式(Worker Mode)</b>
>
> 一个CSM模块，通过实例化多个实例，申请的名称后添加`#`，并共享相同的消息队列，实现工作者模式。
> - 从外部调用上看，这些实例一起组成了一个复合的模块，命名为Worker Agent。
> - 每一个实例，命名为Worker。
>
> <b>行为</b>:
> 外部调用者可以认为Worker Agent就是一个CSM模块，可以进行消息通讯、状态注册等操作。从内部看，空闲的Worker会从Worker Agent消息队列中取出消息，处理消息。因此，工作者模式能够实现一个CSM模块的并发消息处理。
>
> <b>举例</b>:
>
>       //申请模块名称为module#，module是Worker Agent名称，实例化2个实例，这2个实例的名字可能为:
>       // - module#59703F3AD837
>       // - module#106A470BA5EC
>       // 不能直接和Worker进行通讯，需要和Worker Agent通讯，例如:
>       csm message >> arguments -@ module //同步消息，空闲的Worker将处理此消息。
>       csm message >> arguments -> module //同步消息，空闲的Worker将处理此消息。
>
> 应用场景:
> - 10086接线员的场景
> - 下载器并发下载的场景
> - 编译器并发编译的场景
> - TCP Server处理多个Client连接

### CSM - Mark As Worker Module.vi
在CSM名称后添加`#`，以标记此模块为协作者模式模块。

<b>参考范例</b>:  `4. Advance Examples\1. Action Workers Example`。

> - Ref: 名称拼接API
> - Ref: CSM工作者模式(Worker Mode)

-- <b>输入控件(Controls)</b> --
- <b>CSM Name</b>: CSM模块名称。

-- <b>输出控件(Indicators)</b> --
- <b>CSM Name (Marked As Worker)</b>: 添加`#`标记的CSM模块名称。

## 责任链模式 (Chain of Responsibility API) - 待完善

> [!NOTE]
> <b>CSM责任链模式(Chain of Responsibility Mode)</b>
>
> 多个CSM模块，申请的名称后添加`$`，组成处理事务的一个链条，通过责任链模式形成一个完整的模块。
> - 从外部调用上看，这些实例一起组成了一个复合的模块，命名为Chain。
> - 每一个实例，命名为Chain Node。
>
> <b>行为</b>:
> 外部调用者可以认为Chain就是一个CSM模块，可以进行消息通讯、状态注册等操作。从内部看，nodes会根据排列顺序依次尝试处理消息，当node具有当前消息处理的能力时，消息被处理，不再向后传递。
>
> <b>举例</b>:
>
>     //申请模块名称为module$, module是chain名称，实例化4个实例，这四个实例的名字可能为:
>     // - module$1
>     // - module$2
>     // - module$3
>     // - module$4
>     // 组成的Chain顺序为module$1(head) >> module$2 >> module$3 >> module$4(tail)
>     // 假设module$3 module$4能够处理"csm message"
>     csm message >> arguments -@ module
>     // 这个消息将被module$3处理, module$4不会响应
>
> <b>应用场景</b>:
> - 权限审批过程，按照职位层级，具有某职能权限的人员，就可以直接审批，无需继续传递。
> - 功能拼接，不同模块实现不同的任务，通过拼接可以完成不同功能合集的组合。
> - 功能覆盖，通过覆盖实现OOP中的重载。
> - 工作者模式的场景，通常不适合具有界面操作。

### CSM - Mark As Chain Module.vi

拼接责任链模式模块的名称，使用`$`作为分隔符。注意Order不必连续，但是必须唯一，编号小的节点，将排列在责任链的前面。

<b>参考范例</b>:  `4. Advance Examples\2. Chain of Responsibility Example`。

> - Ref: CSM责任链模式(Chain of Responsibility Mode)
> - Ref: 名称拼接API

-- <b>输入控件(Controls)</b> --
- <b>CSM Name</b>:  CSM模块名称。
- <b>Order</b>: 责任链模式下的顺序，编号小的节点，将排列在责任链的前面。

-- <b>输出控件(Indicators)</b> --
- <b>CSM Name (Marked As Chain)</b>: 添加`$`标记的CSM模块名称。

### CSM - Resolve Node Module.vi
通过将高级模式的节点名称解析出对应的CSM模块名称。

例如:
- 工作者模式节点的名称为`module#59703F3AD837`，得到的结果是`module`。
- 责任链模式节点的名称为`module$1`，得到的结果是`module`。

-- <b>输入控件(Controls)</b> --
- <b>CSM Module Name</b>: CSM模块名称。
- <b>Node Name</b>: 节点名称。

## 多循环模式支持(Multi-Loop Support)

> [!NOTE]
> <b>CSM多循环模式(Multi-Loop Mode)</b>
>
> 在有些场景下，适合使用多个循环构成同一个CSM模块，例如:
> - 一段已有的功能代码上改造为CSM模块，例如TCP连接循环、DAQmx数据采集循环，为了保证原本的逻辑清晰，可以在已有的代码包裹While循环，再附加CSM通讯循环，实现改造功能。
> - 在实时要求高的情况，需要使用定时循环实现，则需要CSM循环作为通讯接口，定时循环作为功能循环的实现方案。
> - 在界面操作非常复杂的情况下，建议将界面操作和CSM通讯循环分离，界面操作循环处理界面操作，产生模块间的消息，CSM循环作为实际功能循环。
>
> 多循环支持模式API用于此场景下在模块内部循环间传递内部消息，或提供非CSM循环的CSM接口功能。
>

### CSM - Request CSM to Post Message.vi
申请CSM模块给出异步消息。此API主要用于CSM多循环模式下，其他模块中申请CSM发出消息。

在此场景下，通常也可以使用CSM - Post Message VI，但是它发送的时刻无法确定，而且也不能获得异步消息的返回值。此VI是一个补充。

<b>参考范例</b>：`4. Advance Examples\5. Multi-Loop Module Example\TCP Server Module(Multi-Loop Support).vi`。

> - Ref: CSM多循环模式(Multi-Loop Mode)

-- <b>输入控件(Controls)</b> --
- <b>Module Name</b>: 发送状态的CSM。
- <b>State</b>: 消息名称。
- <b>Arguments ("")</b>: 将被广播的状态参数。
- <b>Without Reply? (F)</b>: 是否需要返回。当需要返回时，发出的是异步消息；不需要返回时，发出的是异步无返回消息。
- <b>Target Module ("" By Default)</b>: 目标模块。
- <b>Immediately? (F)</b>: 立即执行选项。立即发送会让此消息在CSM循环中立即被处理，而不是等待CSM循环中现存的消息执行完毕。

### CSM - Request CSM to Broadcast Status Change.vi
申请CSM发送广播。此API主要用于CSM多循环模式下，其他模块中申请CSM发出广播，通知其他模块状态改变。

> [!WARNING]
> 只要知道模块名称， 您可以在CSM模块外部，使用这个VI伪装这个模块发出广播消息，但是这样做是不推荐的，因为这种逻辑会让整体的逻辑变得混乱，提高调试的难度。因此只建议在CSM多循环模式下使用此VI。

<b>参考范例</b>：`4. Advance Examples\5. Multi-Loop Module Example\TCP Server Module(Multi-Loop Support).vi`。

> - Ref: CSM多循环模式(Multi-Loop Mode)

-- <b>输入控件(Controls)</b> --
- <b>Module Name</b>: 发送状态的CSM。
- <b>Status</b>: 将被广播的状态。
- <b>Arguments ("")</b>: 将被广播的状态参数。
- <b>Broadcast? (T)</b>: 控制是否广播的开关输入。
- <b>Priority ("Status")</b>: 广播的优先级, 默认为"信号广播(Status)"，或"中断广播(Interrupt)"。
- <b>Immediately? (F)</b>: 立即执行选项。立即发送会让此消息在CSM循环中立即被处理，而不是等待CSM循环中现存的消息执行完毕。

### CSM - Forward UI Operations to CSM.vi
此VI主要应用于多循环模式下，将并行于CSM循环的UI循环中用户操作产生的时间，转发到CSM循环中处理。CSM DQMH-Style Template VI模板就是这个逻辑。

<b>参考范例</b>：`Addons - Loop Support\CSMLS - Continuous Loop in CSM Example.vi`。

> - Ref: CSM多循环模式(Multi-Loop Mode)

-- <b>输入控件(Controls)</b> --
- <b>State(s) In ("")</b>: 待处理的状态。
- <b>Name ("" to Use UUID)</b>: 模块的名称。
- <b>High Priority? (T)</b>: 立即执行选项。立即发送会让此消息在CSM循环中立即被处理，而不是等待CSM循环中现存的消息执行完毕。

-- <b>输出控件(Indicators)</b> --
- <b>States Out</b>: 输入始终为空，是为了在模板中保证连线一致性设置的输出端。

### CSM - Module Turns Invalid.vi
检查CSM是否已经退出。通常用于和CSM并行的功能循环的跟随CSM循环退出。

CSM高级模式的模块(协作者模式、责任链模式)只有在最后一个节点退出后，才会触发模块退出事件。

-- <b>输入控件(Controls)</b> --
- <b>CSM Name</b>: CSM模块名称。

-- <b>输出控件(Indicators)</b> --
- <b>Turn Invalid (Exit)?</b>: CSM模块是否已经退出。

# CSM API

> [!NOTE] 
> **名称拼接API**
>
> 这个 VI 只操作了模块名称字符串，并没有实际功能，因此当熟悉 CSM 规则后，可以直接输入对应的名称字符串和规则符号，不是必须调用此API.

## 系统级模块 (System-Level Module API)

> [!NOTE] 
> **CSM系统级模块**
>
> 系统级模块的其他CSM功能，均与普通模块相同，和普通模块唯一的区别，在于默认的 CSM - List Modules.vi 不会列出系统级模块。因此它通常用于实现一些后台运行的功能模块，而在统一处理普通模块操作逻辑时，可以避免对这些后台运行逻辑的干扰。
> CSM系统级模块通常以"."开头，例如：".MainApp"、".BackgroundTask"等，"."是名称的一部分，消息发送、订阅等操作需要的名称也要包含"."。
> 例如：
> 我们可以将主程序循环命名为 ".MainApp", 我们就可以通过 CSM - List Modules.vi 来获取所有普通模块的列表，而不会列出".MainApp"，如果主程序需要退出其他全部模块，就可以发送”Macro: Exit“给 CSM - List Modules.vi 的结果，这样就可以退出所有普通模块，而不会影响系统级模块的运行。
>
> 协作者模式、责任链模式的CSM模块名称，也可以以”.“开头，作为系统级模块运行。

### CSM - Mark As System-Level Module.vi

在输入字符串前添加"."，即可将此模块标记为系统级模块，例如输入为"UIModule", 输出为".UIModule"。

参考范例：0. Base Concepts\7. System-Level Module.vi

> Ref: 名称拼接API
> Ref: CSM系统级模块

-- <b>Controls(输入控件)</b> --
- <b>CSM Name</b>: CSM 模块名称

-- <b>Indicators(输出控件)</b> --
- <b>CSM Name (Marked As Sysetem-Level Module)</b>: 添加“.”标记的CSM模块名称

## 子模块

> [!NOTE] 
> **CSM子模块**
>
> CSM中并没有严格意义上的子模块，仅通过模块名称中的"."来标记不同模块的逻辑关系，从实际运行角度来看，每个模块都是独立且没有层级关系的。
> 例如：
> 模块"ModuleA"和"ModuleA.SubmoduleB"是两个不同的模块，从代码逻辑上看，它们是完全独立的，互不干扰。
> 但可以通过 CSM - List Submodules.vi 来获取模块"ModuleA"的所有逻辑上的子模块，包括"ModuleA.SubmoduleB"。
> 
> 需要注意的是，ModuleA 也可以不实际存在，仅作为逻辑分组，例如：
> 模块 Group.SubModuleA 和 Group.SubModuleB 是两个不同的模块，从代码逻辑上看，它们是完全独立的，互不干扰。
> 但可以通过 CSM - List Submodules.vi 来获取"Group"的所有逻辑上的子模块，包括"Group.SubModuleA"和"Group.SubModuleB"。
>
> 协作者模式、责任链模式的CSM模块名称, 也可以包含".", 因为只是逻辑分组，不影响模块的运行。

## 工作者模式 (Work Mode API)

> [!NOTE] 
> **CSM 工作者模式(worker mode)**
>
> 一个 CSM 模块，通过实例化多个实例，申请的名称后添加“#”,并共享相同的消息队列，实现工作者模式。
> - 从外部调用上看，这些实例一起组成了一个复合的模块，命名为 Worker Agent。
> - 每一个实例，命名为 Worker。
>
> 行为：
> 外部调用者可以认为 Worker Agent 就是一个CSM模块，可以进行消息通讯、状态注册等操作。
> 从内部看，空闲的 Worker 会从 Worker Agent 消息队列中取出消息，处理消息。因此，Worker 模式能够实现一个 CSM 模块的并发消息处理。
>
> 举例：
> //申请模块名称为 module#, module 是 Worker Agent名称，实例化 2 个实例，这2个实例的名字可能为：
> // - module#59703F3AD837
> // - module#106A470BA5EC
> // 不能直接和 worker 进行通讯，需要和 Worker Agent 通讯，例如
> csm message >> arguments -@ module //同步消息，空闲的 worker 将处理此消息
> csm message >> arguments -> module //同步消息，空闲的 worker 将处理此消息
>
> 应用场景：
> 1. 10086 接线员的场景
> 2. 下载器并发下载的场景
> 3. 编译器并发编译的场景
> 4. TCP Server 处理多个Client连接

### CSM - Mark As Worker Module.vi

在CSM名称后添加“#”，以标记此模块为协作者模式模块。

参考范例：4. Advance Examples\1. Action Workers Example

> Ref: 名称拼接API
> Ref: CSM 工作者模式(worker mode)

-- <b>Controls(输入控件)</b> --
- <b>CSM Name</b>: CSM 模块名称

-- <b>Indicators(输出控件)</b> --
- <b>CSM Name (Marked As Worker)</b>: 添加“#”标记的CSM模块名称

## 责任链模式 (Chain of Responsibility API) - 待完善

> [!NOTE] 
> **CSM 责任链模式(Chain of Responsibility mode)**
>
> 多个 CSM 模块，申请的名称后添加“$”,组成处理事务的一个链条，通过责任链模式形成一个完整的模块。

> - 从外部调用上看，这些实例一起组成了一个复合的模块，命名为 Chain。
> - 每一个实例，命名为 chain node。
>
> 行为：
> 外部调用者可以认为 Chain 就是一个 CSM 模块，可以进行消息通讯、状态注册等操作。
> 从内部看，Nodes 会根据排列顺序依次尝试处理消息，当 node 具有当前消息处理的能力时，消息被处理，不再向后传递。
>
> 举例：
> //申请模块名称为 module$, module 是 chain 名称，实例化 4 个实例，这四个实例的名字可能为：
> // - module$1
> // - module$2
> // - module$3
> // - module$4
> // 组成的 Chain 顺序为 module$1(head) >> module$2 >> module$3 >> module$4(tail)
> // 假设 module$3 module$4 能够处理 "csm message"
> csm message >> arguments -@ module
> // 这个消息将被 module$3 处理, module$4 不会响应
>
> 应用场景：
> 1. 权限审批过程，按照职位层级，具有某职能权限的人员，就可以直接审批，无需继续传递。
> 2. 功能拼接，不同模块实现不同的任务，通过拼接可以完成不同功能合集的组合
> 3. 功能覆盖，通过覆盖实现OOP中的重载

### CSM - Mark As Chain Module.vi

[!WARNING] 此组功能还未完全验证过，请谨慎使用。

拼接责任链模式模块的名称，使用“$”作为分隔符。注意 Order 不必连续，但是必须唯一，编号小的节点，将排列在责任链的前面。

参考范例：4. Advance Examples\2. Chain of Responsibility Example

> Ref: CSM 责任链模式(Chain of Responsibility mode)
> Ref: 名称拼接API

-- <b>Controls(输入控件)</b> --
- <b>CSM Name</b>:  CSM 模块名称
- <b>Order</b>:  责任链模式下的顺序, 编号小的节点，将排列在责任链的前面。

-- <b>Indicators(输出控件)</b> --
- <b>CSM Name (Marked As Chain)</b>:添加“$”标记的CSM模块名称

## 旁路循环支持(Side-Loop Support)

### CSM - Request CSM to Post Message.vi

申请 CSM 发送消息。通常用于和CSM并行的功能循环，这些功能循环和 CSM 一起完成完整模块功能。

-- <b>Controls(输入控件)</b> --
- <b>Module Name</b>:发送状态的CSM
- <b>Status</b>: 将被广播的状态
- <b>Arguments ("")</b>: 将被广播的状态参数
- <b>Target Module</b>:目标模块
- <b>Immediately? (F)</b>:Controls
- <b>State</b>:Controls
- <b>Target Module ("" By Default)</b>:Controls
- <b>Without Reply? (F)</b>:Controls

### CSM - Request CSM to Broadcast Status Change.vi

申请 CSM 发布状态。通常用于和CSM并行的功能循环，这些功能循环和 CSM 一起完成完整模块功能。

-- <b>Controls(输入控件)</b> --
- <b>Module Name</b>:发送状态的CSM
- <b>Status</b>: 将被广播的状态
- <b>Arguments ("")</b>: 将被广播的状态参数
- <b>Broadcast(T)</b>: 控制是否广播的开关输入
- <b>Broadcast? (T)</b>:Controls
- <b>Immediately? (F)</b>:Controls

### CSM - Module Turns Invalid.vi

检查CSM是否已经退出。通常用于和CSM并行的功能循环的退出条件。

-- <b>Controls(输入控件)</b> --
- <b>CSM Name</b>: 模块名称

-- <b>Indicators(输出控件)</b> --
- <b>Turn Invalid (Exit)?</b>: 是否已经退出

### CSM - Flood of Events Handler Side Loop.vi

### CSM - Forward States to CSM.vi

-- <b>Controls(输入控件)</b> --
- <b>High Priority(T)</b>:
- <b>Module Name</b>:Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters
- <b>State(s) in ("")</b>:Wire the existing states to this input. The default is an empty string.
- <b>High Priority? (T)</b>:Controls
- <b>State (S) In ("")</b>:Controls

### CSM - Forward UI Operations to CSM.vi

-- <b>Controls(输入控件)</b> --
- <b>Name("" to use uuid)</b>:
- <b>State(s) in ("")</b>:

-- <b>Indicators(输出控件)</b> --
- <b>States Out</b>:
- <b>Name ("" to Use UUID)</b>:Controls
- <b>State (S) In ("")</b>:Controls
- <b>States Out</b>:Indicators

## 子模块

### Concatenate Submodule Name.vi

- <b>CSM Name</b>:Controls
- <b>Name</b>:Controls
- <b>Submodule Name</b>:Indicators
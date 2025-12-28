# CSM API

## 管理接口(Management API)

> [!NOTE]
> <b>CSM工作模式</b>
>
> - <b>Stand-alone</b>: 独立工作模式。不输入模块名称，将自动生成一个随机ID，用于标识模块。
> - <b>CSM</b>: 普通CSM模块。
> - <b>Action Worker</b>: 协作者模式。在模块名称后添加`#`，以标记此模块为工作者，该模块与具有相同名称的其他工作者共享相同的消息队列。
> - <b>Chain Node</b>: 链式节点。在模块名称后添加`$`，以标记此模块为链式节点，同一个链上的消息将依次传递，直到某个节点处理消息。

> [!NOTE]
> <b>CSM优先级队列设计</b>
>
> CSM后台实质上依然使用LabVIEW队列来实现模块间通讯，但它使用了两个队列来分别存储不同优先级的消息:
> - <b>普通优先级队列</b>: 用于传递异步消息和信号广播
> - <b>高优先级消息队列</b>: 用于传递同步消息和中断广播
>
> 高优先级队列中的消息会被优先处理，普通优先级队列中的消息则会在高优先级队列中的消息处理完成后才会被处理。

### CSM - Check If Module Exists.vi
检查CSM模块是否存在。当CSM模块运行在协作者模式或责任链模式下，只有当组成模块的所有节点退出后，模块才会被标记为不存在。

-- <b>输入控件(Controls)</b> --
- <b>CSM Name</b>: CSM模块名称。

-- <b>输出控件(Indicators)</b> --
- <b>CSM Name (dup)</b>: 输入的CSM模块名称副本。
- <b>Exist?</b>: 返回模块是否存在。

### CSM - List Modules.vi
列出所有活动的CSM模块。该VI具有两组选项:
- <b>范围选项</b>：用于标记是否罗列系统级模块，默认不列出，可选择普通/仅系统级模块/所有模块。
- <b>是否包含节点选项</b>：针对协作者模式和责任链模式，当包括节点时，将同时列出节点，否则仅列出模块，默认不包含节点。

> - Ref: CSM工作模式

-- <b>输入控件(Controls)</b> --
- <b>Scope (Normal)</b>: 范围选项，可选择 普通/仅系统级模块/所有模块。
- <b>With Nodes? (F)</b>: 是否包含节点，针对协作者模式和责任链模式，当包括节点时，将同时列出节点，否则仅列出模块，默认不包含节点。

-- <b>输出控件(Indicators)</b> --
- <b>Module Names</b>: CSM模块名称列表。

### CSM - List Submodules.vi
列出当前分组或模块的所有子模块。<b>Recursive? (T)</b>为TRUE时，将递归列出所有层级的子模块，否则仅列出直接下一级子模块。

    举例: 系统存在Level1.Level2A、Level1.Level2A.Node1、Level1.Level2A.Node2、Level1.Level2B.Node1、Level1.Level2B.Node2这5个模块，
     - 当<b>Parent Name</b>为"Level1"时:
        <b>Recursive? (T)</b>为True时，将递归列出所有层级的子模块，包括Level1.Level2A、Level1.Level2A.Node1、Level1.Level2A.Node2、Level1.Level2B.Node1、Level1.Level2B.Node2
        <b>Recursive? (T)</b>为False时，仅列出直接下一级子模块，仅包括Level1.Level2A，注意Level1.Level2B不是一个模块实例，因此并不会被包含在结果中

> [!NOTE]
> 子模块只对普通CSM模块有效，对协作者模式或责任链模式的模块无效。

> - Ref: CSM子模块

-- <b>输入控件(Controls)</b> --
- <b>Parent Name</b>: 分组或父节点名称。
- <b>Recursive? (T)</b>: 是否递归列出所有层级的子模块，默认为TRUE。

-- <b>输出控件(Indicators)</b> --
- <b>Parent Name (Dup)</b>: 输入的分组或父节点名称副本。
- <b>Submodules</b>: 子模块名称列表。

### CSM - Module VI Reference.vi
获取输入模块的VI引用。

VI逻辑:
- 该VI通过发送`VI Reference`同步消息，查询获取CSM模块的VI引用，因此它具有与发送同步消息VI相类似的输入参数。
- 该VI在后台缓存了本次主程序运行查询过的CSM模块的VI引用，当再次查询相同的模块且查询到的VI引用依然有效时，将直接返回缓存的VI引用，而不是重新发送同步消息查询。
- 如果需要强制重新查询模块的VI引用，可设置<b>Force? (F)</b>为TRUE。

对于特殊运行模式的CSM的行为:
- 协作者模式: 返回处理`VI Reference`消息的工作者节点的VI引用。
- 责任链模式: 返回责任链模式的CSM模块的第一个节点的VI引用。
- 系统级模块: 与普通模式CSM相同，返回系统级模块的VI引用。

-- <b>输入控件(Controls)</b> --
- <b>Current Module ("" to Generate an ID)</b>: 查询CSM模块的标记，为空时将生成一个唯一的ID。
- <b>CSM Name</b>: CSM模块名称。
- <b>Force? (F)</b>: 是否强制重新查询模块的VI引用，默认为 False。
- <b>Response Timeout (-2 Using Global Settings)</b>: 同步调用的超时时间，默认为-2，使用全局设置。您可以通过CSM - Set TMO of Sync-Reply VI设置全局超时时间。

-- <b>输出控件(Indicators)</b> --
- <b>CSM Module VIRef</b>: CSM模块的VI引用。

### CSM - Set TMO of Sync-Reply.vi
设置CSM程序全局的同步调用超时时间，单位为毫秒。当输入为-2时，将不会修改全局超时时间，返回值为当前全局超时时间；当输入为其他正值时，将修改全局超时时间为该值，返回新的全局超时时间。

> - Ref: CSM同步消息全局超时

CSM模块/API调用时，默认的超时时间为-2，此时将使用全局设置的超时时间；如果设置为其他正值，则将使用该值作为超时时间。

-- <b>输入控件(Controls)</b> --
- <b>TMO For Sync-Rep (ms) In</b>: 全局超时时间输入，-2表示不修改全局超时时间，其他正值表示修改全局超时时间为该值。

-- <b>输出控件(Indicators)</b> --
- <b>TMO For Sync-Rep (ms) Out</b>: 当前全局超时时间。

### CSM - Module Status.vi
获取CSM模块的状态，包括: 工作模式、工作者数量、消息队列中的待处理消息个数。

> - Ref: CSM工作模式

-- <b>输入控件(Controls)</b> --
- <b>CSM Name</b>: CSM模块名称。

-- <b>输出控件(Indicators)</b> --
- <b>CSM Name (Dup)</b>: 输入的CSM模块名称副本。
- <b>Mode</b>: 返回模块的工作模式。
- <b>#Nodes</b>: 协作者模式或责任链模式下的节点数量。
- <b>#Elements In Queue</b>:  CSM消息队列中的待处理消息个数。

### CSM - Flush Queue.vi
清空CSM模块后台用于模块间通信的LabVIEW队列。

> - Ref: CSM优先级队列设计

> [!WARNING]
> CSM模块通常不建议使用该VI。CSM建议通过设计避免消息在模块中的堆积，因此建议通过设计避免在CSM模块中使用该VI清空后台的消息队列。

-- <b>输入控件(Controls)</b> --
- <b>CSM Name</b>: CSM模块名称。
- <b>Option (Low Priority As Default)</b>: 清理的队列。可以选择All、Low Priority、High Priority。默认值为Low Priority。

-- <b>输出控件(Indicators)</b> --
- <b>CSM Name (Dup)</b>: 输入CSM模块名称的副本。
- <b>#Flushed</b>: 被清理的消息队列中的元素个数。

### Filter JKISM String Queue(CSM - Filter JKISM String Queue.vi)

该VI用于过滤CSM状态队列中的特定状态

> [!WARNING]
> CSM模块通常不建议使用该VI。CSM建议通过设计避免消息在模块中的堆积，因此建议通过设计避免清空JKISM字符串队列。
> 但如果必须清空JKISM字符串队列，建议通过调用该组VI清空JKISM字符串队列，而非使用字符串操作。

> - Ref: CSM 的状态队列操作API

> [!NOTE]
> <b>多态VI(Polymorphic VI)选项</b>
> - CSM - Filter Local States.vi: 过滤本地状态
> - CSM - Filter Messages.vi: 过滤所有类型的消息
> - CSM - Filter Sync Messages.vi: 过滤同步消息
> - CSM - Filter Async Messages.vi: 过滤异步消息
> - CSM - Filter Async without Reply Messages.vi: 过滤异步无回复消息
> - CSM - Filter Messages to Non-Existing Modules.vi: 过滤发送到不存在模块的消息
> - CSM - Filter Broadcasts.vi: 过滤广播消息
> - CSM - Filter Status Broadcasts.vi: 过滤状态广播消息
> - CSM - Filter Interrupt Broadcasts.vi: 过滤中断广播消息
> - CSM - Filter Duplicated Lines.vi: 过滤重复行

#### CSM - Filter Local States.vi
该VI用于过滤CSM状态队列中的本地状态。

> - Ref: CSM 的状态队列操作API

-- <b>输入控件(Controls)</b> --
- <b>States In</b>: 待过滤的整段状态描述字符串。

-- <b>输出控件(Indicators)</b> --
- <b>States Out</b>: 过滤后的状态描述字符串。

#### CSM - Filter Messages.vi
该VI用于过滤CSM状态队列中的所有类型的消息。

> - Ref: CSM 的状态队列操作API

-- <b>输入控件(Controls)</b> --
- <b>States In</b>: 待过滤的整段状态描述字符串。

-- <b>输出控件(Indicators)</b> --
- <b>States Out</b>: 过滤后的状态描述字符串。

#### CSM - Filter Sync Messages.vi
该VI用于过滤CSM状态队列中的同步消息。

> - Ref: CSM 的状态队列操作API

-- <b>输入控件(Controls)</b> --
- <b>States In</b>: 待过滤的整段状态描述字符串。

-- <b>输出控件(Indicators)</b> --
- <b>States Out</b>: 过滤后的状态描述字符串。

#### CSM - Filter Async Messages.vi
该VI用于过滤CSM状态队列中的异步消息。

> - Ref: CSM 的状态队列操作API

-- <b>输入控件(Controls)</b> --
- <b>States In</b>: 待过滤的整段状态描述字符串。

-- <b>输出控件(Indicators)</b> --
- <b>States Out</b>: 过滤后的状态描述字符串。

#### CSM - Filter Async without Reply Messages.vi
该VI用于过滤CSM状态队列中的异步无回复消息。

> - Ref: CSM 的状态队列操作API

-- <b>输入控件(Controls)</b> --
- <b>States In</b>: 待过滤的整段状态描述字符串。

-- <b>输出控件(Indicators)</b> --
- <b>States Out</b>: 过滤后的状态描述字符串。

#### CSM - Filter Messages to Non-Existing Modules.vi
该VI用于过滤CSM状态队列中发送到不存在模块的消息。这个VI中会使用CSM - List Modules VI获取所有活动的CSM模块，然后过滤掉发送给不存在模块的消息。

> - Ref: CSM 的状态队列操作API

-- <b>输入控件(Controls)</b> --
- <b>States In</b>: 待过滤的整段状态描述字符串。

-- <b>输出控件(Indicators)</b> --
- <b>States Out</b>: 过滤后的状态描述字符串。

#### CSM - Filter Broadcasts.vi
该VI用于过滤CSM状态队列中的广播消息。

> - Ref: CSM 的状态队列操作API

-- <b>输入控件(Controls)</b> --
- <b>States In</b>: 待过滤的整段状态描述字符串。

-- <b>输出控件(Indicators)</b> --
- <b>States Out</b>: 过滤后的状态描述字符串。

#### CSM - Filter Status Broadcasts.vi
该VI用于过滤CSM状态队列中的状态广播消息。

> - Ref: CSM 的状态队列操作API

-- <b>输入控件(Controls)</b> --
- <b>States In</b>: 待过滤的整段状态描述字符串。

-- <b>输出控件(Indicators)</b> --
- <b>States Out</b>: 过滤后的状态描述字符串。

#### CSM - Filter Interrupt Broadcasts.vi
该VI用于过滤CSM状态队列中的中断广播消息。

> - Ref: CSM 的状态队列操作API

-- <b>输入控件(Controls)</b> --
- <b>States In</b>: 待过滤的整段状态描述字符串。

-- <b>输出控件(Indicators)</b> --
- <b>States Out</b>: 过滤后的状态描述字符串。

#### CSM - Filter Duplicated Lines.vi
该VI用于过滤CSM状态队列中的重复行。

> - Ref: CSM 的状态队列操作API

-- <b>输入控件(Controls)</b> --
- <b>Keep First Matched? (T)</b>: 是否保留第一个匹配项，默认为TRUE。
- <b>States In</b>: 待过滤的整段状态描述字符串。
- <b>Option</b>: 过滤选项。

-- <b>输出控件(Indicators)</b> --
- <b>States Out</b>: 过滤后的状态描述字符串。

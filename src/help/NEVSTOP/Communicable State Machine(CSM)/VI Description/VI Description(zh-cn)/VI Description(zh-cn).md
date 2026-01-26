# CSM API

- [01. 模板(Templates)](./VI%20Description(zh-cn)%20-%2001.%20Templates.md)
- [02. 核心功能(Core Functions)](./VI%20Description(zh-cn)%20-%2002.%20Core%20Functions.md)
- [03. 参数(Arguments)](./VI%20Description(zh-cn)%20-%2003.%20Arguments.md)
- [04. 管理接口(Management API)](./VI%20Description(zh-cn)%20-%2004.%20Management%20API.md)
- [05. 模块操作接口(Module Operation API)](./VI%20Description(zh-cn)%20-%2005.%20Module%20Operation%20API.md)
- [06. 状态订阅管理(Status Registration)](./VI%20Description(zh-cn)%20-%2006.%20Status%20Registration.md)
- [07. 全局日志(Global Log)](./VI%20Description(zh-cn)%20-%2007.%20Global%20Log.md)
- [08. 高级模式(Advanced Modes)](./VI%20Description(zh-cn)%20-%2008.%20Advanced%20Modes.md)
- [09. 内置插件(Built-in Addons)](./VI%20Description(zh-cn)%20-%2009.%20Build-in%20Addons.md)
- [10. 工具VI(Utility VIs)](./VI%20Description(zh-cn)%20-%2010.%20Utility%20VIs.md)
- [11. CSM-Helper API](./VI%20Description(zh-cn)%20-%2011.%20CSM-Helper%20API.md)
- [12. Debug,Doc,Tools](./VI%20Description(zh-cn)%20-%2012.%20Debug,Doc,Tools.md)
- [13. Internal](./VI%20Description(zh-cn)%20-%2013.%20Internal.md)

> [!NOTE]
> <b>CSM模块间通信类型</b>
>
> CSM模块间的通信分为两类: 消息和广播。
> - 消息: 模块间1:1的通信，根据消息处理的方式，又可分为同步调用(`-@`)、异步调用(`->`)、异步不等待返回(`->|`)等。
> - 广播: 模块间1:N的通信，广播模块会将广播推送给所有订阅了该广播的模块。根据广播处理的优先级，又可分为信号广播(status)和中断广播(interrupt)。

> [!NOTE]
> <b>CSM模块外部接口</b>
>
> 基于CSM框架编写的模块，具有良好的复用性。使用者只需了解以下接口信息，即可在不了解具体实现的情况下，使用CSM模块。
> - 消息接口(Message): 外部可调用的消息名称、参数信息和返回信息。
> - 广播接口(Broadcast): 外部可调用的广播名称、参数信息。
> - 属性接口(Attribute): 模块可使用的属性名称、属性数据类型(LabVIEW数据类型)。

> [!NOTE]
> <b>CSM消息类型</b>
>
> CSM消息分为三类: 同步调用(`-@`)、异步调用(`->`)、异步不等待返回(`->|`)。
> - 同步调用(`-@`): 模块会等待目标模块返回结果，才会继续执行后续代码。
> - 异步调用(`->`): 模块会立即继续执行后续代码，而不会等待目标模块返回结果。
> - 异步不等待返回(`->|`): 模块会立即继续执行后续代码，而不会等待目标模块返回结果。与异步调用(`->`)不同的是，异步不等待返回(`->|`)不会等待目标模块返回结果，也不会抛出错误。

> [!NOTE]
> <b>CSM消息格式解析</b>
>
>       [CSM消息字符串(CSM Message)] >> [参数(Arguments)] [消息类型符号(Message Symbol) ->|,->,-@] [目标模块(Target Module)] // [注释(Comments)]
>
> - CSM 消息字符串(CSM Message): CSM的消息，不可包含CSM关键字和换行符。
> - `>>`: CSM消息字符串(CSM Message)和参数(Arguments)的分隔符。
> - 参数(Arguments): CSM消息的参数，不可包含CSM关键字和换行符。
> - 消息类型符号(Message Symbol): 消息类型符号，用于标识消息类型，包括同步调用(`-@`)、异步调用(`->`)、异步不等待返回(`->|`)等。
> - 目标模块(Target Module): 消息发送的目标模块，如为空，则表示消息会被本模块处理。为空时，消息类型符号也不能存在。
> - 注释(Comments): 注释信息，不会被解析。

> [!NOTE]
> <b>CSM消息的目标模块说明</b>
>
> 普通模式下，CSM消息的目标模块为指定的模块名称。
> 系统级模块只是名称上以`.`起始，CSM消息的目标模块包含`.`的名称， 如申请的模块名称为`.System`，CSM消息的目标模块就是`.System`。
> 协作者模式下，CSM消息的目标模块只能是整体模块名称，不能是节点的名称，例如申请的模块名称为`Worker#`，CSM消息的目标模块就是`Worker`。
> 责任链模式下，CSM消息的目标模块只能是整体模块名称，不能是节点的名称。例如申请的模块名称为`Chain$1`，CSM消息的目标模块就是`Chain`。

> [!NOTE]
> <b>同步消息</b>
>
> 同步消息是消息的一种。CSM发出同步消息后，将暂停状态变化，等待被调用方完成消息处理。同步消息通过`-@`描述。 一个JKISM模块通过同步消息对另一个模块的调用，叫做同步调用。
>
> 调用方会发生的错误:
> - 如果输入的目标模块为`""`，会产生`NO Target Error`。
> - 如果输入的模块不存在，会产生`Target Error`。
> - 如果输入的模块存在，但是在指定的时间内还未完成处理，会产生`Timeout Error`。
>
> 调用方会停留等待返回:
> - 如果调用方是CSM模块，会停留在Parse State Queue++ VI中。
> - 如果是API调用，会停留在调用VI，例如CSM - Send Message and Wait for Reply VI。
>
> 返回:
> - 如果调用方是CSM模块
>   - 正常情况下，会进`Response`状态处理返回。
>   - 如果是调用方发生的错误，会导致CSM状态机进入`Error Handler`模块，处理错误。
>   - 如果是被调用方发生的错误，此信息仍然是消息的结果，在`Response`状态处理，可以从Additional Information中获取。
> - 如果是API调用
>   - Response输出为返回。
>   - 调用方和被调用方发生的错误，会合并到错误簇输出。

> [!NOTE]
> <b>CSM同步消息全局超时</b>
>
> - CSM模块间通信，或使用同步消息发送VI时，默认的超时时间为-2，此时将使用全局设置的超时时间
> - 全局超时时间可以通过CSM - Set TMO of Sync-Reply VI设置为其他正值，以覆盖全局设置的超时时间
> - 全局超时时间仅对同步调用生效，异步调用不受影响

> [!NOTE]
> <b>异步消息</b>
>
> 异步消息是消息的一种。CSM发出异步消息后，将立即继续执行后续代码，而不会等待被调用方完成消息处理。
> 异步消息分为异步调用(`->`)和异步不等待返回(`->|`)，区别只在于异步无返回消息，当被调用方完成操作后，不会将结果返回给调用方。
>
> 调用方会发生的错误:
> - 如果输入的目标模块为`""`，会产生`NO Target Error`。
> - 如果输入的模块不存在，会产生`Target Error`。
>
> 调用方不会停留等待返回:
> - 如果调用方是CSM模块，会在Parse State Queue++ VI发送消息后，进入`Async Message Posted`状态。
> - 如果是API调用，会继续执行后续代码，API只能发送异步无返回异步消息。
>
> 返回:
> - 如果调用方是CSM模块
>   - 正常情况下，会进入`Async Response`状态处理返回。被调用方发生的错误，此信息仍然是消息的结果，在`Async Response`状态处理，可以从Additional Information中获取此错误信息。
>   - 如果是调用方发生的错误，会导致CSM状态机进入`Error Handler`模块，处理错误。
> - API只能发送异步无返回异步消息，无返回。

> [!NOTE]
> <b>CSM操作消息格式解析</b>
>
> CSM定义了系统所需的操作，例如发送广播，广播的订阅、取消订阅。可以基于此定义，扩展系统的功能。
>
>       //[CSM操作字符串(CSM Operation)] >> [参数(Arguments)] -> <[操作类型(Operation)]> // [注释(Comments)]
>
>       例如:
>       // 发送信号广播"TCP Connected"，参数为"192.168.1.100"
>       TCP Connected >> 192.168.1.100 -> <broadcast>
>       // 将TCPModule的TCP Connected广播注册到UI模块的UpdateLED API
>       TCP Connected@TCPModule >> UpdateLED@UI -><register>

> [!NOTE]
> <b>CSM广播</b>
>
> CSM中的广播分为三种: 信号广播(Status)、中断广播(Interrupt)和状态广播(State)， 模块会将信号广播推送给所有订阅了该信号广播的模块。
> 其中信号广播(Status)和中断广播(Interrupt)是需要显式调用的广播，状态广播(State)是隐式的广播，在订阅关系存在的情况下，当CSM运行完成某个状态，就会自动触发状态广播(State)。
>
> - 信号广播(Status): 普通优先级的广播，类似异步消息，会通过低优先级队列传递。当模块中存在其他未处理的异步消息或者信号广播时，会依次被处理。
> - 中断广播(Interrupt): 高优先级的广播，类似同步消息，会通过高优先级队列传递。当模块中存在其他低优先级的异步消息或者信号广播时，会被优先处理，但是如果存在其他未处理的同步消息或中断广播时，会被依次处理。
> - 状态广播(State): 状态广播是隐式的广播，在订阅关系存在的情况下，当CSM运行完成某个状态，就会自动触发状态广播(State)。状态广播的参数，为CSM状态的Response。
>
> 注意：
> - 信号广播或中断广播需要显示发送，名称不要和CSM状态名相同，否则可能出现多次触发的情况
> - 状态广播由于效率的考虑，只有订阅后才会发送，这就意味着必须注册才能在模块的广播事件中收到状态广播。

> [!NOTE]
> <b>CSM广播格式解析</b>
>
>       [CSM广播(CSM Broadcast)] >> [参数(Arguments)] -> <broadcast> // [注释(Comments)]
>       [CSM信号广播(CSM Broadcast)] >> [参数(Arguments)] -> <status> // [注释(Comments)]
>       [CSM中断广播(CSM Broadcast)] >> [参数(Arguments)] -> <interrupt> // [注释(Comments)]
>
> - CSM广播(CSM Broadcast): CSM的广播，不可包含CSM关键字和换行符。
> - `>>`: CSM广播(CSM Broadcast)和参数(Arguments)的分隔符。
> - 参数(Arguments): CSM 广播的参数，不可包含CSM关键字和换行符。
> - 广播类型(Broadcast Type): `<broadcast>`,`<status>`为信号广播(Status)，`<interrupt>`为中断广播(Interrupt)。
> - 注释(Comments): 注释信息，不会被解析。
>

> [!NOTE]
> <b>CSM广播优先级</b>
>
> 从名称上就可以看出，广播是有优先级的。状态广播(State)是一种特殊的广播，默认它的优先级与信号广播(Status)相同。
> 其中中断广播(Interrupt)为高优先级广播，与同步消息均使用高优先级队列进行传递；
> 信号广播(Status)为低优先级广播，与异步消息均使用低优先级队列进行传递。
>
>       // 默认的广播为信号广播，例如：
>       ModuleInternalChange >> Arguments -> <broadcast> // 低优先级
>       ModuleInternalChange >> Arguments -> <broadcast> // 低优先级
>
> 默认的优先级由发送方定义，通过广播格式中的广播类型(Broadcast Type)进行定义。
>
>       // 发送方可以定义广播的优先级
>       ModuleInternalChange >> Arguments -> <status> // 低优先级
>       ModuleInternalChange >> Arguments -> <interrupt> // 高优先级
>
> 默认的订阅不会改变优先级，但可以通过特殊的订阅格式，改变订阅后的广播优先级。
>
>       // 默认的订阅不改变优先级
>       ModuleInternalChange@SourceModule >> API@TargetModule -><register>
>       // 将订阅的广播改为普通优先级，无论之前是何优先级
>       ModuleInternalChange@SourceModule >> API@TargetModule -><register as status>
>       // 将订阅的广播改为高优先级，无论之前是何优先级
>       ModuleInternalChange@SourceModule >> API@TargetModule -><register as interrupt>

> [!NOTE]
> <b>CSM订阅</b>
>
> 订阅是将广播与绑定的接口(API)关联起来，当广播被触发时，会调用绑定的接口(API)。当然，也可以取消订阅。
> 在CSM中，有以下两种广播:
> - 广播(Broadcast): 广播由模块显示的调用广播消息发送，参数需要显示给入。
> - 状态(State): CSM模块的任意一个状态，也可以被订阅。被触发的API收到的参数，为CSM状态的Response。
>
>       // 注册
>       [CSM广播(CSM Broadcast)]@[源模块(SourceModule)] >> [绑定的接口(API)]@[目标模块(TargetModule)] -><register> // [注释(Comments)]
>       // 取消注册
>       [CSM广播(CSM Broadcast)]@[源模块(SourceModule)] >> [绑定的接口(API)]@[目标模块(TargetModule)] -><unregister> // [注释(Comments)]
>
> - CSM广播: 由源模块定义，参考“CSM 广播格式解析”。
> - 源模块: 广播的模块，如果订阅任意模块的广播，源模块可以用`*`表示。
> - 绑定的接口: 由目标模块定义，为目标模块对外的接口。
> - 目标模块: 绑定的接口所在的模块。当在CSM模块中表示订阅到本模块，可忽略。同时省略前面的@分隔符。
> - `<register>`/`<unregister>`: 注册/取消订阅的操作类型定义。
> - 注释(Comments): 注释信息，不会被解析。
>

> [!NOTE]
> <b>CSM订阅位置</b>
>
> CSM订阅所添加的订阅规则，分为内部添加和外部添加两种。
> - 外部添加：外部添加的规则为全局规则，不会随着CSM模块的退出而自动删除，需要手动取消订阅。
>    - 使用`-<register>`语句添加的规则，如果指明了API所在的模块名称，则为外部添加。
>    - 使用 API CSM - Register Broadcast VI 添加的规则，均为外部添加。
> - 内部添加：CSM模块内部添加的规则，会随着CSM模块的退出而自动删除，无需手动取消订阅。
>   - 只有使用语句`-<register>`添加的规则，且API未指明模块名称时，才为内部添加。
>
>           例如：
>           status@sourceModule >> API@TargetModule -><register> // 外部添加
>           status@sourceModule >> API -><register> // 内部添加

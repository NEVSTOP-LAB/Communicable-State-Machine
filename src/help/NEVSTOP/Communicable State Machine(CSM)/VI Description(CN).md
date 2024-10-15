# CSM API

## 模板(Templates)

> [!NOTE] CSM Name 规则
> - CSM 模块名称应该是唯一的，否则会导致 CSM 进入 "Critical Error" 状态。
> - 如果输入为 ""，将使用 UUID 作为模块名称。该模块被标记为独立模式，不会包含在模块列表中。
> - 如果输入以 '#' 结尾，则该模块将在工作模式下运行。具有相同名称的模块将共享同一消息队列。任何外部消息将由其中一个模块处理，取决于哪个模块空闲。
>

> [!NOTE] CSM 初始化状态
> - 默认值和 JKISM 状态机保持一致, 是 "Macro: Initialize"。
> - 通常不会修改此状态，作为输入的目的是为了方便外部程序化修改初始化状态。
>

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

## 核心功能 (Core Functions)

> [!NOTE] CSM 消息格式解析
> [CSM 消息字符串(CSM Message)] >> [参数(Arguments)] [消息类型符号(Message Symbol) ->|,->,-@] [目标模块(Target Module)] // [注释(Comments)]
> - CSM 消息字符串(CSM Message): CSM的消息，不可以包含CSM关键字和换行符
> - ">>": CSM 消息字符串(CSM Message) 和 参数(Arguments) 的分隔符
> - 参数(Arguments): CSM 消息的参数，不可以包含CSM关键字和换行符
> - 消息类型符号(Message Symbol): 消息类型符号，用于标识消息类型，包括同步调用(-@)、异步调用(->)、异步不等待返回(->|)等
> - 目标模块(Target Module): 消息发送的目标模块，如果为空，则表示消息会被本模块处理。为空时，消息类型符号也不能存在
> - 注释(Comments): 注释信息，不会被解析
>

> [!NOTE] CSM 操作消息格式解析
> [CSM 操作字符串(CSM Operation)] >> [参数(Arguments)] -> <[操作类型(operation)]> // [注释(Comments)]
> TODO
>

### Parse State Queue++.vi

解析 CSM 状态队列，返回将执行的下一个当前状态、参数等信息。

-- <b>输入控件</b> --
- <b>State Queue</b>: 整个状态队列被连接到此输入。这应该来自 CSM 的移位寄存器。
- <b>Previous Error</b>: 来自 CSM 的错误簇被连接到此输入。如果发生错误并出现在此输入上，则当前状态输出将返回 "Error Handler" 状态。
- <b>Name("" to use uuid)</b>: CSM 模块名称
- <b>Response Timeout(5000ms)</b>:同步调用时的响应超时设置，默认 5000 ms.
- <b>Dequeue Timeout(0ms)</b>: 检查 CSM 消息队列的超时设置，默认为0，不进行等待。
- <b>Response Arguments</b>: 来自上一个状态的响应参数。它应该来连接 CSM 的移位寄存器，用于传递外部调用的返回值。

-- <b>输出控件</b> --
- <b>Remaining States</b>:  拼接后的所有状态及参数
- <b>Arguments</b>: 返回可能在当前状态字符串中使用的任何参数。这些参数位于“>>”字符之后。<b>注意：</b>参数变量不得包含任何不可打印的字符，比如换行符或回车符。
- <b>Current State</b>: 将执行的下一个当前状态
- <b>Name Used</b>: 分配给此CSM模块的实际名称
- <b>Argument - State</b>: 如果是 CSM 定义的内置状态，此参数表示此状态的前状态
- <b>From Who</b>: 如果<b>Current State</b> 是由外部发送的，则这是源CSM模块名称。

### Build State String with Arguments++.vi

此 VI 用于构建 CSM 消息字符串(包含状态、参数、目标模块、消息类型等信息)，以便发送到其他 CSM 模块。

> [!NOTE]
> 此 VI 只能不能拼接"异步不等待返回"的异步消息，已在函数面板隐藏，建议使用 Build Message with Arguments++.vi 代替此 VI。
>

- <B>例如:</B>

发送给本地状态机时, <b>Target Module ("")</b> 应该为空.

      If State = A 并且没有参数, 那么 <b>State with Arguments</b> = A
      If State = A , Arguments = B 那么 <b>State with Arguments</b> = A >> B

在发送给其他CSM的情况下, 假设 <b>Target Module ("")</b> 的名称是 "Target"

- 同步调用，发送的消息后等待返回:

      If State = A 并且没有参数, 那么 <b>State with Arguments</b> = A -@target
      If State = A , Arguments = B 那么 <b>State with Arguments</b> = A >> B -@target

- 异步调用，发送消息后，将进入"Async Message Posted" 状态，当外部模块处理完毕后，本地模块将收到 "Async Response" 消息:

      If State = A 并且没有参数, 那么 <b>State with Arguments</b> = A ->target
      If State = A , Arguments = B 那么 <b>State with Arguments</b> = A >> B ->target

-- <b>输入控件</b> --
- <b>State</b>: 状态或消息名称字符串
- <b>Arguments ("")</b>: <b>State</b> 的参数
- <b>Target Module ("")</b>: 此消息发送的目标 CSM 模块名称
- <b>Sync-Call(-@) T By Default/Async-Call(->) F</b>: 同步调用输入"TRUE"; 异步调用输入"FALSE"

-- <b>输出控件</b> --
- <b>CSM Message String</b>: 拼接生成的 CSM 消息字符串

### Build Message with Arguments++.vi

此 VI 用于构建 CSM 消息字符串、操作字符串。

> [!NOTE] 消息拼接API
> 此类型API不会直接发送消息，只是拼接消息字符串。需要将字符串并入 CSM 的状态队列后，在 Parse State Queue++.vi 中发送消息、执行操作。
> 在熟悉 CSM 规则的情况下，可以不使用此类API, 直接在字符串中键入对应的消息字符串、操作字符串。
>

多态VI(Polymorphic VI)选项:
- Build Message with Arguments(Auto Check).vi
- Build Asynchronous Message with Arguments.vi
- Build No-Reply Asynchronous Message with Arguments.vi
- Build Synchronous Message with Arguments.vi
- Build Interrupt Status Message.vi
- Build Normal Status Message.vi
- Build Register Status Message.vi
- Build Unregister Status Message.vi
- CSM - Replace Substitution Marks in Messages.vi

#### Build Message with Arguments(Auto Check).vi

拼接生成 CSM 消息字符串, 消息的类型符号会根据输入的 <b>State with Arguments</b> 自动检测。

> Ref: 消息拼接API

-- <b>输入控件</b> --
- <b>State with Arguments</b>: CSM 状态字符串，可以包含参数和目标模块信息。
- <b>Arguments ("")</b>: 参数信息。<b>State with Arguments</b>中包含的参数，会被替换。
- <b>Target Module ("")</b>: 目标模块。为空时, 将使用 <b>State with Arguments</b> 中的默认模块。

-- <b>输出控件</b> --
- <b>CSM Message String</b>: 拼接生成的 CSM 消息字符串

#### Build Synchronous Message with Arguments.vi

拼接生成 CSM 同步消息字符串，消息类型符号为 "-@", 例如:

      Message >> Arguments -@ Target

> Ref: 消息拼接API

-- <b>输入控件</b> --
- <b>State with Arguments</b>: CSM 状态字符串。
- <b>Arguments ("")</b>: 参数信息。<b>State with Arguments</b>中包含的参数，会被替换。
- <b>Target Module ("")</b>: 目标模块。为空时, 将使用 <b>State with Arguments</b> 中的默认模块。

-- <b>输出控件</b> --
- <b>CSM Message String</b>: 拼接生成的 CSM 消息字符串

#### Build Asynchronous Message with Arguments.vi

拼接生成的 CSM 异步消息字符串，消息类型符号为 "->", 例如:

      Message >> Arguments -> Target

> Ref: 消息拼接API

-- <b>输入控件</b> --
- <b>State with Arguments</b>: CSM 状态字符串。
- <b>Arguments ("")</b>: 参数信息。<b>State with Arguments</b>中包含的参数，会被替换。
- <b>Target Module ("")</b>: 目标模块。为空时, 将使用 <b>State with Arguments</b> 中的默认模块。

-- <b>输出控件</b> --
- <b>CSM Message String</b>: 拼接生成的 CSM 消息字符串

#### Build No-Reply Asynchronous Message with Arguments.vi

拼接生成的 CSM 异步消息字符串，消息类型符号为 "->|", 例如:

      Message >> Arguments ->| Target

> Ref: 消息拼接API

-- <b>输入控件</b> --
- <b>State with Arguments</b>: CSM 状态字符串。
- <b>Arguments ("")</b>: 参数信息。<b>State with Arguments</b>中包含的参数，会被替换。
- <b>Target Module ("")</b>: 目标模块。为空时, 将使用 <b>State with Arguments</b> 中的默认模块。

-- <b>输出控件</b> --
- <b>CSM Message String</b>: 拼接生成的 CSM 消息字符串

#### Build Normal Status Message.vi

拼接普通状态消息字符串，消息格式如下:

      Status >> Arguments -><status>
      //以下字符串为等效操作，只是为了更容易键入记忆，定义了更多的操作字符
      Status >> Arguments -><broadcast>
      Status >> Arguments -><all>

> Ref: 消息拼接API

-- <b>输入控件</b> --
- <b>State with Arguments</b>: CSM 普通状态消息字符串。
- <b>Arguments ("")</b>: 参数信息。<b>State with Arguments</b>中包含的参数，会被替换。

-- <b>输出控件</b> --
- <b>CSM Message String</b>:拼接生成的 CSM 消息字符串

#### Build Interrupt Status Message.vi

拼接中断状态消息。消息格式如下:

      Status >> Arguments -><interrupt>

> Ref: 消息拼接API

-- <b>输入控件</b> --
- <b>State with Arguments</b>: CSM 中断状态消息字符串。
- <b>Arguments ("")</b>: 参数信息。<b>State with Arguments</b>中包含的参数，会被替换。

-- <b>输出控件</b> --
- <b>CSM Message String</b>:拼接生成的 CSM 消息字符串

#### Build Register Status Message.vi

拼接注册状态操作消息字符串，消息格式如下:

      //[source-state]@[source-module] >> [response-message]@[response-module] -><register>
      status @ Source >> API @ Target -><register>

举例: 加入下载器模块的下载完毕消息，绑定到播放器模块的开始播放API

      //下载器模块的下载完毕消息，绑定到播放器模块的开始播放API
      DownloadFinished@Downloader >> StartPlay@Player -><register>
      //当播放器模块中执行消息时，Player 可缺省
      DownloadFinished@Downloader >> StartPlay -><register>
      //当有多个模块都有下载完毕消息，可以使用 * 表示所有模块的消息都绑定到播放器模块的开始播放API
      DownloadFinished@* >> StartPlay@Player -><register>

> Ref: 消息拼接API

-- <b>输入控件</b> --
- <b>Target CSM</b>: 订阅状态的 CSM 模块名称
- <b>Source CSM(* as Default)</b>: 发出状态的 CSM 模块名称
- <b>Status</b>: 注册的状态
- <b>API (if "", same as Status)</b>: 订阅状态模块响应的 API 名称

-- <b>输出控件</b> --
- <b>CSM Message String</b>:拼接生成的 CSM 消息字符串

#### Build Unregister Status Message.vi

拼接取消注册状态操作消息字符串，消息格式如下：

      //[source-state]@[source-module] >> [response-message]@[response-module] -><unregister>
      status @ Source >> API @ Target -><unregister>

举例： 取消下载器模块的下载完毕消息，绑定到播放器模块的开始播放API

      //下载器模块的下载完毕消息，绑定到播放器模块的开始播放API
      DownloadFinished@Downloader >> StartPlay@Player -><unregister>
      //当播放器模块中执行消息时，Player 可缺省
      DownloadFinished@Downloader >> StartPlay -><unregister>

> Ref: 消息拼接API

-- <b>输入控件</b> --
- <b>Target CSM</b>: 订阅状态的 CSM 模块名称
- <b>Source CSM(* as Default)</b>: 发出状态的 CSM 模块名称
- <b>Status</b>: 注册的状态

-- <b>输出控件</b> --
- <b>CSM Message String</b>:拼接生成的 CSM 消息字符串

#### CSM - Replace Substitution Marks in Messages.vi

为了能够便利的编辑多条 CSM 消息字符串，提供批量替换标记的功能。有4个标记可以替换：
- <param> 标记： 通常表示相同的参数
- <target> 标记： 通常表示相同的目标
- <1> 标记：表示自定义标记1
- <2> 标记：表示自定义标记2

例如：接线端 <target> 连接了字符串为 "DAQDevice"，<b>States with Replace Token</b> 字符串为：

```
Initialize -@ <target>
Configure -@ <target>
Read -@ <target>
Close -@ <target>
```

<b>States</b>输出为：

```
Initialize -@ DAQDevice
Configure -@ DAQDevice
Read -@ DAQDevice
Close -@ DAQDevice
```

> Ref: 消息拼接API

-- <b>输入控件</b> --
- <b>States with Replace Token</b>: 带有替换标记的 CSM 状态字符串
- <b><param></b>: <param> 标记： 通常表示相同的参数
- <b><target></b>: <target> 标记： 通常表示相同的目标
- <b><1></b>: 自定义标记1
- <b><2></b>: 自定义标记2

-- <b>输出控件</b> --
- <b>States</b>: 替换后

### CSM - Broadcast Status Change.vi

向系统广播状态更改。已注册状态的 CSM 模块将接收到状态更改。例如：

      //广播状态更改
      Status >> Arguments -><broadcast>

> [!NOTE] CSM 的状态队列操作API
> 此类型 API 不会直接发送消息，只是拼接消息字符串。在 Parse State Queue++.vi 中发送消息、执行操作。
> 和 消息拼接API 不同的是，此类 API 会包含 CSM 的状态队列字符串输入输入，相当于在状态队列中插入消息。
>

-- <b>输入控件</b> --
- <b>Status with Arguments</b>: 将被广播的状态及参数，支持多行, 每行状态都将被添加 "-><broadcast>"
- <b>State Queue("")</b>: 整个状态队列被连接到此输入
- <b>Broadcast(T)</b>: 控制是否广播的开关输入

-- <b>输出控件</b> --
- <b>Remaining States</b>: 拼接后的所有状态及参数。

### Add State(s) to Queue By BOOL++.vi

将 CSM 消息字符串并入 CSM 消息队列中。提供了 TRUE/FALSE 两种状态的字符串选项，能够避免使用条件结构，提高代码可读性，提高编程效率。

> Ref: CSM 的状态队列操作API

多态VI(Polymorphic VI)选项:
- add State(s) to Queue By BOOL(Element).vi
- add State(s) to Queue By BOOL(Array Left).vi
- add State(s) to Queue By BOOL(Array Right).vi
- add State(s) to Queue By BOOL(Array All).vi

#### Add State(s) to Queue By BOOL(Element).vi

将 CSM 消息字符串并入 CSM 消息队列中。提供了 TRUE/FALSE 两种状态的字符串选项，能够避免使用条件结构，提高代码可读性，提高编程效率。

> Ref: CSM 的状态队列操作API

-- <b>输入控件</b> --
- <b>State Queue("")</b>: 整个状态队列被连接到此输入
- <b>TRUE("")</b>: <b>Condition</b> 为 True 时插入的状态字符串
- <b>FALSE("")</b>: <b>Condition</b> 为 False 时插入的状态字符串
- <b>Condition</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
- <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的前端。如果为False，它被附加到尾部。

-- <b>输出控件</b> --
- <b>Remaining States</b>: 拼接后的所有状态及参数。

#### Add State(s) to Queue By BOOL(Array Left).vi

将 CSM 消息字符串并入 CSM 消息队列中。提供了 TRUE/FALSE 两种状态的字符串选项，能够避免使用条件结构，提高代码可读性，提高编程效率。

> Ref: CSM 的状态队列操作API

-- <b>输入控件</b> --
- <b>State Queue("")</b>: 整个状态队列被连接到此输入
- <b>TRUE("")</b>: <b>Condition</b> 为 True 时插入的状态字符串
- <b>FALSE("")</b>: <b>Condition</b> 为 False 时插入的状态字符串
- <b>Condition</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
- <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的前端。如果为False，它被附加到尾部。

-- <b>输出控件</b> --
- <b>Remaining States</b>: 拼接后的所有状态及参数。

#### Add State(s) to Queue By BOOL(Array Right).vi

将 CSM 消息字符串并入 CSM 消息队列中。提供了 TRUE/FALSE 两种状态的字符串选项，能够避免使用条件结构，提高代码可读性，提高编程效率。

> Ref: CSM 的状态队列操作API

-- <b>输入控件</b> --
- <b>State Queue("")</b>: 整个状态队列被连接到此输入
- <b>TRUE("")</b>: <b>Condition</b> 为 True 时插入的状态字符串
- <b>FALSE("")</b>: <b>Condition</b> 为 False 时插入的状态字符串
- <b>Condition</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
- <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的前端。如果为False，它被附加到尾部。

-- <b>输出控件</b> --
- <b>Remaining States</b>: 拼接后的所有状态及参数。

#### Add State(s) to Queue By BOOL(Array All).vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。
High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。
Bool输入决定要连接的字符串是TRUE还是False。

> Ref: CSM 的状态队列操作API

-- <b>输入控件</b> --
- <b>State Queue("")</b>: 整个状态队列被连接到此输入
- <b>TRUE("")</b>: <b>Condition</b> 为 True 时插入的状态字符串
- <b>FALSE("")</b>: <b>Condition</b> 为 False 时插入的状态字符串
- <b>Condition</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
- <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的前端。如果为False，它被附加到尾部。

-- <b>输出控件</b> --
- <b>Remaining States</b>: 拼接后的所有状态及参数。

## 参数 (Arguments)

> [!NOTE] CSM 消息关键字
> 包括: '->','->|','-@','-&','<-", "\r", "\n", "//", ">>", ">>>", ">>>>", ";", ","
>

> [!NOTE] CSM HEXSTR 格式参数
> 为了在 CSM 参数中传递任何数据类型，CSM 默认提供了一种 名为 HEXSTR 的参数格式，用于传递任何数据类型。
> HEXSTR：将 LabVIEW 任意数据类型转换为变体，然后将此变体的内存格式表示为十六进制字符串，以便在 CSM 参数中传递。
> HEXSTR可以安全地用作状态参数，而不会破坏 CSM 消息字符串的解析。
>

> [!NOTE] CSM ERROR 参数
> LabVIEW 错误簇信息通常包含回车，并且可能包含 CSM 的消息关键字，因此它通常不能直接作为 CSM 参数传递。
> 虽然可以将错误簇信息转换为 HEXSTR 格式，但是它并不具备可读性，在 log 中不能直观的读取信息。
> 因此为了在 CSM 参数中传递 LabVIEW 错误信息, 提供了一个标准的 CSM 错误参数格式。可以安全地用作状态参数，而不会破坏 CSM 消息字符串的解析。
> 它的格式为: "[Error: error-code] error-description-As-safe-argument-string"
>

### CSM - Keywords.vi

CSM 消息中的关键字列表。

> Ref: CSM 消息关键字

-- <b>输出控件</b> --
- <b>keywords</b>: CSM 关键字列表
- <b>keywords(%Hex format)</b>: CSM 关键字列表的%Hex格式

### CSM - Make String Arguments Safe.vi

将参数字符串中的 CSM 关键字转换为%Hex格式, 保证不影响 CSM 消息字符串解析。

> Ref: CSM 消息关键字

-- <b>输入控件</b> --
- <b>Argument String</b>: 字符串参数

-- <b>输出控件</b> --
- <b>Safe Argument String</b>: 安全的字符串参数

### CSM - Revert Arguments-Safe String.vi

将安全的字符串参数中的 %Hex格式的 CSM 关键字转换回普通格式。

> Ref: CSM 消息关键字

-- <b>输入控件</b> --
- <b>Safe Argument String</b>:  安全的字符串参数

-- <b>输出控件</b> --
- <b>Origin Argument String</b>: 字符串参数

### CSM - Convert Data to HexStr.vi

将 LabVIEW 任意数据类型转换为为 HEXSTR 格式参数字符串。

> Ref: CSM HEXSTR 格式参数

-- <b>输入控件</b> --
- <b>Variant</b>: LabVIEW 数据，通过变体支持任意数据类型

-- <b>输出控件</b> --
- <b>HEXSTR</b>: CSM HEXSTR 格式参数

### CSM - Convert HexStr to Data.vi

将十六进制字符串参数转换回变体数据。

> Ref: CSM HEXSTR 格式参数

-- <b>输入控件</b> --
- <b>HEXSTR</b>: CSM HEXSTR 格式参数

-- <b>输出控件</b> --
- <b>Variant</b>: LabVIEW 数据，通过变体支持任意数据类型

### CSM - Convert Error to Argument.vi

将 LabVIEW 错误簇转换为 CSM 错误参数格式。

> Ref: CSM ERROR 参数

-- <b>输入控件</b> --
- <b>error</b>: LabVIEW 错误簇

-- <b>输出控件</b> --
- <b>Argument</b>: CSM 错误参数格式

### CSM - Convert Argument to Error.vi

将 CSM 错误参数格式转换为 LabVIEW 错误簇。

> Ref: CSM ERROR 参数

-- <b>输入控件</b> --
- <b>Argument</b>: CSM 错误参数格式

-- <b>输出控件</b> --
- <b>error</b>: LabVIEW 错误簇

## 管理接口(Management API)

> [!NOTE] CSM 工作模式
> 1. Stand-alone: 独立工作模式。不输入模块名称，将自动生成一个随机ID, 用于标识模块。
> 2. CSM: 普通 CSM 模块。
> 3. Action Worker: 工作者模式。在模块名称后添加“#”，以标记此模块为工作者，其与具有相同名称的其他工作者共享相同的消息队列。
> 4. Chain Node: 链式节点。在模块名称后添加“$”，以标记此模块为链式节点，同一个链上的消息，将依次传递，直到某个节点处理消息。
>

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

### CSM - Get New State Notifier Event.vi

获取用户事件句柄。用在包含事件结构的 CSM 模块中。包含事件结构的 CSM 模块，通常都在事件结构处等待，这个事件用于收到新的消息时中断在事件结构中的等待，继续执行。

-- <b>输入控件</b> --
- <b>Name("" to use uuid) in</b>: CSM 模块名称

-- <b>输出控件</b> --
- <b>New State Notifier Event</b>: 用户事件句柄，用来当收到消息时，使用CSM模块中断在事件结构中的等待

## 外部操作接口(External API)

### CSM - Wait for Module to Be Alive.vi

在指定的超时时间内等待 CSM 模块上线。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称
- <b>Wait(5000ms)</b>: 等待超时时间，默认为5s

-- <b>输出控件</b> --
- <b>CSM Name(dup)</b>: CSM 模块名称
- <b>Waited(ms)</b>: 已等待的时间

### CSM - Wait for All Modules to be Alive.vi

在指定的超时时间内等待一组 CSM 模块全部上线。

-- <b>输入控件</b> --
- <b>CSM Names</b>: CSM 模块名称
- <b>Timeout(5000ms)</b>: 等待超时时间，默认为5s

-- <b>输出控件</b> --
- <b>CSMs Left</b>: 超时后还未上线的 CSM 模块
- <b>waited(ms)</b>: 已等待的时间

### CSM - Wait for All Modules to Exit.vi

在指定的超时时间内等待一组 CSM 模块全部下线，通常用于程序退出。

-- <b>输入控件</b> --
- <b>CSM Names</b>: CSM 模块名称
- <b>Timeout(5000ms)</b>: 等待超时时间，默认为5s

-- <b>输出控件</b> --
- <b>CSMs Left</b>: 超时后还未下线的 CSM 模块
- <b>waited(ms)</b>: 已等待的时间

### CSM - Post Message.vi

发送不带返回的异步消息到CSM，消息发送后继续执行之后的代码。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称
- <b>State</b>: 消息字符串
- <b>Arguments("")</b>: 消息参数
- <b>Current Module("" to generate a ID)</b>:当前模块名称，当没有输入时，生成一个临时ID，便于调试判断位置。

### CSM - Wait and Post Message.vi

发送不带返回的异步消息到CSM，消息发送后继续执行之后的代码。CSM模块未上线时，会等待指定的时间。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称
- <b>State</b>: 消息字符串
- <b>Arguments("")</b>: 消息参数
- <b>Current Module("" to generate a ID)</b>: 当前模块名称，当没有输入时，生成一个临时ID，便于调试判断位置。
- <b>Wait(5000ms)</b>: 等待超时时间，默认为5s

### CSM - Send Message and Wait for Reply.vi

发送同步消息到CSM，等待返回消息。超时未获取到返回消息，将返回超时错误。

-- <b>输入控件</b> --
- <b>Target Module</b>: 目标 CSM 模块名称
- <b>State</b>: 消息字符串
- <b>Arguments("")</b>: 消息参数
- <b>Response Timeout(5000ms)</b>: 等待返回的超时设置，默认 5000ms.

-- <b>输出控件</b> --
- <b>Response</b>: 返回的响应

### CSM - Wait and Send Message for Reply.vi

发送同步消息到CSM，等待返回消息。超时未获取到返回消息，将返回超时错误。CSM模块未上线时，会等待指定的时间。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称
- <b>State</b>: 消息字符串
- <b>Arguments("")</b>: 消息参数
- <b>Response Timeout(5000ms)</b>: 等待返回的超时设置，默认 5000ms.
- <b>Current Module("" to generate a ID)</b>: 当前模块名称，当没有输入时，生成一个临时ID，便于调试判断位置。
- <b>Wait(5000ms)</b>: 等待超时时间，默认为5s

-- <b>输出控件</b> --
- <b>Response</b>: 返回的响应
- <b>Source CSM</b>: 返回的响应的来源 CSM 模块名称

### CSM - Run Script.vi

运行 CSM 脚本。可以一次性的执行多条消息指令。

-- <b>输入控件</b> --
- <b>CSM Scripts</b>: 待运行的脚本
- <b>Response Timeout(5000ms)</b>: 等待返回的超时设置，默认 5000ms.
- <b>Continue If Error?(F)</b>: 发生错误是是否继续执行
- <b>Current Module("" to generate a ID)</b>: 当前模块名称，当没有输入时，生成一个临时ID，便于调试判断位置。
- <b>Wait(5000ms)</b>: 等待超时时间，默认为5s

-- <b>输出控件</b> --
- <b>Scripts Left</b>: 剩余未执行的脚本

### CSM - Status Change Event

获取 CSM 状态更改事件句柄。

-- <b>输入控件</b> --
- <b>CSM Module</b>: CSM 模块名称

-- <b>输出控件</b> --
- <b>Status Change Event</b>: CSM 状态更改事件句柄

### CSM - Destroy Status Change Event.vi

释放 CSM 状态更改事件句柄。

-- <b>输入控件</b> --
- <b>Status Change Event</b>: CSM 状态更改事件句柄

### CSM - Module Exit Event.vi

获取 CSM 模块退出事件句柄

-- <b>输入控件</b> --
- <b>CSM Module</b>: CSM 模块名称

-- <b>输出控件</b> --
- <b>CSM Exit Event</b>: CSM 模块退出事件句柄

## 状态订阅管理(Status Registration)

### CSM - Register Status Change.vi

注册以接收其他CSM模块状态更改的通知。如果未连接 “Response Message” 或输入为空，则将使用相同的<b>Status</b> 名称作为响应消息。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称.
- <b>Source CSM Name ('*' as Default)</b>: 生成状态的CSM模块。您可以使用“*”来表示所有生成相同状态的模块。
- <b>Status</b>: 状态字符串
- <b>API (if "", same as Status)</b>: 注册后，如果状态发生变化，将接收到此消息。
- <b>Priority(T:As Status,F:As Interrupt)</b>: 如果响应消息为False，则将其插入到状态队列的前面；否则，将其附加到队列的尾部。

-- <b>输出控件</b> --
- <b>CSM Name(dup)</b>: 返回 <b>CSM Name</b>

### CSM - Unregister Status Change.vi

取消注册其他 CSM 模块状态更改的通知。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称.
- <b>Source CSM Name</b>: 生成状态的CSM模块。您可以使用“*”来表示所有生成相同状态的模块。
- <b>Status</b>: 状态字符串

-- <b>输出控件</b> --
- <b>CSM Name(dup)</b>: 返回 <b>CSM Name</b>

### CSM - List All Status Registration.vi

-- <b>输出控件</b> --
- <b>Status Array</b>:

### CSM - List Mapping Relationships in Broadcast Registry.vi

-- <b>输出控件</b> --
- <b>Mapping Relationships</b>:

### CSM - List Rules in Broadcast Registry.vi

-- <b>输出控件</b> --
- <b>Rules</b>:

### CSM - List Status in Broadcast Registry.vi

-- <b>输出控件</b> --
- <b>Status in Registry</b>:

### CSM - Check Mapping Relationship in Broadcast Registry.vi

-- <b>输入控件</b> --
- <b>CSM Name</b>:
- <b>Broadcast state</b>:

-- <b>输出控件</b> --
- <b>Array</b>:

### CSM - Check Status Registration.vi

-- <b>输入控件</b> --
- <b>CSM Name</b>:
- <b>Broadcast state</b>:

-- <b>输出控件</b> --
- <b>Array</b>:

## 全局日志功能(Global Log)

### CSM - Global Log Event.vi

获取 CSM 全局状态用户事件句柄

-- <b>输出控件</b> --
- <b>CSM Global Log Event</b>: CSM 全局状态用户事件句柄

### CSM - Destroy Global Log Event.vi

释放 CSM 全局状态用户事件句柄

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

-- <b>输入控件</b> --
- <b>Place("" to use VI's Name)</b>:
- <b>Clear Error(T)</b>:

### CSM - Set Log Filter Rules.vi

### CSM - List Log Filter Rules As Strings.vi

-- <b>输出控件</b> --
- <b>Rule Strings</b>:

### CSM - Convert Filter Rules.vi

### CSM - Filter Global Log.vi

## 工作者模式 (Work Mode API)

> [!NOTE] CSM 工作者模式(worker mode)
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
> //申请模块名称为 module#, module 是 Worker Agent名称，实例化 4 个实例，这四个实例的名字可能为：
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

> [!NOTE] 名称拼接API
> 这个 VI 只操作了模块名称字符串，并没有实际功能，因此当熟悉 CSM 规则后，可以直接输入对应的名称字符串和规则符号，不是必须调用此API.
>

### CSM - Mark As Worker Module.vi

在CSM名称后添加“#”，以标记此模块工作在工作者模式下。

> Ref: 名称拼接API
> Ref: CSM 工作者模式(worker mode)

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称

-- <b>输出控件</b> --
- <b>CSM Name(marked as worker)</b>: 添加“#”标记的CSM模块名称

## 责任链模式 (Chain of Responsibility API)

### CSM - Mark As Chain Module.vi

[!WARNING] 此组功能还未完全验证过，请谨慎使用。

> Ref: 名称拼接API

-- <b>输入控件</b> --
- <b>CSM Name</b>:  CSM 模块名称
- <b>Order</b>:  责任链模式下的顺序

-- <b>输出控件</b> --
- <b>CSM Name(marked as Chain)</b>:添加“$”标记的CSM模块名称

## 旁路循环支持(Side-Loop Support)

### CSM - Request CSM to Post Message.vi

申请 CSM 发送消息。通常用于和CSM并行的功能循环，这些功能循环和 CSM 一起完成完整模块功能。

-- <b>输入控件</b> --
- <b>Module Name</b>:发送状态的CSM
- <b>Status</b>: 将被广播的状态
- <b>Arguments ("")</b>: 将被广播的状态参数
- <b>Target Module</b>:目标模块

### CSM - Request CSM to Broadcast Status Change.vi

申请 CSM 发布状态。通常用于和CSM并行的功能循环，这些功能循环和 CSM 一起完成完整模块功能。

-- <b>输入控件</b> --
- <b>Module Name</b>:发送状态的CSM
- <b>Status</b>: 将被广播的状态
- <b>Arguments ("")</b>: 将被广播的状态参数
- <b>Broadcast(T)</b>: 控制是否广播的开关输入

### CSM - Module Turns Invalid.vi

检查CSM是否已经退出。通常用于和CSM并行的功能循环，这些功能循环和 CSM 一起完成完整模块功能。 本VI用于并行循环的退出条件。

-- <b>输入控件</b> --
- <b>CSM Name</b>: 模块名称

-- <b>输出控件</b> --
- <b>Turn Invalid(Exit)?</b>: 是否已经退出

## 工具VI(Utility VIs)

### CSM - Compact Multiple States.vi

将多个状态紧凑成单个字符串以供输入使用

-- <b>输入控件</b> --
- <b>Multiple States</b>: CSM状态字符串数组

-- <b>输出控件</b> --
- <b>States</b>: 包含多行CSM状态字符串的字符串

### CSM - Break Down Multiple States String.vi

将包含多行CSM状态字符串的字符串切割成CSM状态字符串数组

-- <b>输入控件</b> --
- <b>States</b>: 包含多行CSM状态字符串的字符串

-- <b>输出控件</b> --
- <b>Multiple States</b>: CSM状态字符串数组

### CSM - Build Exit Messages of CSMs.vi

输入CSM模块名称，拼接生成退出消息("Macro: Exit")。

> Ref: 消息拼接API

-- <b>输入控件</b> --
- <b>CSMs</b>: CSM模块名称数组
- <b>State with Arguments("Macro: Exit“)</b>: 退出消息

-- <b>输出控件</b> --
- <b>States</b>: 拼接生成的CSM消息字符串

### CSM - Filter Duplicate Messages By Name.vi

过滤重复的消息，只保留最新的消息。

> Ref: 消息拼接API

-- <b>输入控件</b> --
- <b>States</b>: 输入的消息字符串
- <b>Whole Messages in Check?(T)</b>: 是否检查整个消息字符串。如果是 FALSE，则只检查消息名称。

-- <b>输出控件</b> --
- <b>Filtered States</b>: 过滤后的消息字符串

### CSM - Filter Messages to Non-Existing Modules.vi

过滤发送给不存在的模块的消息。
这个VI中会使用 CSM - List Modules.vi 获取所有活动的CSM模块，然后过滤掉发送给不存在模块的消息。

-- <b>输入控件</b> --
- <b>States</b>: 输入的消息字符串

-- <b>输出控件</b> --
- <b>Filtered States</b>: 过滤后的消息字符串

### CSM - Remove Duplicated Following Messages.vi

-- <b>输入控件</b> --
- <b>Current State</b>:
- <b>Remaining States</b>:

-- <b>输出控件</b> --
- <b>Remaining States Left</b>:

### CSM Data Type String to Enum.vi

### CSM Data Type String.vi

-- <b>输入控件</b> --
- <b>Data</b>:

-- <b>输出控件</b> --
- <b>Data Type String</b>:

### Replace Tag with Array.vi

-- <b>输入控件</b> --
- <b>Enum</b>:
- <b>replace string</b>:
- <b>single-line text</b>:

-- <b>输出控件</b> --
- <b>States</b>:

### CSM Data Type String to Enum(RefnumEnum).vi

-- <b>输入控件</b> --
- <b>Data Type String</b>:

-- <b>输出控件</b> --
- <b>Array Dim</b>:
- <b>Secondary Type</b>:
- <b>Primary Type</b>:

### CSM Data Type String to Enum(String).vi

-- <b>输入控件</b> --
- <b>Data Type String</b>:

-- <b>输出控件</b> --
- <b>Array Dim</b>:
- <b>Secondary Type String</b>:
- <b>Primary Type</b>:

### CSM Data Type String to Enum(TypeEnum).vi

-- <b>输入控件</b> --
- <b>Data Type String</b>:

-- <b>输出控件</b> --
- <b>Array Dim</b>:
- <b>Secondary Type</b>:
- <b>Primary Type</b>:

### Build Error Cluster.vi

创建一个错误簇(error cluster)，以标准 LabVIEW 的方式从调用 VI 的调用链中构建源字符串。构建的源字符串形式为：
"<B>调用的 VI</B> 在 <B>调用 VI 的调用者</B>-><B>调用 VI 的调用者的调用者</B>->等等...->等等..."
可选的 'String to Prepend to source ("")' 字符串输入可用于在源字符串中添加额外的描述信息。如果存在这个字符串，它将用括号括起来，并添加到源字符串之前。

-- <b>输入控件</b> --
- <b>code</b>: 错误码
- <b>String to Prepend to source ("")</b>: 错误信息字符串

### Build Internal State String.vi

构建包含 JKI 状态机状态、参数等信息的字符串。

-- <b>输入控件</b> --s
- <b>State</b>: 状态字符串
- <b>Arguments ("")</b>: <b>State</b>的参数
- <b>Arg-State ("")</b>: 发送此消息的模块在发送此消息时处于的状态
- <b>Source ("")</b>: 发送此消息的模块名称

-- <b>输出控件</b> --
- <b>CSM Message String</b>: 拼接生成的 CSM 消息字符串

### String History Cacher.vi

保存当前输入的字符串到缓存，缓存的历史字符串，当超出最大长度限制时，最先进入的缓存字符串将被覆盖。用于调试CSM的历史状态。

-- <b>输入控件</b> --
- <b>String</b>: 待缓存字符串
- <b>length</b>: 缓存的历史字符串最大字符串长度
- <b>Include Timestamp(F)</b>: 是否在每行开头包含时间戳。

-- <b>输出控件</b> --
- <b>String Cache</b>: 缓存的历史字符串

### Timeout Selector.vi

用于包含用户事件结构的模板中

-- <b>输入控件</b> --
- <b>Timeout Expected</b>: 预期的超时设置
- <b>Remaining States</b>: 如果还有剩余的状态，输出将为 0，否则输出为预期值

-- <b>输出控件</b> --
- <b>Timeout</b>: 仲裁后使用的超时设置

### Trim Both Whitespace.vi

开头、结尾或两者同时移除所有 ASCII 空白字符(空格、制表符、回车和换行)。

-- <b>输入控件</b> --
- <b>string</b>: 待处理字符串

-- <b>输出控件</b> --
- <b>trimmed string</b>: 处理后的字符串

### uuid.vi

根据标准方法生成 <b>Universally Unique Identifier(UUID)</b>。 例如:
- 59703F3AD837
- 106A470BA5EC
- 9B781DB313AF

-- <b>输出控件</b> --
- <b>UUID</b>: 生成的 UUID

### Random Change Flag.vi

生成一个随机的数值，用于标记状态的变化，CSM中为了提高效率，有些地方的缓存(cache)利用这个标记来判断是否需要更新。

-- <b>输出控件</b> --
- <b>Random Change Flag</b>: 生成的随机数值

### Global Log To String.vi

全局日志(Global Log)数据簇转换为字符串。

-- <b>输入控件</b> --
- <b>Log</b>: 全局日志数据簇

-- <b>输出控件</b> --
- <b>Log String</b>: 全局日志字符串

## Build-in Addons

### CSM WatchDog

> [!NOTE] CSM WatchDog 实现的原理
> LabVIEW VI 退出时，会自动释放所有队列、事件等句柄资源。因此，我们可以通过创建一个 WatchDog 线程，监控一个由主程序VI申请创建的队列资源，当这个队列资源在主VI退出后被释放时，触发 WatchDog 线程给还未退出的 CSM 模块发送 "Macro: Exit"，保证他们正常的退出。
>

#### CSM - Start Watchdog to Ensure All Modules Exit.vi

启动CSM Watchdog 线程，用于保证在主程序退出后，所有的异步启动的 CSM 模块都能正常退出。

> Ref: CSM WatchDog 实现的原理

#### CSM Watchdog Thread.vi

CSM Watchdog 线程，用于保证在主程序退出后，所有的异步启动的 CSM 模块都能正常退出。

> Ref: CSM WatchDog 实现的原理

-- <b>输入控件</b> --
- <b>WatchdogQ</b>: Watchdog 队列资源，

### CSM File Logger

> CSM File Logger 实现的原理
> 通过订阅 CSM 的 Global Log Event 事件，可以将应用中的全部 CSM 活动信息记录下来，用于后期分析和错误定位。
> 文件为文本文件，后缀名为 .csmlog，可以通过记事本等文本编辑查询工具打开。
>

#### CSM - Start File Logger.vi

启动 CSM 事件文件记录功能。

> Ref: CSM File Logger 实现的原理

-- <b>输入控件</b> --
- <b>Log File Path</b>: 记录文件路径
- <b>Enable? (T)</b>: 是否启用
- <b>log limit</b>: 记录文件限制
- <b>Timestamp format</b>: 时间格式
- <b>WatchDog? (T)</b>: 是否启用 WatchDog
- <b>Filter Rules</b>: 时间过滤规则
- <b>Exit When All Module Exist?(F)</b>: CSM 全部模块退出后是否退出

-- <b>输出控件</b> --
- <b>LogFile</b>:
- <b>WatchDogQueue</b>:

#### CSM-Logger-Thread.vi

启动 CSM Global Log 文件记录线程VI。

> Ref: CSM File Logger 实现的原理

-- <b>输入控件</b> --
- <b>Log File Path</b>: 记录文件路径
- <b>log limit</b>: 记录文件限制
- <b>Timestamp format</b>: 时间格式
- <b>WatchDogQ</b>: WatchDog资源，用于检测主程序是否退出
- <b>GlobalLogFilter.lvclass</b>: 事件过滤器对象
- <b>Exit When All Module Exist?(F)</b>: CSM 全部模块退出后是否退出

### CSM Loop Support

#### CSMLS - Add Exit State(s) with Loop Check.vi

-- <b>输入控件</b> --
- <b>States Out in</b>:
- <b>Remaining States</b>:

-- <b>输出控件</b> --
- <b>States Out out</b>:

#### CSMLS - Append Continuous State.vi

-- <b>输入控件</b> --
- <b>Loop State(s) and Arguments</b>: This allows you to place new states in the front of the state machine queue. The default is an empty string.
- <b>Append(T)</b>:
- <b>Continuous Arguments ("")</b>:
- <b>Continuous State</b>:The State string that requires the argument.
- <b>Remaining States</b>:

-- <b>输出控件</b> --
- <b>States Out</b>:

#### CSMLS - Define Loop State(s).vi

-- <b>输入控件</b> --
- <b>States Out in</b>:
- <b>Remaining States</b>:

-- <b>输出控件</b> --
- <b>States Out out</b>:

#### CSMLS - Remove Loop Tag and previous State(s) to Break.vi

-- <b>输入控件</b> --
- <b>Remaining States</b>:

-- <b>输出控件</b> --
- <b>States</b>:

#### CSMLS - Remove Loop Tag to Break.vi

-- <b>输入控件</b> --
- <b>Remaining States</b>:

-- <b>输出控件</b> --
- <b>States</b>:

## CSM-Helper API

### CSM-Helper API.vi

### CSM-Helper usecase Template.vit

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### _Add VI Reference Case.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入
- <b>element</b>:
- <b>Add Frame</b>:

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect Information.vi

-- <b>输入控件</b> --
- <b>Case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出
- <b>Backend Connected Info</b>:
- <b>FrontEnd Connected Info</b>:

### Diagram Node Information.vi

-- <b>输入控件</b> --
- <b>InnerTerminal in</b>:
- <b>Array in</b>:
- <b>Front Tunnels</b>:

-- <b>输出控件</b> --
- <b>Array</b>:
- <b>Array out</b>:

### Get Argument Info From back Term.vi

-- <b>输入控件</b> --
- <b>Terminal in</b>:

-- <b>输出控件</b> --
- <b>Array</b>:

### Get Argument Info From Front Term.vi

-- <b>输入控件</b> --
- <b>Terminal in</b>:

-- <b>输出控件</b> --
- <b>Array</b>:

### GObject Terminals.vi

-- <b>输入控件</b> --
- <b>GObject in</b>:

-- <b>输出控件</b> --
- <b>error in (no error) (dup)</b>:
- <b>Class Name</b>:
- <b>Terms[]</b>:
- <b>Node Object</b>:
- <b>tunnel Relative Pos</b>:

### Relative Pos to InterData Tunnel of CaseContent.vi

-- <b>输入控件</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Position</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Resize CaseStructure By Making Space.vi

-- <b>输入控件</b> --
- <b>Bounds</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>DiffBound</b>:
- <b>MakeSpace.Rect</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Search With Pattern.vi

-- <b>输入控件</b> --
- <b>regular expression</b>:
- <b>Array</b>:

-- <b>输出控件</b> --
- <b>Numeric</b>:

### sub1.vi

-- <b>输入控件</b> --
- <b>Part References.Parse State Queue</b>:
- <b>regular expression</b>:
- <b>Array</b>:

-- <b>输出控件</b> --
- <b>Tunnel out</b>:

### sub2.vi

-- <b>输入控件</b> --
- <b>Part References.Parse State Queue</b>:
- <b>regular expression</b>:
- <b>Array</b>:

-- <b>输出控件</b> --
- <b>Tunnel out</b>:

### Refresh References.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get ParentRef Until Type Matched.vi

-- <b>输入控件</b> --
- <b>Class Name</b>:
- <b>reference in</b>:

-- <b>输出控件</b> --
- <b>Target Ref</b>:

### Is in JKISM or CSM.vi

-- <b>输入控件</b> --
- <b>reference in</b>:

-- <b>输出控件</b> --
- <b>is in JKISM or CSM?</b>:

### Relationship Check.vi

-- <b>输入控件</b> --
- <b>TestRef</b>:
- <b>reference in</b>:

-- <b>输出控件</b> --
- <b>Is TestRef</b>:
- <b>Is Child of TestRef</b>:

### Add State Frame.vi

-- <b>输入控件</b> --
- <b>index(-1, use same group)</b>:
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Add Frame</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Check NewStateNotify is Registered.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>NewStateNotify Registered</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect Error Wire If not Connected.vi

-- <b>输入控件</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect EventReg Wire If not Connected.vi

-- <b>输入控件</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect Internal Data Wire If not Connected.vi

-- <b>输入控件</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect LastResp to Response in Error Case.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect Paired Tunnels.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Connect StateQ Wire If not Connected.vi

-- <b>输入控件</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Copy State.vi

-- <b>输入控件</b> --
- <b>Already Exist Action:
Replace(T) / Skip(F)</b>:
- <b>SourceCSM</b>:
- <b>New(Empty to Use same Name)</b>:
- <b>Case</b>:
- <b>CSM-Helper.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM-Helper out 2</b>:

### Create From Basic Refs.vi

-- <b>输入控件</b> --
- <b>CSM Basic Refs</b>:

-- <b>输出控件</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From CaseStructure Reference.vi

-- <b>输入控件</b> --
- <b>CaseStructure</b>:

-- <b>输出控件</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From EventStructure Reference.vi

-- <b>输入控件</b> --
- <b>CaseStructure</b>:

-- <b>输出控件</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From VI Reference.vi

-- <b>输入控件</b> --
- <b>VI</b>:

-- <b>输出控件</b> --
- <b>CSM-Helper.lvclass</b>:

### Create From WhileLoop Reference.vi

-- <b>输入控件</b> --
- <b>Structure</b>:

-- <b>输出控件</b> --
- <b>CSM-Helper.lvclass</b>:

### Destroy.vi

-- <b>输入控件</b> --
- <b>Save Instruments?(F)</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Doc.vi

-- <b>输入控件</b> --
- <b>String 2</b>:
- <b>String</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>String 4</b>:
- <b>String 3</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get All API Interface Info.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get All Status Interface Info.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Array 3</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get CaseFrame Index By CaseName.vi

-- <b>输入控件</b> --
- <b>CASE</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>index</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get CaseFrame Reference By CaseName.vi

-- <b>输入控件</b> --
- <b>CASE</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Frame Refs</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get Event Structure Num.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>EvtStrutNum</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get Interface Info.vi

-- <b>输入控件</b> --
- <b>CASE</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Response</b>:
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Get Internal Data Info.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Open Block Diagram.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Open Front Panel.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Remove State Frame.vi

-- <b>输入控件</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Save Instrument.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Set Error Tunnel Use Default If not Connected.vi

-- <b>输入控件</b> --
- <b>Use Default if Unwired</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Set Visible Case Frame.vi

-- <b>输入控件</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Set Wire Label Visible.vi

-- <b>输入控件</b> --
- <b>Connected Wire.Label.Visible</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Start Undo.vi

-- <b>输入控件</b> --
- <b>Name</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Stop Undo.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Undo.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read APIs.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Value</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Back Tunnel Internal TermRefs.vi

-- <b>输入控件</b> --
- <b>element</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Back Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Back Tunnels Refs.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Back Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Block Diagram Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Diagram</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Case Structure Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Case Structure</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Event Structure Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Event Structure</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Front Tunnel Internal TermRefs.vi

-- <b>输入控件</b> --
- <b>case</b>:
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Front Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Front Tunnels Refs.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Front Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read New State Notifier Event State Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>New State Notifier Event State Ref</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Paired Tunnels of Case Structure.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Paired Tunnels</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Parse State Queue Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Parse State Queue</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read States.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Value</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Timeout Event State Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>New State Notifier Event State Ref</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read Type.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Part References.Type</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read User-Defined States.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>Array</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read VI Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>VI</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Read While Loop Ref.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>While Loop</b>:
- <b>CSM-Helper out</b>: CSMHelper 输出

### Add VI Reference Case.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### Remove All CSM Bookmarks.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### standardize CSM Module.vi

-- <b>输入控件</b> --
- <b>CSM-Helper in</b>: CSMHelper 输入

-- <b>输出控件</b> --
- <b>CSM-Helper out</b>: CSMHelper 输出

### CSM Essential States.vi

-- <b>输出控件</b> --
- <b>CSM Essential States</b>:

### CSM Module Type.vi

-- <b>输入控件</b> --
- <b>CSM Basic Refs</b>:

-- <b>输出控件</b> --
- <b>CSM Basic Refs (dup)</b>:

### Is CSM Module.vi

使用最少的VI调用，判断是否是 CSM 模块，用于 LabVIEW 插件预先判断。

多态VI(Polymorphic VI)选项:
- Is CSM Module - VIRef.vi
- Is CSM Module - WhileLoop.vi
- Is CSM Module - Structure.vi
- Is CSM Module - CaseStructure.vi
- Is CSM Module - EventStructure.vi
- Is CSM Module - ParseStateVI.vi

#### Is CSM Module - VIRef.vi

通过 VIRef 判断是否是是 CSM 模块

-- <b>输入控件</b> --
- <b>VIRef</b>: VI引用

-- <b>输出控件</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

#### Is CSM Module - WhileLoop.vi

通过 While Loop 引用判断是否是 CSM 模块

-- <b>输入控件</b> --
- <b>WhileLoop</b>: While Loop 引用

-- <b>输出控件</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

#### Is CSM Module - Structure.vi

通过 Structure 引用判断是否是 CSM 模块

-- <b>输入控件</b> --
- <b>Structure</b>: Structure 引用

-- <b>输出控件</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

#### Is CSM Module - CaseStructure.vi

通过 CaseStructure 引用判断是否是 CSM 模块

-- <b>输入控件</b> --
- <b>CaseStructure</b>: CaseStructure 引用

-- <b>输出控件</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

#### Is CSM Module - EventStructure.vi

通过 EventStructure 引用判断是否是 CSM 模块

-- <b>输入控件</b> --
- <b>EventStructure</b>: EventStructure 引用

-- <b>输出控件</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

#### Is CSM Module - ParseStateVI.vi

通过 Parse State VI 引用判断是否是 CSM 模块

-- <b>输入控件</b> --
- <b>Parse State VI Ref</b>: Parse State VI 引用

-- <b>输出控件</b> --
- <b>Is CSM Module?</b>: 否是是 CSM 模块
- <b>CSM Basic Refs</b>: 如果是 CSM模块，这个簇包含了　CSM　模块的基本元素的引用

### CaseStructure - Add Frame.vi

-- <b>输入控件</b> --
- <b>Case Name</b>:
- <b>Reference Frame Index</b>:
- <b>CaseStructure in</b>:

-- <b>输出控件</b> --
- <b>Add Frame</b>:
- <b>CaseStructure out</b>:

### CaseStructure - Case Name to Group Name.vi

-- <b>输入控件</b> --
- <b>element</b>:

-- <b>输出控件</b> --
- <b>String</b>:

### CaseStructure - Check If State Exist.vi

-- <b>输入控件</b> --
- <b>Group Name</b>:
- <b>CaseStructure in</b>:

-- <b>输出控件</b> --
- <b>Numeric</b>:
- <b>CaseStructure out</b>:

### CaseStructure - Get Group Separator Case Index.vi

-- <b>输入控件</b> --
- <b>Group Name</b>:
- <b>CaseStructure in</b>:

-- <b>输出控件</b> --
- <b>Numeric</b>:
- <b>CaseStructure out</b>:

### Diagram - Connect Tunnel with Wire 2.vi

-- <b>输入控件</b> --
- <b>Wire Index</b>:
- <b>Front Tunnels</b>:
- <b>Diagram in</b>:

-- <b>输出控件</b> --
- <b>Array out</b>:
- <b>Diagram out</b>:

### Diagram - Connect Tunnel with Wire.vi

-- <b>输入控件</b> --
- <b>FrontEnd Connected Info</b>:
- <b>Front Tunnels</b>:
- <b>Diagram in</b>:

-- <b>输出控件</b> --
- <b>Array out</b>:
- <b>Diagram out</b>:

### Diagram - Get All Decoration Refs.vi

-- <b>输入控件</b> --
- <b>TopLevelDiagram in</b>:

-- <b>输出控件</b> --
- <b>TextRefs</b>:
- <b>TopLevelDiagram out</b>:

### Diagram - Get All Text Refs.vi

-- <b>输入控件</b> --
- <b>TopLevelDiagram in</b>:

-- <b>输出控件</b> --
- <b>TextRefs</b>:
- <b>TopLevelDiagram out</b>:

### PairedTunnels - Connect Wire.vi

-- <b>输入控件</b> --
- <b>index(-1 for all)</b>:
- <b>PairedTunnels</b>:

-- <b>输出控件</b> --
- <b>PairedTunnels</b>:

### Find Event Structure from Case Structure.vi

-- <b>输入控件</b> --
- <b>CaseStructure</b>:

-- <b>输出控件</b> --
- <b>EvntStruct Refnum</b>:

### Find Parse State Queue from Case Structure.vi

-- <b>输入控件</b> --
- <b>CaseStructure</b>:

-- <b>输出控件</b> --
- <b>CaseStructure</b>:
- <b>Parse State Queue</b>:

### Find Parse State Queue from Event Structure.vi

-- <b>输入控件</b> --
- <b>EvntStruct Refnum</b>:

-- <b>输出控件</b> --
- <b>CaseStructure</b>:
- <b>Parse State Queue</b>:

### Find Parse State Queue from While Loop.vi

-- <b>输入控件</b> --
- <b>WhileLoop in</b>:

-- <b>输出控件</b> --
- <b>CaseStructure</b>:
- <b>Parse State Queue</b>:
- <b>WhileLoop out</b>:

### Terminals - Filter Control Terms.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Error Terms.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Indicator Terms.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Input Term.vi

-- <b>输入控件</b> --
- <b>InnerTerminal in</b>:
- <b>Wire.Terms[] in</b>:

-- <b>输出控件</b> --
- <b>Wire.Terms[] out</b>:

### Terminals - Filter invalid Terms.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Left-Top Term.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:

### Terminals - Left-Top Term.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:

### Terminals - Lower Term.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:

### Terminals - Upper Term.vi

-- <b>输入控件</b> --
- <b>Terms[]</b>:

-- <b>输出控件</b> --
- <b>Terms[] out</b>:

## Documentation

### CSM - Copyright QuickDrop.vi

### CSM - Documentation QuickDrop.vi

### CSM - Keywords QuickDrop.vi

### CSM Dummy Module.vi

-- <b>输入控件</b> --
- <b>Init State("Macro: Initialize")</b>:
- <b>Name("" to use uuid)</b>:

## CSM Internal

### Naming Check.vi

-- <b>输入控件</b> --
- <b>Name("" to use uuid)</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters

-- <b>输出控件</b> --
- <b>Name(dup)</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters

### Check.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:
- <b>Status</b>:
- <b>Source</b>:
- <b>Target</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:
- <b>Response Message Info</b>:

### Delete Source Module.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:
- <b>Source</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:

### Delete Target Module.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:
- <b>Source</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:

### Initialize.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:

### List Entries.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:
- <b>Array</b>:

### List Status in Registry.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:
- <b>Status</b>:

### Register.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:
- <b>status</b>:
- <b>source</b>:
- <b>api</b>:
- <b>target</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:

### Remove Module.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:
- <b>Source</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:

### Unregister.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:
- <b>Status</b>:
- <b>Source</b>:
- <b>api</b>:
- <b>Target</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:

### Broadcast Item Key.vi

-- <b>输入控件</b> --
- <b>status</b>:
- <b>target</b>:
- <b>source</b>:

-- <b>输出控件</b> --
- <b>key</b>:

### Preview.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:

-- <b>输出控件</b> --
- <b>Registry</b>:
- <b>BroadcastRegistry out</b>:

### Remove response API from List.vi

-- <b>输入控件</b> --
- <b>API</b>:
- <b>output cluster in</b>:

-- <b>输出控件</b> --
- <b>output cluster out</b>:

### Concatenate State with Arguments.vi

-- <b>输入控件</b> --
- <b>Arguments</b>:
- <b>State</b>:

-- <b>输出控件</b> --
- <b>State with Arguments</b>:

### CSM-Name to CSM-Mode.vi

-- <b>输入控件</b> --
- <b>String</b>:

-- <b>输出控件</b> --
- <b>ParentCSM Name</b>:
- <b>CSM Mode</b>:
- <b>Requested Name</b>:

### Format Timestamp.vi

-- <b>输入控件</b> --
- <b>timestamp</b>:
- <b>format string</b>:

-- <b>输出控件</b> --
- <b>String</b>:

### Hex Str to U8 Data.vi

-- <b>输入控件</b> --
- <b>HEX String (0-9,A-F)</b>:

-- <b>输出控件</b> --
- <b>u8 Data[]</b>:

### Parse Next Single-line State.vi

-- <b>输入控件</b> --
- <b>States Queue</b>:

-- <b>输出控件</b> --
- <b>Next Single-line State</b>:
- <b>Remaining States Queue</b>:

### Remove Comments from Line.vi

-- <b>输入控件</b> --
- <b>single-line text</b>:

-- <b>输出控件</b> --
- <b>single-line text without comments</b>:

### Splite Reason String Part.vi

-- <b>输入控件</b> --
- <b>Single-line -& Reason</b>:

-- <b>输出控件</b> --
- <b>CSM Name</b>:
- <b>`State</b>:
- <b>`Arguments</b>:

### Splite Single-line Message.vi

-- <b>输入控件</b> --
- <b>single-line text</b>:

-- <b>输出控件</b> --
- <b>operator</b>:
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:

### Trim Single line Text.vi

-- <b>输入控件</b> --
- <b>single-line text</b>:

-- <b>输出控件</b> --
- <b>trimmed text</b>:

### U8 Data to Hex Str.vi

-- <b>输入控件</b> --
- <b>u8 Data[]</b>:

-- <b>输出控件</b> --
- <b>HEX String (0-9,A-F)</b>:

### CSM Critical Error.vi

-- <b>输入控件</b> --
- <b>Arguments(as Reason)</b>:
- <b>CSM Name</b>:

### CSM No Target Error.vi

### CSM Not Allowed Message.vi

-- <b>输入控件</b> --
- <b>State</b>:
- <b>CSM</b>:

### CSM Target Error.vi

-- <b>输入控件</b> --
- <b>Arguments(as CSM Name)</b>:

### CSM Target Timeout Error.vi

-- <b>输入控件</b> --
- <b>Arguments(as CSM Name)</b>:

### CSM Unhandled State Error.vi

-- <b>输入控件</b> --
- <b>Current State</b>:
- <b>CSM Name</b>:

### Cache-Broadcast Registry Search Result.vi

-- <b>输入控件</b> --
- <b>CSM Name</b>:
- <b>Broadcast state</b>:

-- <b>输出控件</b> --
- <b>Array</b>:

### FGV-BroadcastRegistry.vi

-- <b>输入控件</b> --
- <b>Source</b>:
- <b>Target</b>:
- <b>Status</b>:
- <b>API</b>:
- <b>Operation</b>:

-- <b>输出控件</b> --
- <b>response message</b>:

### global-Broadcast Cache Change Flag.vi

全局变量，用于标记广播缓存是否发生变化

### global-CSMQ FGV Change Flag.vi

全局变量，用于标记 CSM 模块管理信息是否发生变化

### global-GEvnt Filter Change Flag.vi

全局变量，用于标记 Global Event 的过滤条件是否发生变化

### Cache-GEvt Filter Object.vi

-- <b>输出控件</b> --
- <b>CSM:LogFilter.lvclass</b>:

### FGV-GEvt Filter Obj.vi

-- <b>输入控件</b> --
- <b>Set(T)/Get(F)</b>:
- <b>Rules-v1</b>:

-- <b>输出控件</b> --
- <b>CSM:LogFilter.lvclass</b>:

### FGV-GlobalEventRef.vi

-- <b>输入控件</b> --
- <b>Create(F)</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event</b>:

### FGV-StatusChangeEventRef.vi

-- <b>输入控件</b> --
- <b>Name("" to use uuid) in</b>:

-- <b>输出控件</b> --
- <b>Status Change Event</b>:

### GEvt-BackgroundThread.vi

### GEvt-Convert Filter Rules - v1.0.vi

-- <b>输入控件</b> --
- <b>Rules-v1</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter</b>:

### GEvt-Filter Global Log - v1.0.vi

-- <b>输入控件</b> --
- <b>Rules-v1</b>:
- <b>Cross CSM Data (in)</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:

### GEvt-Generate Complete Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>event data</b>:
- <b>Enable?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:

### GEvt-Generate Interrupt Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Module Created Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Name("" to use uuid)</b>:
- <b>Created?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Module Destroyed Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Name("" to use uuid)</b>:
- <b>Enable?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Register Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Remaining States Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Remaining States</b>:
- <b>Name("" to use uuid)</b>:
- <b>Enable?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate State Change Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Source Message.*State</b>:
- <b>Source Message.*Arguments</b>:
- <b>Source Module</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Status Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Unregister Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate with Rule Check.vi

-- <b>输入控件</b> --
- <b>LogFilter in</b>:
- <b>event data</b>:
- <b>CSM Global Log Event in</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:

### GEvt-Set Source Filter Rules - v1.0.vi

-- <b>输入控件</b> --
- <b>Rules-v1</b>:

### GEvt-ThreadQueueName.vi

-- <b>输出控件</b> --
- <b>ThreadQueueName</b>:

### GEvt-WatchdogThread.vi

-- <b>输入控件</b> --
- <b>WatchDogQ</b>:

### Filter Check.vi

-- <b>输入控件</b> --
- <b>Cross CSM Data in</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data out</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### List Rules as Strings.vi

-- <b>输入控件</b> --
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>Rule Strings</b>:
- <b>GlobalLogFilter out</b>:

### CSM Check - LogType.vi

-- <b>输入控件</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### CSM Check - State.vi

-- <b>输入控件</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### CSM Check - StateType.vi

-- <b>输入控件</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - CSM.vi

-- <b>输入控件</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - LogType.vi

-- <b>输入控件</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - State.vi

-- <b>输入控件</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - StateType.vi

-- <b>输入控件</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Set CSM LogType Filter.vi

-- <b>输入控件</b> --
- <b>LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter out</b>:

### Set CSM State Filter.vi

-- <b>输入控件</b> --
- <b>CSM:State</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter out</b>:

### Set CSM StateType Filter.vi

-- <b>输入控件</b> --
- <b>LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter out</b>:

### Set Global CSM Filter.vi

-- <b>输入控件</b> --
- <b>Group:CSM</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter out</b>:

### Set Global LogType Filter.vi

-- <b>输入控件</b> --
- <b>Group:LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter out</b>:

### Set Global State Filter.vi

-- <b>输入控件</b> --
- <b>Group:State</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter out</b>:

### Set Global StateType Filter.vi

-- <b>输入控件</b> --
- <b>Group:LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter out</b>:

### Log State Type.vi

-- <b>输入控件</b> --
- <b>Complete(T)/Start(F)</b>:
- <b>Source Module</b>:
- <b>‘State</b>:

-- <b>输出控件</b> --
- <b>CSM_GlobalLog_STATE_TYPE</b>:

### Parse Register Message.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>Module Name </b>:
- <b>args</b>:

-- <b>输出控件</b> --
- <b>target</b>:
- <b>source</b>:
- <b>status</b>:
- <b>api</b>:

### Parse State with Arguments String.vi

-- <b>输入控件</b> --
- <b>State with Arguments</b>:
The State string that requires the argument.

-- <b>输出控件</b> --
- <b>State</b>:
- <b>Arguments</b>:
- <b>Target Module</b>:
- <b>Message Symbol</b>:

### Parse Unregister Message.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>Module Name </b>:
- <b>args</b>:

-- <b>输出控件</b> --
- <b>target</b>:
- <b>source</b>:
- <b>status</b>:
- <b>api</b>:

### Dequeue Element.vi

-- <b>输入控件</b> --
- <b>timeout in ms (-1)</b>:
- <b>Priority Queue</b>:

-- <b>输出控件</b> --
- <b>timed out?</b>:
- <b>Cross JKI State Machine State</b>:
- <b>Priority Queue(dup)</b>:
- <b>High Priority?</b>:

### Enqueue Element.vi

-- <b>输入控件</b> --
- <b>High Priority?(F)</b>:
- <b>timeout in ms (-1)</b>:
- <b>Cross JKI State Machine State</b>:
- <b>Priority Queue</b>:

-- <b>输出控件</b> --
- <b>Priority Queue(dup)</b>:

### Get Queue Status.vi

-- <b>输入控件</b> --
- <b>Priority Queue in</b>:

-- <b>输出控件</b> --
- <b># pending insert</b>:
- <b># pending remove</b>:
- <b>Priority Queue out</b>:
- <b># elements in queue</b>:

### Not a Refnum.vi

-- <b>输入控件</b> --
- <b>Priority Queue.lvclass</b>:

-- <b>输出控件</b> --
- <b>NaN/Path/Refnum?</b>:

### Obtain Priority Queue.vi

-- <b>输入控件</b> --
- <b>create if not found? (T)</b>:
- <b>name</b>:

-- <b>输出控件</b> --
- <b>created new?</b>:
- <b>Priority Queue</b>:

### Release Priority Queue.vi

-- <b>输入控件</b> --
- <b>force destroy? (F)</b>:
- <b>Priority Queue</b>:

### CSMP-Async Call.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:
- <b>Msg Type</b>:

-- <b>输出控件</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-Broadcast.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:
- <b>Msg Type</b>:

-- <b>输出控件</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-PostPostMsg.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Pre-State in</b>:
- <b>Pre-Args in</b>:
- <b>session error</b>:
- <b>Module Name</b>:
- <b>Response Arguments</b>:

-- <b>输出控件</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-PostSendMsg.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>session error</b>:
- <b>Module Name</b>:
- <b>Response Arguments</b>:

-- <b>输出控件</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>error</b>:

### CSMP-Register Status.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:

-- <b>输出控件</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-Sync Call.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Response Timeout(5000ms)</b>:
- <b>Module Name</b>:

-- <b>输出控件</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-Unregister Status.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:

-- <b>输出控件</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSM - Add VI Reference Case to CSMs.vi

### CSM - Debug Console - DebugTool.vi

### CSM - Remove all CSM Bookmarks.vi

### CSM - Running Log - DebugTool.vi

### CSM - State Dashboard - DebugTool.vi

### CSM - State Table - DebugTool.vi

### CSM - Switch Language Tool.vi

### Autosize All MultiListbox Columns (Uniform Text).vi

-- <b>输入控件</b> --
- <b>IgnoreCols(Empty as default)</b>:
- <b>Array</b>:
- <b>Control in</b>:

### Dashboard Cell Resize.vi

-- <b>输入控件</b> --
- <b>Cluster</b>:
- <b>Cluster Size:Height</b>:
- <b>Cluster Size:Width</b>:
- <b>引气压力P4 4</b>:

-- <b>输出控件</b> --
- <b>Bounds:Area Height</b>:
- <b>Bounds:Area Width</b>:

### Dashboard Cell2 Array Resize.vi

-- <b>输入控件</b> --
- <b>Num Columns</b>:
- <b>Cluster</b>:
- <b>Num Rows</b>:
- <b>area height</b>:
- <b>area width</b>:
- <b>Array 2</b>:

### Open CSM BD.vi

-- <b>输入控件</b> --
- <b>Current Module("" to generate a ID)</b>:
- <b>CSM</b>:

### Open CSM FP.vi

-- <b>输入控件</b> --
- <b>Current Module("" to generate a ID)</b>:
- <b>CSM</b>:

### Select Greater_nevstop.vi

-- <b>输入控件</b> --
- <b>A</b>:
- <b>B</b>:

-- <b>输出控件</b> --
- <b>lesser</b>:

### Append Application Directory If Relative.vi

-- <b>输入控件</b> --
- <b>Relative path (.)</b>:

-- <b>输出控件</b> --
- <b>Application Directory (+ Relative)</b>:

### Convert File Extension (Path)__ogtk.vi

-- <b>输入控件</b> --
- <b>new ending (none)</b>:
- <b>file name</b>:

-- <b>输出控件</b> --
- <b>prev ending</b>:
- <b>new filename</b>:

### Convert File Extension (String)__ogtk.vi

-- <b>输入控件</b> --
- <b>new ending (none)</b>:
- <b>file name</b>:

-- <b>输出控件</b> --
- <b>prev ending</b>:
- <b>new filename</b>:

## CSM-DOC

### csmdoc_import_all_csm_VI_description_doc.vi

选择 CSM VI 功能描述的 markdown 文件，导入到所有的VI。

-- <b>Inputs</b> --
- <b>Path</b>: CSM VI 功能描述的 markdown 文件路径

### csmdoc_export_all_csm_VI_description_doc.vi

分析所有CSM VI, 将 VI 功能描述导出到 markdown 文件中。

-- <b>Inputs</b> --
- <b>Path</b>: CSM VI 功能描述的 markdown 文件路径

### csmdoc_export_VI_description.vi

-- <b>Inputs</b> --
- <b>NOTE-Map</b>:
- <b>Path</b>:

-- <b>Outputs</b> --
- <b>concatenated string</b>:

### csmdoc_import_doc_to_singleVI.vi

### csmdoc_import_VI_description.vi

-- <b>Inputs</b> --
- <b>NOTE-Map</b>:
- <b>string</b>:
- <b>Path</b>:

### csmdoc_list_all_csm_documented_VIs.vi

-- <b>Outputs</b> --
- <b>Array</b>:

### csmdoc_load vi description map.vi

-- <b>Inputs</b> --
- <b>Path</b>:

-- <b>Outputs</b> --
- <b>text</b>:
- <b>variant 2</b>:
- <b>variant</b>:

## Unsorted

### CSM - Flood of Events Handler Side Loop.vi

### CSM - Forward States to CSM.vi

-- <b>输入控件</b> --
- <b>High Priority(T)</b>:
- <b>Module Name</b>:Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters
- <b>State(s) in ("")</b>:Wire the existing states to this input. The default is an empty string.

### CSM - Forward UI Operations to CSM.vi

-- <b>输入控件</b> --
- <b>Name("" to use uuid)</b>:
- <b>State(s) in ("")</b>:

-- <b>输出控件</b> --
- <b>States Out</b>:

### CSM - Remove Module in Broadcast Registry.vi

-- <b>输入控件</b> --
- <b>CSM Name</b>:

-- <b>输出控件</b> --
- <b>CSM Name(dup)</b>:

### Parse VI Documentation String.vi

-- <b>Inputs</b> --
- <b>NOTE-Map</b>:
- <b>Documentation</b>:

-- <b>Outputs</b> --
- <b>Ctrl-Doc Map</b>:
- <b>Control Docs</b>:
- <b>Core Doc</b>:
- <b>Documentation (dup)</b>:

### Gevt-ThreadQueueName.vi

-- <b>Outputs</b> --
- <b>ThreadQueueName</b>:

### Script - JKISM to CSM.vi

### CSM - Status Change Event.vi

-- <b>Inputs</b> --
- <b>CSM Module</b>:

-- <b>Outputs</b> --
- <b>Status Change Event</b>:

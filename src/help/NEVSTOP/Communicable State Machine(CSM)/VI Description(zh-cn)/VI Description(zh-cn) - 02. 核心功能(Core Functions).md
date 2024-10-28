# CSM API

## 核心功能(Core Functions)

> [!NOTE] CSM 消息格式解析
> [CSM 消息字符串(CSM Message)] >> [参数(Arguments)] [消息类型符号(Message Symbol) ->|,->,-@] [目标模块(Target Module)] // [注释(Comments)]
> - CSM 消息字符串(CSM Message): CSM的消息，不可以包含CSM关键字和换行符
> - ">>": CSM 消息字符串(CSM Message) 和 参数(Arguments) 的分隔符
> - 参数(Arguments): CSM 消息的参数，不可以包含CSM关键字和换行符
> - 消息类型符号(Message Symbol): 消息类型符号，用于标识消息类型，包括同步调用(-@)、异步调用(->)、异步不等待返回(->|)等
> - 目标模块(Target Module): 消息发送的目标模块，如果为空，则表示消息会被本模块处理。为空时，消息类型符号也不能存在
> - 注释(Comments): 注释信息，不会被解析

> [!NOTE] CSM 操作消息格式解析
> [CSM 操作字符串(CSM Operation)] >> [参数(Arguments)] -> <[操作类型(operation)]> // [注释(Comments)]
> TODO

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

> [!NOTE] 多态VI(Polymorphic VI)选项:
> - Build Message with Arguments(Auto Check).vi
> - Build Asynchronous Message with Arguments.vi
> - Build No-Reply Asynchronous Message with Arguments.vi
> - Build Synchronous Message with Arguments.vi
> - Build Interrupt Status Message.vi
> - Build Normal Status Message.vi
> - Build Register Status Message.vi
> - Build Unregister Status Message.vi
> - CSM - Replace Substitution Marks in Messages.vi

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

      ``` text
      Initialize -@ <target>
      Configure -@ <target>
      Read -@ <target>
      Close -@ <target>
      ```

<b>States</b>输出为：

      ``` text
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

-- <b>输入控件</b> --
- <b>Status with Arguments</b>: 将被广播的状态及参数，支持多行, 每行状态都将被添加 "-><broadcast>"
- <b>State Queue("")</b>: 整个状态队列被连接到此输入
- <b>Broadcast(T)</b>: 控制是否广播的开关输入

-- <b>输出控件</b> --
- <b>Remaining States</b>: 拼接后的所有状态及参数。

### Add State(s) to Queue By BOOL++.vi

将 CSM 消息字符串并入 CSM 消息队列中。提供了 TRUE/FALSE 两种状态的字符串选项，能够避免使用条件结构，提高代码可读性，提高编程效率。

> Ref: CSM 的状态队列操作API

> [!NOTE] 多态VI(Polymorphic VI)选项:
> - add State(s) to Queue By BOOL(Element).vi
> - add State(s) to Queue By BOOL(Array Left).vi
> - add State(s) to Queue By BOOL(Array Right).vi
> - add State(s) to Queue By BOOL(Array All).vi

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

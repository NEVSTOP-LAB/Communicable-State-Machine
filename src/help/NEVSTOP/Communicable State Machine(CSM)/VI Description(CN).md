# CSM API

## 模板(Templates)

> [!NOTE]CSM Name 规则
> - CSM 模块名称应该是唯一的，否则会导致 CSM 进入 "Critical Error" 状态。
> - 如果输入为 ""，将使用 UUID 作为模块名称。该模块被标记为独立模式，不会包含在模块列表中。
> - 如果输入以 '#' 结尾，则该模块将在工作模式下运行。具有相同名称的模块将共享同一消息队列。任何外部消息将由其中一个模块处理，取决于哪个模块空闲。
>

> [!NOTE]CSM 初始化状态
> - 默认值和 JKISM 状态机保持一致, 是 "Macro: Initialize"。
> - 通常不会修改此状态，作为输入的目的是为了方便外部程序化修改初始化状态。
>

### CSM Module Template.vi

用于创建具有无用户界面的 CSM 模块的模板

-- <b>输入控件</b> --
- <b>Name("" to use uuid)</b>: CSM 模块名称
- <b>Init State("Macro: Initialize")</b>: CSM 初始化状态, 默认为 "Macro: Initialize"


### CSM User Interface(UI) Module Template.vi

用于创建具有用户界面的 CSM 模块的模板，模板中包含用户事件结构用于响应用户操作。

-- <b>输入控件</b> --
- <b>Name("" to use uuid)</b>: CSM 模块名称
- <b>Init State("Macro: Initialize")</b>: CSM 初始化状态, 默认为 "Macro: Initialize"

### CSM Module Template - Tiny.vi

用于创建具有无用户界面的 CSM 模块的模板。此模板的代码比较紧凑。

-- <b>输入控件</b> --
- <b>Name("" to use uuid)</b>: CSM 模块名称
- <b>Init State("Macro: Initialize")</b>: CSM 初始化状态, 默认为 "Macro: Initialize"

### CSM User Interface(UI) Module Template - Tiny.vi

用于创建具有用户界面的 CSM 模块的模板，模板中包含用户事件结构用于响应用户操作。此模板的代码比较紧凑。

-- <b>输入控件</b> --
- <b>Name("" to use uuid)</b>: CSM 模块名称
- <b>Init State("Macro: Initialize")</b>: CSM 初始化状态, 默认为 "Macro: Initialize"

## 核心功能(Core Functions)

### Parse State Queue++.vi

解析JKI状态机状态队列，返回将执行的下一个当前状态、参数等信息。

-- <b>输入控件</b> --
- <b>State Queue</b>: 整个状态队列被连接到此输入。这应该来自 CSM 的移位寄存器。
- <b>Previous Error</b>: 来自JKI状态机的错误簇被连接到此输入。如果发生错误并出现在此输入上，则当前状态输出将返回 "Error Handler" 状态。
- <b>Name("" to use uuid)</b>: CSM 模块名称
- <b>Response Timeout(5000ms)</b>:同步调用时的响应超时设置，默认 5000 ms.
- <b>Dequeue Timeout(0ms)</b>: 检查 CSM 消息队列的超时设置，默认为0，不进行等待。
- <b>Response Arguments</b>: 来自上一个状态的响应参数。它应该来连接 CSM 的移位寄存器，用于传递外部调用的返回值。

-- <b>输出控件</b> --
- <b>Remaining States</b>:  返回继续执行的所有状态及参数
- <b>Arguments</b>: 返回可能在当前状态字符串中使用的任何参数。这些参数位于“>>”字符之后。<b>注意：</b>参数变量不得包含任何不可打印的字符，比如换行符或回车符。
- <b>Current State</b>: 将执行的下一个当前状态
- <b>Name Used</b>: 分配给此CSM模块的实际名称
- <b>Argument - State</b>: 如果是 CSM 定义的内置状态，此参数表示此状态的前状态
- <b>From Who</b>: 如果<b>Current State</b> 是由外部发送的，则这是源CSM模块名称。

### Build State String with Arguments++.vi

构建一个包含JKI状态机参数的状态字符串。

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
- <b>State with Arguments</b>: 包含 JKI 状态机状态、参数等信息的字符串

### Build Message with Arguments++.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. Different message type symbol(->|,->,-@) will be used in different Polymorphic Vi instance.

Polymorphic Option:
- Build Message with Arguments(Auto Check).vi
- Build Asynchronous Message with Arguments.vi
- Build No-Reply Asynchronous Message with Arguments.vi
- Build Synchronous Message with Arguments.vi

#### Build Message with Arguments(Auto Check).vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. The message type from input <b>State with Arguments</b> will be used.

- <B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
- <b>Arguments ("")</b> input is "Arguments"
- <b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments" as no message symbol is detected.

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is ""
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -@ Callee"

-- <b>输入控件</b> --
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

-- <b>输出控件</b> --
- <b>State with Arguments</b>: String stands for state with arguments

#### Build Asynchronous Message with Arguments.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values with async-message symbol "->" if <b>Target Module ("")</b> is specified.

- <B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
- <b>Arguments ("")</b> input is "Arguments"
- <b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments -> Callee". It's different with Build Message with Arguments(Auto Check).vi. . Message Type Symbol is replaced with "->".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is ""
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee". Message Type Symbol is replaced with "->".

-- <b>输入控件</b> --
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

-- <b>输出控件</b> --
- <b>State with Arguments</b>: String stands for state with arguments

#### Build No-Reply Asynchronous Message with Arguments.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values with No-Reply async-message symbol "->|" if <b>Target Module ("")</b> is specified.

- <B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
- <b>Arguments ("")</b> input is "Arguments"
- <b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments ->| Callee". It's different with Build Message with Arguments(Auto Check).vi. Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments ->| NewCallee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is ""
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth ->| NewCallee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "->|".

-- <b>输入控件</b> --
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

-- <b>输出控件</b> --
- <b>State with Arguments</b>: String stands for state with arguments

#### Build Synchronous Message with Arguments.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values with sync-message symbol "-@" if <b>Target Module ("")</b> is specified.

- <B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
- <b>Arguments ("")</b> input is "Arguments"
- <b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments ->| Callee". It's different with Build Message with Arguments(Auto Check).vi. Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -@ NewCallee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is ""
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -@ NewCallee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -@ Callee".

-- <b>输入控件</b> --
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

-- <b>输出控件</b> --
- <b>State with Arguments</b>: String stands for state with arguments

#### Build Interrupt Status Message.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. The message type from input <b>State with Arguments</b> will be used.
- <B>For Example:</B>
If <b>State with Arguments</b> input is "API: DoSth"
Then result string is "API: DoSth >> Arguments" as no message symbol is detected.
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth >> NewArguments -> Callee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth -> NewCallee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
Then result string is "API: DoSth >> NewArguments -@ Callee"
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.
- <b>State with Arguments</b>: String stands for state with arguments

-- <b>输入控件</b> --
- <b>State with Arguments</b>:
- <b>Arguments ("")</b>:

-- <b>输出控件</b> --
- <b>State with Arguments</b>:

#### Build Normal Status Message.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. The message type from input <b>State with Arguments</b> will be used.
- <B>For Example:</B>
If <b>State with Arguments</b> input is "API: DoSth"
Then result string is "API: DoSth >> Arguments" as no message symbol is detected.
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth >> NewArguments -> Callee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth -> NewCallee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
Then result string is "API: DoSth >> NewArguments -@ Callee"
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.
- <b>State with Arguments</b>: String stands for state with arguments

-- <b>输入控件</b> --
- <b>State with Arguments</b>:
- <b>Arguments ("")</b>:

-- <b>输出控件</b> --
- <b>State with Arguments</b>:

#### Build Register Status Message.vi

Builds register status message. The message looks like:
[source-state]@[source-module] >> [response-message]@[response-module] -><register>
For examples:
DownloadFinished@Downloader >> StartPlay@Player -><register>
DownloadFinished@Downloader >> StartPlay -><register> // response-module is current module
DownloadFinished@Downloader  -><register> // response-module is current module. response-message is DownloadFinished
DownloadFinished@* >> StartPlay@Player -><register> // Any Module's DownloadFinished is registered to Player's StartPlay state.

-- <b>输入控件</b> --
- <b>Source CSM Name (* as Default)</b>:
- <b>CSM Name</b>:
- <b>Status</b>:
- <b>Response Message (if "", same as Source Message)</b>:

-- <b>输出控件</b> --
- <b>State with Arguments</b>:

#### Build Unregister Status Message.vi

Builds unregister status message. The message looks like:
[source-state]@[source-module] >> [response-module] -><unregister>
For examples:
DownloadFinished@Downloader >> StartPlay -><unregister>
DownloadFinished@Downloader  -><unregister>

-- <b>输入控件</b> --
- <b>Source CSM Name (* as Default)</b>:
- <b>CSM Name</b>:
- <b>Status</b>:

-- <b>输出控件</b> --
- <b>State with Arguments</b>:

### Add State(s) to Queue By BOOL++.vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。Bool输入决定要连接的字符串是TRUE还是False。

#### Add State(s) to Queue By BOOL(Element).vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。Bool输入决定要连接的字符串是TRUE还是False。

-- <b>输入控件</b> --
- <b>State Queue("")</b>: 整个状态队列被连接到此输入
- <b>TRUE("")</b>: <b>Bool</b> 为 True 时插入的状态字符串
- <b>False("")</b>: <b>Bool</b> 为 False 时插入的状态字符串
- <b>Bool</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
- <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的顶部。如果为False，它被附加到尾部。

-- <b>输出控件</b> --
- <b>State Queue Out</b>: 返回继续执行的所有状态及参数。

#### Add State(s) to Queue By BOOL(Array Left).vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。Bool输入决定要连接的字符串是TRUE还是False。

-- <b>输入控件</b> --
- <b>State Queue("")</b>: 整个状态队列被连接到此输入
- <b>TRUE("")</b>: <b>Bool</b> 为 True 时插入的状态字符串
- <b>False("")</b>: <b>Bool</b> 为 False 时插入的状态字符串
- <b>Bool</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
- <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的顶部。如果为False，它被附加到尾部。

-- <b>输出控件</b> --
- <b>State Queue Out</b>: 返回继续执行的所有状态及参数。

#### Add State(s) to Queue By BOOL(Array Right).vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。Bool输入决定要连接的字符串是TRUE还是False。

-- <b>输入控件</b> --
- <b>State Queue("")</b>: 整个状态队列被连接到此输入
- <b>TRUE("")</b>: <b>Bool</b> 为 True 时插入的状态字符串
- <b>False("")</b>: <b>Bool</b> 为 False 时插入的状态字符串
- <b>Bool</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
- <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的顶部。如果为False，它被附加到尾部。

-- <b>输出控件</b> --
- <b>State Queue Out</b>: 返回继续执行的所有状态及参数。

#### Add State(s) to Queue By BOOL(Array All).vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。
High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。
Bool输入决定要连接的字符串是TRUE还是False。

-- <b>输入控件</b> --
- <b>State Queue("")</b>: 整个状态队列被连接到此输入
- <b>TRUE("")</b>: <b>Bool</b> 为 True 时插入的状态字符串
- <b>False("")</b>: <b>Bool</b> 为 False 时插入的状态字符串
- <b>Bool</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
- <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的顶部。如果为False，它被附加到尾部。

-- <b>输出控件</b> --
- <b>State Queue Out</b>: 返回继续执行的所有状态及参数。

### CSM - Broadcast Status Change.vi

向系统广播状态更改。已注册状态的 CSM 模块将接收到状态更改。

-- <b>输入控件</b> --
- <b>Status with Arguments</b>: 将被广播的状态及参数
- <b>State Queue("")</b>: 整个状态队列被连接到此输入
- <b>Broadcast(T)</b>: 控制是否广播的开关输入

-- <b>输出控件</b> --
- <b>Remaining States</b>: 返回继续执行的所有状态及参数。

## 参数(Arguments)

### CSM - Make String Arguments Safe.vi

'->','->|','-@','-&','<-" 是关键字，不能出现在参数中。使用此 VI 保证参数安全。

-- <b>输入控件</b> --
- <b>Argument String</b>: 可能包含关键字的参数 '->','->|','-@','-&','<-".

-- <b>输出控件</b> --
- <b>Safe Argument String</b>: 安全参数

### CSM - Revert Arguments-Safe String.vi

'->','->|','-@','-&','<-" 是关键字，不能出现在参数中。使用<b>CSM Make String Arguments Safe.vi</b>保证参数安全。此VI用于将安全参数转换为原始参数。

-- <b>输入控件</b> --
- <b>Safe Argument String</b>: 安全参数

-- <b>输出控件</b> --
- <b>Origin Argument String</b>: 可能包含关键字的参数 '->','->|','-@','-&','<-".

### CSM - Convert Data to HexStr.vi

将复杂参数（变体）转换为十六进制字符串，该字符串可以安全地用作状态参数，而不会破坏字符串队列逻辑。

-- <b>输入控件</b> --
- <b>Variant</b>: 数据，保存为变体(variant)格式

-- <b>输出控件</b> --
- <b>HEX String (0-9,A-F)</b>: Hex字符串格式，不包含不可见字符，符合 CSM 的参数要求

### CSM - Convert HexStr to Data.vi

将十六进制字符串参数转换回变体数据。

-- <b>输入控件</b> --
- <b>HEX String</b>: Hex字符串格式，不包含不可见字符，符合 CSM 的参数要求

-- <b>输出控件</b> --
- <b>Variant</b>: 数据，保存为变体(variant)格式
- <b>error out</b>: 错误簇

## Advance APIs

### CSM - Start Async Call.vi

异步调用模板代码的VI片段

### CSM - Synchronized Call.vi

同步调用模板代码的VI片段

### CSM - Mark As Worker Module.vi

在CSM名称后添加“＃”，以标记此模块为工作者，其与具有相同名称的其他工作者共享相同的消息队列。一个带有生成的UUID的实际名称将被分配给此CSM模块。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称

-- <b>输出控件</b> --
- <b>CSM Name(marked as worker)</b>: 添加“＃”标记 的CSM 模块名称

### CSM - Compact Multiple States.vi

将多个状态紧凑成单个字符串以供输入使用

-- <b>输入控件</b> --
- <b>States in Lines</b>: 多个状态的字符串数组

-- <b>输出控件</b> --
- <b>States</b>: 包含所有输入状态的字符串

### CSM - Check If Module Exists.vi

检查 CSM 模块是否存在

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称
- <b>Error in</b>: 错误簇

-- <b>输出控件</b> --
- <b>Exist?</b>: 返回模式是否存在，存在返回True，不存在返回False
- <b>CSM Name(dup)</b>: 返回 <b>CSM Name</b>
- <b>Error out</b>: 错误簇

### CSM - List Modules.vi

列出系统中所有活动的CSM模块。

-- <b>输入控件</b> --
- <b>Exclude Standalone CSM(T)</b>: 是否包含独立工作模式的模块
- <b>Error in</b>: 错误簇

-- <b>输出控件</b> --
- <b>Module Names</b>: 模块名称列表
- <b>Error out</b>: 错误簇

### CSM - Module Status.vi

获取CSM模块的状态

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称.
- <b>Error in</b>: 错误簇

-- <b>输出控件</b> --
- <b>Mode</b>: 返回模块的工作模式："Stand-alone", "CSM" 或 "Action Worker".
- <b>#As Worker</b>: 工作者模式下，此模块的工作者数量
- <b>#msg to be processed</b>: CSM消息队列中的待处理消息个数
- <b>CSM Name(dup)</b>: 返回 <b>CSM Name</b>
- <b>Error out</b>: 错误簇

### CSM - Register Status Change.vi

注册以接收其他CSM模块状态更改的通知。如果未连接 “Response Message” 或输入为空，则将使用相同的<b>Status</b> 名称作为响应消息。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称.
- <b>Source CSM Name ('*' as Default)</b>: 生成状态的CSM模块。您可以使用“*”来表示所有生成相同状态的模块。
- <b>Status</b>: 状态字符串
- <b>Response Message (if "", same as Source Message)</b>: 注册后，如果状态发生变化，将接收到此消息。
- <b>Priority(T:As Status,F:As Interrupt)</b>: 如果响应消息为False，则将其插入到状态队列的前面；否则，将其附加到队列的尾部。
- <b>Error in</b>: 错误簇

-- <b>输出控件</b> --
- <b>CSM Name(dup)</b>: 返回 <b>CSM Name</b>
- <b>Error out</b>: 错误簇

### CSM - Unregister Status Change.vi

取消注册其他 CSM 模块状态更改的通知。

-- <b>输入控件</b> --
- <b>CSM Name</b>: CSM 模块名称.
- <b>Source CSM Name</b>: 生成状态的CSM模块。您可以使用“*”来表示所有生成相同状态的模块。
- <b>Status</b>: 状态字符串
- <b>Error in</b>: 错误簇

-- <b>输出控件</b> --
- <b>CSM Name(dup)</b>: 返回 <b>CSM Name</b>
- <b>Error out</b>: 错误簇

### CSM - Get New State Notifier Event.vi

-- <b>输入控件</b> --
- <b>Name("" to use uuid) in</b>: CSM 模块名称
- <b>Error in</b>: 错误簇

-- <b>输出控件</b> --
- <b>New State Notifier Event</b>: 用户事件句柄，用来当收到消息时，使用CSM模块中断在事件结构中的等待
- <b>Error out</b>: 错误簇

## Non-CSM Support

### CSM - Post Message.vi

向指定的CSM发布一条消息，相当于异步调用，但不等待返回参数。

-- <b>输入控件</b> --
- <b>Target Module</b>:目标 CSM 模块名称
- <b>State</b>: 消息字符串
- <b>Arguments ("")</b>: 消息参数
- <b>Error In (no error)</b>: 错误簇

-- <b>输出控件</b> --
- <b>error out</b>: 错误簇

### CSM - Send Message and Wait for Reply.vi

向指定的CSM发布一条消息并等待回复，相当于同步调用，在指定超时内没有收到返回，将返回超时错误。

-- <b>输入控件</b> --
- <b>Target Module</b>: 目标 CSM 模块名称
- <b>State</b>: 消息字符串
- <b>Arguments ("")</b>: 消息参数
- <b>Response Timeout(5000ms)</b>: 等待返回的超时设置，默认 5000ms.
- <b>Error In (no error)</b>: 错误簇

-- <b>输出控件</b> --
- <b>Arguments</b>: Response returned.
- <b>error out</b>: 错误簇

### CSM - Wait and Post Message.vi

-- <b>输入控件</b> --
- <b>State</b>:

- <b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Arguments ("")</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Target Module</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Wait(5000ms)</b>:

- <b>Error In (no error)</b>:
The error cluster from the JKI State Machine is wired to this input. If an error occures and appears on this input, the current state output returns the "Error Handler" state.

-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Wait and Send Message for Reply.vi

-- <b>输入控件</b> --
- <b>State</b>:

- <b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Arguments ("")</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Target Module</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Wait(5000ms)</b>:

- <b>Error In (no error)</b>:
The error cluster from the JKI State Machine is wired to this input. If an error occures and appears on this input, the current state output returns the "Error Handler" state.
- <b>Response Timeout(5000ms)</b>:

-- <b>输出控件</b> --
- <b>Response</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters
- <b>>> Source CSM >></b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Status Change Event

Obtain CSM Global Log Event Reference.
- <b>Error in</b>: Error cluster
- <b>CSM Global Log Event</b>: User event reference for CSM global log.
- <b>Error out</b>: Error cluster

-- <b>输入控件</b> --
- <b>Error in</b>:
- <b>Name("" to use uuid) in</b>:

-- <b>输出控件</b> --
- <b>Error out</b>:
- <b>Status Change Event</b>:

### CSM - Destroy Status Change Event.vi

Release CSM Global Log Event Reference.
- <b>CSM Global Log Event</b>:
- <b>Error in</b>: Error cluster
- <b>Error out</b>: Error cluster

-- <b>输入控件</b> --
- <b>Error in</b>:
- <b>Status Change Event</b>:

-- <b>输出控件</b> --
- <b>Error out</b>:

## Side-Loop Support

### CSM - Request CSM to Post Message.vi

申请 CSM 发送消息。通常用于和CSM并行的功能循环，这些功能循环和 CSM 一起完成完整模块功能。

-- <b>输入控件</b> --
- <b>Module Name</b>:发送状态的CSM
- <b>Status</b>: 将被广播的状态
- <b>Arguments ("")</b>: 将被广播的状态参数
- <b>Target Module</b>:目标模块
- <b>Error In (no error)</b>: 错误簇

-- <b>输出控件</b> --
- <b>error out</b>: 错误簇

### CSM - Request CSM to Broadcast Status Change.vi

申请 CSM 发布状态。通常用于和CSM并行的功能循环，这些功能循环和 CSM 一起完成完整模块功能。

-- <b>输入控件</b> --
- <b>Module Name</b>:发送状态的CSM
- <b>Status</b>: 将被广播的状态
- <b>Arguments ("")</b>: 将被广播的状态参数
- <b>Broadcast(T)</b>: 控制是否广播的开关输入
- <b>Error In (no error)</b>: 错误簇

-- <b>输出控件</b> --
- <b>error out</b>: 错误簇

### CSM - Module Turns Invalid.vi

检查CSM是否已经退出。通常用于和CSM并行的功能循环，这些功能循环和 CSM 一起完成完整模块功能。 本VI用于并行循环的退出条件。

-- <b>输入控件</b> --
- <b>CSM Name</b>: 模块名称

-- <b>输出控件</b> --
- <b>Turn Invalid(Exit)?</b>: 是否已经退出

## Global Log Event

### CSM - Global Log Event.vi

获取 CSM 全局状态用户事件句柄

-- <b>输入控件</b> --
- <b>Error in</b>: 错误簇

-- <b>输出控件</b> --
- <b>CSM Global Log Event</b>: CSM 全局状态用户事件句柄
- <b>Error out</b>: 错误簇

### CSM - Destroy Global Log Event.vi

释放 CSM 全局状态用户事件句柄

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>: CSM 全局状态用户事件句柄
- <b>Error in</b>: 错误簇

-- <b>输出控件</b> --
- <b>Error out</b>: 错误簇

### CSM - Generate User Global Log.vi

-- <b>输入控件</b> --
- <b>Error in</b>:
- <b>From Who</b>:
- <b>ModuleName</b>:
- <b>Log</b>:
- <b>Arguments</b>:

-- <b>输出控件</b> --
- <b>error out</b>:

## Utility VIs

### Build Error Cluster.vi

创建一个错误簇（error cluster），以标准 LabVIEW 的方式从调用 VI 的调用链中构建源字符串。构建的源字符串形式为：
"<B>调用的 VI</B> 在 <B>调用 VI 的调用者</B>-><B>调用 VI 的调用者的调用者</B>->等等...->等等..."
可选的 'String to Prepend to source ("")' 字符串输入可用于在源字符串中添加额外的描述信息。如果存在这个字符串，它将用括号括起来，并添加到源字符串之前。

-- <b>输入控件</b> --
- <b>code</b>: 错误码
- <b>String to Prepend to source ("")</b>: 错误信息字符串

-- <b>输出控件</b> --
- <b>error out</b>: 错误簇

### Build Internal State String.vi

构建包含 JKI 状态机状态、参数等信息的字符串。

-- <b>输入控件</b> --s
- <b>State</b>: 状态字符串
- <b>Arguments ("")</b>: <b>State</b>的参数
- <b>Arg-State ("")</b>: 发送此消息的模块在发送此消息时处于的状态
- <b>Source ("")</b>: 发送此消息的模块名称

-- <b>输出控件</b> --
- <b>State with Arguments</b>: 包含 JKI 状态机状态、参数等信息的字符串

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

开头、结尾或两者同时移除所有 ASCII 空白字符（空格、制表符、回车和换行）。

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

## CSM-Helper API

### CSM-Helper API.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --


### _Add VI Reference Case.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>element</b>:

- <b>Add Frame</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Connect Information.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Case</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Backend Connected Info</b>:

- <b>FrontEnd Connected Info</b>:

- <b>CSM-Helper out</b>:

### Diagram Node Information.vi

-- <b>输入控件</b> --
- <b>InnerTerminal in</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array in</b>:

- <b>Front Tunnels</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
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
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>GObject in</b>:


-- <b>输出控件</b> --
- <b>error in (no error) (dup)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Class Name</b>:

- <b>Terms[]</b>:

- <b>Node Object</b>:

- <b>tunnel Relative Pos</b>:

### Relative Pos to InterData Tunnel of CaseContent.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>element</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Position</b>:

- <b>CSM-Helper out</b>:

### Resize CaseStructure By Making Space.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Bounds</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>DiffBound</b>:

- <b>MakeSpace.Rect</b>:

- <b>CSM-Helper out</b>:

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
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper out</b>:

### Get ParentRef Until Type Matched.vi

-- <b>输入控件</b> --
- <b>Class Name</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>reference in</b>:


-- <b>输出控件</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Target Ref</b>:

### Is in JKISM or CSM.vi

-- <b>输入控件</b> --
- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>reference in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
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
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>index(-1, use same group)</b>:

- <b>element</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Add Frame</b>:

- <b>CSM-Helper out</b>:

### Check NewStateNotify is Registered.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>NewStateNotify Registed</b>:

- <b>CSM-Helper out</b>:

### Connect Error Wire If not Connected.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>case</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Connect EventReg Wire If not Connected.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>case</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Connect Internal Data Wire If not Connected.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>case</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Connect LastResp to Response in Error Case.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Connect Paired Tunnels.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Connect StateQ Wire If not Connected.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>case</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Copy State.vi

-- <b>输入控件</b> --
- <b>Already Exist Action:
Replace(T) / Skip(F)</b>:

- <b>SourceCSM</b>:

- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>New(Empty to Use same Name)</b>:

- <b>Case</b>:

- <b>CSM-Helper.lvclass</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out 2</b>:

### Create From Basic Refs.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM Basic Refs</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper.lvclass</b>:

### Create From CaseStructure Reference.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CaseStructure</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper.lvclass</b>:

### Create From EventStructure Reference.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CaseStructure</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper.lvclass</b>:

### Create From VI Reference.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>VI</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper.lvclass</b>:

### Create From WhileLoop Reference.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Structure</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper.lvclass</b>:

### Destroy.vi

-- <b>输入控件</b> --
- <b>Save Instruments?(F)</b>:

- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper out</b>:

### Doc.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>String 2</b>:

- <b>String</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>String 4</b>:

- <b>String 3</b>:

- <b>CSM-Helper out</b>:

### Get All API Interface Info.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array</b>:

- <b>CSM-Helper out</b>:

### Get All Status Interface Info.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Array 3</b>:

- <b>CSM-Helper out</b>:

### Get CaseFrame Index By CaseName.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CASE</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>index</b>:

- <b>CSM-Helper out</b>:

### Get CaseFrame Reference By CaseName.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CASE</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Frame Refs</b>:

- <b>CSM-Helper out</b>:

### Get Event Structure Num.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>EvtStruNum</b>:

- <b>CSM-Helper out</b>:

### Get Interface Info.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CASE</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Response</b>:

- <b>Array</b>:

- <b>CSM-Helper out</b>:

### Get Internal Data Info.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Array</b>:

- <b>CSM-Helper out</b>:

### Open Block Diagram.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Open Front Panel.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Remove State Frame.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>element</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Save Instrument.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Set Error Tunnel Use Default If not Connected.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Use Default if Unwired</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Set Visible Case Frame.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>element</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Set Wire Label Visible.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Connected Wire.Label.Visible</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper out</b>:

### Start Undo.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Name</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Stop Undo.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Undo.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Read APIs.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Value</b>:

- <b>CSM-Helper out</b>:

### Read Back Tunnel Internal TermRefs.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>element</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Back Tunnels</b>:

- <b>CSM-Helper out</b>:

### Read Back Tunnels Refs.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Back Tunnels</b>:

- <b>CSM-Helper out</b>:

### Read Block Diagram Ref.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Diagram</b>:

- <b>CSM-Helper out</b>:

### Read Case Structure Ref.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Case Structure</b>:

- <b>CSM-Helper out</b>:

### Read Event Structure Ref.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Event Structure</b>:

- <b>CSM-Helper out</b>:

### Read Front Tunnel Internal TermRefs.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>case</b>:

- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Front Tunnels</b>:

- <b>CSM-Helper out</b>:

### Read Front Tunnels Refs.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Front Tunnels</b>:

- <b>CSM-Helper out</b>:

### Read New State Notifier Event State Ref.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>New State Notifier Event State Ref</b>:

- <b>CSM-Helper out</b>:

### Read Paired Tunnels of Case Structure.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Paired Tunnels</b>:

- <b>CSM-Helper out</b>:

### Read Parse State Queue Ref.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Parse State Queue</b>:

- <b>CSM-Helper out</b>:

### Read States.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Value</b>:

- <b>CSM-Helper out</b>:

### Read Timeout Event State Ref.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>New State Notifier Event State Ref</b>:

- <b>CSM-Helper out</b>:

### Read Type.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Part References.Type</b>:

- <b>CSM-Helper out</b>:

### Read User-Defined States.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Array</b>:

- <b>CSM-Helper out</b>:

### Read VI Ref.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>VI</b>:

- <b>CSM-Helper out</b>:

### Read While Loop Ref.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>While Loop</b>:

- <b>CSM-Helper out</b>:

### Add VI Reference Case.vi

-- <b>输入控件</b> --
- <b>error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Remove All CSM Bookmarks.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### standardize CSM Module.vi

-- <b>输入控件</b> --
- <b>error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### CSM Essential States.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --
- <b>CSM Essential States</b>:

### CSM Module Type.vi

-- <b>输入控件</b> --
- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Basic Refs</b>:


-- <b>输出控件</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Basic Refs (dup)</b>:

### Is CSM Module - CaseStructure.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CaseStructure</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Is CSM Module?</b>:

- <b>CSM Basic Refs</b>:

### Is CSM Module - EventStructure.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>EventStructure</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Is CSM Module?</b>:

- <b>CSM Basic Refs</b>:

### Is CSM Module - ParseStateVI.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Parse State VI Ref</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Is CSM Module?</b>:

- <b>CSM Basic Refs</b>:

### Is CSM Module - Structure.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Structure</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Is CSM Module?</b>:

- <b>CSM Basic Refs</b>:

### Is CSM Module - VIRef.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>VIRef</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Is CSM Module?</b>:

- <b>CSM Basic Refs</b>:

### Is CSM Module - WhileLoop.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>WhileLoop in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Is CSM Module?</b>:

- <b>CSM Basic Refs</b>:

### Is CSM Module.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### CaseStructure - Add Frame.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Case Name</b>:

- <b>Reference Frame Index</b>:

- <b>CaseStructure in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Add Frame</b>:

- <b>CaseStructure out</b>:

### CaseStructure - Case Name to Group Name.vi

-- <b>输入控件</b> --
- <b>element</b>:


-- <b>输出控件</b> --
- <b>String</b>:

### CaseStructure - Check If State Exist.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Group Name</b>:

- <b>CaseStructure in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Numeric</b>:

- <b>CaseStructure out</b>:

### CaseStructure - Get Group Seperator Case Index.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Group Name</b>:

- <b>CaseStructure in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Numeric</b>:

- <b>CaseStructure out</b>:

### Diagram - Connect Tunnel with Wire 2.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Wire Indexs</b>:

- <b>Front Tunnels</b>:

- <b>Diagram in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array out</b>:

- <b>Diagram out</b>:

### Diagram - Connect Tunnel with Wire.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>FrontEnd Connected Info</b>:

- <b>Front Tunnels</b>:

- <b>Diagram in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array out</b>:

- <b>Diagram out</b>:

### Diagram - Get All Decoration Refs.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>TopLevelDiagram in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>TextRefs</b>:

- <b>TopLevelDiagram out</b>:

### Diagram - Get All Text Refs.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>TopLevelDiagram in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>TextRefs</b>:

- <b>TopLevelDiagram out</b>:

### PairedTunnels - Connect Wire.vi

-- <b>输入控件</b> --
- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>index(-1 for all)</b>:

- <b>PairedTunnels</b>:


-- <b>输出控件</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>PairedTunnels</b>:

### Find Event Structure from Case Structure.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CaseStructure</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>EvntStruct Refnum</b>:

### Find Parse State Queue from Case Structure.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CaseStructure</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CaseStructure</b>:

- <b>Parse State Queue</b>:

### Find Parse State Queue from Event Strcture.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>EvntStruct Refnum</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CaseStructure</b>:

- <b>Parse State Queue</b>:

### Find Parse State Queue from While Loop.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>WhileLoop in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
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

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### CSM - Documentation QuickDrop.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### CSM - Keywords QuickDrop.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### CSM Dummy Module.vi

-- <b>输入控件</b> --
- <b>Init State("Macro: Initialize")</b>:

- <b>Name("" to use uuid)</b>:


-- <b>输出控件</b> --

## CSM Internal

### Naming Check.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Name("" to use uuid)</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters

-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
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
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>BroadcastRegistry in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
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
- <b>State with Arguements</b>:

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
- <b>trimed text</b>:

### U8 Data to Hex Str.vi

-- <b>输入控件</b> --
- <b>u8 Data[]</b>:


-- <b>输出控件</b> --
- <b>HEX String (0-9,A-F)</b>:

### CSM Critical Error.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Arugments(as Reason)</b>:

- <b>CSM Name</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM No Target Error.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM Not Allowed Message.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>State</b>:

- <b>CSM</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM Target Error.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Arguments(as CSM Name)</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM Target Timeout Error.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Arguments(as CSM Name)</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM Unhandled State Error.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Current State</b>:

- <b>CSM Name</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Cache-Broadcast Registry Search Result.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Name</b>:

- <b>Broadcast state</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array</b>:

### FGV-BroadcastRegistry.vi

-- <b>输入控件</b> --
- <b>Source</b>:

- <b>Target</b>:

- <b>Status</b>:

- <b>API</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Operation</b>:


-- <b>输出控件</b> --
- <b>response message</b>:

- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### global-Broadcast Cache Change Flag.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### global-CSMQ FGV Change Flag.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### Cache-GEvt Filter Object.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --
- <b>CSM:LogFilter.lvclass</b>:

### FGV-GEvt Filter Obj.vi

-- <b>输入控件</b> --
- <b>Set(T)/Get(F)</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Rules-v1</b>:


-- <b>输出控件</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM:LogFilter.lvclass</b>:

### FGV-GlobalEventRef.vi

-- <b>输入控件</b> --
- <b>Create(F)</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Global Log Event</b>:

### FGV-StatusChangeEventRef.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Name("" to use uuid) in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Status Change Event</b>:

### GEvt-BackgroundThread.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

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
- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Rules-v1</b>:


-- <b>输出控件</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Gevt-ThreadQueueName.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --
- <b>ThreadQueueName</b>:

### GEvt-WatchdogThread.vi

-- <b>输入控件</b> --
- <b>WatchDogQ</b>:


-- <b>输出控件</b> --

### global-GEvnt Filter Change Flag.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

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
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>GlobalLogFilter in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
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
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>timeout in ms (-1)</b>:

- <b>Priority Queue</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>timed out?</b>:

- <b>Cross JKI State Machine State</b>:

- <b>Priority Queue(dup)</b>:

- <b>High Priority?</b>:

### Enqueue Element.vi

-- <b>输入控件</b> --
- <b>High Priority?(F)</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>timeout in ms (-1)</b>:

- <b>Cross JKI State Machine State</b>:

- <b>Priority Queue</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Priority Queue(dup)</b>:

### Get Queue Status.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Priority Queue in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
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
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>create if not found? (T)</b>:

- <b>name</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>created new?</b>:

- <b>Priority Queue</b>:

### Release Priority Queue.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>force destroy? (F)</b>:

- <b>Priority Queue</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-Async Call.vi

-- <b>输入控件</b> --
- <b>state</b>:

- <b>args</b>:

- <b>source/target</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Name</b>:

- <b>Msg Type</b>:


-- <b>输出控件</b> --
- <b>state out</b>:

- <b>args out</b>:

- <b>source/target out</b>:

- <b>Pre-State out</b>:

- <b>Pre-Args out</b>:

- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-Broadcast.vi

-- <b>输入控件</b> --
- <b>state</b>:

- <b>args</b>:

- <b>source/target</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Name</b>:

- <b>Msg Type</b>:


-- <b>输出控件</b> --
- <b>state out</b>:

- <b>args out</b>:

- <b>source/target out</b>:

- <b>Pre-State out</b>:

- <b>Pre-Args out</b>:

- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-PostPostMsg.vi

-- <b>输入控件</b> --
- <b>state</b>:

- <b>args</b>:

- <b>source/target</b>:

- <b>Pre-State in</b>:

- <b>Pre-Args in</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>session error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Name</b>:

- <b>Response Arguments</b>:


-- <b>输出控件</b> --
- <b>state out</b>:

- <b>args out</b>:

- <b>source/target out</b>:

- <b>Pre-State out</b>:

- <b>Pre-Args out</b>:

- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-PostSendMsg.vi

-- <b>输入控件</b> --
- <b>state</b>:

- <b>args</b>:

- <b>source/target</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>session error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Name</b>:

- <b>Response Arguments</b>:


-- <b>输出控件</b> --
- <b>state out</b>:

- <b>args out</b>:

- <b>source/target out</b>:

- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-Register Status.vi

-- <b>输入控件</b> --
- <b>state</b>:

- <b>args</b>:

- <b>source/target</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Name</b>:


-- <b>输出控件</b> --
- <b>state out</b>:

- <b>args out</b>:

- <b>source/target out</b>:

- <b>Pre-State out</b>:

- <b>Pre-Args out</b>:

- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-Sync Call.vi

-- <b>输入控件</b> --
- <b>state</b>:

- <b>args</b>:

- <b>source/target</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Response Timeout(5000ms)</b>:

- <b>Module Name</b>:


-- <b>输出控件</b> --
- <b>state out</b>:

- <b>args out</b>:

- <b>source/target out</b>:

- <b>Pre-State out</b>:

- <b>Pre-Args out</b>:

- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-Unregister Status.vi

-- <b>输入控件</b> --
- <b>state</b>:

- <b>args</b>:

- <b>source/target</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Name</b>:


-- <b>输出控件</b> --
- <b>state out</b>:

- <b>args out</b>:

- <b>source/target out</b>:

- <b>Pre-State out</b>:

- <b>Pre-Args out</b>:

- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Add VI Reference Case to CSMs.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### CSM - Debug Console - DebugTool.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### CSM - Remove all CSM Bookmarks.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### CSM - Running Log - DebugTool.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### CSM - State Dashboard - DebugTool.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### CSM - State Table - DebugTool.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### CSM - Switch Language Tool.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### Script - JKISM to CSM.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### Autosize All MultiListbox Columns (Uniform Text).vi

-- <b>输入控件</b> --
- <b>IngoreCols(Empty as default)</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array</b>:

- <b>Control in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Dashboard Cell Resize.vi

-- <b>输入控件</b> --
- <b>Cluster</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Cluster Size:Height</b>:

- <b>Cluster Size:Width</b>:

- <b>引气压力P4 4</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Bounds:Area Height</b>:

- <b>Bounds:Area Width</b>:

### Dashboard Cell2 Array Resize.vi

-- <b>输入控件</b> --
- <b>Num Columns</b>:

- <b>Cluster</b>:

- <b>Num Rows</b>:

- <b>error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>area height</b>:

- <b>area width</b>:

- <b>Array 2</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Open CSM BD.vi

-- <b>输入控件</b> --
- <b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Open CSM FP.vi

-- <b>输入控件</b> --
- <b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Select Greater_nevstop.vi

-- <b>输入控件</b> --
- <b>A</b>:

- <b>B</b>:


-- <b>输出控件</b> --
- <b>lesser</b>:

### CSM - Start File Logger.vi

-- <b>输入控件</b> --
- <b>Filter Rules</b>:

- <b>Timestamp format</b>:

- <b>Enable? (T)</b>:

- <b>log limit</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>WatchDog? (T)</b>:

- <b>Exit When All Module Exist?(F)</b>:

- <b>Log File Path</b>:


-- <b>输出控件</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>LogFile</b>:

- <b>WatchDogQueue</b>:

### CSM-Logger-Thread.vi

-- <b>输入控件</b> --
- <b>log limit</b>:

- <b>Exit When All Module Exist?(F)</b>:

- <b>format string</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>WatchDogQ</b>:

- <b>GlobalLogFilter.lvclass</b>:

- <b>file path (use dialog)</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

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

### CSMLS - Add Exit State(s) with Loop Check.vi

-- <b>输入控件</b> --
- <b>States Out in</b>:

- <b>Remaining States</b>:


-- <b>输出控件</b> --
- <b>States Out out</b>:

### CSMLS - Append Continuous State.vi

-- <b>输入控件</b> --
- <b>Loop State(s) and Arguments</b>:
 This allows you to place new states in the front of the state machine queue. The default is an empty string.
- <b>Append(T)</b>:

- <b>Continous Arguments ("")</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Continous State</b>:
The State string that requires the argument.
- <b>Remaining States</b>:


-- <b>输出控件</b> --
- <b>States Out</b>:

### CSMLS - Define Loop State(s).vi

-- <b>输入控件</b> --
- <b>States Out in</b>:

- <b>Remaining States</b>:


-- <b>输出控件</b> --
- <b>States Out out</b>:

### CSMLS - Remove Loop Tag and previous State(s) to Break.vi

-- <b>输入控件</b> --
- <b>Remaining States</b>:


-- <b>输出控件</b> --
- <b>States</b>:

### CSMLS - Remove Loop Tag to Break.vi

-- <b>输入控件</b> --
- <b>Remaining States</b>:


-- <b>输出控件</b> --
- <b>States</b>:

### CSM - Start Watchdog to Ensure All Modules Exit.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.

-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.


## Unsorted

### CSM Watchdog Thread.vi

-- <b>输入控件</b> --
- <b>WatchdogQ</b>:


-- <b>输出控件</b> --

### CSM - Break Down Multiple States String.vi

-- <b>输入控件</b> --
- <b>States</b>:


-- <b>输出控件</b> --
- <b>Multiple States</b>:

### CSM - Build Exit Messages of CSMs.vi

-- <b>输入控件</b> --
- <b>State with Arguments("Macro: Exit“)</b>:

- <b>CSMs</b>:


-- <b>输出控件</b> --
- <b>States</b>:

### CSM - Check Mapping Relastionship in Broadcast Registry.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Name</b>:

- <b>Broadcast state</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array</b>:

### CSM - Check Status Registration.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Name</b>:

- <b>Broadcast state</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array</b>:

### CSM - Convert Argument to Error.vi

-- <b>输入控件</b> --
- <b>Argument</b>:


-- <b>输出控件</b> --
- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Convert Error to Argument.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>输出控件</b> --
- <b>Arguments</b>:

### CSM - Convert Filter Rules.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### CSM - Filter Duplicate Messages By Name.vi

-- <b>输入控件</b> --
- <b>Whole Messages in Check?(T)</b>:

- <b>States</b>:


-- <b>输出控件</b> --
- <b>States out</b>:

### CSM - Filter Global Log.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### CSM - Filter Messages to Non-Existing Modules.vi

-- <b>输入控件</b> --
- <b>State(s) in ("")</b>:
Wire the existing states to this input. The default is an empty string.

-- <b>输出控件</b> --
- <b>States Out</b>:
This output returns a concatenation of all the inputs seperated by a line feed character. The line feed character is required by the JKI State Machine.

### CSM - Flood of Events Handler Side Loop.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### CSM - Forward States to CSM.vi

-- <b>输入控件</b> --
- <b>High Priority(T)</b>:

- <b>Module Name</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters
- <b>Error In (no error)</b>:
The error cluster from the JKI State Machine is wired to this input. If an error occures and appears on this input, the current state output returns the "Error Handler" state.
- <b>State(s) in ("")</b>:
Wire the existing states to this input. The default is an empty string.

-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Forward UI Operations to CSM.vi

-- <b>输入控件</b> --
- <b>Name("" to use uuid)</b>:

- <b>State(s) in ("")</b>:


-- <b>输出控件</b> --
- <b>States Out</b>:

### CSM - Global Log Error Handler.vi

-- <b>输入控件</b> --
- <b>Clear Error(T)</b>:

- <b>Place("" to use VI's Name)</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Keywords.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --
- <b>%[hex] Code</b>:

- <b>Source</b>:

### CSM - List All Status Registration.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array</b>:

### CSM - List Log Filter Rules As Strings.vi

-- <b>输入控件</b> --
- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>输出控件</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Rule Strings</b>:

### CSM - List Mapping Relationships in Broadcast Registry.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array</b>:

### CSM - List Rules in Broadcast Registry.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Entries</b>:

### CSM - List Status in Broadcast Registry.vi

-- <b>输入控件</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Status in Registry</b>:

### CSM - Mark As Chain Module.vi

-- <b>输入控件</b> --
- <b>Order</b>:

- <b>CSM Name</b>:


-- <b>输出控件</b> --
- <b>CSM Name(marked as Chain)</b>:

### CSM - Module Exit Event.vi

-- <b>输入控件</b> --
- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Name("" to use uuid) in</b>:


-- <b>输出控件</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Exit Event</b>:

### CSM - Module VI Reference.vi

-- <b>输入控件</b> --
- <b>Response Timeout(5000ms)</b>:

- <b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Module VIRef</b>:

### CSM - Remove Duplicated Following Messages.vi

-- <b>输入控件</b> --
- <b>Current State</b>:

- <b>Remaining States</b>:


-- <b>输出控件</b> --
- <b>Remaining States Left</b>:

### CSM - Remove Module in Boradcast Registry.vi

-- <b>输入控件</b> --
- <b>CSM Name</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>输出控件</b> --
- <b>CSM Name(dup)</b>:

- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Replace Substitution Marks in Messages.vi

-- <b>输入控件</b> --
- <b>States with Replace Token</b>:

- <b><param></b>:

- <b><target></b>:

- <b><1></b>:

- <b><2></b>:


-- <b>输出控件</b> --
- <b>States</b>:

### CSM - Run Script.vi

-- <b>输入控件</b> --
- <b>single-line text</b>:

- <b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Continue If Error?(F)</b>:

- <b>Wait(5000ms)</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Response Timeout(5000ms)</b>:


-- <b>输出控件</b> --
- <b>States Left</b>:

- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Set Log Filter Rules.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --



### CSM - Wait for All Modules to be Alive.vi

-- <b>输入控件</b> --
- <b>Timeout(5000ms)</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Names (in)</b>:


-- <b>输出控件</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>waited(ms)</b>:

- <b>Left Modules</b>:

### CSM - Wait for All Modules to Exit.vi

-- <b>输入控件</b> --
- <b>Timeout(5000ms)</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Names (in)</b>:


-- <b>输出控件</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>waited(ms)</b>:

- <b>Left Modules</b>:

### CSM - Wait for Module to Be Alive.vi

-- <b>输入控件</b> --
- <b>Target Module</b>:

- <b>Wait(5000ms)</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>输出控件</b> --
- <b>Target Module (dup)</b>:

- <b>Waited(ms)</b>:

- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM Data Type String to Enum.vi

-- <b>输入控件</b> --


-- <b>输出控件</b> --

### CSM Data Type String.vi

-- <b>输入控件</b> --
- <b>Data</b>:


-- <b>输出控件</b> --
- <b>Data Type String</b>:

### Replace Tag with Array.vi

-- <b>输入控件</b> --
- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Enum</b>:

- <b>replace string</b>:

- <b>single-line text</b>:


-- <b>输出控件</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
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

### CSM-Helper usecase Template.vit
-- <b>输入控件</b> --
- <b>error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>输出控件</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:
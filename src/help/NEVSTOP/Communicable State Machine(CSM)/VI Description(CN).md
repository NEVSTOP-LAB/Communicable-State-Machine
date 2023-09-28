# CSM API

## Template Palette
### CSM - No-Event Structure Template.vi

用于创建具有无用户界面的 CSM 模块的模板

<b>输入控件:</b>
- <b>Name("" to use uuid)</b>: CSM 模块名称
   - 如果输入为 ""，将使用 UUID 作为模块名称。该模块被标记为独立模式，不会包含在模块列表中。
   - 如果输入以 '#' 结尾，则该模块将在工作模式下运行。具有相同名称的模块将共享同一消息队列。任何外部消息将由其中一个模块处理，取决于哪个模块空闲。
   - 否则，输入字符串将被用作模块名称，该名称应在系统中保持唯一。如果在系统中使用重复的模块名称，CSM 将进入 "Critical Error" 状态。

<b>输出控件:</b>
 - 无

### CSM - With Event Structure Template.vi

用于创建具有用户界面的 CSM 模块的模板，模板中包含用户事件结构用于响应用户操作。

<b>输入控件:</b>
 - <b>Name("" to use uuid)</b>: CSM 模块名称
   - 如果输入为 ""，将使用 UUID 作为模块名称。该模块被标记为独立模式，不会包含在模块列表中。
   - 如果输入以 '#' 结尾，则该模块将在工作模式下运行。具有相同名称的模块将共享同一消息队列。任何外部消息将由其中一个模块处理，取决于哪个模块空闲。
   - 否则，输入字符串将被用作模块名称，该名称应在系统中保持唯一。如果在系统中使用重复的模块名称，CSM 将进入 "Critical Error" 状态。

<b>输出控件:</b>
 - 无


### CSM - With Event Structure Template - Tiny.vi

用于创建具有用户界面的 CSM 模块的模板，模板中包含用户事件结构用于响应用户操作。此模板的代码比较紧凑。

<b>输入控件:</b>
- <b>Name("" to use uuid)</b>: CSM 模块名称
   - 如果输入为 ""，将使用 UUID 作为模块名称。该模块被标记为独立模式，不会包含在模块列表中。
   - 如果输入以 '#' 结尾，则该模块将在工作模式下运行。具有相同名称的模块将共享同一消息队列。任何外部消息将由其中一个模块处理，取决于哪个模块空闲。
   - 否则，输入字符串将被用作模块名称，该名称应在系统中保持唯一。如果在系统中使用重复的模块名称，CSM 将进入 "Critical Error" 状态。

<b>输出控件:</b>
 - 无

### Parse State Queue++.vi

解析JKI状态机状态队列，返回将执行的下一个当前状态、参数等信息。


<b>输入控件:</b>
 - <b>State Queue</b>: 整个状态队列被连接到此输入。这应该来自 CSM 的移位寄存器。
 - <b>Error In (no error)</b>: 来自JKI状态机的错误簇被连接到此输入。如果发生错误并出现在此输入上，则当前状态输出将返回 "Error Handler" 状态。
 - <b>Name("" to use uuid)</b>: CSM 模块名称
    - 如果输入为 ""，将使用 UUID 作为模块名称。该模块被标记为独立模式，不会包含在模块列表中。
   - 如果输入以 '#' 结尾，则该模块将在工作模式下运行。具有相同名称的模块将共享同一消息队列。任何外部消息将由其中一个模块处理，取决于哪个模块空闲。
   - 否则，输入字符串将被用作模块名称，该名称应在系统中保持唯一。如果在系统中使用重复的模块名称，CSM 将进入 "Critical Error" 状态。
 - <b>Response Timeout(5000ms)</b>:同步调用时的响应超时设置，默认 5000 ms.
 - <b>Dequeue Timeout(0ms)</b>: 检查 CSM 消息队列的超时设置，默认为0，不进行等待。
 - <b>Response Arguments</b>: 来自上一个状态的响应参数。它应该来连接 CSM 的移位寄存器，用于传递外部调用的返回值。

<b>输出控件:</b>
 - <b>Remaining States</b>:  返回继续执行的所有状态及参数。 These should be passed through the current state in the state machine. These can also be modified or augmented within the current state if necessary.
 - <b>Arguments</b>: 返回可能在当前状态字符串中使用的任何参数。这些参数位于“>>”字符之后。<b>注意：</b>参数变量不得包含任何不可打印的字符，比如换行符或回车符。
 - <b>Current State</b>: 将执行的下一个当前状态
 - <b>Name Used</b>: 分配给此CSM模块的实际名称
 - <b>Argument - State</b>: 如果是 CSM 定义的内置状态，此参数表示此状态的前状态
 - <b>From Who</b>: 如果<b>Current State</b> 是由外部发送的，则这是源CSM模块名称。


### Build State String with Arguments++.vi

构建一个包含JKI状态机参数的状态字符串。

<B>例如:</B>

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

<b>输入控件:</b>
 - <b>State</b>: 状态或消息名称字符串
 - <b>Arguments ("")</b>: <b>State</b> 的参数
 - <b>Target Module ("")</b>: 此消息发送的目标 CSM 模块名称
 - <b>Sync-Call(-@) T By Default/Async-Call(->) F</b>: 同步调用输入"TRUE"; 异步调用输入"FALSE"

<b>输出控件:</b>
 - <b>State with Arguments</b>: 包含 JKI 状态机状态、参数等信息的字符串





### Build Message with Arguments++.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. Different message type symbol(->|,->,-@) will be used in different Polymophic Vi instance.

Polymophic Option:
 - Build Message with Arguments(Auto Check).vi
 - Build Asynchronous Message with Arguments.vi
 - Build No-Reply Asynchronous Message with Arguments.vi
 - Build Synchronous Message with Arguments.vi

<b>Inputs:</b>
 - <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
 - <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
 - <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

<b>Outputs:</b>
 - <b>State with Arguments</b>: String stands for state with arguments

<b>Inputs:</b>


<b>Outputs:</b>


#### Build Message with Arguments(Auto Check).vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. The message type from input <b>State with Arguments</b> will be used.

<B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
<b>Arguments ("")</b> input is "Arguments"
<b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments" as no message symbol is detected.

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is ""
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -@ Callee"

<b>Inputs:</b>
 - <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
 - <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
 - <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

<b>Outputs:</b>
 - <b>State with Arguments</b>: String stands for state with arguments


#### Build Asynchronous Message with Arguments.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values with asyc-message symobol "->" if <b>Target Module ("")</b> is specified.

<B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
<b>Arguments ("")</b> input is "Arguments"
<b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments -> Callee". It's different with Build Message with Arguments(Auto Check).vi. . Message Type Symbol is replaced with "->".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is ""
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee". Message Type Symbol is replaced with "->".

<b>Inputs:</b>
 - <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
 - <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
 - <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

<b>Outputs:</b>
 - <b>State with Arguments</b>: String stands for state with arguments


#### Build No-Reply Asynchronous Message with Arguments.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values with No-Reply asyc-message symobol "->|" if <b>Target Module ("")</b> is specified.

<B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
<b>Arguments ("")</b> input is "Arguments"
<b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments ->| Callee". It's different with Build Message with Arguments(Auto Check).vi. Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments ->| NewCallee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is ""
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth ->| NewCallee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "->|".

<b>Inputs:</b>
 - <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
 - <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
 - <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

<b>Outputs:</b>
 - <b>State with Arguments</b>: String stands for state with arguments


#### Build Synchronous Message with Arguments.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values with sync-message symobol "-@" if <b>Target Module ("")</b> is specified.

<B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
<b>Arguments ("")</b> input is "Arguments"
<b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments ->| Callee". It's different with Build Message with Arguments(Auto Check).vi. Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -@ NewCallee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is ""
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -@ NewCallee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -@ Callee".

<b>Inputs:</b>
 - <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
 - <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
 - <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

<b>Outputs:</b>
 - <b>State with Arguments</b>: String stands for state with arguments


#### Build Interrupt Status Message.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. The message type from input <b>State with Arguments</b> will be used.
<B>For Example:</B>
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

<b>Inputs:</b>
 - <b>State with Arguments</b>:
 - <b>Arguments ("")</b>:

<b>Outputs:</b>
 - <b>State with Arguments</b>:


#### Build Normal Status Message.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. The message type from input <b>State with Arguments</b> will be used.
<B>For Example:</B>
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

<b>Inputs:</b>
 - <b>State with Arguments</b>:
 - <b>Arguments ("")</b>:

<b>Outputs:</b>
 - <b>State with Arguments</b>:


#### Build Register Status Message.vi

Builds register status message. The message looks like:
[source-state]@[source-module] >> [response-message]@[response-module] -><register>
For examples:
DownloadFinished@Downloader >> StartPlay@Player -><register>
DownloadFinished@Downloader >> StartPlay -><register> // response-module is current module
DownloadFinished@Downloader  -><register> // response-module is current module. response-message is DownloadFinished
DownloadFinished@* >> StartPlay@Player -><register> // Any Module's DownloadFinished is registered to Player's StartPlay state.

<b>Inputs:</b>
 - <b>Source CSM Name (* as Default)</b>:
 - <b>CSM Name</b>:
 - <b>Status</b>:
 - <b>Response Message (if "", same as Source Message)</b>:

<b>Outputs:</b>
 - <b>State with Arguments</b>:


#### Build Unregister Status Message.vi

Builds unregister status message. The message looks like:
[source-state]@[source-module] >> [response-module] -><unregister>
For examples:
DownloadFinished@Downloader >> StartPlay -><unregister>
DownloadFinished@Downloader  -><unregister>

<b>Inputs:</b>
 - <b>Source CSM Name (* as Default)</b>:
 - <b>CSM Name</b>:
 - <b>Status</b>:

<b>Outputs:</b>
 - <b>State with Arguments</b>:


### Add State(s) to Queue By BOOL++.vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。Bool输入决定要连接的字符串是TRUE还是False。

<b>Inputs:</b>
 - <b>State Queue("")</b>: 整个状态队列被连接到此输入
 - <b>TRUE("")</b>: <b>Bool</b> 为 True 时插入的状态字符串
 - <b>False("")</b>: <b>Bool</b> 为 False 时插入的状态字符串
 - <b>Bool</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
 - <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的顶部。如果为False，它被附加到尾部。

<b>Outputs:</b>
 - <b>State Queue Out</b>: 返回继续执行的所有状态及参数。


#### Add State(s) to Queue By BOOL(Element).vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。Bool输入决定要连接的字符串是TRUE还是False。

<b>Inputs:</b>
 - <b>State Queue("")</b>: 整个状态队列被连接到此输入
 - <b>TRUE("")</b>: <b>Bool</b> 为 True 时插入的状态字符串
 - <b>False("")</b>: <b>Bool</b> 为 False 时插入的状态字符串
 - <b>Bool</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
 - <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的顶部。如果为False，它被附加到尾部。

<b>Outputs:</b>
 - <b>State Queue Out</b>: 返回继续执行的所有状态及参数。


#### Add State(s) to Queue By BOOL(Array Left).vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。Bool输入决定要连接的字符串是TRUE还是False。

<b>Inputs:</b>
 - <b>State Queue("")</b>: 整个状态队列被连接到此输入
 - <b>TRUE("")</b>: <b>Bool</b> 为 True 时插入的状态字符串
 - <b>False("")</b>: <b>Bool</b> 为 False 时插入的状态字符串
 - <b>Bool</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
 - <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的顶部。如果为False，它被附加到尾部。

<b>Outputs:</b>
 - <b>State Queue Out</b>: 返回继续执行的所有状态及参数。


#### Add State(s) to Queue By BOOL(Array Right).vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。Bool输入决定要连接的字符串是TRUE还是False。

<b>Inputs:</b>
 - <b>State Queue("")</b>: 整个状态队列被连接到此输入
 - <b>TRUE("")</b>: <b>Bool</b> 为 True 时插入的状态字符串
 - <b>False("")</b>: <b>Bool</b> 为 False 时插入的状态字符串
 - <b>Bool</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
 - <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的顶部。如果为False，它被附加到尾部。

<b>Outputs:</b>
 - <b>State Queue Out</b>: 返回继续执行的所有状态及参数。


#### Add State(s) to Queue By BOOL(Array All).vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。Bool输入决定要连接的字符串是TRUE还是False。

<b>Inputs:</b>
 - <b>State Queue("")</b>: 整个状态队列被连接到此输入
 - <b>TRUE("")</b>: <b>Bool</b> 为 True 时插入的状态字符串
 - <b>False("")</b>: <b>Bool</b> 为 False 时插入的状态字符串
 - <b>Bool</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
 - <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的顶部。如果为False，它被附加到尾部。

<b>Outputs:</b>
 - <b>State Queue Out</b>: 返回继续执行的所有状态及参数。

### CSM - Broadcast Status Change.vi

向系统广播状态更改。已注册状态的 CSM 模块将接收到状态更改。

<b>输入控件:</b>
 - <b>Status with Arguments</b>: 将被广播的状态及参数
 - <b>State Queue("")</b>: 整个状态队列被连接到此输入
 - <b>Broadcast(T)</b>: 控制是否广播的开关输入

<b>输出控件:</b>
 - <b>Remaining States</b>: 返回继续执行的所有状态及参数。


## Arguments




### CSM - Make String Arguments Safe.vi

'->','->|','-@','-&','<-" 是关键字，不能出现在参数中。使用此 VI 保证参数安全。

<b>Inputs:</b>
 - <b>Argurment String</b>: 可能包含关键字的参数 '->','->|','-@','-&','<-".

<b>Outputs:</b>
 - <b>Safe Argurment String</b>: 安全参数



### CSM - Revert Arguments-Safe String.vi

'->','->|','-@','-&','<-" 是关键字，不能出现在参数中。使用<b>CSM Make String Arguments Safe.vi</b>保证参数安全。此VI用于将安全参数转换为原始参数。

<b>Inputs:</b>
 - <b>Safe Argurment String</b>: 安全参数

<b>Outputs:</b>
 - <b>Origin Argurment String</b>: 可能包含关键字的参数 '->','->|','-@','-&','<-".

### CSM - Convert Data to HexStr.vi

将复杂参数（变体）转换为十六进制字符串，该字符串可以安全地用作状态参数，而不会破坏字符串队列逻辑。

<b>输入控件:</b>
 - <b>Variant</b>: 数据，保存为变体(variant)格式

<b>输出控件:</b>
 - <b>HEX String (0-9,A-F)</b>: Hex字符串格式，不包含不可见字符，符合 CSM 的参数要求

### CSM - Convert HexStr to Data.vi

将十六进制字符串参数转换回变体数据。

<b>输入控件:</b>
 - <b>HEX String</b>: Hex字符串格式，不包含不可见字符，符合 CSM 的参数要求

<b>输出控件:</b>
 - <b>Variant</b>: 数据，保存为变体(variant)格式
 - <b>error out</b>: 错误簇


## Advance APIs


### CSM - Start Async Call.vi

异步调用模板代码的VI片段

<b>输入控件:</b>
 - 无

<b>输出控件:</b>
 - 无


### CSM - Synchronized Call.vi

同步调用模板代码的VI片段

<b>输入控件:</b>
 - 无
 -
<b>输出控件:</b>
 - 无


### CSM - Mark As Worker Module.vi

在CSM名称后添加“＃”，以标记此模块为工作者，其与具有相同名称的其他工作者共享相同的消息队列。一个带有生成的UUID的实际名称将被分配给此CSM模块。

<b>输入控件:</b>
 - <b>CSM Name</b>: CSM 模块名称

<b>输出控件:</b>
 - <b>CSM Name(marked as worker)</b>: 添加“＃”标记 的CSM 模块名称


### CSM - Compact Multiple States.vi

将多个状态紧凑成单个字符串以供输入使用

<b>输入控件:</b>
 - <b>States in Lines</b>: 多个状态的字符串数组

<b>输出控件:</b>
 - <b>States</b>: 包含所有输入状态的字符串


### CSM - Check If Module Exists.vi

检查 CSM 模块是否存在

<b>输入控件:</b>
 - <b>CSM Name</b>: CSM 模块名称
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>Exist?</b>: 返回模式是否存在，存在返回True，不存在返回False
 - <b>CSM Name(dup)</b>: 返回 <b>CSM Name</b>
 - <b>Error out</b>: 错误簇


### CSM - List Modules.vi

列出系统中所有活动的CSM模块。

<b>输入控件:</b>
 - <b>Exclude Standalone CSM(T)</b>: 是否包含独立工作模式的模块
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>Module Names</b>: 模块名称列表
 - <b>Error out</b>: 错误簇

### CSM - Module Status.vi

获取CSM模块的状态

<b>输入控件:</b>
 - <b>CSM Name</b>: CSM 模块名称.
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>Mode</b>: 返回模块的工作模式："Stand-alone", "CSM" 或 "Action Worker".
 - <b>#As Worker</b>: 工作者模式下，此模块的工作者数量
 - <b>#msg to be processed</b>: CSM消息队列中的待处理消息个数
 - <b>CSM Name(dup)</b>: 返回 <b>CSM Name</b>
 - <b>Error out</b>: 错误簇


### CSM - Register Status Change.vi

注册以接收其他CSM模块状态更改的通知。如果未连接 “Response Message” 或输入为空，则将使用相同的<b>Status</b> 名称作为响应消息。

<b>输入控件:</b>
 - <b>CSM Name</b>: CSM 模块名称.
 - <b>Source CSM Name (* as Default)</b>: 生成状态的CSM模块。您可以使用“*”来表示所有生成相同状态的模块。
 - <b>Status</b>: 状态字符串
 - <b>Response Message (if "", same as Source Message)</b>: 注册后，如果状态发生变化，将接收到此消息。
 - <b>Priority(T:As Status,F:As Interrupt)</b>: 如果响应消息为False，则将其插入到状态队列的前面；否则，将其附加到队列的尾部。
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>CSM Name(dup)</b>: 返回 <b>CSM Name</b>
 - <b>Error out</b>: 错误簇


### CSM - Unregister Status Change.vi

取消注册其他 CSM 模块状态更改的通知。

<b>输入控件:</b>
 - <b>CSM Name</b>: CSM 模块名称.
 - <b>Source CSM Name</b>: 生成状态的CSM模块。您可以使用“*”来表示所有生成相同状态的模块。
 - <b>Status</b>: 状态字符串
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>CSM Name(dup)</b>: 返回 <b>CSM Name</b>
 - <b>Error out</b>: 错误簇


### CSM - Get New State Notifier Event.vi

<b>输入控件:</b>
 - <b>Name("" to use uuid) in</b>: CSM 模块名称
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>New State Notifier Event</b>: 用户事件句柄，用来当收到消息时，使用CSM模块中断在事件结构中的等待
 - <b>Error out</b>: 错误簇


## Non-CSM Support

### CSM - Post Message.vi

向指定的CSM发布一条消息，相当于异步调用，但不等待返回参数。

<b>输入控件:</b>
 - <b>Target Module</b>:目标 CSM 模块名称
 - <b>State</b>: 消息字符串
 - <b>Arguments ("")</b>: 消息参数
 - <b>Error In (no error)</b>: 错误簇

<b>输出控件:</b>
 - <b>error out</b>: 错误簇


### CSM - Send Message and Wait for Reply.vi

向指定的CSM发布一条消息并等待回复，相当于同步调用，在指定超时内没有收到返回，将返回超时错误。

<b>输入控件:</b>
 - <b>Target Module</b>: 目标 CSM 模块名称
 - <b>State</b>: 消息字符串
 - <b>Arguments ("")</b>: 消息参数
 - <b>Response Timeout(5000ms)</b>: 等待返回的超时设置，默认 5000ms.
 - <b>Error In (no error)</b>: 错误簇

<b>输出控件:</b>
 - <b>Arguments</b>: Response returned.
 - <b>error out</b>: 错误簇


### CSM - Status Change Event.vi

Obtain CSM Global Log Event Reference.
- <b>Error in</b>: Error cluster
- <b>CSM Global Log Event</b>: User event reference for CSM global log.
- <b>Error out</b>: Error cluster

<b>Inputs:</b>
 - <b>Error in</b>:
 - <b>Name("" to use uuid) in</b>:

<b>Outputs:</b>
 - <b>Error out</b>:
 - <b>Status Change Event</b>:


### CSM - Destroy Status Change Event.vi

Release CSM Global Log Event Reference.
- <b>CSM Global Log Event</b>:
- <b>Error in</b>: Error cluster
- <b>Error out</b>: Error cluster

<b>Inputs:</b>
 - <b>Error in</b>:
 - <b>Status Change Event</b>:

<b>Outputs:</b>
 - <b>Error out</b>:


## Side-Loop Support


### CSM - Request CSM to Post Message.vi

申请 CSM 发送消息。通常用于和CSM并行的功能循环，这些功能循环和 CSM 一起完成完整模块功能。

<b>Inputs:</b>
 - <b>Module Name</b>:发送状态的CSM
 - <b>Status</b>: 将被广播的状态
 - <b>Arguments ("")</b>: 将被广播的状态参数
 - <b>Target Module</b>:目标模块
 - <b>Error In (no error)</b>: 错误簇
 -
<b>Outputs:</b>
 - <b>error out</b>: 错误簇


### CSM - Request CSM to Broadcast Status Change.vi

申请 CSM 发布状态。通常用于和CSM并行的功能循环，这些功能循环和 CSM 一起完成完整模块功能。

<b>Inputs:</b>
 - <b>Module Name</b>:发送状态的CSM
 - <b>Status</b>: 将被广播的状态
 - <b>Arguments ("")</b>: 将被广播的状态参数
 - <b>Broadcast(T)</b>: 控制是否广播的开关输入
 - <b>Error In (no error)</b>: 错误簇

<b>Outputs:</b>
 - <b>error out</b>: 错误簇


### CSM - Module Turns Invalid.vi

检查CSM是否已经退出。通常用于和CSM并行的功能循环，这些功能循环和 CSM 一起完成完整模块功能。 本VI用于并行循环的退出条件。

<b>Inputs:</b>
 - <b>CSM Name</b>: 模块名称

<b>Outputs:</b>
 - <b>Turn Invalid(Exit)?</b>: 是否已经退出


## Global Log Event


### CSM - Global Log Event.vi

获取 CSM 全局状态用户事件句柄

<b>输入控件:</b>
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>CSM Global Log Event</b>: CSM 全局状态用户事件句柄
 - <b>Error out</b>: 错误簇


### CSM - Destroy Global Log Event.vi

释放 CSM 全局状态用户事件句柄

<b>输入控件:</b>
 - <b>CSM Global Log Event</b>: CSM 全局状态用户事件句柄
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>Error out</b>: 错误簇


### CSM - Generate User Global Log.vi



<b>Inputs:</b>
 - <b>Error in</b>:
 - <b>From Who</b>:
 - <b>ModuleName</b>:
 - <b>Log</b>:
 - <b>Arguments</b>:

<b>Outputs:</b>
 - <b>error out</b>:




## Utility VIs


### Build Error Cluster.vi


创建一个错误簇（error cluster），以标准 LabVIEW 的方式从调用 VI 的调用链中构建源字符串。构建的源字符串形式为：
"<B>调用的 VI</B> 在 <B>调用 VI 的调用者</B>-><B>调用 VI 的调用者的调用者</B>->等等...->等等..."
可选的 'String to Prepend to source ("")' 字符串输入可用于在源字符串中添加额外的描述信息。如果存在这个字符串，它将用括号括起来，并添加到源字符串之前。

<b>输入控件:</b>
 - <b>code</b>: 错误码
 - <b>String to Prepend to source ("")</b>: 错误信息字符串

<b>输出控件:</b>
 - <b>error out</b>: 错误簇


### Build Internal State String.vi

构建包含 JKI 状态机状态、参数等信息的字符串。

<b>输入控件:</b>s
 - <b>State</b>: 状态字符串
 - <b>Arguments ("")</b>: <b>State</b>的参数
 - <b>Arg-State ("")</b>: 发送此消息的模块在发送此消息时处于的状态
 - <b>Source ("")</b>: 发送此消息的模块名称

<b>输出控件:</b>
 - <b>State with Arguments</b>: 包含 JKI 状态机状态、参数等信息的字符串


### String History Cacher.vi

保存当前输入的字符串到缓存，缓存的历史字符串，当超出最大长度限制时，最先进入的缓存字符串将被覆盖。用于调试CSM的历史状态。

<b>输入控件:</b>
 - <b>String</b>: 待缓存字符串
 - <b>length</b>: 缓存的历史字符串最大字符串长度
 - <b>Include Timestamp(F)</b>: 是否在每行开头包含时间戳。

<b>输出控件:</b>
 - <b>String Cache</b>: 缓存的历史字符串


### Timeout Selector.vi

用于包含用户事件结构的模板中

<b>输入控件:</b>
 - <b>Timeout Expected</b>: 预期的超时设置
 - <b>Remaining States</b>: 如果还有剩余的状态，输出将为 0，否则输出为预期值

<b>输出控件:</b>
 - <b>Timeout</b>: 仲裁后使用的超时设置


### Trim Both Whitespace.vi

从 <B>string</B> 的开头、结尾或两者同时移除所有 ASCII 空白字符（空格、制表符、回车和换行）。

<b>输入控件:</b>
 - <b>string</b>: 待处理字符串

<b>输出控件:</b>
 - <b>trimmed string</b>: 处理后的字符串


### uuid.vi

根据标准方法生成 <b>Universally Unique Identifier(UUID)</b>。 例如:

     - 59703F3AD837
     - 106A470BA5EC
     - 9B781DB313AF

<b>输入控件:</b>
 - 无

<b>输出控件:</b>
 - <b>UUID</b>: 生成的 UUID


### CSM - Broadcast Message Type.ctl

广播消息类型定义。
- <b>Interrupt:</b> 高优先级，作为中端
- <b>Status:</b> 普通优先级，作为消息


### CSM - Message Type.ctl

消息类型定义。
- <b>Async:</b> 异步消息 (->)
- <b>Async without Reply:</b> 无返回异步消息 (->|)
- <b>Sync:</b> 同步消息 (-@)




### Global Log To String.vi


<b>Inputs:</b>
 - <b>Log</b>:

<b>Outputs:</b>
 - <b>String</b>:
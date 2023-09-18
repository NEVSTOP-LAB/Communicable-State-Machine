
## JKISM++ No-Event Structure Template.vi

用于创建具有无用户界面的 JKISM 模块的模板

<b>输入控件:</b>
- <b>Name("" to use uuid)</b>: JKISM 模块名称
   - 如果输入为 ""，将使用 UUID 作为模块名称。该模块被标记为独立模式，不会包含在模块列表中。
   - 如果输入以 '#' 结尾，则该模块将在工作模式下运行。具有相同名称的模块将共享同一消息队列。任何外部消息将由其中一个模块处理，取决于哪个模块空闲。
   - 否则，输入字符串将被用作模块名称，该名称应在系统中保持唯一。如果在系统中使用重复的模块名称，JKISM 将进入 "Critical Error" 状态。

<b>输出控件:</b>
 - 无

## JKISM++ With Event Structure Template.vi

用于创建具有用户界面的 JKISM 模块的模板，模板中包含用户事件结构用于响应用户操作。

<b>输入控件:</b>
 - <b>Name("" to use uuid)</b>: JKISM 模块名称
   - 如果输入为 ""，将使用 UUID 作为模块名称。该模块被标记为独立模式，不会包含在模块列表中。
   - 如果输入以 '#' 结尾，则该模块将在工作模式下运行。具有相同名称的模块将共享同一消息队列。任何外部消息将由其中一个模块处理，取决于哪个模块空闲。
   - 否则，输入字符串将被用作模块名称，该名称应在系统中保持唯一。如果在系统中使用重复的模块名称，JKISM 将进入 "Critical Error" 状态。

<b>输出控件:</b>
 - 无


## JKISM++ With Event Structure Template - Tiny.vi

用于创建具有用户界面的 JKISM 模块的模板，模板中包含用户事件结构用于响应用户操作。此模板的代码比较紧凑。

<b>输入控件:</b>
- <b>Name("" to use uuid)</b>: JKISM 模块名称
   - 如果输入为 ""，将使用 UUID 作为模块名称。该模块被标记为独立模式，不会包含在模块列表中。
   - 如果输入以 '#' 结尾，则该模块将在工作模式下运行。具有相同名称的模块将共享同一消息队列。任何外部消息将由其中一个模块处理，取决于哪个模块空闲。
   - 否则，输入字符串将被用作模块名称，该名称应在系统中保持唯一。如果在系统中使用重复的模块名称，JKISM 将进入 "Critical Error" 状态。

<b>输出控件:</b>
 - 无

## Parse State Queue++.vi

解析JKI状态机状态队列，返回将执行的下一个当前状态、参数等信息。


<b>输入控件:</b>
 - <b>State Queue</b>: 整个状态队列被连接到此输入。这应该来自 JKISM 的移位寄存器。
 - <b>Error In (no error)</b>: 来自JKI状态机的错误簇被连接到此输入。如果发生错误并出现在此输入上，则当前状态输出将返回 "Error Handler" 状态。
 - <b>Name("" to use uuid)</b>: JKISM 模块名称
    - 如果输入为 ""，将使用 UUID 作为模块名称。该模块被标记为独立模式，不会包含在模块列表中。
   - 如果输入以 '#' 结尾，则该模块将在工作模式下运行。具有相同名称的模块将共享同一消息队列。任何外部消息将由其中一个模块处理，取决于哪个模块空闲。
   - 否则，输入字符串将被用作模块名称，该名称应在系统中保持唯一。如果在系统中使用重复的模块名称，JKISM 将进入 "Critical Error" 状态。
 - <b>Response Timeout(5000ms)</b>:同步调用时的响应超时设置，默认 5000 ms.
 - <b>Dequeue Timeout(0ms)</b>: 检查 JKISM 消息队列的超时设置，默认为0，不进行等待。
 - <b>Response Arguments</b>: 来自上一个状态的响应参数。它应该来连接 JKISM 的移位寄存器，用于传递外部调用的返回值。

<b>输出控件:</b>
 - <b>Remaining States</b>:  返回继续执行的所有状态及参数。 These should be passed through the current state in the state machine. These can also be modified or augmented within the current state if necessary.
 - <b>Arguments</b>: 返回可能在当前状态字符串中使用的任何参数。这些参数位于“>>”字符之后。<b>注意：</b>参数变量不得包含任何不可打印的字符，比如换行符或回车符。
 - <b>Current State</b>: 将执行的下一个当前状态
 - <b>Name Used</b>: 分配给此JKISM模块的实际名称
 - <b>Argument - State</b>: 如果是 JKISM++ 定义的内置状态，此参数表示此状态的前状态
 - <b>From Who</b>: 如果<b>Current State</b> 是由外部发送的，则这是源JKISM模块名称。


## Build State String with Arguments++.vi

构建一个包含JKI状态机参数的状态字符串。

<B>例如:</B>

发送给本地状态机时, <b>Target Module ("")</b> 应该为空.

      If State = A 并且没有参数, 那么 <b>State with Arguments</b> = A
      If State = A , Arguments = B 那么 <b>State with Arguments</b> = A >> B

在发送给其他JKISM的情况下, 假设 <b>Target Module ("")</b> 的名称是 "Target"

   - 同步调用，发送的消息后等待返回:

         If State = A 并且没有参数, 那么 <b>State with Arguments</b> = A -@target
         If State = A , Arguments = B 那么 <b>State with Arguments</b> = A >> B -@target

   - 异步调用，发送消息后，将进入"Async Message Posted" 状态，当外部模块处理完毕后，本地模块将收到 "Async Response" 消息:

         If State = A 并且没有参数, 那么 <b>State with Arguments</b> = A ->target
         If State = A , Arguments = B 那么 <b>State with Arguments</b> = A >> B ->target

<b>输入控件:</b>
 - <b>State</b>: 状态或消息名称字符串
 - <b>Arguments ("")</b>: <b>State</b> 的参数
 - <b>Target Module ("")</b>: 此消息发送的目标 JKISM 模块名称
 - <b>Sync-Call(-@) T By Default/Async-Call(->) F</b>: 同步调用输入"TRUE"; 异步调用输入"FALSE"

<b>输出控件:</b>
 - <b>State with Arguments</b>: 包含 JKI 状态机状态、参数等信息的字符串


## JKISM++ Convert Data to HexStr.vi

将复杂参数（变体）转换为十六进制字符串，该字符串可以安全地用作状态参数，而不会破坏字符串队列逻辑。

<b>输入控件:</b>
 - <b>Variant</b>: 数据，保存为变体(variant)格式

<b>输出控件:</b>
 - <b>HEX String (0-9,A-F)</b>: Hex字符串格式，不包含不可见字符，符合 JKISM 的参数要求

## JKISM++ Convert HexStr to Data.vi

将十六进制字符串参数转换回变体数据。

<b>输入控件:</b>
 - <b>HEX String</b>: Hex字符串格式，不包含不可见字符，符合 JKISM 的参数要求

<b>输出控件:</b>
 - <b>Variant</b>: 数据，保存为变体(variant)格式
 - <b>error out</b>: 错误簇



## JKISM++ Broadcast Status Change.vi

向系统广播状态更改。已注册状态的 JKISM 模块将接收到状态更改。

<b>输入控件:</b>
 - <b>Status with Arguments</b>: 将被广播的状态及参数
 - <b>State Queue("")</b>: 整个状态队列被连接到此输入
 - <b>Broadcast(T)</b>: 控制是否广播的开关输入

<b>输出控件:</b>
 - <b>Remaining States</b>: 返回继续执行的所有状态及参数。


## JKISM++ Post Message.vi

向指定的JKISM发布一条消息，相当于异步调用，但不等待返回参数。

<b>输入控件:</b>
 - <b>Target Module</b>:目标 JKISM 模块名称
 - <b>State</b>: 消息字符串
 - <b>Arguments ("")</b>: 消息参数
 - <b>Error In (no error)</b>: 错误簇

<b>输出控件:</b>
 - <b>error out</b>: 错误簇


## JKISM++ Send Message and Wait for Reply.vi

向指定的JKISM发布一条消息并等待回复，相当于同步调用，在指定超时内没有收到返回，将返回超时错误。

<b>输入控件:</b>
 - <b>Target Module</b>: 目标 JKISM 模块名称
 - <b>State</b>: 消息字符串
 - <b>Arguments ("")</b>: 消息参数
 - <b>Response Timeout(5000ms)</b>: 等待返回的超时设置，默认 5000ms.
 - <b>Error In (no error)</b>: 错误簇

<b>输出控件:</b>
 - <b>Arguments</b>: Response returned.
 - <b>error out</b>: 错误簇


## JKISM++ Mark As Worker Module.vi

在JKISM名称后添加“＃”，以标记此模块为工作者，其与具有相同名称的其他工作者共享相同的消息队列。一个带有生成的UUID的实际名称将被分配给此JKISM模块。

<b>输入控件:</b>
 - <b>JKISM Name</b>: JKISM 模块名称

<b>输出控件:</b>
 - <b>JKISM Name(marked as worker)</b>: 添加“＃”标记 的JKISM 模块名称


## JKISM++ Check If Module Exists.vi

检查 JKISM 模块是否存在

<b>输入控件:</b>
 - <b>JKISM Name</b>: JKISM 模块名称
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>Exist?</b>: 返回模式是否存在，存在返回True，不存在返回False
 - <b>JKISM Name(dup)</b>: 返回 <b>JKISM Name</b>
 - <b>Error out</b>: 错误簇


## JKISM++ List Modules.vi

列出系统中所有活动的JKISM模块。

<b>输入控件:</b>
 - <b>Exclude Standalone JKISM(T)</b>: 是否包含独立工作模式的模块
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>Module Names</b>: 模块名称列表
 - <b>Error out</b>: 错误簇

## JKISM++ Module Status.vi

获取JKISM模块的状态

<b>输入控件:</b>
 - <b>JKISM Name</b>: JKISM 模块名称.
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>Mode</b>: 返回模块的工作模式："Stand-alone", "JKISM" 或 "Action Worker".
 - <b>#As Worker</b>: 工作者模式下，此模块的工作者数量
 - <b>#msg to be processed</b>: JKISM消息队列中的待处理消息个数
 - <b>JKISM Name(dup)</b>: 返回 <b>JKISM Name</b>
 - <b>Error out</b>: 错误簇


## JKISM++ Register Status Change.vi

注册以接收其他JKISM++模块状态更改的通知。如果未连接 “Response Message” 或输入为空，则将使用相同的<b>Status</b> 名称作为响应消息。

<b>输入控件:</b>
 - <b>JKISM Name</b>: JKISM 模块名称.
 - <b>Source JKISM Name (* as Default)</b>: 生成状态的JKISM模块。您可以使用“*”来表示所有生成相同状态的模块。
 - <b>Status</b>: 状态字符串
 - <b>Response Message (if "", same as Source Message)</b>: 注册后，如果状态发生变化，将接收到此消息。
 - <b>Priority(T:As Status,F:As Interrupt)</b>: 如果响应消息为False，则将其插入到状态队列的前面；否则，将其附加到队列的尾部。
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>JKISM Name(dup)</b>: 返回 <b>JKISM Name</b>
 - <b>Error out</b>: 错误簇


## JKISM++ Unregister Status Change.vi

取消注册其他 JKISM 模块状态更改的通知。

<b>输入控件:</b>
 - <b>JKISM Name</b>: JKISM 模块名称.
 - <b>Source JKISM Name</b>: 生成状态的JKISM模块。您可以使用“*”来表示所有生成相同状态的模块。
 - <b>Status</b>: 状态字符串
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>JKISM Name(dup)</b>: 返回 <b>JKISM Name</b>
 - <b>Error out</b>: 错误簇


## JKISM++ Get New State Notifier Event.vi

<b>输入控件:</b>
 - <b>Name("" to use uuid) in</b>: JKISM 模块名称
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>New State Notifier Event</b>: 用户事件句柄，用来当收到消息时，使用JKISM模块中断在事件结构中的等待
 - <b>Error out</b>: 错误簇


## JKISM++ Global Log Event.vi

获取 JKISM 全局状态用户事件句柄

<b>输入控件:</b>
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>JKISM Global Log Event</b>: JKISM 全局状态用户事件句柄
 - <b>Error out</b>: 错误簇


## JKISM++ Destroy Global Log Event.vi

释放 JKISM 全局状态用户事件句柄

<b>输入控件:</b>
 - <b>JKISM Global Log Event</b>: JKISM 全局状态用户事件句柄
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>Error out</b>: 错误簇


## JKISM++ Compact Multiple States.vi

将多个状态紧凑成单个字符串以供输入使用

<b>输入控件:</b>
 - <b>States in Lines</b>: 多个状态的字符串数组

<b>输出控件:</b>
 - <b>States</b>: 包含所有输入状态的字符串


## JKISM++ Start Async Call.vi

异步调用模板代码的VI片段

<b>输入控件:</b>
 - 无

<b>输出控件:</b>
 - 无


## JKISM++ Synchronized Call.vi

同步调用模板代码的VI片段

<b>输入控件:</b>
 - 无
 -
<b>输出控件:</b>
 - 无


## Build Error Cluster.vi


创建一个错误簇（error cluster），以标准 LabVIEW 的方式从调用 VI 的调用链中构建源字符串。构建的源字符串形式为：
"<B>调用的 VI</B> 在 <B>调用 VI 的调用者</B>-><B>调用 VI 的调用者的调用者</B>->等等...->等等..."
可选的 'String to Prepend to source ("")' 字符串输入可用于在源字符串中添加额外的描述信息。如果存在这个字符串，它将用括号括起来，并添加到源字符串之前。

<b>输入控件:</b>
 - <b>code</b>: 错误码
 - <b>String to Prepend to source ("")</b>: 错误信息字符串

<b>输出控件:</b>
 - <b>error out</b>: 错误簇


## Build Internal State String.vi

构建包含 JKI 状态机状态、参数等信息的字符串。

<b>输入控件:</b>s
 - <b>State</b>: 状态字符串
 - <b>Arguments ("")</b>: <b>State</b>的参数
 - <b>Arg-State ("")</b>: 发送此消息的模块在发送此消息时处于的状态
 - <b>Source ("")</b>: 发送此消息的模块名称

<b>输出控件:</b>
 - <b>State with Arguments</b>: 包含 JKI 状态机状态、参数等信息的字符串


## String History Cacher.vi

保存当前输入的字符串到缓存，缓存的历史字符串，当超出最大长度限制时，最先进入的缓存字符串将被覆盖。用于调试JKISM的历史状态。

<b>输入控件:</b>
 - <b>String</b>: 待缓存字符串
 - <b>length</b>: 缓存的历史字符串最大字符串长度
 - <b>Include Timestamp(F)</b>: 是否在每行开头包含时间戳。

<b>输出控件:</b>
 - <b>String Cache</b>: 缓存的历史字符串


## Timeout Selector.vi

用于包含用户事件结构的模板中

<b>输入控件:</b>
 - <b>Timeout Expected</b>: 预期的超时设置
 - <b>Remaining States</b>: 如果还有剩余的状态，输出将为 0，否则输出为预期值

<b>输出控件:</b>
 - <b>Timeout</b>: 仲裁后使用的超时设置


## Trim Both Whitespace.vi

从 <B>string</B> 的开头、结尾或两者同时移除所有 ASCII 空白字符（空格、制表符、回车和换行）。

<b>输入控件:</b>
 - <b>string</b>: 待处理字符串

<b>输出控件:</b>
 - <b>trimmed string</b>: 处理后的字符串


## uuid.vi

根据标准方法生成 <b>Universally Unique Identifier(UUID)</b>。 例如:

     - 59703F3AD837
     - 106A470BA5EC
     - 9B781DB313AF

<b>输入控件:</b>
 - 无

<b>输出控件:</b>
 - <b>UUID</b>: 生成的 UUID


## JKISM++ Broadcast Message Type.ctl

广播消息类型定义。
- <b>Interrupt:</b> 高优先级，作为中端
- <b>Status:</b> 普通优先级，作为消息

## Add State(s) to Queue By BOOL++.vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。Bool输入决定要连接的字符串是TRUE还是False。

<b>Inputs:</b>
 - <b>State Queue("")</b>: 整个状态队列被连接到此输入
 - <b>TRUE("")</b>: <b>Bool</b> 为 True 时插入的状态字符串
 - <b>False("")</b>: <b>Bool</b> 为 False 时插入的状态字符串
 - <b>Bool</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
 - <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的顶部。如果为False，它被附加到尾部。

<b>Outputs:</b>
 - <b>State Queue Out</b>: 返回继续执行的所有状态及参数。


## Add State(s) to Queue By BOOL(Element).vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。Bool输入决定要连接的字符串是TRUE还是False。

<b>Inputs:</b>
 - <b>State Queue("")</b>: 整个状态队列被连接到此输入
 - <b>TRUE("")</b>: <b>Bool</b> 为 True 时插入的状态字符串
 - <b>False("")</b>: <b>Bool</b> 为 False 时插入的状态字符串
 - <b>Bool</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
 - <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的顶部。如果为False，它被附加到尾部。

<b>Outputs:</b>
 - <b>State Queue Out</b>: 返回继续执行的所有状态及参数。


## Add State(s) to Queue By BOOL(Array Left).vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。Bool输入决定要连接的字符串是TRUE还是False。

<b>Inputs:</b>
 - <b>State Queue("")</b>: 整个状态队列被连接到此输入
 - <b>TRUE("")</b>: <b>Bool</b> 为 True 时插入的状态字符串
 - <b>False("")</b>: <b>Bool</b> 为 False 时插入的状态字符串
 - <b>Bool</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
 - <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的顶部。如果为False，它被附加到尾部。

<b>Outputs:</b>
 - <b>State Queue Out</b>: 返回继续执行的所有状态及参数。


## Add State(s) to Queue By BOOL(Array Right).vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。Bool输入决定要连接的字符串是TRUE还是False。

<b>Inputs:</b>
 - <b>State Queue("")</b>: 整个状态队列被连接到此输入
 - <b>TRUE("")</b>: <b>Bool</b> 为 True 时插入的状态字符串
 - <b>False("")</b>: <b>Bool</b> 为 False 时插入的状态字符串
 - <b>Bool</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
 - <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的顶部。如果为False，它被附加到尾部。

<b>Outputs:</b>
 - <b>State Queue Out</b>: 返回继续执行的所有状态及参数。


## Add State(s) to Queue By BOOL(Array All).vi

根据高优先级和Bool输入，此VI生成TRUE/False和剩余状态的连接状态。High Priority输入决定是否在剩余状态之前或之后连接TRUE或False字符串。Bool输入决定要连接的字符串是TRUE还是False。

<b>Inputs:</b>
 - <b>State Queue("")</b>: 整个状态队列被连接到此输入
 - <b>TRUE("")</b>: <b>Bool</b> 为 True 时插入的状态字符串
 - <b>False("")</b>: <b>Bool</b> 为 False 时插入的状态字符串
 - <b>Bool</b>: 选择连接到TRUE终端或False终端的状态字符串的标志。
 - <b>High Priority(FALSE)</b>: 如果为True，状态将被插入到<b>State Queue("")</b>的顶部。如果为False，它被附加到尾部。

<b>Outputs:</b>
 - <b>State Queue Out</b>: 返回继续执行的所有状态及参数。


## JKISM++ Make String Arguments Safe.vi

'->','->|','-@','-&','<-" 是关键字，不能出现在参数中。使用此 VI 保证参数安全。

<b>Inputs:</b>
 - <b>Argurment String</b>: 可能包含关键字的参数 '->','->|','-@','-&','<-".

<b>Outputs:</b>
 - <b>Safe Argurment String</b>: 安全参数



## JKISM++ Revert Arguments-Safe String.vi

'->','->|','-@','-&','<-" 是关键字，不能出现在参数中。使用<b>JKISM++ Make String Arguments Safe.vi</b>保证参数安全。此VI用于将安全参数转换为原始参数。

<b>Inputs:</b>
 - <b>Safe Argurment String</b>: 安全参数

<b>Outputs:</b>
 - <b>Origin Argurment String</b>: 可能包含关键字的参数 '->','->|','-@','-&','<-".


## JKISM++ Message Type.ctl

消息类型定义。
- <b>Async:</b> 异步消息 (->)
- <b>Async without Reply:</b> 无返回异步消息 (->|)
- <b>Sync:</b> 同步消息 (-@)

## JKISM++ Request JKISM to Post Message.vi

申请 JKISM 发送消息。通常用于和JKISM并行的功能循环，这些功能循环和 JKISM 一起完成完整模块功能。

<b>Inputs:</b>
 - <b>Module Name</b>:发送状态的JKISM
 - <b>Status</b>: 将被广播的状态
 - <b>Arguments ("")</b>: 将被广播的状态参数
 - <b>Target Module</b>:目标模块
 - <b>Error In (no error)</b>: 错误簇
 -
<b>Outputs:</b>
 - <b>error out</b>: 错误簇


## JKISM++ Request JKISM to Broadcast Status Change.vi

申请 JKISM 发布状态。通常用于和JKISM并行的功能循环，这些功能循环和 JKISM 一起完成完整模块功能。

<b>Inputs:</b>
 - <b>Module Name</b>:发送状态的JKISM
 - <b>Status</b>: 将被广播的状态
 - <b>Arguments ("")</b>: 将被广播的状态参数
 - <b>Broadcast(T)</b>: 控制是否广播的开关输入
 - <b>Error In (no error)</b>: 错误簇

<b>Outputs:</b>
 - <b>error out</b>: 错误簇


## JKISM++ Module Turns Invalid.vi

检查JKISM是否已经退出。通常用于和JKISM并行的功能循环，这些功能循环和 JKISM 一起完成完整模块功能。 本VI用于并行循环的退出条件。

<b>Inputs:</b>
 - <b>JKISM Name</b>: 模块名称

<b>Outputs:</b>
 - <b>Turn Invalid(Exit)?</b>: 是否已经退出

## Build Message with Arguments++.vi

构建一个包含 JKISM 参数的消息。此 VI 将解析 "<b>State with Arguments</b>" 中的消息类型、消息字符串、参数和目标模块，并将消息中相应部分替换为输入值。不同的消息类型符号（->|、->、-@）将在不同的多态 VI 实例中使用。

多态选项：

 - Build Message with Arguments(Auto Check).vi
 - Build Asynchronous Message with Arguments.vi
 - Build No-Reply Asynchronous Message with Arguments.vi
 - Build Synchronous Message with Arguments.vi

<b>Input：</b>
 - <b>State with Arguments</b>：可能包含参数或目标模块的输入消息
 - <b>Arguments ("")</b>：将用于替换 <b>State with Arguments</b> 中的参数。如果为空，则输出字符串中不会包含参数。
 - <b>Target Module ("")</b>：将用于替换 <b>State with Arguments</b> 中的目标。如果为空，则将使用 <b>State with Arguments</b> 中的目标。

<b>output：</b>
- <b>State with Arguments</b>：代表带有参数的字符串状态


## Build Message with Arguments(Auto Check).vi

构建一个包含 JKISM 参数的消息。此 VI 将解析 "State with Arguments" 中的消息类型、消息字符串、参数和目标模块，并将消息中相应部分替换为输入值。将使用来自输入 "State with Arguments" 的消息类型。

<B>示例：</B>

      如果 "State with Arguments" 输入为 "API: DoSth"
      <b>Arguments ("")</b> 输入为 "Arguments"
      <b>Target Module ("")</b> 输入为 "Callee"
      则结果字符串为 "API: DoSth >> Arguments"，因为未检测到消息符号。

      如果 "State with Arguments" 输入为 "API: DoSth >> Arguments -> Callee"
      <b>Arguments ("")</b> 输入为 "NewArguments"
      <b>Target Module ("")</b> 输入为空
      则结果字符串为 "API: DoSth >> NewArguments -> Callee"

      如果 "State with Arguments" 输入为 "API: DoSth >> Arguments -> Callee"
      <b>Arguments ("")</b> 输入为 "NewArguments"
      <b>Target Module ("")</b> 输入为 "NewCallee"
      则结果字符串为 "API: DoSth >> NewArguments -> NewCallee"

      如果 "State with Arguments" 输入为 "API: DoSth >> Arguments -> Callee"
      <b>Arguments ("")</b> 输入为空
      <b>Target Module ("")</b> 输入为 "NewCallee"
      则结果字符串为 "API: DoSth -> NewCallee"

      如果 "State with Arguments" 输入为 "API: DoSth >> Arguments -@ Callee"
      <b>Arguments ("")</b> 输入为 "NewArguments"
      <b>Target Module ("")</b> 输入为空
      则结果字符串为 "API: DoSth >> NewArguments -@ Callee"

<b>输入：</b>
 - <b>State with Arguments</b>：可能包含参数或目标模块的输入消息
 - <b>Arguments ("")</b>：将用于替换 <b>State with Arguments</b> 中的参数。如果为空，则输出字符串中不会包含参数。
 - <b>Target Module ("")</b>：将用于替换 <b>State with Arguments</b> 中的目标。如果为空，则将使用 <b>State with Arguments</b> 中的目标。

<b>输出：</b>
 - <b>State with Arguments</b>：代表带有参数的字符串状态


## Build Asynchronous Message with Arguments.vi

构建一个包含 JKISM 参数的消息。此 VI 将解析 "<b>State with Arguments</b>" 中的消息字符串、参数和目标模块，并将消息中相应部分从输入的 "<b>State with Arguments</b>" 中替换为输入值，如果指定了目标模块，则使用异步消息符号 "->"。

<B>例如：</B>

      如果 "<b>State with Arguments</b>" 输入为 "API: DoSth"
      <b>Arguments ("")</b> 输入为 "Arguments"
      <b>Target Module ("")</b> 输入为 "Callee"
      则结果字符串为 "API: DoSth >> Arguments -> Callee"。与 "Build Message with Arguments(Auto Check).vi" 不同。消息类型符号被替换为 "->"。

      如果 "<b>State with Arguments</b>" 输入为 "API: DoSth >> Arguments -> Callee"
      <b>Arguments ("")</b> 输入为 "NewArguments"
      <b>Target Module ("")</b> 输入为空
      则结果字符串为 "API: DoSth >> NewArguments -> Callee"

      如果 "<b>State with Arguments</b>" 输入为 "API: DoSth >> Arguments -> Callee"
      <b>Arguments ("")</b> 输入为 "NewArguments"
      <b>Target Module ("")</b> 输入为 "NewCallee"
      则结果字符串为 "API: DoSth >> NewArguments -> NewCallee"

      如果 "<b>State with Arguments</b>" 输入为 "API: DoSth >> Arguments -> Callee"
      <b>Arguments ("")</b> 输入为空
      <b>Target Module ("")</b> 输入为 "NewCallee"
      则结果字符串为 "API: DoSth -> NewCallee"

      如果 "<b>State with Arguments</b>" 输入为 "API: DoSth >> Arguments -@ Callee"
      <b>Arguments ("")</b> 输入为 "NewArguments"
      <b>Target Module ("")</b> 输入为空
      则结果字符串为 "API: DoSth >> NewArguments -> Callee"。消息类型符号被替换为 "->"。

<b>输入：</b>
 - <b>State with Arguments</b>：可能包含参数或目标模块的输入消息
 - <b>Arguments ("")</b>：用于替换 <b>State with Arguments</b> 中参数的参数。如果为空，则输出字符串中不包含参数。
 - <b>Target Module ("")</b>：用于替换 <b>State with Arguments</b> 中目标的目标。如果为空，则将使用 <b>State with Arguments</b> 中的目标。

<b>输出：</b>
 - <b>State with Arguments</b>：表示带有参数的字符串状态


## Build No-Reply Asynchronous Message with Arguments.vi

构建一个包含 JKISM 参数的消息。此 VI 将解析 "<b>State with Arguments</b>" 中的消息字符串、参数和目标模块，并将消息中相应部分从输入的 "<b>State with Arguments</b>" 中替换为输入值，如果指定了目标模块，则使用 No-Reply 异步消息符号 "->|"。

<B>例如：</B>

      如果 "<b>State with Arguments</b>" 输入为 "API: DoSth"
      <b>Arguments ("")</b> 输入为 "Arguments"
      <b>Target Module ("")</b> 输入为 "Callee"
      则结果字符串为 "API: DoSth >> Arguments ->| Callee"。与 "Build Message with Arguments(Auto Check).vi" 不同。消息类型符号被替换为 "->|"。

      如果 "<b>State with Arguments</b>" 输入为 "API: DoSth >> Arguments -> Callee"
      <b>Arguments ("")</b> 输入为 "NewArguments"
      <b>Target Module ("")</b> 输入为空
      则结果字符串为 "API: DoSth >> NewArguments ->| Callee"。消息类型符号被替换为 "->|"。

      如果 "<b>State with Arguments</b>" 输入为 "API: DoSth >> Arguments -> Callee"
      <b>Arguments ("")</b> 输入为 "NewArguments"
      <b>Target Module ("")</b> 输入为 "NewCallee"
      则结果字符串为 "API: DoSth >> NewArguments ->| NewCallee"。消息类型符号被替换为 "->|"。

      如果 "<b>State with Arguments</b>" 输入为 "API: DoSth >> Arguments -> Callee"
      <b>Arguments ("")</b> 输入为空
      <b>Target Module ("")</b> 输入为 "NewCallee"
      则结果字符串为 "API: DoSth ->| NewCallee"。消息类型符号被替换为 "->|"。

      如果 "<b>State with Arguments</b>" 输入为 "API: DoSth >> Arguments -@ Callee"
      <b>Arguments ("")</b> 输入为 "NewArguments"
      <b>Target Module ("")</b> 输入为空
      则结果字符串为 "API: DoSth >> NewArguments ->| Callee"。消息类型符号被替换为 "->|"。

<b>输入：</b>
 - <b>State with Arguments</b>：可能包含参数或目标模块的输入消息
 - <b>Arguments ("")</b>：用于替换 <b>State with Arguments</b> 中参数的参数。如果为空，则输出字符串中不包含参数。
 - <b>Target Module ("")</b>：用于替换 <b>State with Arguments</b> 中目标的目标。如果为空，则将使用 <b>State with Arguments</b> 中的目标。

<b>输出：</b>
 - <b>State with Arguments</b>：表示带有参数的字符串状态


## Build Synchronous Message with Arguments.vi

构建一个包含 JKISM 参数的消息。此 VI 将解析 "<b>State with Arguments</b>" 中的消息字符串、参数和目标模块，并将消息中相应部分从输入的 "<b>State with Arguments</b>" 中替换为输入值，如果指定了目标模块，则使用同步消息符号 "-@"。

<B>例如：</B>

      如果 "<b>State with Arguments</b>" 输入为 "API: DoSth"
      <b>Arguments ("")</b> 输入为 "Arguments"
      <b>Target Module ("")</b> 输入为 "Callee"
      则结果字符串为 "API: DoSth >> Arguments ->| Callee"。与 "Build Message with Arguments(Auto Check).vi" 不同。消息类型符号被替换为 "-@"。

      如果 "<b>State with Arguments</b>" 输入为 "API: DoSth >> Arguments -> Callee"
      <b>Arguments ("")</b> 输入为 "NewArguments"
      <b>Target Module ("")</b> 输入为空
      则结果字符串为 "API: DoSth >> NewArguments ->| Callee"。消息类型符号被替换为 "-@"。

      如果 "<b>State with Arguments</b>" 输入为 "API: DoSth >> Arguments -> Callee"
      <b>Arguments ("")</b> 输入为 "NewArguments"
      <b>Target Module ("")</b> 输入为 "NewCallee"
      则结果字符串为 "API: DoSth >> NewArguments -@ NewCallee"。消息类型符号被替换为 "-@"。

      如果 "<b>State with Arguments</b>" 输入为 "API: DoSth >> Arguments -> Callee"
      <b>Arguments ("")</b> 输入为空
      <b>Target Module ("")</b> 输入为 "NewCallee"
      则结果字符串为 "API: DoSth -@ NewCallee"。消息类型符号被替换为 "-@"。

      如果 "<b>State with Arguments</b>" 输入为 "API: DoSth >> Arguments -@ Callee"
      <b>Arguments ("")</b> 输入为 "NewArguments"
      <b>Target Module ("")</b> 输入为空
      则结果字符串为 "API: DoSth >> NewArguments -@ Callee"。

<b>输入：</b>
 - <b>State with Arguments</b>：可能包含参数或目标模块的输入消息
 - <b>Arguments ("")</b>：用于替换 <b>State with Arguments</b> 中参数的参数。如果为空，则输出字符串中不包含参数。
 - <b>Target Module ("")</b>：用于替换 <b>State with Arguments</b> 中目标的目标。如果为空，则将使用 <b>State with Arguments</b> 中的目标。

<b>输出：</b>
 - <b>State with Arguments</b>：表示带有参数的字符串状态

## JKISM++ No-Event Structure Template.vi

Template for building JKISM++ Module without User Interface.

<b>输入控件:</b>
- <b>Name("" to use uuid)</b>: JKISM 模块名称
   - 如果输入为 ""，将使用 UUID 作为模块名称。该模块被标记为独立模式，不会包含在模块列表中。
   - 如果输入以 '#' 结尾，则该模块将在工作模式下运行。具有相同名称的模块将共享同一消息队列。任何外部消息将由其中一个模块处理，取决于哪个模块空闲。
   - 否则，输入字符串将被用作模块名称，该名称应在系统中保持唯一。如果在系统中使用重复的模块名称，JKISM 将进入 "Critical Error" 状态。

<b>输出控件:</b>
 - 无

## JKISM++ With Event Structure Template.vi

Template for building JKISM++ Module with User Interface. Event Structure is included in template for processing user operations.

<b>输入控件:</b>
 - <b>Name("" to use uuid)</b>: JKISM 模块名称
   - 如果输入为 ""，将使用 UUID 作为模块名称。该模块被标记为独立模式，不会包含在模块列表中。
   - 如果输入以 '#' 结尾，则该模块将在工作模式下运行。具有相同名称的模块将共享同一消息队列。任何外部消息将由其中一个模块处理，取决于哪个模块空闲。
   - 否则，输入字符串将被用作模块名称，该名称应在系统中保持唯一。如果在系统中使用重复的模块名称，JKISM 将进入 "Critical Error" 状态。

<b>输出控件:</b>
 - 无


## JKISM++ With Event Structure Template - Tiny.vi

Template for building JKISM++ Module without User Interface.

<b>输入控件:</b>
- <b>Name("" to use uuid)</b>: JKISM 模块名称
   - 如果输入为 ""，将使用 UUID 作为模块名称。该模块被标记为独立模式，不会包含在模块列表中。
   - 如果输入以 '#' 结尾，则该模块将在工作模式下运行。具有相同名称的模块将共享同一消息队列。任何外部消息将由其中一个模块处理，取决于哪个模块空闲。
   - 否则，输入字符串将被用作模块名称，该名称应在系统中保持唯一。如果在系统中使用重复的模块名称，JKISM 将进入 "Critical Error" 状态。

<b>输出控件:</b>
 - 无

## Parse State Queue++.vi

Parses the JKI State Machine state queue and returns the current state that will execute next with the associated arguments.


<b>输入控件:</b>
 - <b>State Queue</b>: The entire state queue is wired to this input. This should come from the main JKI State Machine shift register.
 - <b>Error In (no error)</b>: The error cluster from the JKI State Machine is wired to this input. If an error occures and appears on this input, the current state output returns the "Error Handler" state.
 - <b>Name("" to use uuid)</b>: JKISM 模块名称
   - If Input is "", an uuid will be used for module name. The module is marked as stand-alone mode and will not be included in module list.
   - Fi Input end with '#', the module will worked in worker mode. Modules with the same name will shared the same message queue. Any external message will be processed by one of the modules, depends on who is free.
   - Otherwise, the input string will be used as module name, which should be unique in system. JKISM will go to "Critical Error" state if duplicated module name is used in system.
 - <b>Response Timeout(5000ms)</b>: The timeout of waiting for response of sync-call from outside.
 - <b>Dequeue Timeout(0ms)</b>: The timeout of checking JKISM message queue.
 - <b>Response Arguments</b>: The response arguments from last state. It should come from the JKISM shift register.

<b>输出控件:</b>
 - <b>Remaining States</b>:  返回继续执行的所有状态及参数。 These should be passed through the current state in the state machine. These can also be modified or augmented within the current state if necessary.
 - <b>Arguments</b>: Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters. <b>Note:</b> The arguments variable must not contain any unprintable characters like linefeed or carriage return.
 - <b>Current State</b>: The state to be processed
 - <b>Name Used</b>: The actual name assigned to this JKISM module
 - <b>Argument - State</b>: If any core error occurs, this is the source state name
 - <b>From Who</b>: If <b>Current State</b> is called by ouside, this is the source JKISM module name.


## Build State String with Arguments++.vi

Builds a state string that contains arguments for the JKI State Machine.

<B>例如:</B>

For local JKISM, <b>Target Module ("")</b> is empty.

      If State = A and no argument, then <b>State with Arguments</b> = A
      If State = A and Arguments = B then <b>State with Arguments</b> = A >> B

For sending message to other JKISM, suppose <b>Target Module ("")</b> is "Target"

   - For Sync-Call:

         If State = A and no argument, then <b>State with Arguments</b> = A -@target
         If State = A and Arguments = B then <b>State with Arguments</b> = A >> B -@target

   - For Async-Call:

         If State = A and no argument, then <b>State with Arguments</b> = A ->target
         If State = A and Arguments = B then <b>State with Arguments</b> = A >> B ->target

<b>输入控件:</b>
 - <b>State</b>: 状态或消息名称字符串
 - <b>Arguments ("")</b>: <b>State</b> 的参数
 - <b>Target Module ("")</b>: The target JKISM module for the message to be sent to.
 - <b>Sync-Call(-@) T By Default/Async-Call(->) F</b>: For sync call, use "TRUE"; For Async call, use "FALSE"

<b>输出控件:</b>
 - <b>State with Arguments</b>: 包含 JKI 状态机状态、参数等信息的字符串


## JKISM++ Convert Data to HexStr.vi

Convert complex argument(variant) to hex string, which could be safely used as state argument without broking the string queue logic.

<b>输入控件:</b>
 - <b>Variant</b>: 数据，保存为变体(variant)格式

<b>输出控件:</b>
 - <b>HEX String (0-9,A-F)</b>: Hex字符串格式，不包含不可见字符，符合 JKISM 的参数要求

## JKISM++ Convert HexStr to Data.vi

Convert hex string arguments back to variant.

<b>输入控件:</b>
 - <b>HEX String</b>: Hex字符串格式，不包含不可见字符，符合 JKISM 的参数要求

<b>输出控件:</b>
 - <b>Variant</b>: 数据，保存为变体(variant)格式



## JKISM++ Broadcast Status Change.vi

Broadcast the status change to system. The JKISM++ Module who registered the status will receive the status change.

<b>输入控件:</b>
 - <b>Status with Arguments</b>: The entire state queue is wired to this input.
 - <b>State Queue("")</b>: The entire state queue is wired to this input.
 - <b>Broadcast(T)</b>: 控制是否广播的开关输入

<b>输出控件:</b>
 - <b>Remaining States</b>: 返回继续执行的所有状态及参数。


## JKISM++ Post Message.vi

Post a message to JKISM specified.

<b>输入控件:</b>
 - <b>Target Module</b>:Target JKISM Module name.
 - <b>State</b>: Message to post.
 - <b>Arguments ("")</b>: Argument of the message.
 - <b>Error In (no error)</b>: 错误簇

<b>输出控件:</b>
 - <b>error out</b>: 错误簇


## JKISM++ Send Message and Wait for Reply.vi

Send a message to JKISM specified and wait for the reply with timeout.

<b>输入控件:</b>
 - <b>Target Module</b>: Target JKISM Module name.
 - <b>State</b>: Message to send
 - <b>Arguments ("")</b>: Argument of the message.
 - <b>Response Timeout(5000ms)</b>: Timeout for waiting the response.
 - <b>Error In (no error)</b>: 错误簇

<b>输出控件:</b>
 - <b>Arguments</b>: Response returned.
 - <b>error out</b>: 错误簇


## JKISM++ Mark As Worker Module.vi

Append '#' to JKISM Name, to mark this module is a worker, who shares the same message queue with workers with the same name. A real name with uuid generated will be assigned to this JKISM module.

<b>输入控件:</b>
 - <b>JKISM Name</b>: JKISM 模块名称

<b>输出控件:</b>
 - <b>JKISM Name(marked as worker)</b>: JKISM 模块名称 with '#' appended.


## JKISM++ Check If Module Exists.vi

Check if module with specified name exists.

<b>输入控件:</b>
 - <b>JKISM Name</b>: JKISM 模块名称
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>Exist?</b>: 返回模式是否存在，存在返回True，不存在返回False
 - <b>JKISM Name(dup)</b>: 返回 <b>JKISM Name</b>
 - <b>Error out</b>: 错误簇


## JKISM++ List Modules.vi

List all JKISM++ Modules alive in system.

<b>输入控件:</b>
 - <b>Exclude Standalone JKISM(T)</b>: 'TRUE' to exclude standalone JKISM module, and 'FALSE' to include them.
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>Module Names</b>: 模块名称列表
 - <b>Error out</b>: 错误簇

## JKISM++ Module Status.vi

Get the JKISM+ Module Status

<b>输入控件:</b>
 - <b>JKISM Name</b>: JKISM 模块名称.
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>Mode</b>: Return the mode of JKISM Module. It might be "Stand-alone", "JKISM" or "Action Worker".
 - <b>#As Worker</b>: Number of the workers if module in "Action Worker" mode.
 - <b>#msg to be processed</b>: The number of message in JKISM Message Queue.
 - <b>JKISM Name(dup)</b>: Return <b>JKISM Name</b>
 - <b>Error out</b>: 错误簇


## JKISM++ Register Status Change.vi

Register for notification of other JKISM++ Module's status change. If "Response Message" is not connected or "" is the input, the same state name will be used for acting message.

<b>输入控件:</b>
 - <b>JKISM Name</b>: JKISM 模块名称.
 - <b>Source JKISM Name (* as Default)</b>: JKISM who generates the status. You can use '*' for all modules generated the same <b>Status</b>
 - <b>Status</b>: 状态字符串
 - <b>Response Message (if "", same as Source Message)</b>: After registered, If status change, this message will be received.
 - <b>Priority(T:As Status,F:As Interrupt)</b>: The Response Message will be inserted to the front of state queue if it's False, otherwise it wil be append to the tail.
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>JKISM Name(dup)</b>: Return <b>JKISM Name</b>
 - <b>Error out</b>: 错误簇


## JKISM++ Unregister Status Change.vi

Unregister the notification of other JKISM++ Module's status change.

<b>输入控件:</b>
 - <b>JKISM Name</b>: JKISM 模块名称.
 - <b>Source JKISM Name</b>: JKISM who generates the status. You can use '*' for all modules generated the same <b>Status</b>
 - <b>Status</b>: 状态字符串
 - <b>Error in</b>: 错误簇

<b>输出控件:</b>
 - <b>JKISM Name(dup)</b>: return <b>JKISM Name</b>
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

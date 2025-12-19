# CSM API

- [01. Templates](https://www.google.com/search?q=./VI%20Description(zh-cn)%20-%2001.%20Templates.md)
- [02. Core Functions](https://www.google.com/search?q=./VI%20Description(zh-cn)%20-%2002.%20Core%20Functions.md)
- [03. Arguments](https://www.google.com/search?q=./VI%20Description(zh-cn)%20-%2003.%20Arguments.md)
- [04. Management API](https://www.google.com/search?q=./VI%20Description(zh-cn)%20-%2004.%20Management%20API.md)
- [05. Module Operation API](https://www.google.com/search?q=./VI%20Description(zh-cn)%20-%2005.%20Module%20Operation%20API.md)
- [06. Status Registration](https://www.google.com/search?q=./VI%20Description(zh-cn)%20-%2006.%20Status%20Registration.md)
- [07. Global Log](https://www.google.com/search?q=./VI%20Description(zh-cn)%20-%2007.%20Global%20Log.md)
- [08. Advanced Modes](https://www.google.com/search?q=./VI%20Description(zh-cn)%20-%2008.%20Advanced%20Modes.md)
- [09. Built-in Addons](https://www.google.com/search?q=./VI%20Description(zh-cn)%20-%2009.%20Build-in%20Addons.md)
- [10. Utility VIs](https://www.google.com/search?q=./VI%20Description(zh-cn)%20-%2010.%20Utility%20VIs.md)
- [11. CSM-Helper API](https://www.google.com/search?q=./VI%20Description(zh-cn)%20-%2011.%20CSM-Helper%20API.md)
- [12. Debug, Doc, Tools](https://www.google.com/search?q=./VI%20Description(zh-cn)%20-%2012.%20Debug,Doc,Tools.md)
- [13. Internal](https://www.google.com/search?q=./VI%20Description(zh-cn)%20-%2013.%20Internal.md)

> [!NOTE] 
>
> <b>CSM Inter-module Communication Types</b>
>
> Communication between CSM modules is divided into two categories: Messages and Broadcasts.
>
> - <b>Messages:</b> 1:1 communication between modules. Based on the message handling method, it can be further divided into Synchronous Call (`-@`), Asynchronous Call (`->`), and Asynchronous Call without Reply (`->|`).
> - <b>Broadcasts:</b> 1:N communication between modules. The broadcasting module pushes the broadcast to all modules registered to that broadcast. Based on the broadcast processing priority, it can be further divided into Status Broadcast and Interrupt Broadcast.

> [!NOTE] 
>
> <b>CSM Module External Interfaces</b>
>
> Modules written based on the CSM framework have good reusability. You only need to understand the following interface information to use CSM modules without knowing the specific implementation.
>
> - <b>Message:</b> Externally callable message names, argument information, and return information.
> - <b>Broadcast:</b> Externally callable broadcast names and argument information.
> - <b>Attribute:</b> Attribute names usable by the module and attribute data types (LabVIEW data types).

> [!NOTE] 
>
> <b>CSM Message Types</b>
>
> CSM messages are divided into three categories: Synchronous Call (`-@`), Asynchronous Call (`->`), and Asynchronous Call without Reply (`->|`).
>
> - <b>Synchronous Call (`-@`):</b> The module waits for the target module to return a result before continuing to execute subsequent code.
> - <b>Asynchronous Call (`->`):</b> The module immediately continues to execute subsequent code without waiting for the target module to return a result.
> - <b>Asynchronous Call without Reply (`->|`):</b> The module immediately continues to execute subsequent code without waiting for the target module to return a result. Unlike Asynchronous Call (`->`), Asynchronous Call without Reply (`->|`) will not wait for the target module to return a result, nor will it throw an error.

> [!NOTE] 
>
> <b>CSM Message Format Parsing</b>
>
> ```
> [CSM Message] >> [Arguments] [Message Symbol ->|,->,-@] [Target Module] // [Comments]
> ```
>
> - <b>CSM Message:</b> The CSM message. It cannot contain CSM keywords or line breaks.
> - `>>`: Separator between the CSM Message and Arguments.
> - <b>Arguments:</b> Arguments for the CSM message. It cannot contain CSM keywords or line breaks.
> - <b>Message Symbol:</b> Symbol identifying the message type, including Synchronous Call (`-@`), Asynchronous Call (`->`), Asynchronous Call without Reply (`->|`).
> - <b>Target Module:</b> The target module to which the message is sent. If empty, it indicates the message will be processed by the current module. When empty, the Message Symbol also cannot exist.
> - <b>Comments:</b> Comment information, which will not be parsed.

> [!NOTE] 
>
> <b>CSM Message Target Module Description</b>
>
> In Normal Mode, the target module for a CSM message is the specified module name. System-level modules start with a `.` in their name. The target module for a CSM message includes the `.` in the name. For example, if the requested module name is `.System`, the target module for the CSM message is `.System`. In Worker Mode, the target module for a CSM message can only be the overall module name, not the node name. For example, if the requested module name is `Worker#`, the target module for the CSM message is `Worker`. In Chain of Responsibility Mode, the target module for a CSM message can only be the overall module name, not the node name. For example, if the requested module name is `Chain$1`, the target module for the CSM message is `Chain`.

> [!NOTE] 
>
> <b>Synchronous Message</b>
>
> A Synchronous Message is a type of message. After a CSM sends a synchronous message, it pauses state transitions and waits for the callee to complete message processing. Synchronous messages are described via `-@`. A call from one JKISM module to another via a synchronous message is called a synchronous call.
>
> <b>Errors occurring at the Caller:</b>
>
> - If the input target module is `""`, a `NO Target Error` is generated.
> - If the input module does not exist, a `Target Error` is generated.
> - If the input module exists but does not complete processing within the specified time, a `Timeout Error` is generated.
>
> <b>Caller waits for return:</b>
>
> - If the caller is a CSM module, it stays in the Parse State the Queue++ VI.
> - If it is an API call, it stays in the calling VI, such as the CSM - Send Message and Wait for Reply VI.
>
> <b>Return:</b>
>
> - <b>If the caller is a CSM module:</b>
>   - Normally, it enters the "Response" state to handle the return.
>   - If an error occurs at the caller, it causes the CSM state machine to enter the "Error Handler" module to handle the error.
>   - If an error occurs at the callee, this information is still the result of the message. It is handled in the "Response" state and can be obtained from Additional Information.
> - <b>If it is an API call:</b>
>   - The Response output is the return.
>   - Errors occurring at both the caller and callee are merged into the error cluster output.

> [!NOTE] 
>
> <b>Asynchronous Message</b>
>
> An Asynchronous Message is a type of message. After a CSM sends an asynchronous message, it immediately continues to execute subsequent code without waiting for the callee to complete message processing. Asynchronous messages are divided into Asynchronous Call (`->`) and Asynchronous Call without Reply (`->|`). The only difference is that with an Asynchronous Call without Reply (`->|`), the callee will not return the result to the caller after completing the operation.
>
> <b>Errors occurring at the Caller:</b>
>
> - If the input target module is `""`, a `NO Target Error` is generated.
> - If the input module does not exist, a `Target Error` is generated.
>
> <b>Caller does not wait for return:</b>
>
> - If the caller is a CSM module, it enters the "Async Message Posted" state after sending the message in the Parse State Queue++ VI.
> - If it is an API call, it continues to execute subsequent code. The API can only send Asynchronous without Reply messages.
>
> <b>Return:</b>
>
> - <b>If the caller is a CSM module:</b>
>   - Normally, it enters the "Async Response" state to handle the return. If an error occurs at the callee, this information is still the result of the message. It is handled in the "Async Response" state, and this error information can be obtained from Additional Information.
>   - If an error occurs at the caller, it causes the CSM state machine to enter the "Error Handler" module to handle the error.
> - There is no return if the API can only send Asynchronous without Reply messages.

> [!NOTE] 
>
> <b>CSM Operation Message Format Parsing</b>
>
> CSM defines operations required by the system, such as sending broadcasts, registering to broadcasts, and unregistering. Based on this definition, system functionality can be extended.
>
> ```
> [CSM Operation] >> [Arguments] -> <[Operation]> // [Comments]
>   Example:
>   `TCP Connected >> 192.168.1.100 -> <broadcast>` // Send Status Broadcast "TCP Connected" with argument "192.168.1.100"
>   `TCP Connected@TCPModule >> UpdateLED@UI -><register>` // Register the "TCP Connected" signal of the TCP module to the "UpdateLED" interface of the UI module
> ```

> [!NOTE] 
>
> <b>CSM Broadcast</b>
>
> Broadcasts in CSM are divided into three types: Status Broadcast, Interrupt Broadcast, and State Broadcast. The module pushes the Status Broadcast to all modules registered to that Status Broadcast. Status Broadcast and Interrupt Broadcast are explicitly called broadcasts, while State Broadcast is an implicit broadcast. When a subscription relationship exists, the State Broadcast is automatically triggered when the CSM completes a certain state.
>
> - <b>Status Broadcast:</b> Normal priority broadcast. Similar to asynchronous messages, it is passed via the low-priority queue. It is processed sequentially when other unprocessed asynchronous messages or Status Broadcasts exist in the module.
> - <b>Interrupt Broadcast:</b> High priority broadcast. Similar to synchronous messages, it is passed via the high-priority queue. It is processed first when other low-priority asynchronous messages or Status Broadcasts exist in the module. However, if other unprocessed synchronous messages or Interrupt Broadcasts exist, it is processed sequentially.
> - <b>State Broadcast:</b> State Broadcast is an implicit broadcast. When a subscription relationship exists, the State Broadcast is automatically triggered when the CSM completes a certain state. The argument for the State Broadcast is the Response of the CSM state.

> [!NOTE] 
>
> <b>CSM Broadcast Format Parsing</b>
>
> `[CSM Broadcast String] >> [Arguments] -> <broadcast> // [Comments]` `[CSM Status Broadcast String] >> [Arguments] -> <status> // [Comments]` `[CSM Interrupt Broadcast String] >> [Arguments] -> <interrupt> // [Comments]`
>
> - <b>CSM Broadcast String:</b> CSM broadcast. It cannot contain CSM keywords or line breaks.
> - `>>`: Separator between the CSM Broadcast String and Arguments.
> - <b>Arguments:</b> Arguments for the CSM broadcast. It cannot contain CSM keywords or line breaks.
> - <b>Broadcast Type:</b> `<broadcast>` and `<status>` are Status Broadcasts; `<interrupt>` is Interrupt Broadcast.
> - <b>Comments:</b> Comment information, which will not be parsed.

> [!NOTE] 
>
> <b>CSM Registration</b>
>
> Registration associates a broadcast with a bound interface (API). When the broadcast is triggered, the bound interface (API) is called. Registrations can also be cancelled. In CSM, there are two types of broadcasts:
>
> 1. <b>Broadcast:</b> Broadcast explicitly called by the module sending the broadcast message. Arguments need to be explicitly provided.
> 2. <b>State:</b> Any state of a CSM module can also be registered to. The argument received by the triggered API is the Response of the CSM state.
>
>    // Register `[Broadcast Message Name]@[SourceModule] >> [Bound API]@[TargetModule] -><register> // [Comments]`// Unregister `[Broadcast Message Name]@[SourceModule] >> [Bound API]@[TargetModule] -><unregister> // [Comments]`

> - <b>Broadcast Message Name:</b> Defined by the source module. Refer to "CSM Broadcast Format Parsing" for details.
> - <b>Source Module:</b> The broadcasting module. If subscribing to broadcasts from any module, the source module can be represented by `*`.
> - <b>Bound API:</b> Defined by the target module. It is the external interface of the target module.
> - <b>Target Module:</b> The module where the bound API resides. When indicating registration to the current module within a CSM module, it can be ignored. The preceding `@` separator is also omitted.
> - `<register>` / `<unregister>`: Definition of the Register/Unregister operation type.
> - <b>Comments:</b> Comment information, which will not be parsed.
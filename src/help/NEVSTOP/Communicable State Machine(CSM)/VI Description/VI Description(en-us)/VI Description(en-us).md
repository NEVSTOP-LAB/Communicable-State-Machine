# CSM API

- [01. Templates](./VI%20Description(zh-cn)%20-%2001.%20Templates.md)
- [02. Core Functions](./VI%20Description(zh-cn)%20-%2002.%20Core%20Functions.md)
- [03. Arguments](./VI%20Description(zh-cn)%20-%2003.%20Arguments.md)
- [04. Management API](./VI%20Description(zh-cn)%20-%2004.%20Management%20API.md)
- [05. Module Operation API](./VI%20Description(zh-cn)%20-%2005.%20Module%20Operation%20API.md)
- [06. Status Registration](./VI%20Description(zh-cn)%20-%2006.%20Status%20Registration.md)
- [07. Global Log](./VI%20Description(zh-cn)%20-%2007.%20Global%20Log.md)
- [08. Advanced Modes](./VI%20Description(zh-cn)%20-%2008.%20Advanced%20Modes.md)
- [09. Built-in Addons](./VI%20Description(zh-cn)%20-%2009.%20Build-in%20Addons.md)
- [10. Utility VIs](./VI%20Description(zh-cn)%20-%2010.%20Utility%20VIs.md)
- [11. CSM-Helper API](./VI%20Description(zh-cn)%20-%2011.%20CSM-Helper%20API.md)
- [12. Debug, Doc, Tools](./VI%20Description(zh-cn)%20-%2012.%20Debug,Doc,Tools.md)
- [13. Internal](./VI%20Description(zh-cn)%20-%2013.%20Internal.md)

> [!NOTE]
> <b>CSM Inter-module Communication Types</b>
>
> Communication between CSM modules is divided into two categories: Messages and Broadcasts.
> - <b>Messages</b>: 1:1 communication between modules. Based on the message handling method, it can be further divided into Synchronous Call (`-@`), Asynchronous Call (`->`), and Asynchronous Call without Reply (`->|`).
> - <b>Broadcasts</b>: 1:N communication between modules. The broadcasting module pushes the broadcast to all modules registered to that broadcast. Based on the broadcast processing priority, it can be further divided into Status Broadcast and Interrupt Broadcast.

> [!NOTE]
> <b>CSM Module External Interfaces</b>
>
> Modules written based on the CSM framework have good reusability. You only need to understand the following interface information to use CSM modules without knowing the specific implementation.
> - <b>Message</b>: Externally callable message names, argument information, and return information.
> - <b>Broadcast</b>: Externally callable broadcast names and argument information.
> - <b>Attribute</b>: Attribute names usable by the module and attribute data types (LabVIEW data types).

> [!NOTE]
> <b>CSM Message Types</b>
>
> CSM messages are divided into three categories: Synchronous Call (`-@`), Asynchronous Call (`->`), and Asynchronous Call without Reply (`->|`).
> - <b>Synchronous Call (`-@`)</b>: The module waits for the target module to return a result before continuing to execute subsequent code.
> - <b>Asynchronous Call (`->`)</b>: The module immediately continues to execute subsequent code without waiting for the target module to return a result.
> - <b>Asynchronous Call without Reply (`->|`)</b>: The module immediately continues to execute subsequent code without waiting for the target module to return a result. Unlike Asynchronous Call (`->`), Asynchronous Call without Reply (`->|`) will not wait for the target module to return a result, nor will it throw an error.

> [!NOTE]
> <b>CSM Message Format Parsing</b>
>
>       [CSM Message] >> [Arguments] [Message Symbol ->|,->,-@] [Target Module] // [Comments]
>
> - <b>CSM Message</b>: The CSM message. It cannot contain CSM keywords or line breaks.
> - `>>`: Separator between the CSM Message and Arguments.
> - <b>Arguments</b>: Arguments for the CSM message. It cannot contain CSM keywords or line breaks.
> - <b>Message Symbol</b>: Symbol identifying the message type, including Synchronous Call (`-@`), Asynchronous Call (`->`), Asynchronous Call without Reply (`->|`).
> - <b>Target Module</b>: The target module to which the message is sent. If empty, it indicates the message will be processed by the current module. When empty, the Message Symbol also cannot exist.
> - <b>Comments</b>: Comment information, which will not be parsed.

> [!NOTE]
> <b>CSM Message Target Module Description</b>
>
> In Normal Mode, the target module for a CSM message is the specified module name.
> System-level modules start with a `.` in their name. The target module for a CSM message includes the `.` in the name. For example, if the requested module name is `.System`, the target module for the CSM message is `.System`.
> In Worker Mode, the target module for a CSM message can only be the overall module name, not the node name. For example, if the requested module name is `Worker#`, the target module for the CSM message is `Worker`.
> In Chain of Responsibility Mode, the target module for a CSM message can only be the overall module name, not the node name. For example, if the requested module name is `Chain$1`, the target module for the CSM message is `Chain`.

> [!NOTE]
> <b>Synchronous Message</b>
>
> A synchronous message is a type of message. After a CSM sends a synchronous message, it pauses state transitions and waits for the callee to complete message processing. Synchronous messages are described via `-@`. A call from one JKISM module to another via a synchronous message is called a synchronous call.
>
> <b>Errors occurring at the Caller</b>:
> - If the input target module is `""`, a `NO Target Error` is generated.
> - If the input module does not exist, a `Target Error` is generated.
> - If the input module exists but does not complete processing within the specified time, a `Timeout Error` is generated.
>
> <b>Caller waits for return</b>:
> - If the caller is a CSM module, it stays in the Parse State the Queue++ VI.
> - If it is an API call, it stays in the calling VI, such as the CSM - Send Message and Wait for Reply VI.
>
> <b>Return</b>:
> - <b>If the caller is a CSM module</b>:
>   - Normally, it enters the `Response` state to handle the return.
>   - If an error occurs at the caller, it causes the CSM state machine to enter the `Error Handler` module to handle the error.
>   - If an error occurs at the callee, this information is still the result of the message. It is handled in the `Response` state and can be obtained from Additional Information.
> - <b>If it is an API call</b>:
>   - The Response output is the return.
>   - Errors occurring at both the caller and callee are merged into the error cluster output.

> [!NOTE]
> <b>CSM Synchronous Message Global Timeout</b>
>
> - When performing CSM inter-module communication or using the VI that sends synchronous messages, the default timeout is -2, which uses the globally configured timeout.
> - The global timeout can be set to other positive values using the CSM - Set TMO of Sync-Reply VI to override the global setting.
> - The global timeout only applies to synchronous calls. Asynchronous calls are unaffected.

> [!NOTE]
> <b>Asynchronous Message</b>
>
> An asynchronous message is a type of message. After a CSM sends an asynchronous message, it immediately continues to execute subsequent code without waiting for the callee to complete message processing. Asynchronous messages are divided into Asynchronous Call (`->`) and Asynchronous Call without Reply (`->|`). The only difference is that with an Asynchronous Call without Reply (`->|`), the callee will not return the result to the caller after completing the operation.
>
> <b>Errors occurring at the Caller</b>:
> - If the input target module is `""`, a `NO Target Error` is generated.
> - If the input module does not exist, a `Target Error` is generated.
>
> <b>Caller does not wait for return</b>:
> - If the caller is a CSM module, it enters the `Async Message Posted` state after sending the message in the Parse State Queue++ VI.
> - If it is an API call, it continues to execute subsequent code. The API can only send Asynchronous without Reply messages.
>
> <b>Return</b>:
> - <b>If the caller is a CSM module</b>:
>   - Normally, it enters the `Async Response` state to handle the return. If an error occurs at the callee, this information is still the result of the message. It is handled in the `Async Response` state, and this error information can be obtained from Additional Information.
>   - If an error occurs at the caller, it causes the CSM state machine to enter the `Error Handler` module to handle the error.
> - There is no return if the API can only send Asynchronous without Reply messages.

> [!NOTE]
> <b>CSM Operation Message Format Parsing</b>
>
> CSM defines operations required by the system, such as sending broadcasts, registering to broadcasts, and unregistering. Based on this definition, you can extend system functionality.
>
>      // [CSM Operation] >> [Arguments] -> <[Operation]> // [Comments]
>      Example:
>      // Send Status Broadcast "TCP Connected" with argument "192.168.1.100"
>      TCP Connected >> 192.168.1.100 -> <broadcast>
>      // Register the "TCP Connected" signal of the TCP module to the "UpdateLED" interface of the UI module
>      TCP Connected@TCPModule >> UpdateLED@UI -><register>

> [!NOTE]
> <b>CSM Broadcast</b>
>
> Broadcasts in CSM are divided into three types: Status Broadcast, Interrupt Broadcast, and State Broadcast. The module pushes the Status Broadcast to all modules registered to that Status Broadcast. Status Broadcast and Interrupt Broadcast are explicitly called broadcasts, while State Broadcast is an implicit broadcast. When a registration relationship exists, the State Broadcast is automatically triggered when the CSM completes a certain state.
> - <b>Status Broadcast</b>: Normal priority broadcast. Similar to asynchronous messages, it is passed via the low-priority queue. It is processed sequentially when other unprocessed asynchronous messages or Status Broadcasts exist in the module.
> - <b>Interrupt Broadcast</b>: High priority broadcast. Similar to synchronous messages, it is passed via the high-priority queue. It is processed first when other low-priority asynchronous messages or Status Broadcasts exist in the module. However, if other unprocessed synchronous messages or Interrupt Broadcasts exist, it is processed sequentially.
> - <b>State Broadcast</b>: State Broadcast is an implicit broadcast. When a registration relationship exists, the State Broadcast is automatically triggered when the CSM completes a certain state. The argument for the State Broadcast is the Response of the CSM state.
> <b>Note</b>:
> - Status broadcasts or interrupt broadcasts must be explicitly sent. Do not use names identical to CSM state names. Otherwise, multiple triggers may occur.
> - For efficiency considerations, state broadcasts are only sent when registered to. This means you must register to receive state broadcasts in a module's broadcast events.

> [!NOTE]
> <b>CSM Broadcast Format Parsing</b>
>
>      [CSM Broadcast] >> [Arguments] -> <broadcast> // [Comments]
>      [CSM Status Broadcast] >> [Arguments] -> <status> // [Comments]
>      [CSM Interrupt Broadcast] >> [Arguments] -> <interrupt> // [Comments]
>
> - <b>CSM Broadcast</b>: CSM broadcast. It cannot contain CSM keywords or line breaks.
> - `>>`: Separator between the CSM Broadcast and Arguments.
> - <b>Arguments</b>: Arguments for the CSM broadcast. It cannot contain CSM keywords or line breaks.
> - <b>Broadcast Type</b>: `<broadcast>` and `<status>` are Status Broadcasts; `<interrupt>` is Interrupt Broadcast.
> - <b>Comments</b>: Comment information, which will not be parsed.

> [!NOTE]
> <b>CSM Broadcast Priority</b>
>
>Broadcasts have priorities. State broadcast is a special type of broadcast. By default, the priority of state broadcasts is the same as the priority of status broadcasts. Interrupt broadcasts are high-priority broadcasts and are passed using the high-priority queue, just like synchronous messages. Status broadcasts are low-priority broadcasts and are passed using the low-priority queue, just like asynchronous messages.
>
>      // The default broadcast is a Status Broadcast, for example:
>      ModuleInternalChange >> Arguments -> <broadcast> // Low Priority
>      ModuleInternalChange >> Arguments -> <broadcast> // Low Priority
>
> The default priority is defined by the sender via the broadcast type in the broadcast format.
>
>      // The sender can define the priority of the broadcast
>      ModuleInternalChange >> Arguments -> <status> // Low Priority
>      ModuleInternalChange >> Arguments -> <interrupt> // High Priority
>
> Default registrations do not change the priority, but the priority of the registered broadcast can be changed via special registration formats.
>
>      // Default registration does not change priority
>      ModuleInternalChange@SourceModule >> API@TargetModule -><register>
>      // Change the registered broadcast to Normal priority, regardless of its original priority
>      ModuleInternalChange@SourceModule >> API@TargetModule -><register as status>
>      // Change the registered broadcast to High priority, regardless of its original priority
>      ModuleInternalChange@SourceModule >> API@TargetModule -><register as interrupt>

> [!NOTE]
> <b>CSM Registration</b>
>
> Registration associates a broadcast with a bound interface (API). When the broadcast is triggered, the bound interface (API) is called. Registrations can also be cancelled. In CSM, there are two types of broadcasts:
>
> - <b>Broadcast</b>: Broadcast explicitly called by the module sending the broadcast message. Arguments need to be explicitly provided.
> - <b>State</b>: Any state of a CSM module can also be registered to. The argument received by the triggered API is the Response of the CSM state.
>
>       // Register
>       [CSM Broadcast]@[SourceModule] >> [Bound API]@[TargetModule] -><register> // [Comments]
>       // Unregister
>       [CSM Broadcast]@[SourceModule] >> [Bound API]@[TargetModule] -><unregister> // [Comments]
>
> - <b>CSM Broadcast</b>: Defined by the source module. Refer to "CSM Broadcast Format Parsing" for details.
> - <b>Source Module</b>: The broadcasting module. If registering to broadcasts from any module, the source module can be represented by `*`.
> - <b>Bound API</b>: Defined by the target module. It is the external interface of the target module.
> - <b>Target Module</b>: The module where the bound API resides. When indicating registration to the current module within a CSM module, it can be ignored. The preceding `@` separator is also omitted.
> - `<register>` / `<unregister>`: Definition of the Register/Unregister operation type.
> - <b>Comments</b>: Comment information, which will not be parsed.

> [!NOTE]
> <b>CSM Registration Location</b>
>
> There are two types of registration rules added by CSM registrations: Internal Addition and External Addition.
> - <b>External Addition</b>: Rules added externally are global rules. They will not be automatically deleted when the CSM module exits and must be manually unregistered.
>   - Rules added using the `-<register>` statement are considered externally added if the module name where the API resides is specified.
>   - All rules added using the API CSM - Register Broadcast VI are considered externally added.
> - <b>Internal Addition</b>: Rules added internally within a CSM module will be automatically deleted when the CSM module exits, so there is no need to manually unregister.
>   - Rules are considered internally added only when added using the `-<register>` statement and the API does not specify a module name.
>
>         // Example:
>         status@sourceModule >> API@TargetModule -><register> // Externally added
>         status@sourceModule >> API -><register> // Internally added

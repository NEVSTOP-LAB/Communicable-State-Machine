# CSM API

> [!NOTE]
> <b>Name Concatenation API</b>
>
> This VI only manipulates the module name string and has no actual functionality. Therefore, once you are familiar with the CSM rules, you can directly enter name string and rule symbols without calling this API.

## System-Level Module API

> [!NOTE]
> <b>CSM System-Level Module</b>
>
> CSM functions of a system-level module are almost identical to those of a normal module. The only difference is that the CSM - List Modules VI does not list system-level modules. Therefore, a system-level module is typically used to implement functional modules running in the background. When processing the operational logic of normal modules in a unified manner, interference with these background running logics can be avoided.
>
> CSM system-level modules usually start with `.`, for example: `.MainApp` and `.BackgroundTask`. The `.` is part of the name, so operations like message sending and registration must include the `.` in the name. For example, you can name the main program loop `.MainApp`. You can then use the CSM - List Modules VI to get a list of all normal modules without listing `.MainApp`. If the main program needs to exit all other modules, you can send "Macro: Exit" to the results of the CSM - List Modules VI. This allows you to exit all normal modules without affecting the operation of the system-level module.
>
> CSM modules in Worker Mode and Chain of Responsibility Mode can also start with `.` and run as system-level modules.

### CSM - Mark As System-Level Module.vi
Marks a module as a system-level module by adding `.` before the input string. For example, if the input is `UIModule`, the output is `.UIModule`.

<b>Reference Example</b>: `0. Base Concepts\7. System-Level Module.vi`.

> - Ref: Name Concatenation API
> - Ref: CSM System-Level Module

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.

-- <b>Indicators</b> --
- <b>CSM Name (Marked As System-Level Module)</b>: CSM module name marked with `.`.

## Submodule

> [!NOTE]
> <b>CSM Submodule</b>
>
> There are no strict submodules in CSM. The `.` in the module name is only used to mark the logical relationship between different modules. From an actual execution perspective, each module is independent and has no hierarchical relationship. For example, modules `ModuleA` and `ModuleA.SubmoduleB` are two different modules. From the code logic perspective, they are completely independent and do not interfere with each other. However, the CSM - List Submodules VI can be used to retrieve all logical submodules of `ModuleA`, including `ModuleA.SubmoduleB`.
>
> It is important to note that `ModuleA` does not have to actually exist. It can serve merely as a logical group. For example, modules `Group.SubModuleA` and `Group.SubModuleB` are two different modules. From the code logic perspective, they are completely independent and do not interfere with each other. However, the CSM - List Submodules VI can be used to retrieve all logical submodules of `Group`, including `Group.SubModuleA` and `Group.SubModuleB`.
>
> CSM module names in Worker Mode and Chain of Responsibility Mode can also contain `.`, as this is only logical grouping and does not affect module operation.

### Concatenate Submodule Name.vi
Constructs a submodule name.

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.
- <b>Name</b>: Name to append to the CSM module name.

-- <b>Indicators</b> --
- <b>Submodule Name</b>: Returns the concatenated submodule name.

## Work Mode API

> [!NOTE]
> <b>CSM Worker Mode</b>
>
> A CSM module implements Worker Mode by instantiating multiple instances, appending `#` to the requested name, and sharing the same message queue.
> - From an external call perspective, these instances collectively form a composite module named Worker Agent.
> - Each instance is named a Worker.
>
> <b>Behavior</b>: External callers can consider the Worker Agent as a single CSM module capable of message communication, state registration, and so on. Internally, an idle Worker retrieves messages from the Worker Agent message queue and processes them. Therefore, Worker Mode enables concurrent message processing for a CSM module.
>
> <b>Example</b>:
>
>      // Request module name as `module#`, where `module` is the Worker Agent name. Instantiate two instances. Their names might be:
>      // - `module#59703F3AD837`
>      // - `module#106A470BA5EC`
>      // You cannot communicate directly with a Worker. You must communicate with the Worker Agent. For example:
>      `csm message >> arguments -@ module` // Synchronous message. An idle Worker will process this message.
>      `csm message >> arguments -> module` // Asynchronous message. An idle Worker will process this message.
>
> <b>Application Scenarios</b>:
> - Call center operator scenarios
> - Concurrent downloader scenarios
> - Concurrent compiler scenarios
> - TCP Server handling multiple Client connections

### CSM - Mark As Worker Module.vi
Marks a module as a Worker Mode module by adding `#` after the CSM name.

<b>Reference Example</b>: `4. Advance Examples\1. Action Workers Example`.

> - Ref: Name Concatenation API
> - Ref: CSM Worker Mode

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.

-- <b>Indicators</b> --
- <b>CSM Name (Marked As Worker)</b>: CSM module name marked with `#`.

## Chain of Responsibility API

> [!NOTE]
> <b>CSM Chain of Responsibility Mode</b>
>
> Multiple CSM modules form a complete module via Chain of Responsibility Mode by appending `$` to the requested name to form a chain for processing transactions.
> - From an external call perspective, these instances collectively form a composite module named Chain.
> - Each instance is named a Chain Node.
>
> <b>Behavior</b>: External callers can consider the Chain as a single CSM module capable of message communication, state registration, and so on. Internally, nodes attempt to process the message sequentially according to their order. When a node has the capability to process the current message, the message is processed and is not passed further down the chain.
>
> <b>Example</b>:
>
>      // Request module name as `module$`, where `module` is the chain name. Instantiate 4 instances. Their names might be:
>      // - `module$1`
>      // - `module$2`
>      // - `module$3`
>      // - `module$4`
>      // The sequence of the composed Chain is `module$1(head) >> module$2 >> module$3 >> module$4(tail)`
>      // Assume `module$3` and `module$4` can process "csm message"
>      `csm message >> arguments -@ module`
>      // This message will be processed by `module$3`. `module$4` will not respond.
>
> <b>Application Scenarios</b>:
> - Permission approval process. Based on job hierarchy, personnel with specific functional permissions can approve directly without passing it further.
> - Function concatenation. Different modules implement different tasks, and different functional sets can be combined through concatenation.
> - Function overriding. Implementing overloading in OOP through overriding.
> - Worker Mode scenarios are usually not suitable for having UI operations.

### CSM - Mark As Chain Module.vi

Concatenates the name of a Chain of Responsibility Mode module, using `$` as the separator. Note that the order does not need to be consecutive, but it must be unique. Nodes with smaller numbers are arranged at the front of the responsibility chain.

<b>Reference Example</b>: `4. Advance Examples\2. Chain of Responsibility Example`.

> - Ref: CSM Chain of Responsibility Mode
> - Ref: Name Concatenation API

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.
- <b>Order</b>: Sequence in Chain of Responsibility Mode. Nodes with smaller numbers are arranged at the front of the responsibility chain.

-- <b>Indicators</b> --
- <b>CSM Name (Marked As Chain)</b>: CSM module name marked with `$`.

### CSM - Resolve Node Module.vi
Parses the corresponding CSM module name from an Advanced Mode node name.

For example:
- For a Worker Mode node named `module#59703F3AD837`, the result is `module`.
- For a Chain of Responsibility Mode node named `module$1`, the result is `module`.

-- <b>Controls</b> --
- <b>CSM Module Name</b>: CSM module name.
- <b>Node Name</b>: Node name.

## Multi-Loop Support
> [!NOTE]
> <b>CSM Multi-Loop Mode</b>
>
> In some scenarios, it is suitable to use multiple loops to constitute the same CSM module. For example:
> - Retrofitting existing functional code into a CSM module. For example, TCP connection loops or DAQmx data acquisition loops. To ensure the clarity of the original logic, you can wrap the existing code in a While loop and append a CSM communication loop to implement the retrofitted functionality.
> - In cases with high real-time requirements where a Timed Loop is needed, the CSM loop is required as a communication interface, while the Timed Loop serves as the functional loop implementation scheme.
> - In cases where UI operations are very complex, it is recommended to separate UI operations from the CSM communication loop. The UI operation loop handles UI actions and generates inter-module messages, while the CSM loop serves as the actual functional loop.
>
> The Multi-Loop Support Mode API is used in such scenarios to pass internal messages between internal loops of a module or to provide CSM interface functionality for non-CSM loops.

### CSM - Request CSM to Post Message.vi
Requests the CSM module to send an asynchronous message. This VI is primarily used in CSM Multi-Loop Mode for other modules to request the CSM to send a message.

In this scenario, the CSM - Post Message VI could typically also be used, but the exact moment of sending cannot be determined, and the return value of the asynchronous message cannot be obtained. The CSM - Request CSM to Post Message VI serves as a supplement.

<b>Reference Example</b>: `4. Advance Examples\5. Multi-Loop Module Example\TCP Server Module(Multi-Loop Support).vi`.

> - Ref: CSM Multi-Loop Mode

-- <b>Controls</b> --
- <b>Module Name</b>: The CSM sending the status.
- <b>State</b>: Message name.
- <b>Arguments ("")</b>: Status arguments to be broadcast.
- <b>Without Reply? (F)</b>: Whether a reply is needed. When a reply is needed, an asynchronous message is sent. When a reply is not needed, an asynchronous message without reply is sent.
- <b>Target Module ("" By Default)</b>: Target module.
- <b>Immediately? (F)</b>: Immediate execution option. Sending immediately causes this message to be processed instantly in the CSM loop, rather than waiting for existing messages in the CSM loop to finish execution.

### CSM - Request CSM to Broadcast Status Change.vi
Requests the CSM to send a broadcast. This VI is primarily used in CSM Multi-Loop Mode for other modules to request the CSM to issue a broadcast notifying other modules of a status change.

> [!WARNING] As long as you know the module name, you can use this VI outside the CSM module to spoof a broadcast message from this module. However, this is not recommended because such logic makes the overall logic chaotic and increases debugging difficulty. Therefore, it is only recommended to use this VI in CSM Multi-Loop Mode.

<b>Reference Example</b>: `4. Advance Examples\5. Multi-Loop Module Example\TCP Server Module(Multi-Loop Support).vi`.

> - Ref: CSM Multi-Loop Mode

-- <b>Controls</b> --
- <b>Module Name</b>: The CSM sending the status.
- <b>Status</b>: Status to be broadcast.
- <b>Arguments ("")</b>: Status arguments to be broadcast.
- <b>Broadcast? (T)</b>: Switch input to control whether to broadcast.
- <b>Priority ("Status")</b>: Broadcast priority, default is "Status". It can also be "Interrupt".
- <b>Immediately? (F)</b>: Immediate execution option. Sending immediately causes this message to be processed instantly in the CSM loop, rather than waiting for existing messages in the CSM loop to finish execution.

### CSM - Forward UI Operations to CSM.vi
Forwards events generated by user operations in a UI loop parallel to the CSM loop to the CSM loop for processing. This VI is primarily applied in Multi-Loop Mode. The CSM DQMH-Style Template VI also uses this logic.

<b>Reference Example</b>: `Addons - Loop Support\CSMLS - Continuous Loop in CSM Example.vi`.

> - Ref: CSM Multi-Loop Mode

-- <b>Controls</b> --
- <b>State(s) In ("")</b>: States to be processed.
- <b>Name ("" to Use UUID)</b>: Module name.
- <b>High Priority? (T)</b>: Immediate execution option. Sending immediately causes this message to be processed instantly in the CSM loop, rather than waiting for existing messages in the CSM loop to finish execution.

-- <b>Indicators</b> --
- <b>States Out</b>: Input is always empty. This output is set to ensure wire consistency in the template.

### CSM - Module Turns Invalid.vi
Checks if a CSM module has already exited. Typically used for a functional loop parallel to the CSM to exit following the CSM loop.

For modules in CSM Advanced Modes, such as Worker Mode and Chain of Responsibility Mode, the module exit event is triggered only after the last node has exited.

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.

-- <b>Indicators</b> --
- <b>Turn Invalid (Exit)?</b>: Whether the CSM module has already exited.

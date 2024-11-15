# CSM API

> [!NOTE] Name Concatenation API
> This VI only operates on the module name string and has no actual functionality. Therefore, once familiar with CSM rules, you can directly input the corresponding name string and rule symbols without necessarily calling this API.

## Worker Mode API

> [!NOTE] CSM Worker Mode
>
> A CSM module, by instantiating multiple instances, appends "#" to the requested name and shares the same message queue to achieve worker mode.
> - From an external call perspective, these instances together form a composite module named Worker Agent.
> - Each instance is named Worker.
>
> Behavior:
> External callers can consider Worker Agent as a CSM module that can perform message communication, state registration, and other operations.
> Internally, idle Workers will fetch messages from the Worker Agent message queue and process them. Therefore, the Worker mode can achieve concurrent message processing for a CSM module.
>
> Example:
> // Request module name as module#, module is the Worker Agent name, instantiate 4 instances, the names of these four instances might be:
> // - module#59703F3AD837
> // - module#106A470BA5EC
> // Cannot communicate directly with workers, need to communicate with Worker Agent, for example:
> csm message >> arguments -@ module // synchronous message, idle worker will process this message
> csm message >> arguments -> module // synchronous message, idle worker will process this message
>
> Application Scenarios:
> 1. Customer service representative scenario
> 2. Concurrent downloader scenario
> 3. Concurrent compiler scenario
> 4. TCP Server handling multiple client connections

### CSM - Mark As Worker Module.vi

Add "#" to the CSM name to mark this module as operating in worker mode.

> Ref: Name Concatenation API
> Ref: CSM Worker Mode

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name

-- <b>Indicators</b> --
- <b>CSM Name (marked as worker)</b>: CSM module name with "#" mark

## Chain of Responsibility Mode API - To Be Completed

> [!NOTE] CSM Chain of Responsibility Mode
>
> Multiple CSM modules, with names appended with "$", form a chain to handle transactions, creating a complete module through the chain of responsibility mode.

> - From an external call perspective, these instances together form a composite module named Chain.
> - Each instance is named chain node.
>
> Behavior:
> External callers can consider Chain as a CSM module that can perform message communication, state registration, and other operations.
> Internally, nodes will attempt to process messages in sequence. When a node has the capability to handle the current message, the message is processed and not passed further.
>
> Example:
> // Request module name as module$, module is the chain name, instantiate 4 instances, the names of these four instances might be:
> // - module$1
> // - module$2
> // - module$3
> // - module$4
> // The Chain sequence is module$1 >> module$2 >> module$3 >> module$4
> // Suppose module$3 and module$4 can handle "csm message"
> csm message >> arguments -@ module
> // This message will be handled by module$3, module$4 will not respond
>
> Application Scenarios:
> 1. Approval process, where higher-level managers can approve more events according to their position level
> 2. Function concatenation, where different modules perform different tasks, and concatenation can complete combinations of different functional sets
> 3. Function override, achieving OOP overloading through override

### CSM - Mark As Chain Module.vi

[!WARNING] This set of functions has not been fully verified, please use with caution.

> Ref: CSM Chain of Responsibility Mode
> Ref: Name Concatenation API

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name
- <b>Order</b>: Order in the chain of responsibility mode

-- <b>Indicators</b> --
- <b>CSM Name (marked as Chain)</b>: CSM module name with "$" mark

## Side-Loop Support

### CSM - Request CSM to Post Message.vi

Request CSM to send a message. Typically used for functional loops running in parallel with CSM, these loops complete the full module functionality together with CSM.

-- <b>Controls</b> --
- <b>Module Name</b>: CSM sending the status
- <b>Status</b>: Status to be broadcasted
- <b>Arguments ("")</b>: Parameters of the status to be broadcasted
- <b>Target Module</b>: Target module

### CSM - Request CSM to Broadcast Status Change.vi

Request CSM to publish status. Typically used for functional loops running in parallel with CSM, these loops complete the full module functionality together with CSM.

-- <b>Controls</b> --
- <b>Module Name</b>: CSM sending the status
- <b>Status</b>: Status to be broadcasted
- <b>Arguments ("")</b>: Parameters of the status to be broadcasted
- <b>Broadcast (T)</b>: Control switch input for broadcasting

### CSM - Module Turns Invalid.vi

Check if CSM has exited. Typically used for functional loops running in parallel with CSM, these loops complete the full module functionality together with CSM. This VI is used as the exit condition for parallel loops.

-- <b>Controls</b> --
- <b>CSM Name</b>: Module name

-- <b>Indicators</b> --
- <b>Turn Invalid (Exit)?</b>: Whether it has exited

### CSM - Flood of Events Handler Side Loop.vi

### CSM - Forward States to CSM.vi

-- <b>Controls</b> --
- <b>High Priority(T)</b>:
- <b>Module Name</b>: Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters
- <b>State(s) in ("")</b>: Wire the existing states to this input. The default is an empty string.

### CSM - Forward UI Operations to CSM.vi

-- <b>Controls</b> --
- <b>Name("" to use uuid)</b>:
- <b>State(s) in ("")</b>:

-- <b>Indicators</b> --
- <b>States Out</b>:
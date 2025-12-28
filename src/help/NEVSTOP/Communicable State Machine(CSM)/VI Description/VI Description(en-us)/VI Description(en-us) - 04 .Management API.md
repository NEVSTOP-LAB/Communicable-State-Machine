# CSM API

## Management API

> [!NOTE]
> <b>CSM Operation Modes</b>
>
> - <b>Stand-alone</b>: Independent operation mode. If no module name is specified, a random ID is automatically generated to identify the module.
> - <b>CSM</b>: Normal CSM module.
> - <b>Action Worker</b>: Worker Mode. Append `#` to the module name to mark this module as a worker. This module shares the same message queue with other workers having the same name.
> - <b>Chain Node</b>: Chain node. Append `$` to the module name to mark this module as a chain node. Messages on the same chain will be passed sequentially until a node processes the message.

> [!NOTE]
> <b>CSM Priority Queue Design</b>
>
> In the background, CSM essentially uses LabVIEW queues to implement inter-module communication. However, CSM uses two separate queues to store messages of different priorities:
> - <b>Normal Priority Queue</b>: Used for passing asynchronous messages and status broadcasts.
> - <b>High Priority Message Queue</b>: Used for passing synchronous messages and interrupt broadcasts. Messages in the High Priority Queue are processed first. Messages in the Normal Priority Queue are processed only after the messages in the High Priority Queue have been processed.

### CSM - Check If Module Exists.vi
Checks if a CSM module exists. When a CSM module is running in Worker Mode or Chain of Responsibility Mode, the module is marked as non-existent only after all nodes composing the module have exited.

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.

-- <b>Indicators</b> --
- <b>CSM Name (dup)</b>: A copy of the input CSM module name.
- <b>Exist?</b>: Returns whether the module exists.

### CSM - List Modules.vi
Lists all active CSM modules. This VI has two sets of options:

- <b>Scope Option</b>: Used to specify whether to list system-level modules. By default, system-level modules are not listed. Options: Normal/System Only/All.
- <b>With Nodes Option</b>: Targeted at Worker Mode and Chain of Responsibility Mode. When including nodes, individual nodes are listed along with the modules. Otherwise, only the modules are listed. By default, nodes are not included.

> - Ref: CSM Operation Modes

-- <b>Controls</b> --
- <b>Scope (Normal)</b>: Scope option. You can select from Normal, System Only, or All.
- <b>With Nodes? (F)</b>: Whether to include nodes. This input is targeted at Worker Mode and Chain of Responsibility Mode. When TRUE, nodes are listed simultaneously. Otherwise, only modules are listed. The default is FALSE.

-- <b>Indicators</b> --
- <b>Module Names</b>: List of CSM module names.

### CSM - List Submodules.vi

Lists all submodules of the current group or module. When <b>Recursive? (T)</b> is TRUE, This VI recursively lists submodules at all levels. Otherwise, this VI only lists the direct next-level submodules.

      Example: The system contains the following five modules: Level1.Level2A, Level1.Level2A.Node1, Level1.Level2A.Node2, Level1.Level2B.Node1, Level1.Level2B.Node2.
      - When <b>Parent Name</b> is "Level1":
      If <b>Recursive? (T)</b> is True, this VI recursively lists submodules at all levels, including Level1.Level2A, Level1.Level2A.Node1, Level1.Level2A.Node2, Level1.Level2B.Node1, Level1.Level2B.Node2.
      If <b>Recursive? (T)</b> is False, this VI only lists direct next-level submodules, which only includes Level1.Level2A. Note that Level1.Level2B is not a module instance, so it is not included in the results.

> [!NOTE]
> Submodules are only valid for normal CSM modules and are invalid for modules in Worker Mode or Chain of Responsibility Mode.

> - Ref: CSM Submodule

-- <b>Controls</b> --
- <b>Parent Name</b>: Group or parent node name.
- <b>Recursive? (T)</b>: Whether to recursively list submodules at all levels. The default is TRUE.

-- <b>Indicators</b> --
- <b>Parent Name (Dup)</b>: A copy of the input group or parent node name.
- <b>Submodules</b>: List of submodule names.

### CSM - Module VI Reference.vi
Obtains the VI Reference of the input module.

The following is the logic of this VI:
- This VI queries and retrieves the CSM module's VI reference by sending a `VI Reference` synchronous message, so it has input parameters similar to the VI that sends synchronous messages.
- This VI caches the VI reference of the CSM module queried during the current main program run in the background. When the same module is queried again and the retrieved VI reference is still valid, the cached VI reference is returned directly instead of sending another synchronous message query.
- If you need to force a re-query of the module's VI reference, you can set <b>Force? (F)</b> to TRUE.

Behavior for CSM in special operation modes:
- <b>Worker Mode</b>: Returns the VI reference of the worker node handling the `VI Reference` message.
- <b>Chain of Responsibility Mode</b>: Returns the VI reference of the first node of the CSM module in Chain of Responsibility Mode.
- <b>System-Level Module</b>: Same as normal mode CSM. Returns the VI reference of the system-level module.

-- <b>Controls</b> --
- <b>Current Module ("" to Generate an ID)</b>: Tag for the querying CSM module. If empty, a unique ID is generated.
- <b>CSM Name</b>: CSM module name.
- <b>Force? (F)</b>: Whether to force a re-query of the module's VI reference. The default is FALSE.
- <b>Response Timeout (-2 Using Global Settings)</b>: Timeout for synchronous calls. The default is -2, which uses the global setting. You can set the global timeout using the CSM - Set TMO of Sync-Reply VI.

-- <b>Indicators</b> --
- <b>CSM Module VIRef</b>: VI reference of the CSM module.

### CSM - Set TMO of Sync-Reply.vi
Sets the global synchronous call timeout for the CSM program, in milliseconds. When the input is -2, the global timeout is not modified, and the return value is the current global timeout. When the input is any other positive value, the global timeout is modified to that value, and the new global timeout is returned.

> - Ref: CSM Synchronous Message Global Timeout

When calling a CSM Module/API, the default timeout is -2, in which case the globally configured timeout is used. If set to another positive value, that value is used as the timeout.

-- <b>Controls</b> --
- <b>TMO For Sync-Rep (ms) In</b>: Global timeout input. Using a value of -2 indicates no change to the global timeout. Other positive values indicate modifying the global timeout to that value.

-- <b>Indicators</b> --
- <b>TMO For Sync-Rep (ms) Out</b>: The current global timeout.

### CSM - Module Status.vi
Obtains the status of a CSM module, including operation mode, number of workers, and number of messages pending in the message queue.

> - Ref: CSM Operation Modes

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.

-- <b>Indicators</b> --
- <b>CSM Name (dup)</b>: A copy of the input CSM module name.
- <b>Mode</b>: Returns the operation mode of the module.
- <b>#Nodes</b>: Number of nodes in Worker Mode or Chain of Responsibility Mode.
- <b>#Elements In Queue</b>: Number of messages pending processing in the CSM message queue.

### CSM - Flush Queue.vi
Clear the LabVIEW queue used in the background for inter-module communication of a CSM module.

> - Ref: CSM Priority Queue Design

> [!WARNING]
> Using this VI is generally not recommended for CSM modules. It is recommended to use code design to avoid message accumulation in modules. Therefore, it is recommended to avoid using this VI to clear background message queues in CSM modules.

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.
- <b>Option (Low Priority As Default)</b>: The queue to flush. You can select from the following: All, Low Priority, and High Priority. The default is Low Priority.

-- <b>Indicators</b> --
- <b>CSM Name (Dup)</b>: A copy of the input CSM module name.
- <b>#Flushed</b>: Number of elements in the flushed message queue.

### Filter JKISM String Queue(CSM - Filter JKISM String Queue.vi)
Filters specific states in the CSM state queue.

> [!WARNING]
> Using this VI is generally not recommended. It is recommended to avoid message accumulation in modules through your code design. Therefore, it is recommended to avoid clearing the JKISM string queue through code design. However, if clearing the JKISM string queue is mandatory, it is recommended to use this VI to clear the JKISM string queue rather than using string operations.

> - Ref: CSM State Queue Operation API

> [!NOTE]
> <b>Polymorphic VI Options</b>
>
> - CSM - Filter Local States.vi: Filters local states.
> - CSM - Filter Messages.vi: Filters all types of messages.
> - CSM - Filter Sync Messages.vi: Filters synchronous messages.
> - CSM - Filter Async Messages.vi: Filters asynchronous messages.
> - CSM - Filter Async without Reply Messages.vi: Filters asynchronous without reply messages.
> - CSM - Filter Messages to Non-Existing Modules.vi: Filters messages sent to non-existing modules.
> - CSM - Filter Broadcasts.vi: Filters broadcast messages.
> - CSM - Filter Status Broadcasts.vi: Filters status broadcast messages.
> - CSM - Filter Interrupt Broadcasts.vi: Filters interrupt broadcast messages.
> - CSM - Filter Duplicated Lines.vi: Filters duplicated lines.

#### CSM - Filter Local States.vi
Filters local states in the CSM state queue.

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>States In</b>: The entire state description string to filter.

-- <b>Indicators</b> --
- <b>States Out</b>: The filtered state description string.

#### CSM - Filter Messages.vi
Filters all types of messages in the CSM state queue.

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>States In</b>: The entire state description string to filter.

-- <b>Indicators</b> --
- <b>States Out</b>: The filtered state description string.

#### CSM - Filter Sync Messages.vi
Filters synchronous messages in the CSM state queue.

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>States In</b>: The entire state description string to filter.

-- <b>Indicators</b> --
- <b>States Out</b>: The filtered state description string.

#### CSM - Filter Async Messages.vi
Filters asynchronous messages in the CSM state queue.

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>States In</b>: The entire state description string to filter.

-- <b>Indicators</b> --
- <b>States Out</b>: The filtered state description string.

#### CSM - Filter Async without Reply Messages.vi
Filters asynchronous without reply messages in the CSM state queue.

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>States In</b>: The entire state description string to filter.

-- <b>Indicators</b> --
- <b>States Out</b>: The filtered state description string.

#### CSM - Filter Messages to Non-Existing Modules.vi
Filters messages sent to non-existing modules in the CSM state queue. This VI uses the CSM - List Modules VI to obtain all active CSM modules and then filters out messages sent to modules that do not exist.

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>States In</b>: The entire state description string to filter.

-- <b>Indicators</b> --
- <b>States Out</b>: The filtered state description string.

#### CSM - Filter Broadcasts.vi
Filters broadcast messages in the CSM state queue.

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>States In</b>: The entire state description string to filter.

-- <b>Indicators</b> --
- <b>States Out</b>: The filtered state description string.

#### CSM - Filter Status Broadcasts.vi
Filters status broadcast messages in the CSM state queue.

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>States In</b>: The entire state description string to filter.

-- <b>Indicators</b> --
- <b>States Out</b>: The filtered state description string.

#### CSM - Filter Interrupt Broadcasts.vi
Filters interrupt broadcast messages in the CSM state queue.

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>States In</b>: The entire state description string to filter.

-- <b>Indicators</b> --
- <b>States Out</b>: The filtered state description string.

#### CSM - Filter Duplicated Lines.vi
Filters duplicated lines in the CSM state queue.

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>Keep First Matched? (T)</b>: Whether to keep the first matched item. The default is TRUE.
- <b>States In</b>: The entire state description string to filter.
- <b>Option</b>: Filter option.

-- <b>Indicators</b> --
- <b>States Out</b>: The filtered state description string.

# CSM API

## Management API

> [!NOTE] CSM Working Modes
> 1. Stand-alone: Independent working mode. If no module name is provided, a random ID will be generated to identify the module.
> 2. CSM: Regular CSM module.
> 3. Action Worker: Worker mode. Add "#" after the module name to mark this module as a worker, sharing the same message queue with other workers of the same name.
> 4. Chain Node: Chain node. Add "$" after the module name to mark this module as a chain node. Messages on the same chain will be passed sequentially until a node processes the message.

### CSM - Start Async Call.vi

VI snippet for asynchronous call template code

### CSM - Synchronized Call.vi

VI snippet for synchronous call template code

### CSM - Module VI Reference.vi

Query and obtain the VI reference of the CSM module by sending a "VI Reference" synchronous message.

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name
- <b>Current Module("" to generate an ID)</b>: Identifier of the CSM module to query. If empty, a unique ID will be generated.
- <b>Response Timeout(5000ms)</b>: Timeout for synchronous messages, default is 5000 ms

-- <b>Indicators</b> --
- <b>CSM Module VIRef</b>: VI reference of the CSM module

### CSM - Check If Module Exists.vi

Check if the CSM module exists

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name

-- <b>Indicators</b> --
- <b>Exist?</b>: Returns whether the module exists
- <b>CSM Name(dup)</b>: Returns <b>CSM Name</b>

### CSM - List Modules.vi

List all active CSM modules.

> Ref: CSM Working Modes

-- <b>Controls</b> --
- <b>Exclude Standalone CSM(T)</b>: Whether to include modules in standalone working mode

-- <b>Indicators</b> --
- <b>Module Names</b>: List of CSM module names

### CSM - Module Status.vi

Get the status of the CSM module, including: working mode, number of workers, and the number of pending messages in the message queue.

> Ref: CSM Working Modes

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name

-- <b>Indicators</b> --
- <b>Mode</b>: Returns the working mode of the module
- <b>#As Worker</b>: Number of workers in worker mode for this module
- <b>#msg to be processed</b>: Number of pending messages in the CSM message queue
- <b>CSM Name(dup)</b>: Returns <b>CSM Name</b>

# CSM Advance Example Description

## Advance Examples

### Action Workers Example(Action Worker Mode Example.vi)

#### Overview

Demonstrates the Worker Mode in the CSM framework. In Worker Mode, multiple clonable CSM instances operate as sub-modules. To avoid naming conflicts, CSM automatically appends a “#” postfix to worker module names. When a message is sent to worker, the first idle instance handles it using a fair queue mechanism. From the outside, the system behaves as if only one module is running, while all CSM concepts—such as synchronous, asynchronous, and status messages—remain unchanged.

In this example, four worker instances of worker run in the background. Check the history log to see which instance processed each message.

#### Introduction

This example demonstrates the Worker Mode in the CSM framework. In Worker Mode, multiple clonable CSM instances operate as sub-modules. To avoid naming conflicts, CSM automatically appends a “#” postfix to worker module names. When a message is sent to worker, the first idle instance handles it using a fair queue mechanism. From the outside, the system behaves as if only one module is running, while all CSM concepts—such as synchronous, asynchronous, and status messages—remain unchanged.

In this example, four worker instances of worker run in the background. Check the history log to see which instance processed each message.

#### Steps

Step 1: Use a high-level VI to mark the CSM module as a worker mode (Add a # as Postfix) , if you're familiar with the CSM rules, you can also just type the right name postfix instead of using this high-level VI. 
Then asynchronously call 4 worker CSM modules without waiting for replies. Alternatively, you can also call the 4 worker CSM modules synchronously or even asynchronously with replies, please refer to the code in the disabled-cases.

Step 2: drop a template CSM VI with UI and name it as WorkerModeExample. 

Step 3: Use a while loop to status info of all the running CSM modules, including name, mode, No. of instances and No. of messages queues to be processed. Use a high-level VI to stop the while loop, namely as soon as the caller/main CSM module exited, the while loop will be stopped.

Step 4: Go to the "Macro:Initialize" case and add one more message string as last line, ''UI: Update Worker Info''. For now, no code is placed in the ''UI: Update Worker Info" case, but you can write any customized code here.

Step 5: 
  Step 5.1: UI event handling, after user clicked any of the six user buttons "DoSth: DoA -> Worker", "DoSth: DoA -@ Worker", "DoSth: Error -> Worker", "DoSth: Error -@ Worker" , "Macro: Exit -@ Worker", "Macro: Exit -> Worker", an inter-module message will be sent to the first idle worker CSM module.
  Step 5.2 Then add a Response Source Manager indicator in the UI to handle both the  "Async Response" and "Response"  case, also send a local message ''UI: Update Worker Info".

Step 6: Under Panel Close? UI event, use a high-level API to send "Macro:Exit" sync-messages to all the running CSM worker modules (You can also type the inter-module messages manually with the attention of how many running worker modules there are. You need one message for each running worker mode) and also send a local message "Macro:Exit" to the caller/main CSM module. All the CSM modules will exit in an ordered way then.

### Chain of Responsibility Example(Chain of Responsibility Example.vi)

#### Overview

Demonstrates the responsibility chain design pattern implemented in the CSM framework. By clicking the buttons on the front panel, you can observe how the responsibility chain processes allowed messages in a defined sequence.

Each message is passed through the chain from the lowest-ordered module to the highest-ordered module. Processing stops when a module successfully handles the message, and the message is not forwarded to subsequent modules. If no module in the chain can process the message, this example returns an error.

#### Introduction

This example demonstrates the responsibility chain mode in the CSM framework. Responsibility chain CSM module should always be marked with a "$" and an integer number as suffix, such as "CSMName$1", "CSMName$2", and so on. 

A group of responsibility chain CSM modules process messages both in allowed ways and also in a sequential order:

- Only specially allowed messages can be processed by each individual chain module.
- If one message is allowed by multiple chain modules, the chain module with the lowest order will process the message and the message won't be processed by higher-ordered chain module any more.

#### Instructions

1. Run this VI.
2. Click any of the buttons on the front panel, such as "Action: action 1 -> Chain", then you can see which chain module has processed which message. 
3. Click the "Macro: Exit -> Chain" or "Macro: Exit -@ Chain" button, then you can see the chain module will be initiated in an ordered way.

#### Steps

Step 1: Add special allowed messages for each individual CSM submodule which will be then marked with chain mode, such as "Action: action 1" and "Action: action 2" for the "Chain$1" CSM submodule in this example.

Step 2: Drop a template CSM VI with UI and name it as ChainModeExample. 

Step 3: Create boolean buttons in the UI, such as "Action: action 1 -> Chain" and so on to simulate the inter-module message transfer. 

Step 4: Use high-level APIs to monitor the status of all running CSM modules.

Step 5: Use global log APIs to calculate and monitor the real-time logging capability, please refer to 4. Advance Examples\6. Global Log Handling Capability for more details. 

### Build-in Error Handling Framework(Topmost VI who Registers all Errors.vi)

#### Overview

Demonstrates how to subscribe to errors from all active CSM sub-modules using the built-in error handling framework.

Each CSM module automatically broadcasts an Error Occurred status update when an error is detected. To capture these events, add a single inter-module message string in the top-level CSM module to register for the broadcast.

If the caller VI is not a CSM module, you can achieve the same functionality using the Non-CSM Caller Support VIs.

#### Introduction

This example demonstrates how to subscribe to errors from all active CSM sub-modules using the built-in error handling framework.

Each CSM module automatically broadcasts an Error Occurred status update when an error is detected. To capture these events, add a single inter-module message string in the top-level CSM module to register for the broadcast.

If the caller VI is not a CSM module, you can achieve the same functionality using the Non-CSM Caller Support VIs.

#### Steps

Step 1: Use the CSM VI template to create the GlobalErrorHandlingExample CSM module and synchronously call two other CSM modules.

Step 2: Add one more line of inter-module string message to register "Error Occurred" broadcast event, which is generated any time if any CSM submodule got error: "Error Occurred@* >> Error Handler -><register>", then process the captured event accordingly in the "Error Handler" case.

### Global Log Filter Example(Filter From Source(Event).vi)

#### Overview

Demonstrates using the CSM Global Log APIs to record state change events for debugging and monitoring. This example uses a source-view, user-event-based mechanism.

#### Introduction

This example demonstrates using the CSM Global Log APIs to record state change events for debugging and monitoring. This example uses a source-view, user-event-based mechanism.

#### Steps

Step 1:  Get the CSM global state user event handle. and register it.

Step 2: Set the global filter rules. Under the rules, there are two clusters, the first one for global filter and the second one is for specific CSM modules. 

As example we filter out the whole logs from Module2 (Global) and also the "State Change" LogType of Module1(Specific Module Log).

Step 3: Use CSM_Run Scripts VI to send "API:start" message to all the four synchronously called CSM modules.

Step 4: Dynamically change the global filter rules in a UI event. 

Step 5: Capture the user-event and handle it, in this example, we print it into the LabVIEW UI.

Step 6: Use CSM_Run Scripts VI to send "Macro:Exit" message to synchronously exit all the running CSM modules and also destroy the CSM global state user event handle.

### Global Log Filter Example(Filter From Source(Queue).vi)

#### Overview

Demonstrates using the CSM Global Log APIs to record state change events for debugging and monitoring. This example uses a source-view, queue-based mechanism.

#### Introduction

This example demonstrates using the CSM Global Log APIs to record state change events for debugging and monitoring. This example uses a source-view, queue-based mechanism.

#### Steps

Step 1:  Get the CSM global state user event queue.

Step 2: Set the global filter rules. Under the rules, there are two clusters, the first one for global filter and the second one is for specific CSM modules. 

As example we filter out the whole logs from Module2 (Global) and also the "State Change" LogType of Module1(Specific Module Log).

Step 3: Use CSM_Run Scripts VI to send "API:start" message to all the four synchronously called CSM modules.

Step 4: At first use LabVIEW queue VIs to get queue status and dequeue one element to do some logging calculation, such as speed and LogInQ and so on. We also print the log into the LabVIEW UI.

Then dynamically change the global filter rules if user changes it directly from the UI. 

Step 5: Use CSM_Run Scripts VI to send "Macro:Exit" message to synchronously exit all the running CSM modules and also destroy the CSM global state user event queue.

### Global Log Filter Example(Filter From Subscriber(Event).vi)

#### Overview

Demonstrates using the CSM Global Log APIs to record state change events for debugging and monitoring. This example uses a subscriber-view, user-event-based mechanism.

#### Introduction

This example demonstrates using the CSM Global Log APIs to record state change events for debugging and monitoring. This example uses a subscriber-view, user-event-based mechanism.

#### Steps

Step 1:  Get the CSM global state user event handle. and register it.

Step 2: Use CSM_Run Scripts VI to send "API:start" message to all the four synchronously called CSM modules.

Step 3: Dynamically Set the global filter rules in the UI event. Under the rules, there are two clusters, the first one for global filter and the second one is for specific CSM modules. 

As example we filter out the whole logs from Module2 (Global) and also the "State Change" LogType of Module1(Specific Module Log).

Step 4: Capture the user-event and handle it, in this example, we print it into the LabVIEW UI.

Step 5: Use CSM_Run Scripts VI to send "Macro:Exit" message to synchronously exit all the running CSM modules and also destroy the CSM global state user event handle.

### Global Log Filter Example(Filter From Subscriber(Queue).vi)

#### Overview

Demonstrates using the CSM Global Log APIs to record state change events for debugging and monitoring. This example uses a subscriber-view, queue-based mechanism.

#### Introduction

This example demonstrates using the CSM Global Log APIs to record state change events for debugging and monitoring. This example uses a subscriber-view, queue-based mechanism.

#### Steps

Step 1:  Get the CSM global state user event queue.

Step 2: Use CSM_Run Scripts VI to send "API:start" message to all the four synchronously called CSM modules.

Step 3 At first use LabVIEW queue VIs to get queue status and dequeue one element to do some logging calculation, such as speed and LogInQ and so on. 

Then dynamically change the global filter rules if user changes it directly from the UI. 

Finally we also print the log into the LabVIEW UI.

Step 4: Use CSM_Run Scripts VI to send "Macro:Exit" message to synchronously exit all the running CSM modules and also destroy the CSM global state user event queue.

### Multi-Loop Module Example(Main - Call and Monitor TCP Traffic.vi)

#### Overview

Demonstrates invoking a CSM submodule in a side loop. Externally, this module interacts like a standard CSM submodule, but note its specific API and status change behavior.

#### Introduction

This example demonstrates invoking a CSM submodule in a side loop. Externally, this module interacts like a standard CSM submodule, but note its specific API and status change behavior.

#### Instructions

1. Run this VI.
2. Run the Simple TCP - Client.vi.
3. Modify the string controls on both this VI and the client to observe the communication logs.
4. Restart Simple TCP - Client.vi as needed to observe the reconnection logs.

### Global Log Handling Capability(Global Log Handling Capability Example.vi)

#### Overview

Demonstrates global log handling capability of CSM. This example calls 30 sub-modules that continuously generate events. The main VI captures these events and uses the Global Log APIs to calculate and display key processing metrics, such as LogInQ, changing speed, and handling speed.

Use this example to benchmark global log performance of CSM and as a reference for custom implementations.

#### Introduction

This example demonstrates global log handling capability of CSM. This example calls 30 sub-modules that continuously generate events. The main VI captures these events and uses the Global Log APIs to calculate and display key processing metrics, such as LogInQ, changing speed, and handling speed.

Use this example to benchmark global log performance of CSM and as a reference for custom implementations.

#### Steps

Step 1: Asynchronously call 30 CSM submodules, each of which will then generate events continuously.

Step 2: Starts the CSM Watchdog thread to ensure that all asynchronously started CSM modules exit properly after the main program exits.

Step 3: Use CSM's built-in global log APIs to capture and calculate some typical logging capability figures.

Step 4: Exit the caller and all the other running CSM modules.

### Register State as Status Example(Register State as Status Example.vi)

#### Overview

Demonstrates dynamic state registration using the CSM <register> message string. The message can be built using Build Message With Arguments ++.vi or created manually. Click the buttons in the example UI and see corresponding responses. You can also change the registration string in the example UI to see further customized responses.

A key feature of this example is the ability to cascade or pipeline event registration. For example, when A registers B and B registers C, an event from A is first captured by B, then passed to C for further handling. Click API: API2 -@submodule1 to view this demonstration.

The CSM core engine automatically manages the registration process, so manual unregistration is not required.

#### Introduction

This example demonstrates dynamic state registration using the CSM <register> message string. The message can be built using Build Message With Arguments ++.vi or created manually. Click the buttons in the example UI and see corresponding responses. You can also change the registration string in the example UI to see further customized responses.

A key feature of this example is the ability to cascade or pipeline event registration. For example, when A registers B and B registers C, an event from A is first captured by B, then passed to C for further handling. Click API: API2 -@submodule1 to view this demonstration.

The CSM core engine automatically manages the registration process, so manual unregistration is not required.

#### Steps

Step 1: Create a CSM module with UI based on template VI and synchronously called two CSM submodules (with 1s waiting time before calling the submodules for better UI display order.)

Step 2: Manually add a series of "<register>" strings to dynamically register inter-module events between different CSM modules. If you're unfamiliar with this string syntax, you can also use the high-level API Build Message With Arguments ++.vi.

Step 3: Add "Echo:Echo1" case: we use the utility VI to further get the source of the registration, either local call, or remote call or status callback. This utility VI is useful if you want to know the registered event source. Also add "Echo:Echo2" case and so far no code is placed here. But you can implement any customized code. You don't need to manually unregister these events, since the CSM core engine will process it automatically.

## Addons - Logger

### CSM Application Running Log Example.vi

#### Overview

Demonstrates how to use the CSM Logger VIs to implement a global CSM event file logging function.

#### Introduction

This example demonstrates how to use the CSM Logger VIs to implement a global CSM event file logging function.

#### Steps

Step 1: Use the CSM VI template to get a CSM Module with UI. 

  Step 1.1: Give the CSM module a name, such as "RunningLogExample". 

  Step 1.2: Broadcast the message in the UI event.

Step 2: Use the high-level CSM-Start File Logger.vi (This VI can be found under LabVIEW palette -> CSM -> Addons -> Logger) to rapidly implement a global CSM event file logging function.

As example, we put two such VIs sequentially, manually set the file path and name of the logging, also enable the global rule filter respectively. After running this example, you can also find and view the corresponding logging files for deeper understanding. If you want to add/call more CSM modules later, you don't need to change any code here for the logging function. In summary, you only need such one single high-level CSM addon logger VI to rapidly implement a global logging function. 

## Addons - Loop Support

### CSMLS - Continuous Loop in CSM Example.vi

#### Overview

Demonstrates how to use CSM Loop-Support VIs to create a continuous loop mechanism similar to a while loop. Instead of embedding a while loop manually, you can use high-level APIs to define, append, and terminate the loop. The CSM framework automatically handles all underlying operations.

This example showcases continuous DAQ acquisition within the CSM framework. Click Start to begin continuous acquisition and Stop (or trigger a high-priority error) to end the loop. For comparison, clicking DAQ:once runs a single acquisition. Low-priority errors do not stop the loop.

#### Introduction

This example demonstrates how to use CSM Loop-Support VIs to create a continuous loop mechanism similar to a while loop. Instead of embedding a while loop manually, you can use high-level APIs to define, append, and terminate the loop. The CSM framework automatically handles all underlying operations.

This example showcases continuous DAQ acquisition within the CSM framework. Click Start to begin continuous acquisition and Stop (or trigger a high-priority error) to end the loop. For comparison, clicking DAQ:once runs a single acquisition. Low-priority errors do not stop the loop.

#### Instructions

1. Run the VI and click **DAQ:once** to perform a single DAQ acquisition.
2. Click **Start** to begin continuous acquisition. The waveform chart and log history update in real time.
3. Click **Stop** or **High-Priority Error** to terminate the loop.
4. While the loop is running, clicking **Low-Priority Error.** The error is ignored and the loop still runs.

#### Steps

Step 1:

​	Step 1.1 If the UI event becomes very complex, it's recommend to use the CSM DQMH-Style Template so that we can handle the UI-logic separately from other CSM-related logic. You can find this template under LabVIEW palette -> CSM -> More Templates. 

​	Step 1.2: Also the multi-loop support APIs have been used to forward states from DQMH-loop to the CSM main loop. As an example, after user clicks Start button, the "Macro:DAQ continuous" message can then be forwarded into the CSM main loop for further logic processing.

Step 2: Use the CSM-Addon Logger Start File Logger.vi to rapidly implement a CSM global event file logging function.

Step3: Use CSM Loop-support API VIs to implement while-loop.

​	Step 3.1: Define Loop States(s).vi: Define a multiple message strings, mark the string with "-><loop>" so that this message string will be handled continuously. Send all these strings into the Define Loop States(s).VI

​	Step 3.2: Append Continuous States.vi: Add the necessary continuous arguments if any, also append this into other states and Arguments, so that all those can run in a loop.

​	Step 3.3 Remove Loop Tag to Break.vi: Use this VI to stop the while loop and process post-loop states.

​	Step 3.4: Remove Loop Tag and Previous States to Break.vi: Use this VI to stop the while loop, also remove previous states and then process post-loop states.

## Addons - API String Arguments Support

### Using within CSM - Get Module Configuration.vi

#### Overview



#### Introduction



#### Steps



### CSM API String to Typical data types.vi

#### Overview



#### Introduction



#### Steps



## 

### Typical data types to CSM API String.vi

#### Overview



#### Introduction



#### Steps



## 

### Incorrect usage collections.vi

#### Overview



#### Introduction



#### Steps



## 

### CSM API String to Float.vi

#### Overview



#### Introduction



#### Steps



## 

### CSM API String (Float with Unit) to Float.vi

#### Overview



#### Introduction



#### Steps



## 

### CSM API String to Complex Numeric.vi

#### Overview



#### Introduction



#### Steps



## 

### CSM API String to TimeStamp.vi

#### Overview



#### Introduction



#### Steps



## 

### CSM API String to Enum(special format).vi

#### Overview



#### Introduction



#### Steps



## 

### CSM API String to Array.vi

#### Overview



#### Introduction



#### Steps



## 

### 1D-Cluster to CSM API String.vi

#### Overview



#### Introduction



#### Steps



## 

### 2D-Cluster to CSM API String.vi

#### Overview



#### Introduction



#### Steps



## 

### Cluster to CSM API String.vi

#### Overview



#### Introduction



#### Steps



## 

### CSM API String to Cluster.vi

#### Overview



#### Introduction



#### Steps



## 

### CSM API String to Cluster with 2D Array elements.vi

#### Overview



#### Introduction



#### Steps



## 

## Addons - MassData Parameter Support

### MassData Argument Format.vi

#### Overview



#### Introduction



#### Steps



### Show MassData Cache Status in FP.vi

#### Overview



#### Introduction



#### Steps



### 

### MassData in Non-CSM Framework.vi

#### Overview



#### Introduction



#### Steps



### 

### MassData in CSM.vi

#### Overview



#### Introduction



#### Steps



## Addons - INI Static Variable Support

### Used as parameters parsed by CSM.vi

#### Overview



#### Introduction



#### Steps



### Load the corresponding configuration by providing the prototype.vi

#### Overview



#### Introduction



#### Steps



### In CSM API parameters.vi

#### Overview



#### Introduction



#### Steps



### Multi-file configuration systemvi.vi

#### Overview



#### Introduction



#### Steps



### Write and Read Configuration.vi

#### Overview



#### Introduction



#### Steps



### import Config.ini with __include section.vi

#### Overview



#### Introduction



#### Steps



### Read Nested Variables.vi

#### Overview



#### Introduction



#### Steps


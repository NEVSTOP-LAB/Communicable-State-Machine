# Example Description

## Basic Concepts

### 1. JKISM vs CSM.vi

#### Overview

Demonstrates the framework structures of the JKISM and CSM state machine templates. Both frameworks use string-based message queues to implement the core state machine.

#### VI-Description

This example compares code between JKISM framework and CSM framework. Both frameworks use string-based message queues to implement the core state machine.


#### Steps

Based on JKISM, the CSM has following main expanded features, let's explain them step by step:
Step1: Redesigned the core string-parse engine.
  Step1.1 JKISM uses Parse State Queue.vi which just outputs the next state queue and its corresponding argument (which comes after >>), principally works as "dequeue element".
  Step1.2 CSM uses Parse State Queue++.vi to additionally add following main functionalities:
    - Automatically create/process/destroy queue/user-event mechanism based on state queue input, so that user only needs to give the corresponding high-level string-message.
        - Inter-module/VI messages can be transferred.
        - Additional inputs such as Dequeue Timeout, Response Timeout and Allowed Messages to implement further advanced functions. 

Step2: CSM adds an internal state debug log history.vi for better debugging and logging, the state history can be directly displayed on the front panel.

Step3: CSM defines a series of string syntax to implement local/inter-module message transfers, such as sync-messages, async-messages, status creation/registration/unregistration and so on.

Step4: CSM expands the debug tools, please refer to palette CSM->CSM Debug Tools for further details.

Step5: CSM also has further addons for further customized functionalities, please refer to palette CSM->addons for further details.


### 2. Module Naming Rules.vi

#### Overview

Demonstrates basic string-naming rules for CSM module names. A valid CSM module name is a string that should NOT contain any of the following special characters: `~!@%^&*()\[\]{}+=|\\/?'"<>,.\t\r\n`. These characters are reserved keywords for other purposes within the CSM framework.


#### VI-Description

Demonstrates basic string-naming rules for CSM module names. A valid CSM module name is a string that should NOT contain any of the following special characters: `~!@%^&*()\[\]{}+=|\\/?'"<>,.\t\r\n`. These characters are reserved keywords for other purposes within the CSM framework.

### 3. Message Helper VI and Equivalent String.vi

#### Overview

Demonstrates string syntax format for message communications within the CSM framework.

#### VI-Description

This example explains the following types of string syntax format of inter-CSM-module message communication:
- Sync message
- Async message with reply
- Async message without reply
- Broadcasting a normal status string
- Broadcasting an interrupt or a high-priority status string
- Registering a status
- Unregistering a status

You can use the LabVIEW API to build these strings, or you can create these strings manually by following message rules.

### 4.1 Arguments - Complex Data As Arguments.vi

#### Overview

Converts complex LabVIEW data types, such as clusters and arrays, into a CSM-compatible HEXSTR (0-9, A-F) format and then converts the strings back to the original data type. This process uses complex data safely as a state parameter without disrupting CSM message string parsing.

#### VI-Description

Converts complex LabVIEW data types, such as clusters and arrays, into a CSM-compatible HEXSTR (0-9, A-F) format and then converts the strings back to the original data type. This process uses complex data safely as a state parameter without disrupting CSM message string parsing. Furthermore, the CSM-Argument Type.vi gets the argument token, in this case `HEXSTR`.

### 4.2 Arguments - Error As Arguments.vi

#### Overview

Converts a LabVIEW error cluster into a CSM-compatible error string, which allows the CSM core parse engine to process LabVIEW errors from the message queue. The converted error string uses the following format: `[Error: error-code] error-description-As-safe-argument-string`.

#### VI-Description

This example converts a LabVIEW error cluster into a CSM-compatible error string, which allows the CSM core parse engine to process LabVIEW errors from the message queue. The converted error string uses the following format: `[Error: error-code] error-description-As-safe-argument-string`. Furthermore, the CSM-Argument Type.vi gets the argument token, in this case `ErrStr`.

### 4.3 Arguments - Safe Arguments if it contains key words of CSM.vi

#### Overview
Demonstrates how to convert reserved CSM keywords in an argument string to a HEXSTR (0-9, A-F) format and how to convert back to original form to prevent affecting parsing of CSM message strings.

#### VI-Description
This example demonstrates how to convert reserved CSM keywords in an argument string to a %HEXSTR (0-9, A-F) format and how to convert back to original form to prevent affecting parsing of CSM message strings.

### 5. CSM Data Type.vi

#### Overview

Identifies the data type of LabVIEW input data. You can use this example for further customized data type conversion within the CSM framework.

#### VI-Description

This example identifies the data type of LabVIEW input data. You can use this example for further customized data type conversion within the CSM framework.

### 6. Module Attributes.vi

#### Overview

Demonstrates how to dynamically interact with CSM module attributes using VIs from outside the CSM framework.

#### VI-Description

This example demonstrates how to dynamically interact with CSM module attributes using VIs from outside the CSM framework.

The following are three ways of interaction within CSM framework:

- Use string message queue to transfer message locally/outside of CSM framework, such as State >> Argument -@ DestModuleName.
- Broadcast/Interrupt a status change event from a CSM module, register/unregister that event from another CSM/non-CSM module.
- Use Module Attribute related VIs to get/set/remove/list CSM module attributes.

The core function of this example is from outside the CSM module to dynamically set another random number value to the CSM module, and then get the value from the CSM module and display the value on the UI.

#### Steps

Step 1: Drop the VI template from LabVIEW CSM palette.

Step 2: Add one new line of state string after Macro:Initialize, namely API: Define ABC Attribute.

Step 3: Set Module Attribute inside the CSM module: abc as attribute, a random number as value.

Step 4: Set Module Attribute from outside the CSM module: abc as attribute, a random number as value.

Step 5: Set Module Attribute from outside the CSM module: abc as attribute, retrieve the set random number as value.

Step 6: Send a synchronous message to stop the CSM module from outside the CSM module.


### 7. System-Level Module.vi

#### Overview

Demonstrates how to create a system-level module and illustrates the differences between system-level and regular CSM modules when listing all active modules. System-level modules are typically used in large-scale projects to facilitate code development and debugging.

#### VI-Description

This example demonstrates how to create a system-level module and illustrates the differences between system-level and regular CSM modules when listing all active modules. System-level modules are typically used in large-scale projects to facilitate code development and debugging.

#### Steps

Step 1: Use high-level API VI to create a system-level module name (add "." as prefix to the CSM name to mark as system-level module). You can also just directly input the corresponding name string and rule symbols without calling this API if you're familiar with the rules.

Step 2: Synchronized call of several "normal"/ non-System-level CSM modules.

Step 3: Naming check of valid CSM module names, otherwise error will be generated. A valid CSM module name is a string which should NOT contain any of following special characters ~!@%^&*()\[\]{}+=|\\/?'"<>,\t\r\n, because those are reserved keywords for other well-defined purposes inside CSM framework. For further details you can go to another example code named Module Naming Rules.vi.

Step 4: List all active CSM modules, by default no system-level modules will be listed. By using this high-level VI we can separate the system-level modules from other regular modules for better code development, debugging and so on.

Step 5: Use high-level API VI under CSM->API->Non-CSM Caller Support to send synchronous Macro:Exit messages to all the active CSM modules to stop all those modules/VIs.

These Non-CSM Caller Support VIs are recommended to be used if we want to send inter-modules messages from a Non-CSM module to CSM-modules.

#### Overview

Demonstrates how to dynamically interact with CSM module attributes using VIs from outside the CSM framework.

#### VI-Description

This example demonstrates how to dynamically interact with CSM module attributes using VIs from outside the CSM framework.

The following are three ways of interaction within CSM framework:

- Use string message queue to transfer message locally/outside of CSM framework, such as State >> Argument -@ DestModuleName.
- Broadcast/Interrupt a status change event from a CSM module, register/unregister that event from another CSM/non-CSM module.
- Use Module Attribute related VIs to get/set/remove/list CSM module attributes.

The core function of this example is from outside the CSM module to dynamically set another random number value to the CSM module, and then get the value from the CSM module and display the value on the UI.

#### Steps

Step 1: Drop the VI template from LabVIEW CSM palette.

Step 2: Add one new line of state string after Macro:Initialize, namely API: Define ABC Attribute.

Step 3: Set Module Attribute inside the CSM module: abc as attribute, a random number as value.

Step 4: Set Module Attribute from outside the CSM module: abc as attribute, a random number as value.

Step 5: Set Module Attribute from outside the CSM module: abc as attribute, retrieve the set random number as value.

Step 6: Send a synchronous message to stop the CSM module from outside the CSM module. 


## Create a reuse Module 

### CSM Reuse Module.vi

#### Overview
Generates a random number every second and compare the number against a user-defined threshold. Broadcasts an update when the generated random number exceeds the threshold.

#### VI-Description
This example generates a random number every second and compare the number against a user-defined threshold. Broadcasts an update when the generated random number exceeds the threshold.

#### Steps
Step1. Drop CSM Template from palette.
Step2. Add "Level" to Internal Data for compression. The default value is 0.5.
Step3. Create "DoSth: Check If Greater than 0.5". In this, the core functionality is implemented.         
    Step3.1 Compare Random Data and update UI
    Step3.2 Publish "Status Changed" status when Random data exceeds the level.

Step4. Change timeout as shift register. It will be used to start/stop timeout event. Link wires of timeout in every cases. 
Step5. In Timeout Event, Add "DoSth: Check If Greater than 0.5" to State Queue.

Step6. Create APIs for this module.
    Step6.1 Create "API: Start" to change timeout to 0.5s, which will trigger "DoSth: Check If Greater than 0.5" every second. In this case, "Check Started" Status will be broadcasted.
    Step6.2 Create "API: Stop" to change timeout to -1, which will Stop checking. "Check Stopped" Status will be broadcasted.
    Step6.3 Create "API: Set Level" to change Level setting.
    Step6.4 Create "API: Get Level" to Get current Level from outside.

Step7. Create Local Test Button/Controls 
    Step7.1 create Level Control which calls "API: Set Level" to change level setting locally.
    Step7.2 Create Start button which calls "API: Start" to start checking locally.
    Step7.3 Create Stop button which calls "API: Stop" to start checking locally.

Step8. Update UI correctly in proper cases.
    Step8.1 Initialize UI when starting up.
    Step8.2 Comment "UI: Front Panel State >> Open" in "Macro: Initialize". When it works as submodule, the UI will hide instead of popping up automatically

## Caller is CSM Scenario

### CSM Example - Caller is a CSM.vi

#### Overview

Demonstrates how to invoke CSM module within the CSM framework. In this example, inter-module communication is performed through message string queue operations. You can generate a message string using the Build Message with Arguments++ VI or directly use message description strings if you are familiar with the format.

This example synchronously calls two instances of CSM Reuse Module.vi, enabling dynamic status subscription and module control through the API.

#### VI-Description

Demonstrates how to invoke CSM module within the CSM framework. In this example, inter-module communication is performed through message string queue operations. You can generate a message string using the Build Message with Arguments++ VI or directly use message description strings if you are familiar with the format.

This example synchronously calls two instances of CSM Reuse Module.vi, enabling dynamic status subscription and module control through the API.

#### Steps

Step 1: Drop a VI CSM UI Module Template from LabVIEW palette, change the CSM name to "CSMScenarioExample".

Step 2: Synchronously call the CSM Reuse Module.vi twice and name them SubModule0 and SubModule1 respectively. For more details of how to create such a reuse CSM module, please refer to another CSM-example named 1. Create a reuse Module.

Step 3: Add one new line of customized message string, namely "Macro: Switch Active Module" as the last line into the existing standard string queues under "Macro:Initialize" case, so that we can switch between different SubModules.

Step 4: Add one string constant SubModule0 for internal data initialization. For more customized internal data initialization, we can add more code here. 

Step 5: Add one string control in the UI to switch and display active/target module (Combox box).
  Step 5.1: Under " 'Target Module': Value Change" UI event, set the string control to the active module internal data and also send one intra-module message Macro: Switch Active. Module. 
  Step 5.2: Under "UI: Initialize" case, update the active/Target Module.

Step 6: Under "Macro: Switch Active Module" case, use the high level VI to send an inter-module sync. message "API: Get Level -@ modulename" to the active SubModule.
Or you can also just type the string constant manually if you're familiar with the CSM string syntax rules. 

Step 7: Now the status queue is empty and the CSM state machine is now waiting in the timeout UI-event under  ' "", "Event Structure", "Idle" '. The next step depends on the UI interaction provided by the User. 

Step 8: Create local test buttons/controls in the UI as follows:
  Step 8.1: Create API:Start button, when user clicks this button, a async-No reply message, "API: Start -> modulename" will be send to start the active subModule. 
  Step 8.2: Create Register All Status Change button, when user clicks this button, this CSM module registers following broadcast/interrupt message from the active SubModule 
"Status Changed@* >> Action: Status Change Handler -><register>".
  Step 8.3:  Create Unregister All Status Change button, when user clicks this button, this CSM module unregisters following broadcast/interrupt message from the active SubModule 
"Status Changed@* >> Action: Status Change Handler -><unregister>".
  Step 8.4: No code here, but you can see the log when it's called because of the registered status change. Any further customized code can be added here right after receiving this broadcast/interrupt message.
  Step 8.5: Create API:Stop button, when user clicks this button, an async-No reply message, "API: Stop -> modulename" will be sent to stop the active subModule. 
  Step 8.6: Create Level DBL control, when user changes the value, an async message, "API: Set Level >> 0.3 ->| modulename" will be sent to the active subModule.
  Step 8.7: Create API: Get Level(Async) button, when user clicks this button, an async message, "API: Get Level -> modulename" will be sent to the active SubModule. Handle the case "Async Message Posted" and "Async Response" accordingly, in this example the Level display will be updated.  
  Step 8.8: Create UI: create Front Panel State >> Open button, when user clicks the button, an async message with no reply "UI: Front Panel State >> Open ->| modulename" will be sent to the active Submodule.
  Step 8.9: Create UI: create Front Panel State >> Close button, when user clicks the button, an async message with no reply "UI: Front Panel State >> Close ->| modulename" will be sent to the active Submodule.

Step 9: Under "Panel Close?" UI event, add two more new string messages before "Macro:Exit": "Macro: Exit -@ SubModule0" and "Macro: Exit -@ SubModule1", so that we can safely close all the CSM submodules before we finally close the CSM caller/main module.

## Caller is Other Framework Scenario

### CSM Example - Caller is NOT a CSM.vi

#### Overview

Demonstrates how to invoke a CSM module from another framework application. In this example, inter-module communication is implemented using the Post/Send Message API and module status change user events.

This example asynchronously calls two instances of CSM Reuse Module.vi, enabling dynamic message subscription and module control through the API.

#### VI-Description

This example demonstrates how to invoke a CSM module from another framework application. In this example, inter-module communication is implemented using the Post/Send Message API and module status change user events.

This example asynchronously calls two instances of CSM Reuse Module.vi, enabling dynamic message subscription and module control through the API.

#### Steps

Step 1: In the 100ms-UI event timeout, check if any CSM modules are running/exist.

Start and  stop a CSM submodule:
Step 2: Async-call of the selected CSM submodule. 
Step 3: Send an async. message without reply to the selected CSM submodule to stop/exit the CSM submodule. The high-level API can be found under LabVIEW palette -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support.

Register and unregister status change:
Step 4: Use the high-level API to get the status change event handles from the selected Submodule and register it. The high-level API can be found under LabVIEW palette -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support.
Step 5: Unregister user event. Use the high-level API to destroy and release the status change event handles. The high-level API can be found under LabVIEW palette -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support.

API call:
Step 6: Use the high-level API to send an async-message without reply to the selected submodule: "API:start". The high-level API can be found under LabVIEW palette -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support.
Step 7: Use the same high-level API to send an async-message without reply to the selected submodule: "API:stop".

UI Front panel of selected CSM submodule: 
Step 8:  Use the high-level API to send an async-message without reply to the selected submodule: "UI: Front Panel State >> Open". The high-level API can be found under LabVIEW palette -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support.
Step 9: Use the same high-level API to send an async-message without reply to the selected submodule: "UI: Front Panel State >> Close". 

Select a module:
Step 10: Use the high-level API to send a sync. message and wait for a return message, in this case, the level value: "API: Get Level". The high-level API can be found under LabVIEW palette -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support.

Get and set Level:
Step 11: Use the high-level API to send a sync. message and wait for a return message: "API: Set Level >> value". The high-level API can be found under LabVIEW palette -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support.
Step 12: Use the same high-level API to send a sync. message and wait for a return message: "API: Get Level".

Handle submodule's status change event:
Step 13: after registering the status change event, we can handle this event here. As example, we print the user event data into the status history, which also displays directly on the UI. 

Panel close? UI event:
Step 14: At first use the high-level API to send a sync. message to exit the selected submodule: "Macro:Exit", then exit the caller/main module.

## Advance Examples

### Action Workers Example(Action Worker Mode Example.vi)

#### Overview

Demonstrates the Worker Mode in the CSM framework. In Worker Mode, multiple clonable CSM instances operate as sub-modules. To avoid naming conflicts, CSM automatically appends a “#” postfix to worker module names. When a message is sent to worker, the first idle instance handles it using a fair queue mechanism. From the outside, the system behaves as if only one module is running, while all CSM concepts—such as synchronous, asynchronous, and status messages—remain unchanged.

In this example, four worker instances of worker run in the background. Check the history log to see which instance processed each message.

#### VI-Description

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

#### VI-Description

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

#### VI-Description

This example demonstrates how to subscribe to errors from all active CSM sub-modules using the built-in error handling framework.

Each CSM module automatically broadcasts an Error Occurred status update when an error is detected. To capture these events, add a single inter-module message string in the top-level CSM module to register for the broadcast.

If the caller VI is not a CSM module, you can achieve the same functionality using the Non-CSM Caller Support VIs.

#### Steps

Step 1: Use the CSM VI template to create the GlobalErrorHandlingExample CSM module and synchronously call two other CSM modules.

Step 2: Add one more line of inter-module string message to register "Error Occurred" broadcast event, which is generated any time if any CSM submodule got error: "Error Occurred@* >> Error Handler -><register>", then process the captured event accordingly in the "Error Handler" case.

### Global Log Filter Example(Filter From Source(Event).vi)

#### Overview

Demonstrates using the CSM Global Log APIs to record state change events for debugging and monitoring. This example uses a source-view, user-event-based mechanism.

#### VI-Description

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

#### VI-Description

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

#### VI-Description

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

#### VI-Description

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

#### VI-Description

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

#### VI-Description

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

#### VI-Description

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

#### VI-Description

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

#### VI-Description

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



#### VI-Description



#### Steps



### CSM API String to Typical data types.vi

#### Overview



#### VI-Description



#### Steps



## 

### Typical data types to CSM API String.vi

#### Overview



#### VI-Description



#### Steps



## 

### Incorrect usage collections.vi

#### Overview



#### VI-Description



#### Steps



## 

### CSM API String to Float.vi

#### Overview



#### VI-Description



#### Steps



## 

### CSM API String (Float with Unit) to Float.vi

#### Overview



#### VI-Description



#### Steps



## 

### CSM API String to Complex Numeric.vi

#### Overview



#### VI-Description



#### Steps



## 

### CSM API String to TimeStamp.vi

#### Overview



#### VI-Description



#### Steps



## 

### CSM API String to Enum(special format).vi

#### Overview



#### VI-Description



#### Steps



## 

### CSM API String to Array.vi

#### Overview



#### VI-Description



#### Steps



## 

### 1D-Cluster to CSM API String.vi

#### Overview



#### VI-Description



#### Steps



## 

### 2D-Cluster to CSM API String.vi

#### Overview



#### VI-Description



#### Steps



## 

### Cluster to CSM API String.vi

#### Overview



#### VI-Description



#### Steps



## 

### CSM API String to Cluster.vi

#### Overview



#### VI-Description



#### Steps



## 

### CSM API String to Cluster with 2D Array elements.vi

#### Overview



#### VI-Description



#### Steps



## 

## Addons - MassData Parameter Support

### MassData Argument Format.vi

#### Overview



#### VI-Description



#### Steps



### Show MassData Cache Status in FP.vi

#### Overview



#### VI-Description



#### Steps



### 

### MassData in Non-CSM Framework.vi

#### Overview



#### VI-Description



#### Steps



### 

### MassData in CSM.vi

#### Overview



#### VI-Description



#### Steps



## Addons - INI Static Variable Support

### Used as parameters parsed by CSM.vi

#### Overview



#### VI-Description



#### Steps



### Load the corresponding configuration by providing the prototype.vi

#### Overview



#### VI-Description



#### Steps



### In CSM API parameters.vi

#### Overview



#### VI-Description



#### Steps



### Multi-file configuration systemvi.vi

#### Overview



#### VI-Description



#### Steps



### Write and Read Configuration.vi

#### Overview



#### VI-Description



#### Steps



### import Config.ini with __include section.vi

#### Overview



#### VI-Description



#### Steps



### Read Nested Variables.vi

#### Overview



#### VI-Description



#### Steps


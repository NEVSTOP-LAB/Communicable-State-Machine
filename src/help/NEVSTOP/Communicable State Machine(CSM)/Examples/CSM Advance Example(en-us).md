# CSM Advance Example Description

## Worker Mode Example

### Caller Program (Action Worker Mode Example.vi)

#### Overview

Demonstrates the Worker Mode within the CSM framework. In this example, four workers run in the background, collectively forming a CSM module in Worker Mode.

#### Introduction

This example demonstrates the Worker Mode within the CSM framework. In Worker Mode, multiple cloneable CSM instances run as nodes. To avoid naming conflicts, the module name is appended with a "#" suffix, informing the CSM framework that this is a worker module. When a message is sent to the workers, the message is handled using a fair queuing mechanism, where the first available worker module processes the message. From an external perspective, the system behaves as if only a single module is running, and all CSM concepts, such as synchronous, asynchronous, and broadcast, remain unchanged.

In this example, four workers run in the background.

#### Steps

- Step1: Use the Advanced VI to mark the CSM module as Worker Mode (adding `#` as a suffix). If you are familiar with CSM rules, you can also type the correct name suffix directly without using this VI. Then, asynchronously call the 4 worker CSM modules without waiting for a reply. Alternatively, you can call the 4 worker CSM modules synchronously, or even asynchronously with a reply (refer to the code in the Disabled cases).
- Step2: This loop is the main program module, named `WorkerModeExample`.
- Step3: Use a While Loop to retrieve status information for all running CSM modules, including names, modes, instance counts, and the number of message queues to be processed. Use the Advanced VI to stop the While Loop. Once the caller/main CSM module exits, the While Loop will stop.
- Step4:
  - Step4.1: UI Event Handling. After the user clicks any of the following six user buttons, an inter-module message is sent to the first available worker CSM module.
    - "DoSth: DoA -> Worker"
    - "DoSth: DoA -@ Worker"
    - "DoSth: Error -> Worker"
    - "DoSth: Error -@ Worker"
    - "Macro: Exit -@ Worker"
    - "Macro: Exit -> Worker"
  - Step4.2: Add a Response Source Manager indicator to the UI to handle "Async Response" and "Response" cases.
- Step5: Module Exit. In the `Macro: Exit` message, use the CSM - Build Exit Messages of CSMs VI to create synchronous `Macro: Exit` messages for all running CSM worker modules. You can also manually type the inter-module messages, but be aware of how many worker modules are running. One message is required for each running worker instance. Then, send the local message `Macro: Exit` to the caller/main CSM module. All CSM modules will then exit sequentially.

### Worker Mode Module Implementation (Action Worker.vi)

#### Overview

This example is the implementation of the CSM module node in Worker Mode. It is called by `Action Worker Mode Example.vi`, which instantiates multiple nodes that collectively form a CSM module in Worker Mode. To run simultaneously, the VI of the CSM worker module must be set to Reentrant.

#### Introduction

This example shows the implementation of a CSM module node in Worker Mode. It provides the following two methods:

- `DoSth: DoA`: No actual operation. Used for demonstration only.
- `DoSth: Error`: No actual operation; generates an error with Code=12345. Used for demonstration only.

To allow Worker Mode nodes to run simultaneously, the VI execution property is set to Reentrant.

#### Steps

- Step1: Add the "DoSth: DoA" method.
- Step2: Add the "DoSth: Error" method.
- Step3: Set the VI execution property to Reentrant.

## Chain of Responsibility Example

### Caller Program (Chain of Responsibility Example.vi)

#### Overview

This example demonstrates the responsibility chain design pattern implemented within the CSM framework. By clicking buttons on the front panel, you can observe how the responsibility chain processes allowed messages in a defined order. Each message is passed from the lowest-order module to the highest-order module. When a module successfully processes the message, processing stops, and the message is not forwarded to subsequent modules. If no module in the chain can handle the message, this example returns an error.

#### Instructions

1. Run this VI.
2. Click any button on the front panel, such as <b>Action: action 1 -> Chain</b>. You can then see which chain module processed which message.
3. Click the <b>Macro: Exit -> Chain</b> or <b>Macro: Exit -@ Chain</b> button, and you will see the chain modules shut down in order.

#### Introduction

This example demonstrates the responsibility chain pattern in the CSM framework. Responsibility chain CSM modules must always be marked with a "$" suffix and followed by an integer, such as "CSMName$1", "CSMName$2", etc.

A group of responsibility chain CSM modules process messages sequentially based on permissions:

- Each individual chain module can only process specifically allowed messages.
- If a message is allowed by multiple chain modules, the lowest-order chain module processes the message, and the message is not processed by any higher-order chain modules.

#### Steps

- Step1: Add special allowed messages for each CSM submodule marked as Chain Mode. For example, in this case, "Action: action 1" and "Action: action 2" for the "Chain$1" CSM submodule.
- Step2: This loop is the main program module, named `ChainModeExample`.
- Step3: Create Boolean buttons on the UI, such as "Action: action 1 -> Chain", to simulate inter-module message transmission.
- Step4: Use a While Loop to retrieve status information for all running CSM modules, including names, modes, instance counts, and the number of message queues to be processed. Use the Advanced VI to stop the While Loop. Once the caller/main CSM module exits, the While Loop will stop.
- Step5: Use the Global Log API to calculate and monitor real-time logging capabilities. For more details, refer to *4. Advance Examples\6. Global Log Handling Capability*.

### Chain Mode Module Implementation (ChainNode A.vi)

#### Overview

This example implements a CSM module node in the chain of responsibility mode. This VI is called by `Chain of Responsibility Example.vi`.

#### Introduction

This example implements a CSM module node for the chain of responsibility mode. The "Allowed Messages" parameter defines the message names that the node can process, such as "Action: action 1" and "Action: action 2" messages.

### Chain Mode Module Implementation (ChainNode B.vi)

#### Overview

This example implements a CSM module node in the chain of responsibility mode. This VI is called by `Chain of Responsibility Example.vi`

#### Introduction

This example implements a CSM module node for the chain of responsibility mode. The "Allowed Messages" parameter defines the message names that this node can process, such as "Action: action 2", "Action: action 3", "Action: action 4", and "Action: action 5" messages.

### Chain Mode Module Implementation (ChainNode C.vi)

#### Overview

This example implements a CSM module node in the chain of responsibility mode. This VI is called by `Chain of Responsibility Example.vi`.

#### Introduction

This example implements a CSM module node for the chain of responsibility mode. The "Allowed Messages" parameter defines the message names that this node can process, such as "Action: action 4", "Action: action 5", and "Action: action 6" messages.

## Global Error Handling Mechanism Example

### Main Program (Topmost VI who Registers all Errors.vi)

#### Overview

Demonstrates how to use the status subscription mechanism to implement a global error handling mechanism. The main program also acts as an error handling module, where errors from all CSM submodules can be captured and handled within the main program.

#### Introduction

This example demonstrates how to use the status subscription mechanism to implement a global error handling mechanism. The main program also acts as an error handling module, where errors from all CSM submodules can be captured and handled within the main program. Every CSM module automatically broadcasts an `Error Occurred` status update when an error occurs. By adding an inter-module message string in the main program to register for this broadcast, errors from all CSM submodules can be captured.

If the caller VI is not a CSM module, you can use the Non-CSM Caller Support VI to implement functionality to subscribe to CSM module errors.

#### Steps

- Step1: The core of the main program is a CSM module named `GlobalErrorHandlingExample`.
- Step2: Synchronously call two other CSM modules. These two submodules can generate predetermined errors when buttons are clicked.
- Step3: Register for the "Error Occurred" broadcast event at startup: `"Error Occurred@* >> Error Handler -><register>"`. This event triggers the "Error Handler" of `GlobalErrorHandlingExample` to process the captured event whenever any CSM submodule broadcasts an `Error Occurred` status change.
- Step4: (Optional) In the exit logic, use `CSM - Filter Messages to Non-Existing Modules.vi` to filter out messages to non-existent CSM modules to avoid triggering errors during exit.

### Simulated Error Generation Module (Error Module.vi)

#### Overview

A CSM example module used to generate predetermined errors when a button is clicked.

#### Introduction

This example is a submodule for the global error handling mechanism, used to generate predetermined errors when a button is clicked. This CSM module is set to Reentrant, allowing multiple instances to run simultaneously. The front panel opens automatically upon startup. Clicking the <b>Generate Error</b> button creates a simulated error. Through the state machine transition, this error runs into the "Error Handler" state and broadcasts the error via the `Error Occurred` status. Any module subscribed to this module's `Error Occurred` status can capture and handle this error.

#### Steps

- Step1: Generate a simulated error and pass it into the module via the error wire. This represents a typical error scenario.
- Step2: This error information triggers the CSM module to transition to the `Error Handler` state. This behavior is consistent with the JKI State Machine (JKISM).
- Step3: In the `Error Handler` state, the error information is broadcast via the `Error Occurred` status.

## Global Log Filtering Example

### Event-Based Source Filtering (Filter From Source(Event).vi)

#### Overview

Demonstrates using the CSM Global Log API to record state change events for debugging and monitoring. This example is based on the User Event mechanism and configures source-side filtering rules.

#### Introduction

This example demonstrates using the CSM Global Log API to record state change events for debugging and monitoring. This example is based on the User Event mechanism and configures source-side filtering rules.

#### Steps

- Step1: Use an Event Structure to retrieve the CSM global log and display it on the interface.
  - Step1.1: Obtain the CSM Global Status User Event refnum and register it.
  - Step1.2: Set source-side global filtering rules. The first rule is for global filtering, and the second is for a specific CSM module. For example, filtering out all logs from Module2 (Global) and the "State Change" LogType from Module1 (Module-Specific).
  - Step1.3: In the `<CSM Global Log Event>` case, handle the CSM global log event and print it to the LabVIEW UI.
  - Step1.4: During the program exit process, unregister the CSM Global Status User Event refnum.
- Step2: Synchronously call `1. Create a reuse Module\CSM Reuse Module.vi` to create four running CSM module instances.
  - Step2.1: Create four running CSM module instances.
  - Step2.2: Once global log handling is ready, send the "API:start" message to start all modules.
  - Step2.3: Observe the running log information. You can see that the relevant logs defined in the rules have been filtered.
  - Step2.4: Upon program exit, send the "Macro: Exit" message to synchronously exit all running CSM modules.

### Queue-Based Source Filtering (Filter From Source(Queue).vi)

#### Overview

Demonstrates using the CSM Global Log API to record state change events for debugging and monitoring. This example is based on the User Event mechanism and configures source-side filtering rules.

#### Introduction

This example demonstrates using the CSM Global Log API to record state change events for debugging and monitoring. This example is based on a queue-based mechanism and configures source-side filtering rules.

#### Steps

- Step1: Use an Event Structure to retrieve the CSM global log and display it on the interface.
  - Step1.1: Obtain the CSM Global Status Queue refnum and register it.
  - Step1.2: Set source-side global filtering rules. The first rule is for global filtering and the second is for a specific CSM module. For example, filtering out all logs from Module2 (Global) and the "State Change" LogType from Module1 (Module-Specific).
  - Step1.3: Query the queue status and calculate metrics such as log processing speed.
  - Step1.4: Use a Dequeue structure to handle CSM global log events and print them to the LabVIEW UI.
  - Step1.5: During the program exit process, unregister/release the CSM Global Status Queue refnum.
- Step2: Synchronously call `1. Create a reuse Module\CSM Reuse Module.vi` to create four running CSM module instances.
  - Step2.1: Create four running CSM module instances.
  - Step2.2: Once global log handling is ready, send the "API:start" message to start all modules.
  - Step2.3: Observe the running Log information; you can see that the relevant logs defined in the rules have been filtered.
  - Step2.4: Upon program exit, send the "Macro: Exit" message to synchronously exit all running CSM modules.

### Event-Based Subscriber Filtering (Filter From Subscriber(Event).vi)

#### Overview

Demonstrates using the CSM Global Log API to record state change events for debugging and monitoring. This example is based on the User Event mechanism and configures subscriber-side filtering rules. Subscriber-side rule settings only affect logs received by that specific subscriber and do not affect other subscribers or global logs.

#### Introduction

This example demonstrates using the CSM Global Log API to record state change events for debugging and monitoring. This example is based on the User Event mechanism and configures subscriber-side filtering rules. Subscriber-side rule settings only affect logs received by that specific subscriber and do not affect other subscribers or global logs.

#### Steps

- Step1: Use an Event Structure to retrieve the CSM global log and display it on the interface.
  - Step1.1: Obtain the CSM Global Status User Event refnum and register it.
  - Step1.2: Set subscriber-side global filtering rules. The first rule is for global filtering, and the second is for a specific CSM module. For example, filtering out all logs from Module2 (Global) and the "State Change" LogType from Module1 (Module-Specific).
  - Step1.3: In the `<CSM Global Log Event>` case, handle the CSM global log event and print it to the LabVIEW UI.
  - Step1.4: During the program exit process, unregister the CSM Global Status User Event refnum.
- Step2: Synchronously call `1. Create a reuse Module\CSM Reuse Module.vi` to create four running CSM module instances.
  - Step2.1: Create four running CSM module instances.
  - Step2.2: Once global log handling is ready, send the "API:start" message to start all modules.
  - Step2.3: Observe the running Log information. You can see that the relevant logs defined in the rules have been filtered.
  - Step2.4: Upon program exit, send the "Macro: Exit" message to synchronously exit all running CSM modules.

### Queue-Based Subscriber Filtering (Filter From Subscriber(Queue).vi)

#### Overview

Demonstrates using the CSM Global Log API to record state change events for debugging and monitoring. This example is based on the User Event mechanism and configures subscriber-side filtering rules. Subscriber-side rule settings only affect logs received by that specific subscriber and do not affect other subscribers or global logs.

#### Introduction

This example demonstrates using the CSM Global Log API to record state change events for debugging and monitoring. This example is based on a queue-based mechanism and configures subscriber-side filtering rules. Subscriber-side rule settings only affect logs received by that specific subscriber and do not affect other subscribers or global logs.

#### Steps

- Step1: Use an Event Structure to retrieve the CSM global log and display it on the interface.
  - Step1.1: Obtain the CSM Global Status Queue refnum and register it.
  - Step1.2: Set subscriber-side global filtering rules. The first rule is for global filtering, and the second is for a specific CSM module. For example, filtering out all logs from Module2 (Global) and the "State Change" LogType from Module1 (Module-Specific).
  - Step1.3: Query the queue status and calculate metrics such as log processing speed.
  - Step1.4: Use a Dequeue structure to handle CSM global log events and print them to the LabVIEW UI.
  - Step1.5: During the program exit process, unregister/release the CSM Global Status Queue refnum.
- Step2: Synchronously call `1. Create a reuse Module\CSM Reuse Module.vi` to create four running CSM module instances.
  - Step2.1: Create four running CSM module instances.
  - Step2.2: Once global log handling is ready, send the "API:start" message to start all modules.
  - Step2.3: Observe the running Log information; you can see that the relevant logs defined in the rules have been filtered.
  - Step2.4: Upon program exit, send the "Macro: Exit" message to synchronously exit all running CSM modules.

## Multi-Loop Module Example (Main - Call and Monitor TCP Traffic.vi)

### Multi-Loop Module (TCP Server Module(Multi-Loop Support).vi)

#### Overview

This example demonstrates how to create a CSM module with a side loop. In some scenarios, implementing logic outside the CSM loop is much simpler. In such cases, you can use the side-loop support API to integrate your logic with the CSM loop, forming a submodule.

This example creates a simple TCP Server submodule that is intuitive and easy to understand, while fully leveraging the advantages of CSM as an interface.

#### Instructions

1. Run this VI.
2. Run `Simple TCP - Client.vi`.
3. Modify the string controls on the front panel of both VIs to observe log information.
4. You can restart `Simple TCP - Client.vi` to view the logs.

#### Introduction

The CSM loop acts as an interface, allowing you to use "TCP: Send" to send messages via TCP and "TCP: Receive" to handle received messages. This example displays only the messages. By combining the CSM loop with a side TCP loop, this module functions as a TCP service for sending and receiving messages with a client via a TCP connection.

This development approach makes it convenient to adapt existing code, using CSM as a communication interface to interact with other modules. Multi-loop design is suited for timing-critical scenarios that require timed loops.

#### Steps

- Step1: CSM loop acts as a communication interface.
  - Step1.1: Create the `TCP: Send` interface to handle sending TCP data packets.
  - Step1.2: Create the `TCP: Receive` interface to handle receiving TCP data packets.
  - Step1.3: Broadcast received TCP data packets via a "TCP Received" status change.
- Step2: TCP side loop.
  - Step2.1: TCP Listen. Hardcoded port number.
  - Step2.2: Broadcast "TCP Connected" status upon initial TCP connection.
  - Step2.3: Monitor the TCP connection for incoming messages.
  - Step2.4: Clear Error 56, as it indicates the TCP connection is idle.
  - Step2.5: Call the side loop API: `CSM Module Turns Invalid.vi` to ensure the side loop exits along with the CSM loop.
  - Step2.6: Stop the inner loop.
  - Step2.7: Close the TCP refnum.
  - Step2.8: Broadcast "TCP Disconnected" status when the TCP connection is broken.
  - Step2.9: Stop the outer loop.

### TCP Server Program (Main - Call and Monitor TCP Traffic.vi)

#### Overview

Implements a TCP server program based on calling `TCP Server Module(Multi-Loop Support).vi`. From the outside, the interaction with this module is identical to that of a standard CSM module. Internally, however, the module's status changes are broadcast via the side loop.

#### Instructions

1. Run this VI.
2. Run `Simple TCP - Client.vi`.
3. Modify the string controls on the front panel of both VIs to observe communication logs.
4. Restart `Simple TCP - Client.vi` as needed to observe reconnection logs.

#### Introduction

Without using the CSM framework directly, this example implements a TCP server program by calling `TCP Server Module(Multi-Loop Support).vi`. From the outside, the interaction with this module is identical to that of a standard CSM module. Internally, however, the module's status changes are broadcast via the side loop.

#### Steps

- Step1: Initialize UI.
- Step2: Asynchronously call `TCP Server Module(Multi-Loop Support).vi` to start a CSM module named "TCPServer".
- Step3: Subscribe to the status change events of the TCPServer module.
- Step4: Modify the string control on the client VI to observe communication logs.
- Step5: Run `Simple TCP - Client.vi` and click the send button on the VI to send a TCP message to the server.
- Step6: Any received TCP message is broadcast by the TCPServer as a "TCP Received" status change. Therefore, this status can be handled in the status handling event, and this program displays it on the interface.
- Step7: After modifying the content of the string control and pressing Enter, this program sends it as a TCP message to the Client.
- Step8: Upon program exit, unsubscribe from the TCPServer module's status change events.
- Step9: Send the "Macro: Exit" message to synchronously exit the TCPServer module.

## Global Log Handling Capability (Global Log Handling Capability Example.vi)

### Overview

Demonstrates the global log handling capabilities of CSM. This example calls 30 submodules that continuously generate events. The main VI captures these events and uses the Global Log API to compute and display key processing metrics, such as `LogInQ`, change speed, and processing speed.

Use this example to benchmark CSM global log performance and as a reference for custom implementations.

### Introduction

This example demonstrates the global log handling capabilities of CSM. This example calls 30 submodules that continuously generate events. The main VI captures these events and uses the Global Log API to calculate and display key processing metrics, such as `LogInQ`, change speed, and processing speed.

Use this example to benchmark CSM global log performance and as a reference for custom implementations.

### Steps

- Step1: Asynchronously call 30 CSM submodules, each of which subsequently generates events continuously.
- Step2: Start the CSM Watchdog thread to ensure all asynchronously launched CSM modules exit properly after the main program exits.
- Step3: Use CSM's built-in Global Log API to capture and calculate typical logging capability data.
- Step4: Exit the caller and all other running CSM modules.

## State Subscription Example

### State Subscription Example Submodule (State Register Example Submodule.vi)

#### Overview

This example is the submodule for the Register State as Status Example. It is called by `Register State as Status Example.vi`.

#### Introduction

This example is the submodule for the Register State as Status Example. It is called by `Register State as Status Example.vi`. When you click a button on the front panel of this example, the state corresponding to the button name is executed.

### State Subscription Main Program (Register State as Status Example.vi)

#### Overview

Demonstrates how to use the state registration feature.

Compared to status, the advantages of state registration are as follows:

- There is no need to explicitly publish a status. As long as execution reaches a particular state and that state has subscribers, it will automatically trigger and pass the state’s Response as parameters to the subscribers.
- It is easy to implement the observer pattern without intruding into the original code.
- It supports chained registrations, but you must avoid creating registration loops, which would result in infinite recursion.

#### Introduction

This example demonstrates how to use the state registration feature. Click buttons in the example UI to view corresponding responses. You can also change the registration strings in the example UI to see further custom responses.

There is no difference in syntax between state registration and status. The difference is that a status needs to be explicitly broadcast via API, whereas state changes allow you to subscribe to any state within a CSM module.

The following is what this example does:

```
// After the "Macro: Initialize" state of any module completes, trigger "Echo: Echo1" in the main CSM module (default).
Macro: Initialize@* >> Echo: Echo1 -><register>
// After the "API: API1" state of any module completes, trigger "Echo: Echo1" in the main CSM module (default).
API: API1@* >> Echo: Echo1-><register>
// After the "API: API2" state of "SubModule1" completes, trigger "Echo: Echo2" in the Main CSM module (default).
API: API2@SubModule1 >> Echo: Echo2 -><register>
// After the "Echo: Echo2" state of the main module completes, trigger "API: API1" in "SubModule1".
Echo: Echo2@main >> API: API1@submodule1 -><register>
// After the "Exit" state of "SubModule1" completes, trigger "Echo: Echo1" in the main CSM module (default).
Exit@submodule1 >> Echo: Echo1 -><register>
// After the "Macro: Exit" state of "SubModule2" completes, trigger "Echo: Echo1" in the main CSM module (default).
Macro: Exit@submodule2 >> Echo: Echo1 -><register>
```

After `Echo: Echo2` in the `main` module executes, it triggers the `API: API1` state in `SubModule1`. According to the zero-first rule, after the `API: API1` state completes, it triggers `Echo: Echo1` in the main CSM module (default). This is a chained registration scenario.

#### Steps

- Step1: Based on the global log template, create a monitoring loop to observe state changes in all modules within the system.
- Step2: Asynchronously call two CSM submodules. Wait for 1 second before calling submodules to achieve better UI display order. You can click buttons on the front panel to trigger state changes of submodules.
- Step3: Implement a CSM main program module named `main` using the template.
  - Step3.1: Clicking buttons on the main program interface triggers its state changes. The button name is used directly as the state name to reduce coding.
  - Step3.2: When the main module starts, it automatically registers the preset state registration rules.
  - Step3.3: In the "Echo: Echo1" state, parameters and other information are displayed as a pop-up. The execution of this state is also recorded in the global log.
- Step4: You can click buttons on the main interface or submodule interfaces to trigger the corresponding logic, view the global log, and verify that the state registration is effective.

# Addons - Logger

## CSM Application Running Log Example.vi

### Overview

Demonstrates how to use the CSM Logger VIs to implement global CSM event file logging.

### Introduction

This example demonstrates how to use the CSM Logger VIs to implement global CSM event file logging. Use the CSM-Start File Logger VI, found under LabVIEW Palette -> CSM -> Addons -> Logger, to quickly implement global CSM event file logging.

In this example, two instances of the CSM-Start File Logger VI are placed in sequence, the log file path and name are manually set , and global rule filters are enabled for each instance separately. After running this example, you can locate and view the corresponding log files to deepen your understanding. If you add/call more CSM modules later, you do not need to change any code here to achieve logging functionality. In summary, a single high-level CSM Addon Logger VI is sufficient to quickly realize a global logging mechanism.

### Steps

- Step1: This is a simple CSM module named `RunningLogExample`.
- Step2: Any button click will run into the "API: Button Click" state and broadcast a status change of the same name, with the button name as the parameter.
- Step3: In `API: Button Click`, nothing needs to be done because the goal is to observe the log file.
- Step4: After the program starts, two background logging threads for log files are launched. These logging threads will exit as the program exits.
- Step5: After running the program, check the directory where the example VI is located for two log files.
  - Step5.1: `CSM Application Running Log Example.csmlog` records all logs.
  - Step5.2: `CSM Application Running Log Example.no-state.csmlog` records logs without state change records.

# Addons - Loop Support

## CSMLS - Continuous Loop in CSM Example.vi

### Overview

A loop is the basic unit of operation for a state machine, executing continuously while the state machine is running. Users can define loop conditions via logic or use the CSM Loop-Support VIs. The advantage of the Loop-Support VIs is that the loop can continue to respond to other events while running, without blocking the state machine's operation. This is similar to a continuous looping mechanism in a While Loop. You do not need to manually embed a While Loop. Instead, you can use the CSM Loop-Support VIs to define, append, and terminate loops. The CSM Loop-Support VIs accomplish this function by analyzing the state queue.

This example demonstrates continuous DAQ acquisition within the CSM framework. Click <b>Start</b> to begin continuous acquisition, and click <b>Stop</b>, or trigger a high-priority error, to end the loop. For comparison, click <b>DAQ: Once</b> to run a single acquisition. A low-priority error does not stop the loop.

### Instructions

1. Run the VI and click <b>DAQ: Once</b> to perform a single DAQ acquisition.
2. Click <b>Start</b> to begin continuous acquisition. The waveform graph and log history update in real-time.
3. Click <b>Stop</b> or <b>High-Priority Error</b> to terminate the loop.
4. While the loop is running, click <b>Low-Priority Error</b>. The error is ignored, and the loop continues to run.

### Introduction

This example demonstrates how to use CSM Loop-Support VIs to implement the functionality of a continuous DAQ acquisition While Loop. Click <b>Start</b> to begin continuous acquisition, and click <b>Stop</b>, or trigger a high-priority error, to end the loop. For comparison, click <b>DAQ: Once</b> to run a single acquisition.

### Steps

- Step1: UI Event Handling Loop.
  - Step1.1: If UI events become very complex, it is recommended to use the CSM DQMH-Style Template so that you can handle UI logic separately from other CSM-related logic. You can find this template under LabVIEW Palette -> CSM -> More Templates.
  - Step1.2: Additionally, the Multi-Loop Module Support API is used to forward states from the DQMH loop to the CSM main loop. For example, after the user clicks the <b>Start</b> button, the "Macro:DAQ continuous" message can be forwarded to the CSM main loop for further logic processing.
- Step2: Use `CSM-Addon Logger Start File Logger.vi` to quickly implement CSM global event file logging.
- Step3: CSM Loop that is used to handle interface operations and external responses, and implement specific operational logic.
  - Step3.1: In the DAQ group, perform the specific operational logic for DAQ acquisition.
- Step4: Use CSM Loop-Support VIs to implement the While Loop.
  - Step4.1: `Define Loop States(s).vi`: Define continuous states, marking the loop check state with `-><loop>` so that the message string is processed continuously.
  - Step4.2: `Append Continuous States.vi`: Append the next round of states and continue adding the loop check state to the state queue via parameters.
  - Step4.3: `Remove Loop Tag to Break.vi`: Use this VI to remove the `<loop>` tag to break the loop state. States related to the current loop iteration can be processed normally.
  - Step4.4: `Remove Loop Tag and Previous States to Break.vi`: Remove the `<loop>` tag and all previous states to break the loop state. States related to the current loop iteration are removed.
  - Step4.5: A delay function needs to be added to control the loop rate.
- Step5: As a result, the same states can be used to implement a standard single acquisition.

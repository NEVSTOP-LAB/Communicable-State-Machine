# CSM Basic Example Description

## Basic Concepts

### 1. JKISM vs CSM.vi

#### Overview

CSM is a LabVIEW development framework designed according to the logic of the JKI State Machine (JKISM). Both frameworks use string-based message queues to implement core logic. This example demonstrates the extensions CSM builds upon JKISM.

#### Introduction

This example compares the code between the JKISM framework and the CSM framework. Both frameworks use string-based message queues to implement the core state machine.

#### Steps

Based on JKISM, CSM includes the following major extended features:

- Step 1: CSM is a program framework, so it requires a module name.
- Step 2: CSM redesigns the core string parsing engine.
  - Step 2.1: JKISM uses `Parse State Queue.vi`, which only outputs the next state queue and its corresponding arguments (located after `>>`), primarily functioning as a "Dequeue Element" operation.
  - Step 2.2: CSM uses `Parse State Queue++.vi`, which adds the following major features:
    - Automatically creates/handles/destroys the queue/user event mechanism based on the state queue input, so the user only needs to provide the corresponding high-level string messages.
    - Enables Inter-module/Inter-VI message transmission.
    - Includes additional inputs, such as Dequeue Timeout, Response Timeout, and Allowed Messages, to implement more advanced functionality.
- Step 3: CSM adds an internal state debugging log, `history.vi`, for better debugging and recording. The state history can be displayed directly on the front panel.
- Step 4: CSM defines a series of string syntaxes to implement local/inter-module message transmission, such as synchronous messages, asynchronous messages, state creation/registration/unregistration, etc.
  - Step 4.1: JKISM only defines local state transitions. It can carry an argument and comment.
  - Step 4.2: CSM is a software framework, so it defines modules and message communication between modules.
- Step 5: CSM defines some base states to handle the logical behavior of communication between modules.
  - Step 5.1: "Critical Error" is used to handle unrecoverable errors.
  - Step 5.2: "Target Timeout Error" is used to handle module message communication timeout errors.
  - Step 5.3: "Target Error" is used to handle errors where the target module does not exist.
  - Step 5.4: "Async Response" is used to handle replies to asynchronous messages.
  - Step 5.5: "Response" is used to handle replies to synchronous messages.
  - Step 5.6: "Async Message Posted" is used to handle operations after an asynchronous message is sent.
  - Step 5.7: (Optional) Message events used in "Events: Register" and "Events: Unregister" are used to trigger a CSM module with an event structure to exit the structure.
  - Step 5.8: (Optional) `<New State Notifier Event>` works with Step 5.7 to break out of the event structure and wait when an external message arrives.
  - Step 5.9: (Optional) CSM recommends using API groups to provide external interfaces, but in reality, all cases can be called using messages.
- Step 6: CSM additionally defines "Msg/Rsp's CSM" to locate the source module of external messages and states.
- Step 7: Additional message information, such as the source message name and source arguments of a response, can be obtained here.
- Step 8: CSM has preset message returns.
- Step 9: CSM extends debugging tools. For details, please refer to the palette CSM -> CSM Debug Tools.

### 2. Module Naming Rules.vi

#### Overview

Demonstrates the basic string naming rules for CSM modules. A valid CSM module name is a string that should not contain any of the following special characters: `~!@%^&*()\[\]{}+=|\\/?'"<>,.\t\r\n`. These characters are keywords reserved for other purposes within the CSM framework.

#### Introduction

This example demonstrates what constitutes a valid CSM module name by analyzing different scenarios.

#### Steps

- Step1: Regular module name.
- Step2: Valid name containing spaces.
- Step3: Name containing a colon (`:`).
- Step4: Name containing a hash (`#`). In this case, the module name is valid, and the corresponding module operates in Worker Mode.
- Step5: Name containing an underscore (`_`).
- Step6: Name containing a hyphen (`-`).
- Step7: Examples of invalid names containing reserved characters.
- Step8: Name beginning with a dot (`.`). In this case, the module name is valid, and the corresponding module operates in System-Level Mode.
- Step9: Shows a case where a dot (`.`) serves as an internal separator. In this case, the module name is valid and can be logically viewed as a Submodule.
- Step10: Shows a case containing a dollar sign (`$`) followed by a number. In this case, the module name is valid, and the corresponding module operates in Chain Mode.

### 3. Message Helper VI and Equivalent String.vi

#### Overview

Demonstrates the string syntax format for message communication within the CSM framework.

#### Introduction

This example explains the syntax format for inter-module message communication in CSM. You can use LabVIEW APIs to build these strings. If you are familiar with the message rules, you can create them manually. The syntax defined by CSM is as follows:

```
    //--- CSM State Syntax ---
    // Local Message Example
    DoSth: DoA >> Arguments

    // Synchronous Call Example
    API: xxxx >> Arguments -@ TargetModule

    // Asynchronous Call Example
    API: xxxx >> Arguments -> TargetModule

    // Asynchronous Call (No Reply) Example
    API: xxxx >> Arguments ->| TargetModule

    // Broadcast Normal Status:
    Status >> StatusArguments -><status>

    // Broadcast Interrupt Status:
    Interrupt >> StatusArguments -><interrupt>

    // Register Source Module's State to Handler Module
    Status@Source Module >> API@Handler Module -><register>

    // Unregister Source Module's State
    Status@Source Module >> API@Handler Module -><unregister>

    //--- CSM Comments ---
    // To add a comment, use "//". All text to the right will be ignored.
    UI: Initialize // Initialize UI
    // Another comment line
```

#### Steps

- Step1: Synchronous message. The sender waits in place for a reply until a timeout occurs or a reply is received.
- Step2: Asynchronous message with reply. The sender continues to execute subsequent operations without waiting for a reply. After the receiver processes the message, it replies to the sender.
- Step3: Asynchronous message without reply. The sender continues to execute subsequent operations without waiting for a reply. After the receiver processes the message, it does not reply to the sender.
- Step4: Broadcast a normal status string.
- Step5: Broadcast an interrupt or high-priority status string.
- Step6: Register a state. When the state changes, the registered handler module message is automatically triggered.
- Step7: Unregister a state. Cancels the message trigger upon state change.

### 4.1 Arguments - Complex Data As Arguments.vi

#### Overview

This example demonstrates how other data types are converted to HEXSTR and passed as arguments.

#### Introduction

CSM arguments can only be represented as String types. The HEXSTR (0-9, A-F) format is the string representation used within the CSM framework to pass complex data types. It allows any data type to be used as an argument without interfering with CSM message string parsing. Additionally, `CSM - Argument Type.vi` retrieves the argument tag, which in this case is `HEXSTR`.

The internal conversion logic involves converting any data type to a Variant, and then converting the memory content of the Variant into the HEXSTR format.

Application scenarios include lossless transfer of any data type, such as clusters, arrays, structures, etc. However, large data volumes will result in excessively long message strings, affecting performance. Therefore, it is not suitable for scenarios like transferring large arrays or waveform data.

#### Steps

- Step1: Demonstrate converting a cluster to HEXSTR and restoring it.
- Step2: Demonstrate converting a small data array to HEXSTR and restoring it.

### 4.2 Arguments - Error As Arguments.vi

#### Overview

This example demonstrates how LabVIEW errors are passed as CSM arguments.

#### Introduction

This example converts a LabVIEW error cluster into a CSM-compatible error string. This allows the CSM core parsing engine to handle LabVIEW errors from the message queue and facilitates logging internal errors. The converted error string uses the following format: `<ErrStr>[Error: error-code] error-description-As-safe-argument-string`. Additionally, `CSM - Argument Type.vi` retrieves the argument tag, which in this case is `ErrStr`.

<b>Application Scenario</b>: Passing LabVIEW errors.

#### Steps

- Step1: Demonstrate converting an error to ErrStr and restoring it.
- Step2: (Forward Compatibility) Demonstrate converting a previous ErrStr back to an error cluster.
- Step3: Demonstrate converting a previous ErrStr back to an error cluster and obtaining the CSM-Argument Type.

### 4.3 Arguments - Safe Arguments if it contains key words of CSM.vi

#### Overview

Demonstrates how to pass strings containing special characters as arguments.

#### Introduction

Since CSM uses text descriptions as arguments, parsing errors occur if the argument contains reserved CSM keywords. To solve this, CSM provides APIs to convert special characters in unsafe strings into safe strings for use in arguments.

<b>Application Scenario</b>: Passing strings containing special characters.

#### Steps

- Step1: Demonstrate converting an unsafe string to a safe string and obtaining the CSM-Argument Type.
- Step2: Demonstrate using a Windows file path as an argument.
- Step3: Demonstrate using a URL as an argument.

### 5. CSM Data Type.vi

#### Overview

Demonstrates the data type descriptions recommended by CSM.

#### Introduction

In the CSM framework, arguments can only be passed in the form of String types. To support various data types, data usually needs to go through a process of packing, transmission, and unpacking. For example, CSM internally provides support for the HEXSTR argument type, and users can also provide custom data type conversions via addons to suit their application scenarios.

To support different data types, you sometimes need to pass data type descriptions to handle logic branches for different data types at the decoding stage. This example demonstrates the data type description method recommended by CSM and the corresponding APIs.

### 6. Module Attributes.vi

#### Overview

Demonstrates how to use CSM Attributes. CSM Attribute is a mechanism within the CSM framework for storing module configurations. It is used to:

- Provide a configuration method that does not require message access. External entities can directly read/write module attribute values via Module Name, Attribute Name, and Data Type.
- Provide a data sharing mechanism for internal nodes of modules in Worker Mode and Chain Mode. Different nodes share the same Attribute space and can share data by reading/writing Attributes.

#### Introduction

This example demonstrates how to dynamically interact with CSM module attributes using VIs outside the CSM framework. The core function of this example is to dynamically set a random numeric value to a CSM module from outside that module, and then retrieve that value from the CSM module and display it on the UI.

#### Steps

- Step1: This is a CSM module created from a template, named "CSM".
- Step2: Add a new state string line after `Macro:Initialize`, specifically `API: Define ABC Attribute`.
- Step3: In `API: Define ABC Attribute`, set the module attribute: `abc` as the attribute and a random number as the value.
- Step4: Set the module attribute from outside the CSM module: `abc` as the attribute and a random number as the value.
- Step5: Read the module attribute from outside the CSM module: `abc` as the attribute.
- Step6: Send a synchronous message from outside the CSM module to stop the CSM module.

### 7. System-Level Module.vi

#### Overview

Demonstrates how to create a system-level module and explains the difference between system-level modules and regular CSM modules when listing all active modules.

#### Introduction

System-level modules have a "." added as a prefix to their name, marking them as system-level modules. Functionally, system-level modules are identical to regular modules and can perform message communication and state registration. The difference is that system-level modules are not automatically listed in the active module list. This means that in normal logic scheduling, system-level modules will not be directly called and can only be triggered by explicit message transmission.

Therefore, system-level modules are typically used to implement global background functions, such as scheduling modules in TCP programs.

This example demonstrates this distinction.

#### Steps

- Step1: Use the Advanced VIs to create a system-level module name by adding "." as a prefix to the CSM name. If you are familiar with the rules, you can also enter the corresponding name string and rule symbol directly without calling this API.
- Step2: Synchronously call several "regular"/non-system-level CSM modules.
- Step3: (Optional) Check if the CSM module name is valid. For more details, refer to the code of another example named `Module Naming Rules.vi`.
- Step4: Wait for 1 second to ensure all modules finish starting.
- Step5: List all active CSM modules. By default, system-level modules are not listed. By using the Advanced VIs, you can separate system-level modules from other regular modules for more efficient code development, debugging, etc.
- Step6: Use unified logic to send the "Macro:Exit" message to all active regular CSM modules to stop them.
- Step7: You can still send messages to system-level modules, such as sending the "Macro:Exit" message, to stop the system-level module.

## Create a reuse Module

### CSM Reuse Module.vi

#### Overview

In the CSM framework, creating a reusable module usually does not require message interaction with other modules. You only need to provide external interfaces and publish the module's state changes. Therefore, as long as these two aspects are clearly described, the reusable module can be called even without knowledge of its internal implementation details. This example demonstrates how to create a reusable module that checks if random data exceeds a user-defined threshold.

In a CSM module, all case branches can be considered callable messages, but it is recommended to use API groups as external interfaces. When state updates need to be sent, Status or Interrupt Status can be sent to notify external modules of internal state changes.

#### Introduction

This example demonstrates a CSM module whose function is to generate a random number every second and compare that number with a user-defined threshold. When the generated random number exceeds the threshold, an update is broadcast.

#### Steps

- Step1: Drag and drop the CSM Template from the palette.
- Step2: Add <b>Level</b> to Internal Data. The default value is 0.5.
- Step3: Create "DoSth: Check If Greater than 0.5" to implement the core functionality.
  - Step3.1: Compare random data and update the UI.
  - Step3.2: Publish the "Status Changed" status when random data exceeds the level.
- Step4: Change the <b>Timeout</b> to a shift register. It will be used to start/stop timeout events. Wire <b>Timeout</b> in every case.
- Step5: In the Timeout Event, add "DoSth: Check If Greater than 0.5" to the State Queue.
- Step6: Create APIs for this module.
  - Step6.1: Create "API: Start" to change the timeout to 0.5, which will trigger "DoSth: Check If Greater than 0.5" every second. In this case, broadcast the "Check Started" status.
  - Step6.2: Create "API: Stop" to change the timeout to -1, which will stop the checking. The "Check Stopped" status will be broadcast.
  - Step6.3: Create "API: Set Level" to change the Level setting.
  - Step6.4: Create "API: Get Level" to retrieve the current Level from the outside.
- Step7: Create local test buttons/controls.
  - Step7.1: Create a <b>Level</b> control and call "API: Set Level" to change the level setting locally.
  - Step7.2: Create a <b>Start</b> button and call "API: Start" to begin checking locally.
  - Step7.3: Create a <b>Stop</b> button and call "API: Stop" to stop checking locally.
- Step8: Correctly update the UI where appropriate.
  - Step8.1: Initialize the UI at startup.
  - Step8.2: Comment out `UI: Front Panel State >> Open` in "Macro: Initialize". When working as a submodule, the UI will automatically hide instead of popping up.

## Caller is CSM Scenario

### CSM Example - Caller is a CSM.vi

#### Overview

Demonstrates how to call a CSM module within the CSM framework. This example synchronously calls two instances of the CSM Reuse Module VI, implementing dynamic state subscription and module control via API.

#### Introduction

Demonstrates how to call a CSM module within the CSM framework. In this example, inter-module communication is performed via message string queue operations. You can use the Build Message with Arguments++ VI to generate message strings. If you are familiar with the format, you can also use message description strings directly.

This example synchronously calls two instances of the CSM Reuse Module VI, implementing dynamic state subscription and module control via API.

#### Steps

- Step1: Drag and drop a CSM User Interface (UI) Module Template from the LabVIEW palette and change the CSM Name to "CSMScenarioExample".
- Step2: Synchronously call CSM Reuse Module VI twice, naming them SubModule0 and SubModule1, respectively. For more details on creating such reusable CSM modules, refer to CSM example named `1. Create a reuse Module`.
- Step3: Add a new custom message string line, "Macro: Switch Active Module", as the last line to the existing standard string queue under the "Macro:Initialize" case so that you can switch between different submodules.
- Step4: Add a string constant SubModule0 for internal data initialization. You can add more code here for further custom internal data initialization.
- Step5: Add a string control (Combo Box) in the UI to switch and display the active/target module.
  - Step5.1: Under the "'Target Module': Value Change" UI event, set the string control to the active module internal data.
  - Step5.2: Use "Macro: Switch Active Module" again to update the active module.
- Step6: Under the "Macro: Switch Active Module" case, use the Advanced VIs to send an inter-module synchronous message "API: Get Level -@ modulename" to the active submodule. Alternatively, if you are familiar with CSM string syntax rules, you can manually type the string constant.
- Step7: Now the state queue is empty, and the CSM state machine is waiting in the Timeout UI event under ''", "Event Structure", "Idle". The next step depends on the user-provided UI interaction.
- Step8: Create local test buttons/controls in the UI as follows:
  - Step8.1: Create an <b>API:Start</b> button. When the user clicks this button, an asynchronous no-reply message "API: Start -> modulename" will be sent to start the active submodule.
  - Step8.2: Create a <b>Register All Status Change</b> button. When the user clicks this button, this CSM module will register the following broadcast/interrupt message from the active submodule: "Status Changed@* >> Action: Status Change Handler ->\<register>".
  - Step8.3: Create an <b>Unregister All Status Change</b> button. When the user clicks this button, this CSM module will unregister the following broadcast/interrupt message from the active submodule: "Status Changed@* >> Action: Status Change Handler ->\<unregister>".
  - Step8.4: This is used to break out of the event structure when a message is received to handle state changes.
  - Step8.5: Create an <b>API:Stop</b> button. When the user clicks this button, an asynchronous no-reply message "API: Stop -> modulename" will be sent to stop the active submodule.
  - Step8.6: Create a <b>Level</b> DBL control. When the user changes the value, an asynchronous message "API: Set Level >> 0.3 ->| modulename" will be sent to the active submodule.
  - Step8.7: Create an <b>API: Get Level(Async)</b> button. When the user clicks this button, an asynchronous message "API: Get Level -> modulename" will be sent to the active submodule. The "Async Message Posted" and "Async Response" cases will be processed accordingly. In this example, the Level display will be updated.
  - Step8.8: Create a <b>UI: create Front Panel State >> Open</b> button. When the user clicks this button, an asynchronous message with no reply "UI: Front Panel State >> Open ->| modulename" will be sent to the active submodule.
  - Step8.9: Create a <b>UI: create Front Panel State >> Close</b> button. When the user clicks this button, an asynchronous message with no reply "UI: Front Panel State >> Close ->| modulename" will be sent to the active submodule.
- Step9: Under the "Panel Close?" UI event, add two new string messages before "Macro:Exit": "Macro: Exit -@ SubModule0" and "Macro: Exit -@ SubModule1", so that you can safely close all CSM submodules before finally closing the CSM caller/main module.

## Caller is Other Framework Scenario

### CSM Example - Caller is NOT a CSM.vi

#### Overview

Demonstrates how to call a CSM module from another framework application. This example asynchronously calls two instances of the CSM Reuse Module VI, implementing dynamic message subscription and module control via API.

#### Introduction

Demonstrates how to call a CSM module from another framework application. In this example, inter-module communication is implemented using the Post/Send Message API and module state change user events.

This example asynchronously calls two instances of the CSM Reuse Module VI, implementing dynamic message subscription and module control via API.

#### Steps

- Step1: In the 100ms-UI event timeout, check if any CSM modules are running/existing.
- Step2: Start and stop CSM submodules.
  - Step2.1: Asynchronously call the selected CSM submodule.
  - Step2.2: Send an asynchronous message (no reply) to the selected CSM submodule to stop/exit the CSM submodule. This API can be found under LabVIEW Palette -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support.
- Step3: Register and unregister state changes.
  - Step3.1: Get the state change event refnum from the selected submodule and register it. This API can be found under LabVIEW Palette -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support.
  - Step3.2: Unregister User Event. Use the Non-CSM Caller Support API to destroy and release the State Change Event Refnum. This API can be found under LabVIEW Palette -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support.
- Step4: API Calls.
  - Step4.1: Send an asynchronous message (no reply) to the selected submodule: "API:start". This Advanced API can be found under LabVIEW Palette -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support.
  - Step4.2: Send an asynchronous message (no reply) to the selected submodule: "API:stop".
  - Step4.3: Send an asynchronous message (no reply) to the selected submodule: "UI: Front Panel State >> Open". This Advanced API can be found under LabVIEW Palette -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support.
  - Step4.4: Send an asynchronous message (no reply) to the selected submodule: "UI: Front Panel State >> Close".
  - Step4.5: Send a synchronous message and wait for the return message, in this case, the level value: "API: Get Level". This Advanced API can be found under LabVIEW Palette -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support.
  - Step4.6: Send a synchronous message and wait for the return message: "API: Set Level >> value". This Advanced API can be found under LabVIEW Palette -> Communicable State Machine(CSM) -> API -> Non-CSM Caller Support.
- Step5: Handle submodule state change events.
  - Step5.1: After registering the state change event, you can handle this event here. For example, printing the user event data to the state history, which is also displayed directly on the UI.
- Step6: Program Exit. In the "Panel close?" UI event, send a synchronous message "Macro: Exit" to all submodules and wait for all submodules to exit.

# CSM Basic Example Description

## Basic Concepts

### 1. JKISM vs CSM.vi

#### Overview

Demonstrates the framework structures of the JKISM and CSM state machine templates. Both frameworks use string-based message queues to implement the core state machine.

#### Introduction

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


#### Introduction

Demonstrates basic string-naming rules for CSM module names. A valid CSM module name is a string that should NOT contain any of the following special characters: `~!@%^&*()\[\]{}+=|\\/?'"<>,.\t\r\n`. These characters are reserved keywords for other purposes within the CSM framework.

### 3. Message Helper VI and Equivalent String.vi

#### Overview

Demonstrates string syntax format for message communications within the CSM framework.

#### Introduction

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

#### Introduction

Converts complex LabVIEW data types, such as clusters and arrays, into a CSM-compatible HEXSTR (0-9, A-F) format and then converts the strings back to the original data type. This process uses complex data safely as a state parameter without disrupting CSM message string parsing. Furthermore, the CSM-Argument Type.vi gets the argument token, in this case `HEXSTR`.

### 4.2 Arguments - Error As Arguments.vi

#### Overview

Converts a LabVIEW error cluster into a CSM-compatible error string, which allows the CSM core parse engine to process LabVIEW errors from the message queue. The converted error string uses the following format: `[Error: error-code] error-description-As-safe-argument-string`.

#### Introduction

This example converts a LabVIEW error cluster into a CSM-compatible error string, which allows the CSM core parse engine to process LabVIEW errors from the message queue. The converted error string uses the following format: `[Error: error-code] error-description-As-safe-argument-string`. Furthermore, the CSM-Argument Type.vi gets the argument token, in this case `ErrStr`.

### 4.3 Arguments - Safe Arguments if it contains key words of CSM.vi

#### Overview
Demonstrates how to convert reserved CSM keywords in an argument string to a HEXSTR (0-9, A-F) format and how to convert back to original form to prevent affecting parsing of CSM message strings.

#### Introduction
This example demonstrates how to convert reserved CSM keywords in an argument string to a %HEXSTR (0-9, A-F) format and how to convert back to original form to prevent affecting parsing of CSM message strings.

### 5. CSM Data Type.vi

#### Overview

Identifies the data type of LabVIEW input data. You can use this example for further customized data type conversion within the CSM framework.

#### Introduction

This example identifies the data type of LabVIEW input data. You can use this example for further customized data type conversion within the CSM framework.

### 6. Module Attributes.vi

#### Overview

Demonstrates how to dynamically interact with CSM module attributes using VIs from outside the CSM framework.

#### Introduction

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

#### Introduction

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

#### Introduction

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

#### Introduction
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

#### Introduction

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

#### Introduction

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

# Templates

> [!NOTE]
> <b>CSM Naming Rules</b>
>
> - CSM module name must be unique. Otherwise, CSM enters a `Critical Error` state.
> - If the input module name is an empty string (""), the system uses a UUID as the module name. Such a module is marked as standalone mode and does not appear in the module list.
> - Worker Mode Rule: If the input module name ends with `#`, a worker mode node will be instantiated. Multiple worker mode nodes can form a worker mode module.
> - Chain of Responsibility Mode Rule: If the input module name ends with `$` followed by a number, a chain of responsibility mode node will be instantiated. Multiple chain of responsibility mode nodes can form a chain of responsibility mode module.
> - System-Level Module Rule: If the input module name starts with `.`, the module is a system-level module. Under default settings, such modules are not listed by the CSM - List Modules VI and are  suitable for instantiating modules that run in the background.
> - Submodule Rule: `.` is also allowed in a module name to separate the module name into multiple parts. CSM does not have strict rules for submodules. The `.` in the module name only marks the logical relationship between different modules. From an execution perspective, they are considered independent modules. The only difference is that you can obtain a list of logical submodules via the CSM - List Submodules VI.

> [!NOTE]
> <b>CSM Initialize State ("Macro: Initialize")</b>
>
> - The default value is `Macro: Initialize`, which is consistent with the JKISM state machine.
> - This state is used to initialize the state machine of a CSM module. A CSM module will process externally sent messages only after completing this macro state.

> [!NOTE]
> <b>CSM Exit State ("Macro: Exit")</b>
>
> - The default value is "Macro: Exit", which is consistent with the JKISM state machine.
> - This state is used to exit the state machine of a CSM module. After entering this state, a CSM module no longer processes externally sent messages.

## CSM User Interface(UI) Module Template.vi
A template for creating a CSM module with a user interface. This template includes a user Event Structure for responding to user actions.

> - Ref: CSM Naming Rules
> - Ref: CSM Initialize State
> - Ref: CSM Exit State

-- <b>Controls</b> --
- <b>Name ("" to use UUID)</b>: CSM module name. Refer to <b>CSM Naming Rules</b> for module naming rules.

## CSM Module Template.vi
A template for creating a CSM module without a user interface. This is the most commonly used CSM template. The template also includes an event response loop used for exiting the module during debugging. Remove this loop after debugging is complete.

> - Ref: CSM Naming Rules
> - Ref: CSM Initialize State
> - Ref: CSM Exit State

-- <b>Controls</b> --
- <b>Name ("" to use UUID)</b>: CSM module name. Refer to <b>CSM Naming Rules</b> for module naming rules.

## CSM Module Template - Tiny.vi
Compact code template for creating a CSM module without a user interface. The functionality of this template is identical to the CSM Module Template VI.

> - Ref: CSM Naming Rules
> - Ref: CSM Initialize State
> - Ref: CSM Exit State

-- <b>Controls</b> --
- <b>Name ("" to use UUID)</b>: CSM module name. Refer to <b>CSM Naming Rules</b> for module naming rules.

## CSM User Interface(UI) Module Template - Tiny.vi
Compact code template used to create a CSM module with a user interface. This template includes a user Event Structure for responding to user actions. The functionality of this template is identical to the CSM User Interface(UI) Module Template VI.

> - Ref: CSM Naming Rules
> - Ref: CSM Initialize State
> - Ref: CSM Exit State

-- <b>Controls</b> --
- <b>Name ("" to use UUID)</b>: CSM module name. Refer to <b>CSM Naming Rules</b> for module naming rules.

## CSM DQMH-Style Template.vi
Creates a DQMH-style CSM module template. This structure places the user Event Structure responsible for responding to user actions in a separate independent loop. This structure is primarily used to handle complex user operation scenarios. For example:

- The user interface operations are very complex and require combined logic to complete collaborative work, such as a "Mouse Down -> Drag -> Mouse Up" sequence triggering an event.
- The user interface needs to respond to rapidly generated events, such as "Mouse Move" or "Panel Resize". If these events generated messages directly, they would quickly flood the queue with duplicate messages.

The user Event Structure loop for user operations is created via the CSM - Flood of Events Handler Side Loop VI template. Users can also create a complete DQMH-style CSM module template by combining the CSM - Flood of Events Handler Side Loop VI with the CSM Module Template VI.

Refer to the following example `[CSM-Example]\4. Advance Examples\CSMLS - Continuous Loop in CSM Example.vi` for demonstration of using this VI.

> - Ref: CSM Naming Rules
> - Ref: CSM Initialize State
> - Ref: CSM Exit State

-- <b>Controls</b> --
- <b>Name ("" to use UUID)</b>: CSM module name. Refer to <b>CSM Naming Rules</b> for module naming rules.

## Other Code Snippets

### CSM - Start Async Call.vi
Code snippet for starting a CSM module asynchronously. After dragging this VI to the block diagram, change the static VI reference to the target CSM module.

<b>Reference Example</b>: `[CSM-Example]\3. Caller is Other Framework Scenario\CSM Example - Caller is NOT a CSM.vi`.

### CSM - Synchronized Call.vi
Code snippet for calling a CSM module synchronously. This VI calls CSM module directly as a subVI.

<b>Reference Example</b>: `[CSM-Example]\2. Caller is CSM Scenario\CSM Example - Caller is a CSM.vi`.

### CSM - Flood of Events Handler Side Loop.vi
User Event Structure loop template for DQMH-style CSM modules. This VI is primarily used for handling scenarios where user interface operations are very complex and require combined logic to complete collaborative work.

<b>Reference Example</b>: `[CSM-Example]\4. Advance Examples\CSMLS - Continuous Loop in CSM Example.vi`.

### CSM - Global Log Queue Monitoring Loop.vi
Creates a global log queue monitoring loop, which is used for querying and monitoring messages in the global log queue.

<b>Reference Example</b>: `[CSM-Example]\4. Advance Examples\2. Chain of Responsibility Example\Chain of Responsibility Example.vi`.

### CSM - Global Log Event Monitoring Loop.vi
Creates a global log event monitoring loop, which is used for querying and monitoring messages in the global log queue.

<b>Reference Example</b>: Any examples in `[CSM-Example]\4. Advance Examples\4. Global Log Filter Example\`.

## Template Support

### CSM - Get New State Notifier Event.vi
Obtains a user event refnum, which is suitable for CSM modules containing an Event Structure. CSM modules with an Event Structure typically wait at the Event Structure. The user event refnum this VI obtains is used to interrupt the wait in the Event Structure when a new message is received, allowing the module to continue execution.

-- <b>Controls</b> --
- <b>Name ("" to use UUID)</b>: CSM module name. Refer to <b>CSM Naming Rules</b> for module naming rules.

-- <b>Indicators</b> --
- <b>New State Notifier Event</b>: User event refnum, which is used to interrupt the CSM module's wait in the Event Structure when a message is received.

### Timeout Selector.vi
Suitable for templates containing a user Event Structure. If <b>Timeout Expected</b> is -1 but there are still <b>Remaining States</b> in the queue, the timeout value will be modified to 0. This ensures the execution immediately breaks out of the user Event Structure and continues to process the remaining states.

-- <b>Controls</b> --
- <b>Timeout Expected</b>: Expected timeout setting.
- <b>Remaining States</b>: Returns 0 if there are remaining states. Otherwise, returns the expected value.

-- <b>Indicators</b> --
- <b>Timeout</b>: Timeout setting used after arbitration.

### Template Error Handling

#### CSM Critical Error.vi
Generates an error cluster describing a CSM Critical Error. A Critical Error is a severe error occurring within the CSM framework that cannot be handled or replied to by user code. A common cause is a duplicate module name.

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.
- <b>Arguments (As Reason)</b>: Reason for the error.

#### CSM No Target Error.vi
Generates an error cluster describing a CSM "No Target Message" error. A "No Target Message" error occurs when the CSM attempts to send a message, but the target module name is an empty string.

#### CSM Target Error.vi
Generates an error cluster describing a CSM "Target Module Not Found" error. A "Target Module Not Found" error occurs when the CSM attempts to send a message to a non-existent target module.

-- <b>Controls</b> --
- <b>Arguments (As CSM Name)</b>: Wired argument, passing the target module name.

#### CSM Target Timeout Error.vi
Generates an error cluster describing a CSM "Target Module Timeout" error. A "Target Module Timeout" error occurs when the CSM attempts to send a synchronous message to a target module but does not receive a reply within the specified timeout period.

-- <b>Controls</b> --
- <b>Arguments (As CSM Name)</b>: Wired argument, passing the target module name.

#### CSM Unhandled State Error.vi
Generates an error cluster describing a CSM "Unhandled State" error. The following are situations where a CSM "Unhandled State" error occurs:
- When a state is used in the internal message transition but is not defined in this module. This is consistent with JKISM behavior.
- When a message sent externally to this module is not defined.

-- <b>Controls</b> --
- <b>Undefined State</b>: The undefined state.
- <b>CSM Name</b>: CSM module name.

# CSM API

## Templates

> [!NOTE] CSM Name Rules
> - The CSM module name must be unique to avoid entering the "Critical Error" state.
> - If the input is "", a UUID will be used as the module name. This module will operate in independent mode and will not be listed in the module list.
> - If the input ends with '#', the module will run in work mode. Modules with the same name will share the same message queue. External messages will be handled by the idle module.

> [!NOTE] CSM Initialization State
> - The default value is "Macro: Initialize", consistent with the JKISM state machine.
> - This state is typically not modified and is provided to facilitate external programmatic changes to the initialization state.

### CSM Module Template.vi

Creates a template for a CSM module without a user interface.

> Ref: CSM Name Rules
> Ref: CSM Initialization State

-- <b>Controls</b> --
- <b>Name("" to use uuid)</b>: CSM Module Name
- <b>Init State("Macro: Initialize")</b>: Initialization State, default is "Macro: Initialize"

### CSM User Interface(UI) Module Template.vi

Creates a template for a CSM module with a user interface, including a user event structure to respond to user actions.

> Ref: CSM Name Rules
> Ref: CSM Initialization State

-- <b>Controls</b> --
- <b>Name("" to use uuid)</b>: CSM Module Name
- <b>Init State("Macro: Initialize")</b>: Initialization State, default is "Macro: Initialize"

### CSM Module Template - Tiny.vi

Creates a compact template for a CSM module without a user interface.

> Ref: CSM Name Rules
> Ref: CSM Initialization State

-- <b>Controls</b> --
- <b>Name("" to use uuid)</b>: CSM Module Name
- <b>Init State("Macro: Initialize")</b>: Initialization State, default is "Macro: Initialize"

### CSM User Interface(UI) Module Template - Tiny.vi

Creates a compact template for a CSM module with a user interface, including a user event structure to respond to user actions.

> Ref: CSM Name Rules
> Ref: CSM Initialization State

-- <b>Controls</b> --
- <b>Name("" to use uuid)</b>: CSM Module Name
- <b>Init State("Macro: Initialize")</b>: Initialization State, default is "Macro: Initialize"

### Template Support VIs

#### CSM - Get New State Notifier Event.vi

Obtains the user event handle for CSM modules with an event structure. This event interrupts the wait in the event structure when a new message is received, allowing execution to continue.

-- <b>Controls</b> --
- <b>Name("" to use uuid) in</b>: CSM Module Name

-- <b>Indicators</b> --
- <b>New State Notifier Event</b>: User event handle to interrupt the wait in the event structure when a message is received

#### Timeout Selector.vi

Used in templates with a user event structure.

-- <b>Controls</b> --
- <b>Timeout Expected</b>: Expected timeout setting
- <b>Remaining States</b>: Outputs 0 if there are remaining states; otherwise, outputs the expected value

-- <b>Indicators</b> --
- <b>Timeout</b>: Timeout setting after arbitration

#### Error Handler for Templates

##### CSM Critical Error.vi

Generates a critical error message for the CSM module, usually due to a duplicate module name.

-- <b>Controls</b> --
- <b>Arguments(as Reason)</b>: Reason for the error
- <b>CSM Name</b>: CSM Module Name

##### CSM No Target Error.vi

Generates a target module not found error message for the CSM module when a CSM Module Name is required but an empty string is input.

##### CSM Target Error.vi

Generates a target module not found error message for the CSM module.

-- <b>Controls</b> --
- <b>Arguments(as CSM Name)</b>: Connection parameters, passing the target module name

##### CSM Target Timeout Error.vi

Generates a timeout error message for the target module of the CSM.

-- <b>Controls</b> --
- <b>Arguments(as CSM Name)</b>: Connection parameters, passing the target module name

##### CSM Unhandled State Error.vi

Generates an unhandled state error message for the CSM module. Possible scenarios:
- An error occurs when an undefined state is used in the internal message rotation (consistent with JKISM behavior).
- An error occurs when an undefined state is received from an external source.

-- <b>Controls</b> --
- <b>Undefined State</b>: Undefined State
- <b>CSM Name</b>: CSM Module Name

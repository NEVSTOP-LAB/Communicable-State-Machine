# CSM API

## Templates

> [!NOTE] CSM Name Rules
> - The CSM module name should be unique; otherwise, it will cause the CSM to enter the "Critical Error" state.
> - If the input is "", a UUID will be used as the module name. This module will be marked as independent mode and will not be included in the module list.
> - If the input ends with '#', the module will run in work mode. Modules with the same name will share the same message queue. Any external message will be handled by one of the modules, depending on which module is idle.

> [!NOTE] CSM Initialization State
> - The default value is consistent with the JKISM state machine, which is "Macro: Initialize".
> - This state is usually not modified. It is provided as an input to facilitate external programmatic modification of the initialization state.

### CSM Module Template.vi

Used to create a template for a CSM module without a user interface.

> Ref: CSM Name Rules
> Ref: CSM Initialization State

-- <b>Inputs</b> --
- <b>Name("" to use uuid)</b>: CSM Module Name
- <b>Init State("Macro: Initialize")</b>: Initialize State, "Macro: Initialize" as default

### CSM User Interface(UI) Module Template.vi

Used to create a template for a CSM module with a user interface. The template includes a user event structure to respond to user actions.

> Ref: CSM Name Rules
> Ref: CSM Initialization State

-- <b>Inputs</b> --
- <b>Name("" to use uuid)</b>: CSM Module Name
- <b>Init State("Macro: Initialize")</b>: Initialize State, "Macro: Initialize" as default

### CSM Module Template - Tiny.vi

Used to create a template for a CSM module without a user interface. The template code is more compact.

> Ref: CSM Name Rules
> Ref: CSM Initialization State

-- <b>Inputs</b> --
- <b>Name("" to use uuid)</b>: CSM Module Name
- <b>Init State("Macro: Initialize")</b>: Initialize State, "Macro: Initialize" as default

### CSM User Interface(UI) Module Template - Tiny.vi

Used to create a template for a CSM module with a user interface. The template includes a user event structure to respond to user actions. The template code is more compact.

> Ref: CSM Name Rules
> Ref: CSM Initialization State

-- <b>Inputs</b> --
- <b>Name("" to use uuid)</b>: CSM Module Name
- <b>Init State("Macro: Initialize")</b>: Initialize State, "Macro: Initialize" as default

### Template Support VIs

#### CSM - Get New State Notifier Event.vi

Gets the user event handle. Used in CSM modules that contain an event structure. CSM modules with an event structure usually wait at the event structure, and this event is used to interrupt the wait in the event structure when a new message is received, allowing execution to continue.

-- <b>Inputs</b> --
- <b>Name("" to use uuid) in</b>: CSM Module Name

-- <b>Outputs</b> --
- <b>New State Notifier Event</b>: User event handle, used to interrupt the wait in the event structure of the CSM module when a message is received

#### Timeout Selector.vi

Used in templates that contain a user event structure.

-- <b>Inputs</b> --
- <b>Timeout Expected</b>: Expected timeout setting
- <b>Remaining States</b>: If there are remaining states, the output will be 0; otherwise, the output will be the expected value

-- <b>Outputs</b> --
- <b>Timeout</b>: Timeout setting used after arbitration

#### Error Handler for Templates

##### CSM Critical Error.vi

Generates a critical error message for the CSM module, usually due to a duplicate module name.

-- <b>Inputs</b> --
- <b>Arguments(as Reason)</b>: Reason for the error
- <b>CSM Name</b>: CSM Module Name

##### CSM No Target Error.vi

Generates a target module not found error message for the CSM module when a CSM Module Name is required but an empty string is input.

##### CSM Target Error.vi

Generates a target module not found error message for the CSM module.

-- <b>Inputs</b> --
- <b>Arguments(as CSM Name)</b>: Connection parameters, passing the target module name


##### CSM Target Timeout Error.vi

Generates a timeout error message for the target module of the CSM.

-- <b>Inputs</b> --
- <b>Arguments(as CSM Name)</b>: Connection parameters, passing the target module name

##### CSM Unhandled State Error.vi

Generates an unhandled state error message for the CSM module. Possible scenarios:
- An error occurs when an undefined state is used in the internal message rotation (consistent with JKISM behavior).
- An error occurs when an undefined state is received from an external source.

-- <b>Inputs</b> --
- <b>Undefined State</b>: Undefined State
- <b>CSM Name</b>: CSM Module Name


# Module Operation API

## CSM - Wait for Module to Be Alive.vi
Waits for a CSM module to come online within a specified timeout period and returns the wait time. This VI returns an error if the timeout is exceeded. Internally, this VI periodically checks if the CSM module is online using the CSM - Check If Module Exists VI at 1 ms intervals.

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.
- <b>Wait (5000ms)</b>: Timeout duration for waiting. The default is 5000 ms.

-- <b>Indicators</b> --
- <b>CSM Name (Dup)</b>: CSM module name.
- <b>Waited (ms)</b>: Time elapsed while waiting.

## CSM - Wait for All Modules to be Alive.vi
Waits for a group of CSM modules to all come online within a specified timeout period, and returns the wait time. This VI returns an error and the names of modules that did not come online if the timeout is exceeded. Internally, this VI periodically checks if all modules are online using the CSM - List Module VI at 5 ms intervals.

-- <b>Controls</b> --
- <b>CSM Names</b>: CSM module names.
- <b>Timeout (5000ms)</b>: Timeout duration for waiting. The default is 5000 ms.

-- <b>Indicators</b> --
- <b>CSMs Left</b>: CSM modules that have not come online after the timeout.
- <b>Waited (ms)</b>: Time elapsed while waiting.

## CSM - Wait for All Modules to Exit.vi
Waits for a group of CSM modules to all go offline within a specified timeout period, and returns the wait time. This VI returns an error and the names of modules that did not go offline if the timeout is exceeded. This VI is typically used during program exit.

-- <b>Controls</b> --
- <b>CSM Names</b>: CSM module names.
- <b>Timeout (5000ms)</b>: Timeout duration for waiting. The default is 5000 ms.

-- <b>Indicators</b> --
- <b>CSMs Left</b>: CSM modules that have not gone offline after the timeout.
- <b>Waited (ms)</b>: Time elapsed while waiting.

## CSM - Post Message.vi
Sends an asynchronous message to the specified CSM module. Since the transmission is asynchronous, this VI does not wait for a reply, and code execution continues immediately after the message is sent. If the CSM module does not exist, a "Target Error" is returned.

> ![NOTE]
> Asynchronous messages sent using this VI are strictly asynchronous without return. Return arguments from asynchronous messages cannot be retrieved.

> - Ref: Asynchronous Message
> - Ref: CSM Message Target Module Description

-- <b>Controls</b> --
- <b>Current Module ("" to Generate an ID)</b>: Name of the current module. If empty, a temporary ID is generated for debugging purposes to identify the location.
- <b>State</b>: Message string.
- <b>Arguments ("")</b>: Message arguments.
- <b>Target Module</b>: Name of the target module.

## CSM - Wait and Post Message.vi
Sends an asynchronous message to the specified CSM module. Since the transmission is asynchronous, this VI does not wait for a reply, and code execution continues immediately after the message is sent. If the CSM module does not exist, this VI waits for the specified timeout duration. If the timeout is exceeded, a timeout error is returned.

> - Ref: Asynchronous Message
> - Ref: CSM Message Target Module Description

-- <b>Controls</b> --
- <b>Current Module ("" to Generate an ID)</b>: Name of the current module. If empty, a temporary ID is generated for debugging purposes to identify the location.
- <b>State</b>: Message string.
- <b>Arguments ("")</b>: Message arguments.
- <b>Target Module</b>: Name of the target module.
- <b>Wait (5000ms)</b>: Timeout duration for waiting. The default is 5000 ms.

-- <b>Indicators</b> --
- <b>Waited (ms)</b>: Time elapsed while waiting.

## CSM - Send Message and Wait for Reply.vi
Sends a synchronous message to the CSM and waits for a reply before continuing code execution.
- If no reply message is received within the timeout, this VI returns a "CSM Timeout Error".
- If the target module does not exist, this VI returns a "Target Error".

> - Ref: Synchronous Message
> - Ref: Global Timeout Setting
> - Ref: CSM Message Target Module Description

-- <b>Controls</b> --
- <b>Current Module ("" to Generate an ID)</b>: Name of the current module. If empty, a temporary ID is generated for debugging purposes to identify the location.
- <b>State</b>: Message string.
- <b>Arguments ("")</b>: Message arguments.
- <b>Target Module</b>: Target CSM module name.
- <b>Response Timeout (-2 Using Global Settings)</b>: Timeout setting for waiting for a reply. The default is 5000 ms.

-- <b>Indicators</b> --
- <b>Response</b>: Returned response.
- <b>Source CSM</b>: Name of the CSM module that sourced the returned response. In Worker Mode or Chain of Responsibility Mode, this output returns the name of the node.

## CSM - Wait and Send Message for Reply.vi
Sends a synchronous message to the CSM and waits for a reply before continuing code execution. If the CSM module does not exist, this VI waits for the specified timeout duration. The following errors may occur:
- If the module does not exist at the time of sending and the wait times out, this VI returns a timeout error.
- If the message is sent but no reply message is received within the timeout, this VI returns a "CSM Timeout Error".

> - Ref: Synchronous Message
> - Ref: Global Timeout Setting
> - Ref: CSM Message Target Module Description

-- <b>Controls</b> --
- <b>Current Module ("" to Generate an ID)</b>: Name of the current module. If empty, a temporary ID is generated for debugging purposes to identify the location.
- <b>State</b>: Message string.
- <b>Arguments ("")</b>: Message arguments.
- <b>Target Module</b>: CSM module name.
- <b>Wait (5000ms)</b>: Timeout duration for waiting. The default is 5000 ms.
- <b>Response Timeout (-2 Using Global Settings)</b>: Timeout for synchronous calls. The default is -2, which uses the global setting. You can set the global timeout using the CSM - Set TMO of Sync-Reply VI.

-- <b>Indicators</b> --
- <b>Response</b>: Returned response.
- <b>Source CSM</b>: Name of the CSM module that sourced the returned response. In Worker Mode or Chain of Responsibility Mode, this returns the name of the node.

## CSM - Run Script.vi
Executes multiple CSM commands in a single batch, supporting synchronous messages, asynchronous messages, and registrations.

<b>Temporary Variable Support</b>

CSM - Run Script.vi supports an additional supplementary syntax to save return values to specified temporary variables for use in subsequent instructions. Use the `=>` symbol to save the return value to a variable, and variable names are case-insensitive. In subsequent instructions, you can reference the variable using the syntax `${variable name}`.

Example:

```
API: Random -@ csm => var1
API: Random -@ csm => var2
API: echo >> ${var1} -@ csm
API: echo >> ${var2} -@ csm
API: echo >> ${var1},${var2} -@ csm
```

<b>Additional Command</b>

- Wait: Wait for the specified number of milliseconds, for example `Wait: 1000` means wait 1000 milliseconds.

```
API: Do Something -@ csm
Wait: 1000 // Wait 1000 milliseconds, then continue to the next instruction
API: Do Something Else -@ csm
```

> [!WARNING]
> <b>Temporary Variable Support</b> and <b>Additional Command</b> are not natively supported by CSM, but are parsed and processed by CSM - Run Script.vi. Therefore, temporary variables can only be used within the same script execution and cannot be saved or passed across scripts. Wait is also not part of the CSM instructions and cannot use this syntax elsewhere.

> - Ref: CSM Message Target Module Description

-- <b>Controls</b> --
- <b>Current Module ("" to Generate an ID)</b>: Name of the current module. If empty, a temporary ID is generated for debugging purposes to identify the location.
- <b>CSM Scripts</b>: CSM commands to execute.
- <b>Continue If Error? (F)</b>: Whether to continue execution if an error occurs. The default is FALSE, which specifies to not continue.
- <b>Wait (5000 ms)</b>: Timeout duration for waiting module to be alive. The default is 5000 ms.
- <b>Response Timeout (-2 Using Global Settings)</b>: Timeout for synchronous calls. The default is -2, which uses the global setting. You can set the global timeout using the CSM - Set TMO of Sync-Reply VI.

-- <b>Indicators</b> --
- <b>Response</b>: Returned results from executing the script. Only synchronous messages carry returns. The corresponding column for other commands will be an empty string.
- <b>Scripts Left</b>: Remaining unexecuted scripts.

## CSM - Broadcast Event.vi
Obtains the CSM status change event refnum.

-- <b>Controls</b> --
- <b>CSM Module</b>: CSM module name.
- <b>Wait (5000 ms)</b>: Timeout duration for waiting module to be alive. The default is 5000 ms.

-- <b>Indicators</b> --
- <b>Status Change Event</b>: CSM status change event refnum.
- <b>Waited (ms)</b>: Time elapsed while waiting.

## CSM - Destroy Broadcast Event.vi
Releases the CSM status change event refnum.

-- <b>Controls</b> --
- <b>Status Change Event</b>: CSM status change event refnum.

## CSM - Module Exit Event.vi
Obtains the CSM module exit event refnum. If the module does not exist, this VI waits for the specified timeout duration. If the module still does not exist after the timeout, this VI returns a timeout error.

For modules in CSM advanced modes, such as Worker Mode and Chain of Responsibility Mode, the module exit event is triggered only after the last node has exited.

-- <b>Controls</b> --
- <b>Name ("" to Use UUID) In</b>: CSM module name. Refer to <b>CSM Naming Rules</b> for module naming rules.
- <b>Wait (5000 ms)</b>: Timeout duration for waiting module to be alive. The default is 5000 ms.

-- <b>Indicators</b> --
- <b>CSM Exit Event</b>: CSM module exit event refnum.
- <b>Waited (ms)</b>: Time elapsed while waiting.

## Attributes

> [!NOTE]
> <b>CSM Module Attributes</b>
>
> CSM module attributes are a data area that can store module configuration and status, accessed by name. CSM module attributes can be used in the following scenarios:
> - Providing a way to access and modify configuration and status information without messages. For example, a "Connected" attribute in a TCP module indicating whether a connection is established is more convenient to access directly.
> - Nodes running in advanced modes, such as Worker Mode and Chain of Responsibility Mode, share the same data area, which is used for sharing data between modules.

### CSM - Set Module Attribute.vi
Sets the attribute value of the specified module. If the attribute does not exist, a new attribute is created, and <b>Replaced</b> returns FALSE. Otherwise, it returns TRUE. If the CSM module does not exist, this VI waits for the specified timeout duration. If the timeout is exceeded, this VI returns a timeout error.

> - Ref: CSM Module Attributes

<b>Reference Example</b>: `[CSM-Example]\0. Base Concepts\6. Module Attributes.vi`.

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.
- <b>Attribute</b>: Attribute name. Must not be an empty string.
- <b>Value</b>: Attribute data.
- <b>Wait (5000 ms)</b>: Timeout duration for waiting module to be alive. The default is 5000 ms.

-- <b>Indicators</b> --
- <b>CSM Name (Dup)</b>: A copy of the input CSM module name.
- <b>Replaced</b>: Whether the attribute was replaced.
- <b>Waited (ms)</b>: Time elapsed while waiting.

### CSM - Get Module Attribute.vi
Reads the attribute value of the specified module. If the attribute does not exist, the default value is returned, and <b>Found</b> returns FALSE. Otherwise, it returns TRUE. If the CSM module does not exist, this VI waits for the specified timeout duration. If the timeout is exceeded, this VI returns a timeout error.

> - Ref: CSM Module Attributes

<b>Reference Example</b>: `[CSM-Example]\0. Base Concepts\6. Module Attributes.vi`.

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.
- <b>Attribute</b>: Attribute name. Must not be an empty string.
- <b>Default Value (Empty Variant)</b>: Default value returned when the attribute does not exist.
- <b>Wait (5000 ms)</b>: Timeout duration for waiting module to be alive. The default is 5000 ms.

-- <b>Indicators</b> --
- <b>CSM Name (Dup)</b>: A copy of the input CSM module name.
- <b>Found</b>: Whether the attribute exists.
- <b>Value</b>: Attribute value.
- <b>Waited (ms)</b>: Time elapsed while waiting.

### CSM - List Module Attributes.vi
Lists all attribute names of the specified module. If the CSM module does not exist, this VI waits for the specified timeout duration. If the timeout is exceeded, this VI returns a timeout error.

> - Ref: CSM Module Attributes

<b>Reference Example</b>: `[CSM-Example]\0. Base Concepts\6. Module Attributes.vi`.

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.
- <b>Include Value? (F)</b>: Whether to include attribute values. The default is FALSE, which specifies to not include attribute values.
- <b>Wait (5000 ms)</b>: Timeout duration for waiting module to be alive. The default is 5000 ms.

-- <b>Indicators</b> --
- <b>CSM Name (Dup)</b>: A copy of the input CSM module name.
- <b>Attributes</b>: List of attribute names.
- <b>Values</b>: List of attribute values.
- <b>Waited (ms)</b>: Time elapsed while waiting.

### CSM - Delete Module Attribute.vi
Deletes the attribute of the specified module. If the attribute does not exist, the <b>Found</b> output returns FALSE. Otherwise, it returns TRUE. If the CSM module does not exist, this VI waits for the specified timeout duration. If the timeout is exceeded, this VI returns a timeout error.

> - Ref: CSM Module Attributes

<b>Reference Example</b>: `[CSM-Example]\0. Base Concepts\6. Module Attributes.vi`.

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.
- <b>Attribute</b>: Attribute name. Must not be an empty string.
- <b>Wait (5000 ms)</b>: Timeout duration for waiting module to be alive. The default is 5000 ms.

-- <b>Indicators</b> --
- <b>CSM Name (Dup)</b>: A copy of the input CSM module name.
- <b>Found</b>: Whether the attribute exists.
- <b>Waited (ms)</b>: Time elapsed while waiting.

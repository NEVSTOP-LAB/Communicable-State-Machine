# CSM API

## Module Operation API

### CSM - Wait for Module to Be Alive.vi

Wait for the CSM module to come online within the specified timeout period.

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name
- <b>Wait(5000ms)</b>: Wait timeout, default is 5s

-- <b>Indicators</b> --
- <b>CSM Name(dup)</b>: CSM module name
- <b>Waited(ms)</b>: Time waited

### CSM - Wait for All Modules to be Alive.vi

Wait for a group of CSM modules to come online within the specified timeout period.

-- <b>Controls</b> --
- <b>CSM Names</b>: CSM module names
- <b>Timeout(5000ms)</b>: Wait timeout, default is 5s

-- <b>Indicators</b> --
- <b>CSMs Left</b>: CSM modules that did not come online within the timeout period
- <b>Waited(ms)</b>: Time waited

### CSM - Wait for All Modules to Exit.vi

Wait for a group of CSM modules to go offline within the specified timeout period, usually used for program exit.

-- <b>Controls</b> --
- <b>CSM Names</b>: CSM module names
- <b>Timeout(5000ms)</b>: Wait timeout, default is 5s

-- <b>Indicators</b> --
- <b>CSMs Left</b>: CSM modules that did not go offline within the timeout period
- <b>Waited(ms)</b>: Time waited

### CSM - Post Message.vi

Send an asynchronous message to the CSM without waiting for a return, and continue executing the subsequent code.

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name
- <b>State</b>: Message string
- <b>Arguments("")</b>: Message parameters
- <b>Current Module("" to generate an ID)</b>: Current module name. If not provided, a temporary ID is generated for debugging purposes.

### CSM - Wait and Post Message.vi

Send an asynchronous message to the CSM without waiting for a return, and continue executing the subsequent code. If the CSM module is not online, it will wait for the specified time.

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name
- <b>State</b>: Message string
- <b>Arguments("")</b>: Message parameters
- <b>Current Module("" to generate an ID)</b>: Current module name. If not provided, a temporary ID is generated for debugging purposes.
- <b>Wait(5000ms)</b>: Wait timeout, default is 5s

### CSM - Send Message and Wait for Reply.vi

Send a synchronous message to the CSM and wait for a return message. If the return message is not received within the timeout period, a timeout error is returned.

-- <b>Controls</b> --
- <b>Target Module</b>: Target CSM module name
- <b>State</b>: Message string
- <b>Arguments("")</b>: Message parameters
- <b>Response Timeout(5000ms)</b>: Timeout setting for waiting for the return message, default is 5000ms.

-- <b>Indicators</b> --
- <b>Response</b>: Returned response

### CSM - Wait and Send Message for Reply.vi

Send a synchronous message to the CSM and wait for a return message. If the return message is not received within the timeout period, a timeout error is returned. If the CSM module is not online, it will wait for the specified time.

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name
- <b>State</b>: Message string
- <b>Arguments("")</b>: Message parameters
- <b>Response Timeout(5000ms)</b>: Timeout setting for waiting for the return message, default is 5000ms.
- <b>Current Module("" to generate an ID)</b>: Current module name. If not provided, a temporary ID is generated for debugging purposes.
- <b>Wait(5000ms)</b>: Wait timeout, default is 5s

-- <b>Indicators</b> --
- <b>Response</b>: Returned response
- <b>Source CSM</b>: Source CSM module name of the returned response

### CSM - Run Script.vi

Run a CSM script. Multiple message instructions can be executed at once.

-- <b>Controls</b> --
- <b>CSM Scripts</b>: Scripts to be run
- <b>Response Timeout(5000ms)</b>: Timeout setting for waiting for the return message, default is 5000ms.
- <b>Continue If Error?(F)</b>: Whether to continue execution if an error occurs
- <b>Current Module("" to generate an ID)</b>: Current module name. If not provided, a temporary ID is generated for debugging purposes.
- <b>Wait(5000ms)</b>: Wait timeout, default is 5s

-- <b>Indicators</b> --
- <b>Scripts Left</b>: Remaining scripts that were not executed

### CSM - Status Change Event.vi

Get the CSM status change event handle.

-- <b>Controls</b> --
- <b>CSM Module</b>: CSM module name

-- <b>Indicators</b> --
- <b>Status Change Event</b>: CSM status change event handle

### CSM - Destroy Status Change Event.vi

Release the CSM status change event handle.

-- <b>Controls</b> --
- <b>Status Change Event</b>: CSM status change event handle

### CSM - Module Exit Event.vi

Get the CSM module exit event handle.

-- <b>Controls</b> --
- <b>CSM Module</b>: CSM module name

-- <b>Indicators</b> --
- <b>CSM Exit Event</b>: CSM module exit event handle

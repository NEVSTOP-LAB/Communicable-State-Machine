# CSM API

## Status Subscription Management (×´Ì¬¶©ÔÄ¹ÜÀí)

### CSM - Register Status Change.vi

Register to receive notifications of status changes from other CSM modules. If "Response Message" is not connected or the input is empty, the same <b>Status</b> name will be used as the response message.

-- <b>Controls</b> --
- <b>CSM Name</b>: Name of the CSM module.
- <b>Source CSM Name ('*' as Default)</b>: The CSM module generating the status. You can use "*" to denote all modules generating the same status.
- <b>Status</b>: Status string.
- <b>API (if "", same as Status)</b>: After registration, this message will be received if the status changes.
- <b>Priority (T: As Status, F: As Interrupt)</b>: If the response message is False, it will be inserted at the front of the status queue; otherwise, it will be appended to the end of the queue.

-- <b>Indicators</b> --
- <b>CSM Name (dup)</b>: Returns <b>CSM Name</b>.

### CSM - Unregister Status Change.vi

Unregister notifications of status changes from other CSM modules.

-- <b>Controls</b> --
- <b>CSM Name</b>: Name of the CSM module.
- <b>Source CSM Name</b>: The CSM module generating the status. You can use "*" to denote all modules generating the same status.
- <b>Status</b>: Status string.

-- <b>Indicators</b> --
- <b>CSM Name (dup)</b>: Returns <b>CSM Name</b>.

### CSM - List All Status Registration.vi

-- <b>Indicators</b> --
- <b>Status Array</b>:

### CSM - List Mapping Relationships in Broadcast Registry.vi

-- <b>Indicators</b> --
- <b>Mapping Relationships</b>:

### CSM - List Rules in Broadcast Registry.vi

-- <b>Indicators</b> --
- <b>Rules</b>:

### CSM - List Status in Broadcast Registry.vi

-- <b>Indicators</b> --
- <b>Status in Registry</b>:

### CSM - Check Mapping Relationship in Broadcast Registry.vi

-- <b>Controls</b> --
- <b>CSM Name</b>:
- <b>Broadcast state</b>:

-- <b>Indicators</b> --
- <b>Array</b>:

### CSM - Check Status Registration.vi

-- <b>Controls</b> --
- <b>CSM Name</b>:
- <b>Broadcast state</b>:

-- <b>Indicators</b> --
- <b>Array</b>:

### CSM - Remove Module in Broadcast Registry.vi

-- <b>Controls</b> --
- <b>CSM Name</b>:

-- <b>Indicators</b> --
- <b>CSM Name(dup)</b>:
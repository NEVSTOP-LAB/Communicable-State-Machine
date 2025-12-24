# Broadcast Registration

## CSM - Register Broadcast.vi
Registers to receive notifications of changes triggered by other CSM modules. If <b>API</b> is not wired or the input is empty, the trigger name will be used as the response message. The trigger name can be the broadcast name of the source module or the state name of the source module.

In Worker Mode and Chain of Responsibility Mode, the input node name is automatically parsed as the module name because CSM implements registrations on a per-module basis.

<b>Reference Example</b>: `2. Caller is CSM Scenario\CSM Example - Caller is a CSM.vi`.

> - Ref: CSM Registration
> - Ref: CSM Registration Location
> - Ref: CSM Broadcast Priority

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.
- <b>Source CSM Name (* as Default)</b>: The CSM module generating the status. You can use `*` to represent all modules generating the same status.
- <b>Trigger</b>: Trigger string.
- <b>API (if "", same as Trigger)</b>: Upon registration, this message will be received if the trigger changes.
- <b>Priority (No Change)</b>: Broadcast priority after registration.

-- <b>Indicators</b> --
- <b>CSM Name (Dup)</b>: A copy of the input CSM module name.

## CSM - Unregister Broadcast.vi
Unregister notifications of state changes from other CSM modules.

In Worker Mode and Chain of Responsibility Mode, the input node name is automatically parsed as the module name because CSM implements registrations on a per-module basis.

<b>Reference Example</b>: `2. Caller is CSM Scenario\CSM Example - Caller is a CSM.vi`.

> - Ref: CSM Registration

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.
- <b>Source CSM Name (* as Default)</b>: The CSM module generating the status. You can use `*` to represent all modules generating the same status.
- <b>Trigger</b>: Trigger string.
- <b>API ("*" as Default)</b>: The API name to unregister. If empty, it applies to all APIs.

-- <b>Indicators</b> --
- <b>CSM Name (Dup)</b>: A copy of the input CSM module name.

## CSM - List Rules in Broadcast Registry.vi
Lists all rules in the CSM registry.

> - Ref: CSM Broadcast
> - Ref: CSM Registration

-- <b>Indicators</b> --
- <b>Rule Entries</b>: All rule entries.

## CSM - List Mapping Relationships in Broadcast Registry.vi
Lists all broadcast registration relationships for the current CSM module. Unlike rules, broadcast registration relationships represent all specific registrations of the current CSM module under the current rules.

> [!NOTE]
> CSM uses Register/Unregister operations to add CSM module broadcast registration rules. Based on the current rules and actually existing modules, all broadcast registration relationships for the current CSM module can be deduced. CSM internally caches the current registration relationships. The registration relationship cache is automatically updated when the registration rules or the number of CSM modules changes.

> - Ref: CSM Broadcast
> - Ref: CSM Registration

-- <b>Indicators</b> --
- <b>Mapping Relationships</b>: All broadcast registration relationships for the current CSM module.

## CSM - List Sources in Broadcast Registry.vi
Lists the broadcast names of all current broadcast registration relationships.

> - Ref: CSM Broadcast
> - Ref: CSM Registration

-- <b>Indicators</b> --
- <b>Broadcast Names</b>: Broadcast names of all current broadcast registration relationships.

## CSM - Check Mapping Relationship in Broadcast Registry.vi
Checks all registration relationships corresponding to a specific broadcast name of a CSM module.

> - Ref: CSM Broadcast
> - Ref: CSM Registration

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.
- <b>Broadcast Name</b>: Name of the broadcast.

-- <b>Indicators</b> --
- <b>Mapping Relationships</b>: All registration relationships corresponding to the specific broadcast name of the current CSM module.

## CSM - Remove Module in Broadcast Registry.vi
Removes all registration relationships associated with the specified CSM module from the broadcast registry.

> - Ref: CSM Broadcast
> - Ref: CSM Registration

-- <b>Controls</b> --
- <b>CSM Name</b>: CSM module name.

-- <b>Indicators</b> --
- <b>CSM Name (Dup)</b>: A copy of the input CSM module name.

## CSM - Drop Broadcast Registry.vi
Resets all information in the background broadcast registry, used in scenarios requiring a complete reset of registration relationships.

> - Ref: CSM Broadcast
> - Ref: CSM Registration

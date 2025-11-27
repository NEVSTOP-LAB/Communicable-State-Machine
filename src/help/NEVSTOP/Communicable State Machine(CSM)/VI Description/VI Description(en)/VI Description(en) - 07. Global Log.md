# CSM API

## Global Log

> [!NOTE] CSM Global Log Function
> The CSM Global Log function is used to record global state change events for debugging, monitoring, and other scenarios.
>
> The information that can be recorded includes:
> 1. State changes of the CSM state machine
> 2. Message communication between CSM modules, including data returns
> 3. State publishing of CSM modules
> 4. Creation and destruction of CSM modules
> 5. Subscription and unsubscription of CSM module states
> 6. Error information handled by CSM modules
> 7. User-defined events
>
> The debugging tools are mainly developed based on the Global Log function API. Users can develop debugging tools according to their needs.

### CSM - Global Log Event.vi

Get the CSM global state user event handle

> Ref: CSM Global Log Function

-- <b>Output Control</b> --
- <b>CSM Global Log Event</b>: CSM global state user event handle

### CSM - Destroy Global Log Event.vi

Release the CSM global state user event handle

> Ref: CSM Global Log Function

-- <b>Input Control</b> --
- <b>CSM Global Log Event</b>: CSM global state user event handle

### CSM - Generate User Global Log.vi

Generate user global events for debugging and other scenarios.

-- <b>Input Control</b> --
- <b>Log</b>: Event name
- <b>Arguments</b>: Event parameters
- <b>From Who</b>: Source
- <b>ModuleName</b>: Module name

### CSM - Global Log Error Handler.vi

CSM error handling function. If an error occurs, the error information will be published through the CSM Global Log and can be recorded in debugging tools and background logs.

-- <b>Input Control</b> --
- <b>Place("" to use VI's Name)</b>: Mark the location where the error occurred
- <b>Clear Error(T)</b>: Whether to clear the error, default is to clear

### CSM - Set Log Filter Rules.vi

Set global filter rules. This rule is applied at the sending source. When the log meets the filter rules, it will not be sent from the source, so no tool will be able to detect this log record.

### CSM - List Log Filter Rules As Strings.vi

List global filter rules.

-- <b>Output Control</b> --
- <b>Rule Strings</b>: Filter rule strings

### CSM - Convert Filter Rules.vi

Convert the filter rule cluster list to filter rule class instances.

### CSM - Filter Global Log.vi

Determine whether the log is filtered according to the rules. The filtering judgment of this VI occurs at the subscription end, so it does not affect the subscription of other tools.

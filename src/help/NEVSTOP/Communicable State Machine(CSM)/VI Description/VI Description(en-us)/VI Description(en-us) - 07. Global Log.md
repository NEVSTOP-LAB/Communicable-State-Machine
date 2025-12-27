# Global Log

> [!NOTE]
> <b>CSM Global Log Functionality</b>
>
> The CSM Global Log functionality is used to view global log change events, serving scenarios such as debugging and monitoring.
> The following is the information that can be logged:
> - Module state modifications
> - Inter-module message communication, including data returns
> - Module status publishing
> - Module creation and destruction
> - Module state registration and unregistration
> - Error information handled by modules
> - User-defined events
>
> Debugging tools are primarily developed based on the Global Log API. You can develop debugging tools according to your own needs.

> [!NOTE]
> <b>CSM Global Log Acquisition Methods</b>
>
> CSM provides two methods for acquiring global logs: Queue and Event. The Queue processing method is recommended because the queue interface is more efficient and offers greater flexibility in selecting log processing schemes based on the number of accumulated logs in the queue.

## CSM - Global Log Queue.vi
Obtains the global log queue refnum. Global log events can be retrieved from this queue.

> - Ref: CSM Global Log Functionality Ref: CSM Global Log Acquisition Methods

<b>Reference Examples</b>:
- `4. Advance Examples\Filter From Source(Queue).vi`
- `4. Advance Examples\Filter From Subscriber(Queue).vi`

-- <b>Indicators</b> --
- <b>Global Log Queue</b>: Global log queue refnum.

## CSM - Global Log Event.vi
Obtains the CSM global log user event refnum, used to retrieve global log user events from the global log queue.

> - Ref: CSM Global Log Functionality
> - Ref: CSM Global Log Acquisition Methods

<b>Reference Examples</b>:
- `4. Advance Examples\Filter From Source(Event).vi`
- `4. Advance Examples\Filter From Subscriber(Event).vi`

-- <b>Indicators</b> --
- <b>CSM Global Log Event</b>: CSM global log user event refnum.
- <b>Timeout In ms (5000ms)</b>: Timeout duration. The default is 5000 ms.

## CSM - Destroy Global Log Queue.vi
Releases the global log queue refnum.

> - Ref: CSM Global Log Functionality
> - Ref: CSM Global Log Acquisition Methods

<b>Reference Examples</b>:
- `4. Advance Examples\Filter From Source(Queue).vi`
- `4. Advance Examples\Filter From Subscriber(Queue).vi`

-- <b>Controls</b> --
- <b>Global Log Queue</b>: Global log queue refnum.

## CSM - Destroy Global Log Event.vi
Releases the CSM global log user event refnum.

> - Ref: CSM Global Log Functionality
> - Ref: CSM Global Log Acquisition Methods

<b>Reference Examples</b>:
- `4. Advance Examples\Filter From Source(Event).vi`
- `4. Advance Examples\Filter From Subscriber(Event).vi`

-- <b>Controls</b> --
- <b>CSM Global Log Event</b>: CSM global log user event refnum.
- <b>Force Destroy? (F)</b>: Whether to force destruction. The default is FALSE, which specifies not to force.
- <b>Timeout In ms (5000ms)</b>: Timeout duration. The default is 5000 ms.

## CSM - Global Log Error Handler.vi
CSM error handling function. If an error occurs, the error information is published via the CSM Global Log. This allows error information occurring outside the CSM framework to be recorded in the global log.

-- <b>Controls</b> --
- <b>Place ("" to Use VI's Name)</b>: Marks the location where the error occurred, which by default uses the name of the calling VI.
- <b>Clear Error? (T)</b>: Whether to clear the error. The default is TRUE, which specifies to clear the error. The error is cleared after passing through this VI.

## CSM - Generate User Global Log.vi
Generates a custom user log for scenarios such as debugging. When the input parameters of this VI contain error information, CSM - Global Log Error Handler VI is called to record the error information.

-- <b>Controls</b> --
- <b>Log</b>: Event name.
- <b>Arguments</b>: Event arguments.
- <b>From Who</b>: Source.
- <b>ModuleName</b>: Module name.
- <b>Place ("" to Use VI's Name)</b>: Location where the error occurred. The default is the name of the VI.

## Filter Rules

> [!NOTE]
> <b>Global Log Filter Location</b>
>
> There are two types of global log filtering: source-side filtering and registerer-side filtering.
>
> - <b>Source-side filtering</b>: The CSM framework has built-in filtering rules. Based on user settings, logs can be prevented from being sent at the source.
> - <b>Subscriber-side filtering</b>: Using the same rules, CSM provides helper VIs that can determine whether a log matches the filtering rules after it is received, allowing for different logic processing.
>
> Source-side processing completely prevents logs from being sent, reducing system load. Registerer-side filtering only affects the logic of that specific registerer and does not affect background log saving, offering higher flexibility.

> [!NOTE]
> <b>Global Log Filter Rules</b>
>
> Global log filter rules allow a category of logs to be filtered out so they do not appear in the global log.
>
> The following are the three types of log filter rules:
> - <b>Global Rules</b>: Apply to all modules meeting the conditions. You can configure the following settings:
>   - <b>Module Name</b>: All names of the module will be filtered.
>   - <b>Log Type</b>: Such as state, message, broadcast, module Initialization, and so on.
>   - <b>State Name</b>: Any module with the state name will be filtered.
>   - <b>State Type</b>: Type of state, such as internal state, external message, and so on.
> - <b>Module Rules</b>: Apply to specific modules. You can configure the following settings:
>   - <b>Module Log Type</b>: Modules with the specified log types of the module are filtered.
>   - <b>State Name</b>: Modules with the specified state name are filtered.
>   - <b>State Type</b>: Modules with the specified state type are filtered.
> - <b>Periodic Filter Rules</b>: This rule is currently only effective at the registration point because it is difficult to count numbers at the publication location.
>   - Whether to enable periodic filtering.
>   - <b>Threshold (#/s)</b>: Periodic filtering threshold.
>   - <b>CheckPeriod (s)</b>: Check window time.

### CSM - Set Log Filter Rules.vi
Sets global source-side filtering rules. When a log satisfies the filtering rules, the log will not be sent from the source, so no tools will be able to detect this log record.

> [!NOTE]
> This VI is a polymorphic VI. To ensure forward compatibility of the interface after modifications, it is recommended to select the instance with the newer version for this VI.

> - Ref: Global Log Filter Location
> - Ref: Global Log Filter Rules

<b>Reference Examples</b>:
- `4. Advance Examples\Filter From Source(Queue).vi`
- `4. Advance Examples\Filter From Source(Event).vi`

### CSM - List Log Filter Rules As Strings.vi
Lists global filter rules in string format, with each rule occupying one line for user viewing. This VI is primarily used for background log file saving, debugging interface viewing, and so on.

> - Ref: Global Log Filter Rules

-- <b>Indicators</b> --
- <b>Rule Strings</b>: Filter rule strings.

### CSM - Convert Filter Rules.vi
Converts a list of filter rule clusters into filter rule class instances. Providing the interface in the form of a class ensures forward compatibility. When functions are modified, the old interface remains unchanged. Currently, this VI is mainly used for the CSM File Logger Addon.

> [!NOTE]
> This VI is designed as a polymorphic VI in order to ensure forward compatibility of the interface after modifications. It is recommended to select the instance with the newer version.

> - Ref: Global Log Filter Rules

### CSM - Filter Global Log.vi
This is a registerer-side filtering VI used to determine if a log satisfies the filtering rules. The filtering judgment occurs at the registerer end, so it will not affect registrations of other tools.

> [!NOTE]
> This VI is a Polymorphic VI to ensure forward compatibility of the interface after modifications. It is recommended to select the instance with the newer version.

> - Ref: Global Log Filter Rules

### Utility VIs

#### Global Log To String.vi
Converts global log data clusters to strings.

-- <b>Controls</b> --
- <b>Log</b>: Global log data cluster.

-- <b>Indicators</b> --
- <b>Log String</b>: Global log string.

#### Global Log To String(Source Time).vi
Converts global log data clusters to strings, using the send time as the timestamp.

-- <b>Controls</b> --
- <b>Log</b>: Global log data cluster.
- <b>Format String</b>: Timestamp format.

-- <b>Indicators</b> --
- <b>Log String</b>: Global log string.

#### Global Log History Cacher.vi
Saves the current input string to the cache. When the cached history strings exceed the maximum length limit, the oldest cached string will be overwritten. Use this VI for debugging CSM history states.

-- <b>Controls</b> --
- <b>Global Log Data</b>: Received global log information packet.
- <b>Length (10000)</b>: Maximum string length for cached history strings.
- <b>Level (Normal)</b>: Processing level. The default is <b>Normal</b>, which indicates standard processing. Higher levels omit different information to increase processing speed.
- <b>Time Format String</b>: Timestamp format.
- <b>With Periodic Info? (T)</b>: Whether to fold periodic logs.
- <b>Remove Immediately? (F)</b>: Whether to immediately remove periodic folded information.
- <b>Reset?</b>: Reset flag.
- <b>Settings</b>: Periodic log configuration information. You can set detection period and periodic threshold to determine whether to fold.

-- <b>Indicators</b> --
- <b>String Cache</b>: Cached history strings.

#### Auto Processing Level.vi
Dynamically calculates the recommended log processing level based on the current number of logs in the global log queue.

-- <b>Controls</b> --
- <b>#Left In Q</b>: Number of remaining logs in the global log queue.
- <b>Debounce Period (5s)</b>: Log processing upgrade time. If logs in the global log queue consistently increase within the specified time, the processing level will be upgraded.
- <b>Period (0.1s)</b>: Detection period. The default is 100 ms.
- <b>Reset? (F)</b>: Reset flag.

-- <b>Indicators</b> --
- <b>Level</b>: Processing level. "Normal" indicates standard processing. Higher levels omit different information to increase processing speed.
- <b>LogInQ Changing Speed (#/s)</b>: Current rate of log change in the global log queue.
- <b>Since Upgraded (S)</b>: Time since the last processing level upgrade.

### Exit With Empty Queue Check.vi
This VI is used for global log monitoring loops utilizing the global log queue, such as `template/CSM - Global Log Queue Monitoring Loop.vi` or the background thread of the CSM File Logger.

Typically, the exit condition for these global log monitoring loops is met when the program exits. At this time, logs in the queue may not have been fully processed. Use this VI to allow a period of <b>Timeout (5s)</b> to process logs in the queue after the <b>Stop</b> signal arrives. The <b>Exit</b> signal is set to TRUE to exit the loop, only when the number of logs in the queue is empty or the timeout occurs.

-- <b>Controls</b> --
- <b>Queue</b>: Queue resource, such as the global log queue.
- <b>Stop</b>: Input stop signal. When this signal is TRUE, it starts checking if the queue is empty.

-- <b>Controls</b> --
- <b>Timeout (5s)</b>: Timeout duration. Default is 5 s.
- <b>Exit</b>: Real exit signal. <b>Exit</b> returns TRUE when the queue is empty or timeout occurs.
- <b>Since Exiting (s)</b>: Time elapsed since exiting started, in seconds.

# CSM API

## Built-in Addons

### CSM WatchDog

> [!NOTE] Principle of CSM WatchDog
> When a LabVIEW VI exits, it automatically releases all queue, event, and other handle resources. Therefore, we can create a WatchDog thread to monitor a queue resource created by the main program VI. When this queue resource is released after the main VI exits, the WatchDog thread triggers and sends "Macro: Exit" to the still-running CSM modules, ensuring they exit properly.

#### CSM - Start Watchdog to Ensure All Modules Exit.vi

Starts the CSM Watchdog thread to ensure that all asynchronously started CSM modules exit properly after the main program exits.

> Ref: Principle of CSM WatchDog

#### CSM Watchdog Thread.vi

The CSM Watchdog thread ensures that all asynchronously started CSM modules exit properly after the main program exits.

> Ref: Principle of CSM WatchDog

-- <b>Controls</b> --
- <b>WatchdogQ</b>: Watchdog queue resource

### CSM File Logger

> [!NOTE] Principle of CSM File Logger
> By subscribing to the CSM's Global Log Event, all CSM activity information in the application can be recorded for later analysis and error localization.
> The file is a text file with the extension .csmlog, which can be opened with Notepad or other text editing tools.

#### CSM - Start File Logger.vi

Starts the CSM event file logging function.

> Ref: Principle of CSM File Logger

-- <b>Controls</b> --
- <b>Log File Path</b>: Path to the log file
- <b>Enable? (T)</b>: Enable or not
- <b>log limit</b>: Log file limit
- <b>Timestamp format</b>: Timestamp format
- <b>WatchDog? (T)</b>: Enable WatchDog or not
- <b>Filter Rules</b>: Time filter rules
- <b>Exit When All Module Exist?(F)</b>: Exit after all CSM modules exit or not

-- <b>Indicators</b> --
- <b>LogFile</b>: CSM log file path
- <b>WatchDogQueue</b>: WatchDog resource handle

#### CSM-Logger-Thread.vi

Starts the CSM Global Log file logging thread VI.

> Ref: Principle of CSM File Logger

-- <b>Controls</b> --
- <b>Log File Path</b>: Path to the log file
- <b>log limit</b>: Log file limit
- <b>Timestamp format</b>: Timestamp format
- <b>WatchDogQ</b>: WatchDog resource for detecting if the main program has exited
- <b>GlobalLogFilter.lvclass</b>: Event filter object
- <b>Exit When All Module Exist?(F)</b>: Exit after all CSM modules exit or not

### CSM Loop Support

> [!NOTE] Reason for CSM LOOP Design
> JKISM/CSM is a state machine framework, and completing loop work is a common scenario. There is no good solution for implementing loops.
> - Using a loop in a Case branch can cause the state machine to get stuck in that state, unable to switch normally, and unable to respond to external messages.
> - Inserting the next loop state at the end of the state loop also makes it difficult to respond to external messages and is not intuitive.
> Therefore, this addon provides a standard way to implement loops, solving the above problems.

#### CSMLS - Add Exit State(s) with Loop Check.vi

Checks the loop when exiting.

-- <b>Controls</b> --
- <b>States Queue</b>: The entire state queue is connected to this input
- <b>Exiting States</b>: States required for exit

-- <b>Indicators</b> --
- <b>Remaining States</b>: Remaining message queue

#### CSMLS - Append Continuous State.vi

Adds a loop state.

-- <b>Controls</b> --
- <b>States Queue</b>: The entire state queue is connected to this input
- <b>Loop State(s) and Arguments</b>: Loop states
- <b>Continuous State</b>: Loop state name
- <b>Continuous Arguments ("")</b>: Loop state arguments
- <b>Append(T)</b>: Append or not

-- <b>Indicators</b> --
- <b>Remaining States</b>: Remaining message queue

#### CSMLS - Define Loop State(s).vi

Defines loop operations.

-- <b>Controls</b> --
- <b>States Queue</b>: The entire state queue is connected to this input
- <b>Loop State(s) and Arguments</b>: Loop states

-- <b>Indicators</b> --
- <b>Remaining States</b>: Remaining message queue

#### CSMLS - Remove Loop Tag and previous State(s) to Break.vi

Stops the loop by removing the <loop> tag and all states before the <loop> tag.

Example:

If the CSM message queue contains the following messages, executing this API will remove the messages where the comments are located:

    DAQ: Acquire                    //<b>Will be removed</b>
    DAQ: Continuous Check -><loop>  //<b>Will be removed</b>
    DAQ: Stop
    DAQ: Release

This means no DAQ operations will be performed, and it will immediately proceed to stop and release.

-- <b>Controls</b> --
- <b>States Queue</b>: The entire state queue is connected to this input

-- <b>Indicators</b> --
- <b>Remaining States</b>: Remaining message queue

#### CSMLS - Remove Loop Tag to Break.vi

Stops the loop by removing the <loop> tag.

Example:

If the CSM message queue contains the following messages, executing this API will remove the messages where the comments are located:

    DAQ: Acquire
    DAQ: Continuous Check -><loop>  //<b>Will be removed</b>
    DAQ: Stop
    DAQ: Release

This means the current DAQ operation will still be performed, then it will proceed to stop and release.

-- <b>Controls</b> --
- <b>States Queue</b>: The entire state queue is connected to this input

-- <b>Indicators</b> --
- <b>Remaining States</b>: Remaining message queue

# Build-in Addons

## CSM WatchDog Addon

> [!NOTE]
> <b>CSM WatchDog Implementation Principle</b>
>
> When a LabVIEW VI exits, it automatically releases all handle resources such as queues and events. Therefore, you can create a WatchDog thread that monitors a queue resource created by the main program VI. When this queue resource is released after the main VI exits, the WatchDog thread is triggered to send `Macro: Exit` to any CSM modules that have not yet exited, ensuring they exit normally.

### CSM - Start Watchdog to Ensure All Modules Exit.vi
Starts the CSM Watchdog thread to monitor whether the main program has exited. It is typically executed immediately after the main program starts.

<b>Application Scenario</b>: Used to ensure that all asynchronously started CSM modules can exit normally after the main program exits.

> - Ref: CSM WatchDog Implementation Principle

### CSM Watchdog Thread.vi
The CSM Watchdog thread is used to ensure that all asynchronously started CSM modules can exit normally after the main program exits.

> - Ref: CSM WatchDog Implementation Principle

-- <b>Controls</b> --
- <b>Watchdog Queue</b>: Watchdog queue resource.

## CSM File Logger Addon

### CSM - Start File Logger.vi
Starts the CSM Global Log file recording background thread, which is used to save all execution records in the application to a specified text file.

> [!NOTE]
> <b>CSM File Logger Implementation Principle</b>
>
> The CSM File Logger retrieves all execution records in the application via the CSM Global Log API and saves them to a specified text file for later analysis and error localization. The file format is a text file with the suffix `.csmlog`, which can be opened using text editing query tools such as Notepad.

> [!NOTE]
> <b>Log File Limits</b>
>
> To prevent log files from becoming too large due to long-running software, limits are set on log file size and the number of files:
> - <b>File Size</b>: The maximum size of a single file in bytes. The default is 10 MB.
> - <b>File Num</b>: The maximum number of LOG files. The default is 2.
>
> When the log file size exceeds the <b>File Size</b> limit, a new file record is created. When the number of log files exceeds the <b>File Num</b> limit, the oldest file record is deleted.

> - Ref: Global Log Filter Rules

<b>Reference Example</b>: `Addons - Logger\CSM Application Running Log Example.vi`.

-- <b>Controls</b> --
- <b>Log File Path</b>: Log file path.
- <b>Timestamp format</b>: Time format. The default is `%<%Y/%m/%d %H:%M:%S%3u>T`.
- <b>Log Limit</b>: Log file size limit. <b>File Size</b> is the maximum size of a single file in bytes. The default is 10 MB. <b>File Num</b> is the maximum number of LOG files. The default is 2.
- <b>Filter Rules</b>: Filter rules, configured via the CSM - Convert Filter Rules VI.
- <b>Enable? (T)</b>: Whether to enable the file recording function. The default is TRUE, which specifies to enable the file recording function. When <b>Enable?</b> is FALSE, the file recording function is disabled.
- <b>WatchDog? (T)</b>: Whether to enable the WatchDog function. The default is TRUE. When the calling VI exits, the allocated WatchDog resource is automatically released, triggering the recording thread to exit automatically; manually releasing the WatchDog resource will also trigger the recording thread to exit.
- <b>Exit When All Module Exist? (F)</b>: Automatically exit recording after all CSM modules have exited. The default is FALSE. If TRUE, and the main program is not a CSM, the recording thread will also automatically exit when all running CSM modules exit.

-- <b>Indicators</b> --
- <b>Log File</b>: CSM LOG file path.
- <b>Watchdog Queue</b>: WatchDog resource handle.

### CSM-Logger-Thread.vi
The thread VI used in the CSM - Start File Logger VI.

> - Ref: CSM File Logger Implementation Principle

### CSM-Logger-Thread(Event).vi
The thread VI originally used in the CSM - Start File Logger VI. This VI is now deprecated. Use the CSM-Logger-Thread VI.

> - Ref: CSM File Logger Implementation Principle

## CSM Loop Support Addon

> [!NOTE]
> <b>Reason for CSM LOOP Support Design</b>
>
> A loop is the basic unit of operation for a state machine, executing continuously while the state machine is running. Users can define loop conditions via logic or use the CSM-recommended Loop Support Addon to define loops.
>
> Typically loop schemes may have the following issues:
> - Implementing a loop within a Case branch can cause the state machine to get stuck in that state, unable to switch normally or respond to external messages.
> - Inserting the next loop state in the last state of a state loop can also result in poor response to external messages and is unintuitive.
>
> The advantage of the way Loop Support defines loops is that it can still respond to other events while the loop is running, without blocking the operation of the state machine. CSM Loop-Support VIs are used to define, append, and terminate loops, using special tags to identify the corresponding loop states and the end state. Therefore, this addon is primarily intended to provide a standard loop implementation method to solve the above problems.

### CSMLS - Define Loop State(s).vi
Defines a loop operation, identifying the repeating loop state via the tag `-><loop>`. This loop also appends the `-><end>` tag at the end to mark the loop's conclusion.

For example, the following loop can be defined:

      DAQ: Initialize
      DAQ: Start
      DAQ: Continue Check -><loop> // Call the CSMLS - Append Continuous State VI in this loop to repeat acquisition and wait for a period as the loop interval.
      DAQ: Stop
      DAQ: Close -><end> // -><end> is automatically added.

During the loop process, synchronous messages will interrupt the loop and execute immediately due to their high priority. Asynchronous messages have lower priority; after being dequeued, they are added after the `-><end>` tag. At this point, the CSMLS - Append Continuous State VI within `DAQ: Continue Check` will move the states after the `-><end>` tag to the front of the queue, thus allowing asynchronous messages to be responded to during the loop.

The loop can be ended by removing `-><loop>`. You can use the following VIs to remove the loop tag:
- CSMLS - Remove Loop Tag and previous State(s) to Break VI: Removes the line containing the `-><loop>` tag and all preceding states, used to break out of the loop.
- CSMLS - Remove Loop Tag to Break VI: Removes the line containing the `-><loop>` tag, used to break out of the loop.

<b>Reference Example</b>: `Addons - Loop Support\CSMLS - Continuous Loop in CSM Example.vi`.

> - Ref: Reason for CSM LOOP Support Design

> [!WARNING]
> <b>Add to Front? (F)</b> is usually FALSE because once a loop state starts, it does not end immediately. Before insertion into the state queue, it is considered a sub-state of the current state. If the current state was called via a synchronous message, it would not return immediately. For example, if a set of continuous acquisition states is defined in `API: Start DAQ` and this message is sent synchronously from outside, the logic should be to start the loop and then return immediately. Only set <b>Add to Front? (F)</b> to TRUE if the logic is to wait for the loop to end before returning.

-- <b>Controls</b> --
- <b>States Queue</b>: Connect the entire state queue to this input.
- <b>Loop States</b>: Loop states.
- <b>Add to Front? (F)</b>: Whether to add to the front of all states. The default is FALSE.

-- <b>Indicators</b> --
- <b>Remaining States</b>: The processed message queue.

### CSMLS - Append Continuous State.vi
Appends loop states to maintain the loop running.

<b>Reference Example</b>: `Addons - Loop Support\CSMLS - Continuous Loop in CSM Example.vi`.

-- <b>Controls</b> --
- <b>States Queue</b>: Connect the entire state queue to this input.
- <b>Loop State(s) and Arguments</b>: Loop states.
- <b>Continuous State</b>: Loop state name.
- <b>Continuous Arguments ("")</b>: Loop state arguments.
- <b>Append(T)</b>: Whether to append. The default is TRUE.

-- <b>Indicators</b> --
- <b>Remaining States</b>: The remaining message queue.

### CSMLS - Remove Loop Tag and previous State(s) to Break.vi
Stops the loop by removing the `<loop>` tag and all states before the `<loop>` tag.

<b>Example</b>: If the following messages exist in the CSM message queue, executing the current API operation will remove the messages where the comments are located.

      DAQ: Acquire                    // Will be removed
      DAQ: Continuous Check -><loop>  // Will be removed
      DAQ: Stop
      DAQ: Close

This is equivalent to not executing any DAQ operations and immediately entering stop and release.

-- <b>Controls</b> --
- <b>States Queue</b>: Connect the entire state queue to this input.

-- <b>Indicators</b> --
- <b>Remaining States</b>: The remaining message queue.

### CSMLS - Remove Loop Tag to Break.vi
Stops the loop by removing the `<loop>` tag.
<b>Example</b>: If the following messages exist in the CSM message queue, executing the current API operation will remove the messages where the comments are located.

      DAQ: Acquire
      DAQ: Continuous Check -><loop>  // Will be removed
      DAQ: Stop
      DAQ: Close

This is equivalent to still executing the current DAQ operation, and then entering stop and release.

-- <b>Controls</b> --
- <b>States Queue</b>: Connect the entire state queue to this input.

-- <b>Indicators</b> --
- <b>Remaining States</b>: The remaining message queue.

### CSMLS - Add Exit State(s) with Loop Check.vi
Checks for loop tags upon exit. Since this VI is easily forgotten to be called, a call has been added for the `Macro: Exit` state in the Parse State Queue++ VI. Therefore, this VI has been removed from the Functions palette.

-- <b>Controls</b> --
- <b>States Queue</b>: Connect the entire state queue to this input.
- <b>Exiting States</b>: States required for exiting.

-- <b>Indicators</b> --
- <b>Remaining States</b>: Processed message queue.
- <b><loop> Found</b>: `<loop>` tag found.

## CSM Attributes Supplementary Functions

### CSM Set Module Attribute.vim
Provides a version of the CSM - Set Module Attribute VI that automatically adapts to the input data type.

> - Ref: CSM - Set Module Attribute.vi

### CSM Get Module Attribute.vim
Provides a version of the CSM - Get Module Attribute VI that automatically adapts to the input data type.

> - Ref: CSM - Get Module Attribute.vi

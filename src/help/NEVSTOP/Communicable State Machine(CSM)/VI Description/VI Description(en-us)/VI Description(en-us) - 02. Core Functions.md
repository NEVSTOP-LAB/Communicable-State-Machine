# Core Functions

> [!NOTE]
> <b>Message Building API</b>
>
> This type of API is only used to concatenate message strings and does not send messages directly. The strings need to be merged into the CSM state queue, and the messages will be sent and the operation executed within the Parse State Queue++ VI. If you are familiar with CSM rules, you do not need to use this type of API. You can type the corresponding message string or operation string directly into the string.

> [!NOTE]
> <b>CSM State Queue Operation API</b>
>
> This type of API only concatenates message strings and does not send messages directly. The message is sent and the operation executed within the Parse State Queue++ VI. Unlike the Message Building API, this type of API includes a CSM state queue string input, which is equivalent to inserting a message into the state queue.

## Parse State Queue++.vi
Parses the CSM state queue and returns the next current state to execute, along with arguments and other information.

> - Ref: CSM Inter-module Communication Types

-- <b>Controls</b> --
- <b>Response Arguments</b>: Response arguments from the previous state. Connect this input to the CSM shift register to pass return values from external calls.
- <b>Name ("" to use UUID)</b>: CSM module name. Refer to <b>CSM Naming Rules</b> for module naming rules.
- <b>State Queue</b>: The entire state queue is connected to this input. This must be wired from a CSM shift register.
- <b>Previous Error</b>: Error cluster from the CSM. If an error occurs and is passed to this input, the <b>Current State</b> output returns the `Error Handler` state.
- <b>Dequeue (1 ms)</b>: Timeout setting for checking the CSM message queue. The default is 1 ms. The default is not set to 0 to avoid generating massive amounts of empty messages in certain error situations.
- <b>Response Timeout (-2 Use Global Settings)</b>: Timeout for synchronous calls. The default is -2, which uses the global setting. You can set the global timeout using the CSM - Set TMO of Sync-Reply VI.
- <b>Allowed Messages (Empty for All)</b>: A list of allowed message names. An empty list indicates that all messages are allowed.

-- <b>Indicators</b> --
- <b>Name Used</b>: Actual name assigned to the CSM module.
- <b>Remaining States</b>: All concatenated states and arguments.
- <b>Current State</b>: The next current state to execute.
- <b>Arguments</b>: Returns any arguments that might be used in the current state string. These arguments are located after the `>>` characters.
    - Argument variables must not contain any non-printable characters, such as line feeds or carriage returns.
- <b>Additional Information</b>: Supplemental information. For states triggered by a broadcast, this information contains the name and arguments of the broadcast.
- <b>Source CSM</b>: If <b>Current State</b> is sent externally, this is the name of the source CSM module.

## Build State String with Arguments++.vi
> [!WARNING]
> This VI cannot concatenate "Asynchronous without Reply" messages. This VI is hidden from the Functions palette. It is recommended to use the Build Message with Arguments++ VI instead of this VI.

Builds CSM message strings, containing information such as state, arguments, target module, message type, etc., for sending to other CSM modules.

> - Ref: CSM Message Types
> - Ref: CSM Message Format Parsing

      Example:
      When sending to the local state machine, <b>Target Module ("")</b> must be set to empty.
          If State = A and there are no arguments, then <b>State with Arguments</b> = A
          If State = A , Arguments = B, then <b>State with Arguments</b> = A >> B
      When sending to other CSM modules, assume the name of <b>Target Module ("")</b> is "Target".
      - Synchronous Call (Wait for reply after sending message):
          If State = A and there are no arguments, then <b>State with Arguments</b> = A -@target
          If State = A , Arguments = B, then <b>State with Arguments</b> = A >> B -@target
      - Asynchronous Call (Enter "Async Message Posted" state after sending message. Local module receives "Async Response" message after external module finishes processing):
          If State = A and there are no arguments, then <b>State with Arguments</b> = A ->target
          If State = A , Arguments = B, then <b>State with Arguments</b> = A >> B ->target

-- <b>Controls</b> --
- <b>State</b>: State or message name string.
- <b>Arguments ("")</b>: Arguments for <b>State</b>.
- <b>Target Module ("")</b>: The name of the target CSM module to which this message is sent.
- <b>Type</b>: Message type. You can select from Async, Async Without Reply, or Sync.

-- <b>Indicators</b> --
- <b>CSM Message String</b>: Concatenated CSM message string.

## Build Message with Arguments++.vi
Builds CSM message strings and operation strings.

> - Ref: Message Building API

> [!NOTE]
> <b>Polymorphic VI Options</b>
> - Build Message with Arguments(Auto Check).vi: Concatenates message strings based on the input message symbols.
> - Build Asynchronous Message with Arguments.vi: Concatenates and generates CSM asynchronous message strings. The message type symbol is `->`.
> - Build No-Reply Asynchronous Message with Arguments.vi: Concatenates and generates CSM asynchronous message strings without reply. The message type symbol is `->|`.
> - Build Synchronous Message with Arguments.vi: Concatenates and generates CSM synchronous message strings. The message type symbol is `-@`.
> - Build Interrupt Broadcast Message.vi: Concatenates and generates CSM interrupt broadcast strings.
> - Build Normal Broadcast Message.vi: Concatenates and generates CSM status broadcast strings.
> - Build Register Message.vi: Concatenates and generates CSM register state operation strings.
> - Build Unregister Message.vi: Concatenates and generates CSM unregister state operation strings.
> - CSM - Replace Marks in Messages.vi: Replaces placeholders in message strings.
> - CSM - Replace Mark with String Array.vi: Replaces tags in a single state string with strings from an array and merges them into a string describing a group of states.

> - Ref: CSM Inter-module Communication Types

### Build Message with Arguments(Auto Check).vi
Concatenates and generates CSM message strings. The message type symbol is automatically detected based on the input <b>State with Arguments</b>.

> - Ref: Message Building API
> - Ref: CSM Message Target Module Description

-- <b>Controls</b> --
- <b>State with Arguments</b>: CSM state string, which can contain arguments and target module information.
- <b>Arguments ("")</b>: Argument information. Arguments contained in <b>State with Arguments</b> will be replaced.
- <b>Target Module ("")</b>: Target module. If empty, the default module in <b>State with Arguments</b> will be used.

-- <b>Indicators</b> --
- <b>CSM Message String</b>: Concatenated CSM message string.

### Build Synchronous Message with Arguments.vi
Concatenates and generates CSM synchronous message strings. The message type symbol is `-@`, for example:

      Message >> Arguments -@ Target

> - Ref: Message Building API
> - Ref: Synchronous Message
> - Ref: CSM Message Target Module Description

-- <b>Controls</b> --
- <b>State with Arguments</b>: CSM state string.
- <b>Arguments ("")</b>: Argument information. Arguments contained in <b>State with Arguments</b> will be replaced.
- <b>Target Module ("")</b>: Target module. If empty, the default module in <b>State with Arguments</b> will be used.

-- <b>Indicators</b> --
- <b>CSM Message String</b>: Concatenated CSM message string.

### Build Asynchronous Message with Arguments.vi
Concatenates and generates CSM asynchronous message strings. The message type symbol is `->`, for example:

      Message >> Arguments -> Target

> - Ref: Message Building API
> - Ref: Asynchronous Message
> - Ref: CSM Message Target Module Description

-- <b>Controls</b> --
- <b>State with Arguments</b>: CSM state string.
- <b>Arguments ("")</b>: Argument information. Arguments contained in <b>State with Arguments</b> will be replaced.
- <b>Target Module ("")</b>: Target module. If empty, the default module in <b>State with Arguments</b> will be used.

-- <b>Indicators</b> --
- <b>CSM Message String</b>: Concatenated CSM message string.

### Build No-Reply Asynchronous Message with Arguments.vi
Concatenates and generates CSM asynchronous message strings without reply. The message type symbol is `->|`, for example:

      Message >> Arguments ->| Target

> - Ref: Message Building API
> - Ref: Asynchronous Message
> - Ref: CSM Message Target Module Description

-- <b>Controls</b> --
- <b>State with Arguments</b>: CSM state string.
- <b>Arguments ("")</b>: Argument information. Arguments contained in <b>State with Arguments</b> will be replaced.
- <b>Target Module ("")</b>: Target module. If empty, the default module in <b>State with Arguments</b> will be used.

-- <b>Indicators</b> --
- <b>CSM Message String</b>: Concatenated CSM message string.

### Build Status Broadcast Message.vi
Concatenates normal status message strings. The message format is as follows:

      Status >> Arguments -><status>
      // The following strings are equivalent operations.
      // More operation characters are defined for easier typing and memorization.
      Status >> Arguments -><broadcast>
      Status >> Arguments -><all>

> - Ref: Message Building API

-- <b>Controls</b> --
- <b>State with Arguments</b>: CSM normal status message string.
- <b>Arguments ("")</b>: Argument information. Arguments contained in <b>State with Arguments</b> will be replaced.

-- <b>Indicators</b> --
- <b>CSM Message String</b>: Concatenated CSM message string.

### Build Interrupt Broadcast Message.vi
Concatenates interrupt status messages. The message format is as follows:

      Status >> Arguments -><interrupt>

> - Ref: Message Building API

-- <b>Controls</b> --
- <b>State with Arguments</b>: CSM interrupt status message string.
- <b>Arguments ("")</b>: Argument information. Arguments contained in <b>State with Arguments</b> will be replaced.

-- <b>Indicators</b> --
- <b>CSM Message String</b>: Concatenated CSM message string.

### Build Register Message.vi
Concatenates register state operation message strings. The message format is as follows:

      //[source-state]@[source-module] >> [response-message]@[response-module] -><register>
      status @ Source >> API @ Target -><register>

      Example: Bind the "Download Finished" message of the Downloader module to the "Start Play" API of the Player module.
      // Bind the "Download Finished" message of the Downloader module to the "Start Play" API of the Player module
      DownloadFinished@Downloader >> StartPlay@Player -><register>
      // When executing the message within the Player module, "Player" can be omitted
      DownloadFinished@Downloader >> StartPlay -><register>
      // When multiple modules have the "Download Finished" message,
      // use * to bind this message from all modules to the "Start Play" API of the Player module
      DownloadFinished@* >> StartPlay@Player -><register>

> - Ref: Message Building API
> - Ref: CSM Registration
> - Ref: CSM Registration Location
> - Ref: CSM Broadcast Priority

-- <b>Controls</b> --
- <b>Target CSM</b>: Name of the CSM module registering to the status.
- <b>Source CSM (* as Default)</b>: Name of the CSM module publishing the status.
- <b>Status</b>: Status to register.
- <b>API (If "", Same As "Status")</b>: Name of the API in the registering module that responds to the status.
- <b>Priority (No Change)</b>: Priority of the broadcast after registration.

-- <b>Indicators</b> --
- <b>CSM Message String</b>: Concatenated CSM message string.

### Build Unregister Message.vi
Concatenates unregister state operation message strings. The message format is as follows:

      //[source-state]@[source-module] >> [response-message]@[response-module] -><unregister>
      status @ Source >> API @ Target -><unregister>

      Example: Cancel the binding of the "Download Finished" message of the Downloader module to the "Start Play" API of the Player module.
      // Cancel binding of the "Download Finished" message of the Downloader module to the "Start Play" API of the Player module
      DownloadFinished@Downloader >> StartPlay@Player -><unregister>
      // When executing the message within the Player module, "Player" can be omitted
      DownloadFinished@Downloader >> StartPlay -><unregister>

- In Worker Mode, the module's internal registration rules will only be automatically unregistered after all nodes have exited.
- In Chain of Responsibility Mode, the module's internal registration rules will be automatically unregistered as the node exits.

> - Ref: Message Building API
> - Ref: CSM Registration
> - Ref: CSM Registration Location

-- <b>Controls</b> --
- <b>Target CSM</b>: Name of the CSM module registering to the status.
- <b>Source CSM (* as Default)</b>: Name of the CSM module publishing the status.
- <b>Status</b>: Registered status.
- <b>API (If "", Same As "Status")</b>: Name of the API in the registering module that responds to the status to be unregistered.

-- <b>Indicators</b> --
- <b>CSM Message String</b>: Concatenated CSM message string.

### CSM - Replace Marks in Messages.vi
Facilitates editing multiple CSM message strings by providing a batch replacement function for marks. There are four marks that can be replaced:
- `<param>` mark: Usually represents the same argument.
- `<target>` mark: Usually represents the same target.
- `<1>` mark: Represents custom mark 1.
- `<2>` mark: Represents custom mark 2.

<b>Example</b>: The terminal `<target>` is connected to the string `DAQDevice`. The <b>States with Replace Token</b> string is:

      text
      Initialize -@ <target>
      Configure -@ <target>
      Read -@ <target>
      Close -@ <target>

The <b>States</b> output is:

      text
      Initialize -@ DAQDevice
      Configure -@ DAQDevice
      Read -@ DAQDevice
      Close -@ DAQDevice

> - Ref: Message Building API

-- <b>Controls</b> --
- <b>States with Replace Token</b>: CSM state string with replacement marks.
- <b><param></b>: `<param>` mark, which usually represents the same argument.
- <b><target></b>: `<target>` mark, which usually represents the same target.
- <b><1></b>: Custom mark 1.
- <b><2></b>: Custom mark 2.

-- <b>Indicators</b> --
- <b>States</b>: State string after replacement.

### CSM - Replace Mark with String Array.vi
Replaces tags in a single state string with strings from an array and merges them into a string describing a group of states.

<b>Example</b>: For `Draw >> <1> -@ Painter`, <b>Tag</b> should be set to `<1>`

Input array `[Line, Circle, Rectangle]`. The result will be:

      Draw >> Line -@ Painter
      Draw >> Circle -@ Painter
      Draw >> Rectangle -@ Painter

-- <b>Controls</b> --
- <b>single-line text</b>: Single-line state string containing tags like `<1>`, `<2>`, `<3>`, etc.
- <b>Substitution Mark</b>: The tag to replace, such as `<1>`, `<2>`, `<3>`, etc.
- <b>replace string</b>: The array of strings to replace the tag with.

-- <b>Indicators</b> --
- <b>States</b>: The merged state string.

## CSM - Broadcast Status Change.vi
Broadcasts a status change to the system. CSM modules with registered states will receive this status change. For example:

      // Broadcast status change
      Status >> Arguments -><broadcast>

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>Status with Arguments</b>: The status and arguments to be broadcast. This input supports multiple lines and each state line will have `-><broadcast>` appended.
- <b>State Queue</b>: The entire state queue is connected to this input.
- <b>Broadcast? (T)</b>: Specifies whether to broadcast.

-- <b>Indicators</b> --
- <b>Remaining States</b>: Returns all concatenated states and arguments.

## Add State(s) to Queue By BOOL++.vi
Merges CSM message strings into the CSM message queue. This VI provides string options for both TRUE and FALSE states, avoiding the use of case structures and improving code readability and programming efficiency.

> - Ref: CSM State Queue Operation API

> [!NOTE]
> <b>Polymorphic VI Options</b>
> - Add State(s) to Queue By BOOL(Element).vi
> - Add State(s) to Queue By BOOL(Array Left).vi
> - Add State(s) to Queue By BOOL(Array Right).vi
> - Add State(s) to Queue By BOOL(Array All).vi

### Add State(s) to Queue By BOOL(Element).vi
Merges CSM message strings into the CSM message queue. This VI provides string options for both TRUE and FALSE states, avoiding the use of Case Structures and improving code readability and programming efficiency.

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>State Queue ("")</b>: The entire state queue is connected to this input.
- <b>Condition</b>: Selects the state string connected to the TRUE or FALSE terminal.
- <b>High Priority? (F)</b>: If TRUE, the state is inserted at the front of the <b>State Queue ("")</b>. If FALSE, the state is appended to the end.
- <b>TRUE ("")</b>: The state string to insert when <b>Condition</b> is TRUE.
- <b>FALSE ("")</b>: The state string to insert when <b>Condition</b> is FALSE.

-- <b>Indicators</b> --
- <b>Remaining States</b>: Returns all concatenated states and arguments.

### Add State(s) to Queue By BOOL(Array Left).vi
Merges CSM message strings into the CSM message queue. This VI provides string options for both TRUE and FALSE states, avoiding the use of case structures and improving code readability and programming efficiency.

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>State Queue ("")</b>: The entire state queue is connected to this input.
- <b>Condition</b>: Selects the state string connected to the TRUE or FALSE terminal.
- <b>High Priority? (F)</b>: If TRUE, the state is inserted at the front of the <b>State Queue ("")</b>. If FALSE, the state is appended to the end.
- <b>TRUE ("")</b>: The state string to insert when <b>Condition</b> is TRUE.
- <b>FALSE ("")</b>: The state string to insert when <b>Condition</b> is FALSE.

-- <b>Indicators</b> --
- <b>Remaining States</b>: Returns all concatenated states and arguments.

### Add State(s) to Queue By BOOL(Array Right).vi
Merges CSM message strings into the CSM message queue. This VI provides string options for both TRUE and FALSE states, avoiding the use of case structures and improving code readability and programming efficiency.

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>State Queue ("")</b>: The entire state queue is connected to this input.
- <b>Condition</b>: Selects the state string connected to the TRUE or FALSE terminal.
- <b>High Priority? (F)</b>: If TRUE, the state is inserted at the front of the <b>State Queue ("")</b>. If FALSE, the state is appended to the end.
- <b>TRUE ("")</b>: The state string to insert when <b>Condition</b> is TRUE.
- <b>FALSE ("")</b>: The state string to insert when <b>Condition</b> is FALSE.

-- <b>Indicators</b> --
- <b>Remaining States</b>: Returns all concatenated states and arguments.

### Add State(s) to Queue By BOOL(Array All).vi
Generates the concatenated state of TRUE/FALSE and the remaining states based on the <b>High Priority</b> and Boolean inputs. The <b>High Priority</b> input determines whether to concatenate the TRUE or FALSE string before or after the remaining states. The <b>TRUE</b> and <b>FALSE</b> inputs determine whether the string to be concatenated is TRUE or FALSE.

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>State Queue ("")</b>: The entire state queue is connected to this input.
- <b>Condition</b>: Selects the state string connected to the TRUE or FALSE terminal.
- <b>High Priority? (F)</b>: If TRUE, the state is inserted at the front of the <b>State Queue ("")</b>. If FALSE, the state is appended to the end.
- <b>TRUE ("")</b>: The state string to insert when <b>Condition</b> is TRUE.
- <b>FALSE ("")</b>: The state string to insert when <b>Condition</b> is FALSE.

-- <b>Indicators</b> --
- <b>Remaining States</b>: Returns all concatenated states and arguments.

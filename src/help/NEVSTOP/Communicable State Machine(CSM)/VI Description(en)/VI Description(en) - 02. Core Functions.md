# CSM API

## Core Functions

> [!NOTE] CSM Message Format Parsing
> [CSM Message String] >> [Arguments] [Message Symbol ->|,->,-@] [Target Module] // [Comments]
> - <b>CSM Message String</b>: CSM messages must not contain CSM keywords or newline characters.
> - <b>" >> "</b>: Separator between CSM Message String and Arguments.
> - <b>Arguments</b>: Parameters of the CSM message, must not contain CSM keywords or newline characters.
> - <b>Message Symbol</b>: Symbols to identify message types, including synchronous call (-@), asynchronous call (->), and asynchronous no-wait call (->|).
> - <b>Target Module</b>: The target module to which the message is sent. If empty, the message will be processed by the current module. The message symbol must not exist if the target module is empty.
> - <b>Comments</b>: Information that will not be parsed.

> [!NOTE] CSM Operation Message Format Parsing
> [CSM Operation String] >> [Arguments] -> <[Operation Type]> // [Comments]
> TODO #329

### Parse State Queue++.vi

Parses the CSM state queue and returns the next current state to be executed, along with parameters and other information.

<b>Controls</b>
- <b>State Queue</b>: The entire state queue is connected to this input. This should come from the CSM's shift register.
- <b>Previous Error</b>: The error cluster from the CSM is connected to this input. If an error occurs and appears at this input, the current state output will return the "Error Handler" state.
- <b>Name ("" to use uuid)</b>: CSM module name.
- <b>Response Timeout (5000ms)</b>: Response timeout setting for synchronous calls, default is 5000 ms.
- <b>Dequeue Timeout (0ms)</b>: Timeout setting for checking the CSM message queue, default is 0, meaning no wait.
- <b>Response Arguments</b>: Response parameters from the previous state. It should be connected to the CSM's shift register to pass return values from external calls.

<b>Indicators</b>
- <b>Remaining States</b>: All concatenated states and parameters.
- <b>Arguments</b>: Returns any parameters that may be used in the current state string. These parameters are located after the ">>" character. <b>Note:</b> Argument variables must not contain any non-printable characters, such as newline or carriage return.
- <b>Current State</b>: The next current state to be executed.
- <b>Name Used</b>: The actual name assigned to this CSM module.
- <b>Argument - State</b>: If it is a built-in state defined by CSM, this parameter indicates the previous state of this state.
- <b>From Who</b>: If <b>Current State</b> is sent by an external source, this is the source CSM module name.

### Build State String with Arguments++.vi

This VI is used to build a CSM message string (including state, arguments, target module, message type, etc.) to be sent to other CSM modules.

> <b>NOTE</b>
> This VI cannot concatenate asynchronous messages with "no-wait" return, it is hidden in the function panel. It is recommended to use Build Message with Arguments++.vi instead of this VI.

- <b>Example:</b>

When sending to the local state machine, <b>Target Module ("")</b> should be empty.

      If State = A and there are no arguments, then <b>State with Arguments</b> = A
      If State = A, Arguments = B then <b>State with Arguments</b> = A >> B

When sending to other CSMs, assuming the name of <b>Target Module ("")</b> is "Target":

- Synchronous call, the message is sent and waits for a return:

      If State = A and there are no arguments, then <b>State with Arguments</b> = A -@target
      If State = A, Arguments = B then <b>State with Arguments</b> = A >> B -@target

- Asynchronous call, the message is sent, and it will enter the "Async Message Posted" state. When the external module completes processing, the local module will receive the "Async Response" message:

      If State = A and there are no arguments, then <b>State with Arguments</b> = A ->target
      If State = A, Arguments = B then <b>State with Arguments</b> = A >> B ->target

<b>Controls</b>
- <b>State</b>: State or message name string.
- <b>Arguments ("")</b>: Arguments for <b>State</b>.
- <b>Target Module ("")</b>: The name of the target CSM module to which this message is sent.
- <b>Sync-Call(-@) T By Default/Async-Call(->) F</b>: Synchronous call input "TRUE"; Asynchronous call input "FALSE".

<b>Indicators</b>
- <b>CSM Message String</b>: The concatenated CSM message string.

### Build Message with Arguments++.vi

This VI is used to build CSM message strings and operation strings.

> [!NOTE] Message Concatenation API
> This type of API does not directly send messages, it only concatenates message strings. The strings need to be incorporated into the CSM's state queue and then sent and executed in Parse State Queue++.vi.
> If you are familiar with CSM rules, you can skip using this type of API and directly type the corresponding message strings and operation strings in the text.

> [!NOTE] Polymorphic VI Options:
> - Build Message with Arguments (Auto Check).vi
> - Build Asynchronous Message with Arguments.vi
> - Build No-Reply Asynchronous Message with Arguments.vi
> - Build Synchronous Message with Arguments.vi
> - Build Interrupt Status Message.vi
> - Build Normal Status Message.vi
> - Build Register Status Message.vi
> - Build Unregister Status Message.vi
> - CSM - Replace Substitution Marks in Messages.vi

#### Build Message with Arguments(Auto Check).vi

Concatenates a CSM message string, and the message type symbol will be automatically detected based on the input <b>State with Arguments</b>.

> Ref: Message Concatenation API

<b>Controls</b>
- <b>State with Arguments</b>: CSM state string, which can include arguments and target module information.
- <b>Arguments ("")</b>: Argument information. Arguments included in <b>State with Arguments</b> will be replaced.
- <b>Target Module ("")</b>: Target module. If empty, the default module in <b>State with Arguments</b> will be used.

<b>Indicators</b>
- <b>CSM Message String</b>: The concatenated CSM message string.

#### Build Synchronous Message with Arguments.vi

Concatenates a CSM synchronous message string, with the message type symbol "-@", for example:

      Message >> Arguments -@ Target

> Ref: Message Concatenation API

<b>Controls</b>
- <b>State with Arguments</b>: CSM state string.
- <b>Arguments ("")</b>: Argument information. Arguments included in <b>State with Arguments</b> will be replaced.
- <b>Target Module ("")</b>: Target module. If empty, the default module in <b>State with Arguments</b> will be used.

<b>Indicators</b>
- <b>CSM Message String</b>: The concatenated CSM message string.

#### Build Asynchronous Message with Arguments.vi

Concatenates a CSM asynchronous message string, with the message type symbol "->", for example:

      Message >> Arguments -> Target

> Ref: Message Concatenation API

<b>Controls</b>
- <b>State with Arguments</b>: CSM state string.
- <b>Arguments ("")</b>: Argument information. Arguments included in <b>State with Arguments</b> will be replaced.
- <b>Target Module ("")</b>: Target module. If empty, the default module in <b>State with Arguments</b> will be used.

<b>Indicators</b>
- <b>CSM Message String</b>: The concatenated CSM message string.

#### Build No-Reply Asynchronous Message with Arguments.vi

Concatenates a CSM asynchronous message string, with the message type symbol "->|", for example:

      Message >> Arguments ->| Target

> Ref: Message Concatenation API

<b>Controls</b>
- <b>State with Arguments</b>: CSM state string.
- <b>Arguments ("")</b>: Argument information. Arguments included in <b>State with Arguments</b> will be replaced.
- <b>Target Module ("")</b>: Target module. If empty, the default module in <b>State with Arguments</b> will be used.

<b>Indicators</b>
- <b>CSM Message String</b>: The concatenated CSM message string.

#### Build Normal Status Message.vi

Concatenates a normal status message string, with the following format:

      Status >> Arguments -><status>
      // The following strings are equivalent operations, defined for easier typing and memory:
      Status >> Arguments -><broadcast>
      Status >> Arguments -><all>

> Ref: Message Concatenation API

<b>Controls</b>
- <b>State with Arguments</b>: CSM normal status message string.
- <b>Arguments ("")</b>: Argument information. Arguments included in <b>State with Arguments</b> will be replaced.

<b>Indicators</b>
- <b>CSM Message String</b>: The concatenated CSM message string.

#### Build Interrupt Status Message.vi

Concatenates an interrupt status message. The format is as follows:

      Status >> Arguments -><interrupt>

> Ref: Message Concatenation API

<b>Controls</b>
- <b>State with Arguments</b>: CSM interrupt status message string.
- <b>Arguments ("")</b>: Argument information. Arguments included in <b>State with Arguments</b> will be replaced.

<b>Indicators</b>
- <b>CSM Message String</b>: The concatenated CSM message string.

#### Build Register Status Message.vi

Concatenates a register status operation message string, with the following format:

      //[source-state]@[source-module] >> [response-message]@[response-module] -><register>
      status @ Source >> API @ Target -><register>

Example: Add the download completion message of the downloader module, binding it to the start play API of the player module.

      // Bind the download completion message of the downloader module to the start play API of the player module.
      DownloadFinished@Downloader >> StartPlay@Player -><register>
      // When executing the message in the player module, Player can be omitted.
      DownloadFinished@Downloader >> StartPlay -><register>
      // When multiple modules have download completion messages, use * to indicate that all modules' messages are bound to the start play API of the player module.
      DownloadFinished@* >> StartPlay@Player -><register>

> Ref: Message Concatenation API

<b>Controls</b>
- <b>Target CSM</b>: The name of the CSM module subscribing to the status.
- <b>Source CSM (* as Default)</b>: The name of the CSM module issuing the status.
- <b>Status</b>: The registered status.
- <b>API (if "", same as Status)</b>: The API name that the subscribing status module responds to.

<b>Indicators</b>
- <b>CSM Message String</b>: The concatenated CSM message string.

#### Build Unregister Status Message.vi

Concatenates an unregister status operation message string, with the following format:

      //[source-state]@[source-module] >> [response-message]@[response-module] -><unregister>
      status @ Source >> API @ Target -><unregister>

Example: Unbind the download completion message of the downloader module from the start play API of the player module.

      // Unbind the download completion message of the downloader module from the start play API of the player module.
      DownloadFinished@Downloader >> StartPlay@Player -><unregister>
      // When executing the message in the player module, Player can be omitted.
      DownloadFinished@Downloader >> StartPlay -><unregister>

> Ref: Message Concatenation API

<b>Controls</b>
- <b>Target CSM</b>: The name of the CSM module subscribing to the status.
- <b>Source CSM (* as Default)</b>: The name of the CSM module issuing the status.
- <b>Status</b>: The registered status.

<b>Indicators</b>
- <b>CSM Message String</b>: The concatenated CSM message string.

#### CSM - Replace Substitution Marks in Messages.vi

Provides a batch replacement function for editing multiple CSM message strings conveniently. There are 4 markers that can be replaced:
- <param> Marker: Usually represents the same parameter.
- <target> Marker: Usually represents the same target.
- <1> Marker: Represents custom marker 1.
- <2> Marker: Represents custom marker 2.

Example: The terminal <target> is connected to the string "DAQDevice", and the <b>States with Replace Token</b> string is:

      ``` text
      Initialize -@ <target>
      Configure -@ <target>
      Read -@ <target>
      Close -@ <target>
      ```

<b>States</b> output is:

      ``` text
      Initialize -@ DAQDevice
      Configure -@ DAQDevice
      Read -@ DAQDevice
      Close -@ DAQDevice
      ```

> Ref: Message Concatenation API

<b>Controls</b>
- <b>States with Replace Token</b>: CSM state string with replacement markers.
- <b><param></b>: <param> Marker: Usually represents the same parameter.
- <b><target></b>: <target> Marker: Usually represents the same target.
- <b><1></b>: Custom marker 1.
- <b><2></b>: Custom marker 2.

<b>Indicators</b>
- <b>States</b>: The replaced states.

### CSM - Broadcast Status Change.vi

Broadcasts a status change to the system. CSM modules with registered statuses will receive the status change. For example:

      // Broadcast status change
      Status >> Arguments -><broadcast>

> [!NOTE] CSM State Queue Operation API
> This type of API does not directly send messages, it only concatenates message strings. Messages are sent and executed in Parse State Queue++.vi.
> Unlike the Message Concatenation API, this type of API includes the CSM state queue string input, equivalent to inserting messages into the state queue.

<b>Controls</b>
- <b>Status with Arguments</b>: The status and arguments to be broadcasted, supports multiple lines, each line status will be added with "-><broadcast>".
- <b>State Queue ("")</b>: The entire state queue is connected to this input.
- <b>Broadcast (T)</b>: Control switch input for broadcasting.

<b>Indicators</b>
- <b>Remaining States</b>: All concatenated states and parameters.

### Add State(s) to Queue By BOOL++.vi

Incorporates CSM message strings into the CSM message queue. Provides TRUE/FALSE state string options to avoid using conditional structures, improving code readability and programming efficiency.

> Ref: CSM State Queue Operation API

> [!NOTE] Polymorphic VI Options:
> - add State(s) to Queue By BOOL (Element).vi
> - add State(s) to Queue By BOOL (Array Left).vi
> - add State(s) to Queue By BOOL (Array Right).vi
> - add State(s) to Queue By BOOL (Array All).vi

#### Add State(s) to Queue By BOOL(Element).vi

Incorporates CSM message strings into the CSM message queue. Provides TRUE/FALSE state string options to avoid using conditional structures, improving code readability and programming efficiency.

> Ref: CSM State Queue Operation API

<b>Controls</b>
- <b>State Queue ("")</b>: The entire state queue is connected to this input.
- <b>TRUE ("")</b>: State string inserted when <b>Condition</b> is True.
- <b>FALSE ("")</b>: State string inserted when <b>Condition</b> is False.
- <b>Condition</b>: Flag to select the state string connected to the TRUE terminal or the FALSE terminal.
- <b>High Priority (FALSE)</b>: If True, the state will be inserted at the front of <b>State Queue ("")</b>. If False, it is appended to the end.

<b>Indicators</b>
- <b>Remaining States</b>: All concatenated states and parameters.

#### Add State(s) to Queue By BOOL(Array Left).vi

Incorporates CSM message strings into the CSM message queue. Provides TRUE/FALSE state string options to avoid using conditional structures, improving code readability and programming efficiency.

> Ref: CSM State Queue Operation API

<b>Controls</b>
- <b>State Queue ("")</b>: The entire state queue is connected to this input.
- <b>TRUE ("")</b>: State string inserted when <b>Condition</b> is True.
- <b>FALSE ("")</b>: State string inserted when <b>Condition</b> is False.
- <b>Condition</b>: Flag to select the state string connected to the TRUE terminal or the FALSE terminal.
- <b>High Priority (FALSE)</b>: If True, the state will be inserted at the front of <b>State Queue ("")</b>. If False, it is appended to the end.

<b>Indicators</b>
- <b>Remaining States</b>: All concatenated states and parameters.

#### Add State(s) to Queue By BOOL(Array Right).vi

Incorporates CSM message strings into the CSM message queue. Provides TRUE/FALSE state string options to avoid using conditional structures, improving code readability and programming efficiency.

> Ref: CSM State Queue Operation API

<b>Controls</b>
- <b>State Queue ("")</b>: The entire state queue is connected to this input.
- <b>TRUE ("")</b>: State string inserted when <b>Condition</b> is True.
- <b>FALSE ("")</b>: State string inserted when <b>Condition</b> is False.
- <b>Condition</b>: Flag to select the state string connected to the TRUE terminal or the FALSE terminal.
- <b>High Priority (FALSE)</b>: If True, the state will be inserted at the front of <b>State Queue ("")</b>. If False, it is appended to the end.

<b>Indicators</b>
- <b>Remaining States</b>: All concatenated states and parameters.

#### Add State(s) to Queue By BOOL(Array All).vi

Based on high priority and Bool input, this VI generates TRUE/False and remaining states concatenated states.
The High Priority input determines whether to concatenate the TRUE or FALSE string before or after the remaining states.
The Bool input determines whether the TRUE or FALSE string is concatenated.

> Ref: CSM State Queue Operation API

<b>Controls</b>
- <b>State Queue ("")</b>: The entire state queue is connected to this input.
- <b>TRUE ("")</b>: State string inserted when <b>Condition</b> is True.
- <b>FALSE ("")</b>: State string inserted when <b>Condition</b> is False.
- <b>Condition</b>: Flag to select the state string connected to the TRUE terminal or the FALSE terminal.
- <b>High Priority (FALSE)</b>: If True, the state will be inserted at the front of <b>State Queue ("")</b>. If False, it is appended to the end.

<b>Indicators</b>
- <b>Remaining States</b>: All concatenated states and parameters.

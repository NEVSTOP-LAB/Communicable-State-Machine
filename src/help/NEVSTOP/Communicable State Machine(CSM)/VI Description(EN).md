# CSM API

## Template Palette

### CSM - No-Event Structure Template.vi

Template for building CSM Module without User Interface.

<b>Inputs:</b>
- <b>Name("" to use uuid)</b>: Module Name
  - If Input is "", an uuid will be used for module name. The module is marked as stand-alone mode and will not be included in module list.
  - If Input end with '#', the module will worked in worker mode. Modules with the same name will shared the same message queue. Any external message will be processed by one of the modules, depends on who is free.
  - Otherwise, the input string will be used as module name, which should be unique in system. CSM will go to "Critical Error" state if duplicated module name is used in system.

<b>Outputs:</b>
- N/A

### CSM - With Event Structure Template.vi

Template for building CSM Module with User Interface. Event Structure is included in template for processing user operations.

<b>Inputs:</b>
- <b>Name("" to use uuid)</b>: Module Name
  - If Input is "", an uuid will be used for module name. The module is marked as stand-alone mode and will not be included in module list.
  - Fi Input end with '#', the module will worked in worker mode. Modules with the same name will shared the same message queue. Any external message will be processed by one of the modules, depending who is free.
  - Otherwise, the input string will be used as module name, which should be unique in system. CSM will go to "Critical Error" state if duplicated module name is used in system.

<b>Outputs:</b>
- N/A

### CSM - With Event Structure Template - Tiny.vi

Template for building CSM Module without User Interface.

<b>Inputs:</b>
- <b>Name("" to use uuid)</b>: Module Name
  - If Input is "", an uuid will be used for module name. The module is marked as stand-alone mode and will not be included in module list.
  - Fi Input end with '#', the module will worked in worker mode. Modules with the same name will shared the same message queue. Any external message will be processed by one of the modules, depends on who is free.
  - Otherwise, the input string will be used as module name, which should be unique in system. CSM will go to "Critical Error" state if duplicated module name is used in system.

<b>Outputs:</b>
- N/A

## Basics APIs

### Parse State Queue++.vi

Parses the CSM state queue and returns the current state that will execute next with the associated arguments.

<b>Inputs:</b>
- <b>State Queue</b>: The entire state queue is wired to this input. This should come from the main CSM shift register.
- <b>Error In (no error)</b>: The error cluster from the CSM is wired to this input. If an error occurs and appears on this input, the current state output returns the "Error Handler" state.
- <b>Name("" to use uuid)</b>: Module Name
  - If Input is "", an uuid will be used for module name. The module is marked as stand-alone mode and will not be included in module list.
  - Fi Input end with '#', the module will worked in worker mode. Modules with the same name will shared the same message queue. Any external message will be processed by one of the modules, depends on who is free.
  - Otherwise, the input string will be used as module name, which should be unique in system. CSM will go to "Critical Error" state if duplicated module name is used in system.
- <b>Response Timeout(5000ms)</b>: The timeout of waiting for response of sync-call from outside.
- <b>Dequeue Timeout(0ms)</b>: The timeout of checking CSM message queue.
- <b>Response Arguments</b>: The response arguments from last state. It should come from the CSM shift register.

<b>Outputs:</b>
- <b>Remaining States</b>:  Returns all the next states that should execute after the current state completes. These should be passed through the current state in the state machine. These can also be modified or augmented within the current state if necessary.
- <b>Arguments</b>: Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters. <b>Note:</b> The arguments variable must not contain any unprintable characters like linefeed or carriage return.
- <b>Current State</b>: The state to be processed
- <b>Name Used</b>: The actual name assigned to this CSM module
- <b>Argument - State</b>: If any core error occurs, this is the source state name
- <b>From Who</b>: If <b>Current State</b> is called by outside, this is the source CSM module name.

### Build State String with Arguments++.vi

Builds a state string that contains arguments for the CSM.

<B>For Example:</B>

For local CSM, <b>Target Module ("")</b> is empty.

      If State = A and no argument, then <b>State with Arguments</b> = A
      If State = A and Arguments = B then <b>State with Arguments</b> = A >> B

For sending message to other CSM, suppose <b>Target Module ("")</b> is "Target"

- For Sync-Call:

         If State = A and no argument, then <b>State with Arguments</b> = A -@target
         If State = A and Arguments = B then <b>State with Arguments</b> = A >> B -@target

- For Async-Call:

         If State = A and no argument, then <b>State with Arguments</b> = A ->target
         If State = A and Arguments = B then <b>State with Arguments</b> = A >> B ->target

<b>Inputs:</b>
- <b>State</b>: The State or message string
- <b>Arguments ("")</b>: The argument for <b>State</b>
- <b>Target Module ("")</b>: The target CSM module for the message to be sent to.
- <b>Sync-Call(-@) T By Default/Async-Call(->) F</b>: For sync call, use "TRUE"; For Async call, use "FALSE"

<b>Outputs:</b>
- <b>State with Arguments</b>: String stands for state with arguments

### Build Message with Arguments++.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. Different message type symbol(->|,->,-@) will be used in different Polymorphic Vi instance.

Polymorphic Option:
- Build Message with Arguments(Auto Check).vi
- Build Asynchronous Message with Arguments.vi
- Build No-Reply Asynchronous Message with Arguments.vi
- Build Synchronous Message with Arguments.vi

<b>Inputs:</b>
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

<b>Outputs:</b>
- <b>State with Arguments</b>: String stands for state with arguments

<b>Inputs:</b>

<b>Outputs:</b>

#### Build Message with Arguments(Auto Check).vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. The message type from input <b>State with Arguments</b> will be used.

<B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
<b>Arguments ("")</b> input is "Arguments"
<b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments" as no message symbol is detected.

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is ""
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -@ Callee"

<b>Inputs:</b>
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

<b>Outputs:</b>
- <b>State with Arguments</b>: String stands for state with arguments

#### Build Asynchronous Message with Arguments.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values with async-message symbol "->" if <b>Target Module ("")</b> is specified.

<B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
<b>Arguments ("")</b> input is "Arguments"
<b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments -> Callee". It's different with Build Message with Arguments(Auto Check).vi. . Message Type Symbol is replaced with "->".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is ""
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee". Message Type Symbol is replaced with "->".

<b>Inputs:</b>
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

<b>Outputs:</b>
- <b>State with Arguments</b>: String stands for state with arguments

#### Build No-Reply Asynchronous Message with Arguments.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values with No-Reply async-message symbol "->|" if <b>Target Module ("")</b> is specified.

<B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
<b>Arguments ("")</b> input is "Arguments"
<b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments ->| Callee". It's different with Build Message with Arguments(Auto Check).vi. Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments ->| NewCallee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is ""
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth ->| NewCallee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "->|".

<b>Inputs:</b>
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

<b>Outputs:</b>
- <b>State with Arguments</b>: String stands for state with arguments

#### Build Synchronous Message with Arguments.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values with sync-message symbol "-@" if <b>Target Module ("")</b> is specified.

<B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
<b>Arguments ("")</b> input is "Arguments"
<b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments ->| Callee". It's different with Build Message with Arguments(Auto Check).vi. Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -@ NewCallee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is ""
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -@ NewCallee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -@ Callee".

<b>Inputs:</b>
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

<b>Outputs:</b>
- <b>State with Arguments</b>: String stands for state with arguments

#### Build Interrupt Status Message.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. The message type from input <b>State with Arguments</b> will be used.
<B>For Example:</B>
If <b>State with Arguments</b> input is "API: DoSth"
Then result string is "API: DoSth >> Arguments" as no message symbol is detected.
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth >> NewArguments -> Callee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth -> NewCallee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
Then result string is "API: DoSth >> NewArguments -@ Callee"
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.
- <b>State with Arguments</b>: String stands for state with arguments

<b>Inputs:</b>
- <b>State with Arguments</b>:
- <b>Arguments ("")</b>:

<b>Outputs:</b>
- <b>State with Arguments</b>:

#### Build Normal Status Message.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. The message type from input <b>State with Arguments</b> will be used.
<B>For Example:</B>
If <b>State with Arguments</b> input is "API: DoSth"
Then result string is "API: DoSth >> Arguments" as no message symbol is detected.
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth >> NewArguments -> Callee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth -> NewCallee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
Then result string is "API: DoSth >> NewArguments -@ Callee"
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.
- <b>State with Arguments</b>: String stands for state with arguments

<b>Inputs:</b>
- <b>State with Arguments</b>:
- <b>Arguments ("")</b>:

<b>Outputs:</b>
- <b>State with Arguments</b>:

#### Build Register Status Message.vi

Builds register status message. The message looks like:
[source-state]@[source-module] >> [response-message]@[response-module] -><register>
For examples:
DownloadFinished@Downloader >> StartPlay@Player -><register>
DownloadFinished@Downloader >> StartPlay -><register> // response-module is current module
DownloadFinished@Downloader  -><register> // response-module is current module. response-message is DownloadFinished
DownloadFinished@* >> StartPlay@Player -><register> // Any Module's DownloadFinished is registered to Player's StartPlay state.

<b>Inputs:</b>
- <b>Source CSM Name (* as Default)</b>:
- <b>CSM Name</b>:
- <b>Status</b>:
- <b>Response Message (if "", same as Source Message)</b>:

<b>Outputs:</b>
- <b>State with Arguments</b>:

#### Build Unregister Status Message.vi

Builds unregister status message. The message looks like:
[source-state]@[source-module] >> [response-module] -><unregister>
For examples:
DownloadFinished@Downloader >> StartPlay -><unregister>
DownloadFinished@Downloader  -><unregister>

<b>Inputs:</b>
- <b>Source CSM Name (* as Default)</b>:
- <b>CSM Name</b>:
- <b>Status</b>:

<b>Outputs:</b>
- <b>State with Arguments</b>:

### Add State(s) to Queue By BOOL++.vi

Depending on the High Priority and Bool input, this VI generates a concatenated state of TRUE/False and Remaining States. The High Priority input determines if the TRUE or False string concatenates before/after the remaining states. The Bool input determines whether TRUE or False string to be concatenated.

<b>Inputs:</b>
- <b>State Queue("")</b>: The entire state queue is wired to this input.
- <b>TRUE("")</b>: State to insert when <b>Bool</b> is True.
- <b>False("")</b>: State to insert when <b>Bool</b> is False.
- <b>Bool</b>: Flag for choosing State String connected to TRUE terminal or False terminal.
- <b>High Priority(FALSE)</b>: If True, The state will be inserted to the top of the <b>State Queue("")</b>. If False, It's appended to the tail.

<b>Outputs:</b>
- <b>State Queue Out</b>: Returns all the next states that should execute after the current state completes.

#### Add State(s) to Queue By BOOL(Element).vi

Depending on the High Priority and Bool input, this VI generates a concatenated state of TRUE/False and Remaining States. The High Priority input determines if the TRUE or False string concatenates before/after the remaining states. The Bool input determines whether TRUE or False string to be concatenated.

<b>Inputs:</b>
- <b>State Queue("")</b>: The entire state queue is wired to this input.
- <b>TRUE("")</b>: State to insert when <b>Bool</b> is True.
- <b>False("")</b>: State to insert when <b>Bool</b> is False.
- <b>Bool</b>: Flag for choosing State String connected to TRUE terminal or False terminal.
- <b>High Priority(FALSE)</b>: If True, The state will be inserted to the top of the <b>State Queue("")</b>. If False, It's appended to the tail.

<b>Outputs:</b>
- <b>State Queue Out</b>: Returns all the next states that should execute after the current state completes.

#### Add State(s) to Queue By BOOL(Array Left).vi

Depending on the High Priority and Bool input, this VI generates a concatenated state of TRUE/False and Remaining States. The High Priority input determines if the TRUE or False string concatenates before/after the remaining states. The Bool input determines whether TRUE or False string to be concatenated.

<b>Inputs:</b>
- <b>State Queue("")</b>: The entire state queue is wired to this input.
- <b>TRUE("")</b>: State to insert when <b>Bool</b> is True.
- <b>False("")</b>: State to insert when <b>Bool</b> is False.
- <b>Bool</b>: Flag for choosing State String connected to TRUE terminal or False terminal.
- <b>High Priority(FALSE)</b>: If True, The state will be inserted to the top of the <b>State Queue("")</b>. If False, It's appended to the tail.

<b>Outputs:</b>
- <b>State Queue Out</b>: Returns all the next states that should execute after the current state completes.

#### Add State(s) to Queue By BOOL(Array Right).vi

Depending on the High Priority and Bool input, this VI generates a concatenated state of TRUE/False and Remaining States. The High Priority input determines if the TRUE or False string concatenates before/after the remaining states. The Bool input determines whether TRUE or False string to be concatenated.

<b>Inputs:</b>
- <b>State Queue("")</b>: The entire state queue is wired to this input.
- <b>TRUE("")</b>: State to insert when <b>Bool</b> is True.
- <b>False("")</b>: State to insert when <b>Bool</b> is False.
- <b>Bool</b>: Flag for choosing State String connected to TRUE terminal or False terminal.
- <b>High Priority(FALSE)</b>: If True, The state will be inserted to the top of the <b>State Queue("")</b>. If False, It's appended to the tail.

<b>Outputs:</b>
- <b>State Queue Out</b>: Returns all the next states that should execute after the current state completes.

#### Add State(s) to Queue By BOOL(Array All).vi

Depending on the High Priority and Bool input, this VI generates a concatenated state of TRUE/False and Remaining States. The High Priority input determines if the TRUE or False string concatenates before/after the remaining states. The Bool input determines whether TRUE or False string to be concatenated.

<b>Inputs:</b>
- <b>State Queue("")</b>: The entire state queue is wired to this input.
- <b>TRUE("")</b>: State to insert when <b>Bool</b> is True.
- <b>False("")</b>: State to insert when <b>Bool</b> is False.
- <b>Bool</b>: Flag for choosing State String connected to TRUE terminal or False terminal.
- <b>High Priority(FALSE)</b>: If True, The state will be inserted to the top of the <b>State Queue("")</b>. If False, It's appended to the tail.

<b>Outputs:</b>
- <b>State Queue Out</b>: Returns all the next states that should execute after the current state completes.

### CSM - Broadcast Status Change.vi

Broadcast the status change to system. The CSM Module who registered the status will receive the status change.

<b>Inputs:</b>
- <b>Status with Arguments</b>: Status with arguments to publish
- <b>State Queue("")</b>: The entire state queue is wired to this input.
- <b>Broadcast(T)</b>: Trigger for broadcast or not.

<b>Outputs:</b>
- <b>Remaining States</b>: Returns all the next states that should execute after the current state completes.

## Arguments

### CSM - Make String Arguments Safe.vi

'->','->|','-@','-&','<-" are key words in CSM, which should not be included in arguments. You can use this vi to make your arguments safe.

<b>Inputs:</b>
- <b>Argument String</b>: Arguments might include '->','->|','-@','-&','<-".

<b>Outputs:</b>
- <b>Safe Argument String</b>: Arguments safe for CSM.

### CSM - Revert Arguments-Safe String.vi

'->','->|','-@','-&','<-" are key words in CSM, which should not be included in arguments. You can use <b>CSM Make String Arguments Safe.vi</b> to make your arguments safe. This VI is used for converting the safe arguments back to the origin string.

<b>Inputs:</b>
- <b>Safe Argument String</b>: Arguments safe for CSM.

<b>Outputs:</b>
- <b>Origin Argument String</b>: Origin arguments might include '->','->|','-@','-&','<-".

### CSM - Convert Data to HexStr.vi

Convert complex argument(variant) to hex string, which could be safely used as state argument without broking the string queue logic.

<b>Inputs:</b>
- <b>Variant</b>: Complex data in variant format.

<b>Outputs:</b>
- <b>HEX String (0-9,A-F)</b>: Hex String, which contains no invisible string following CSM's rule

### CSM - Convert HexStr to Data.vi

Convert hex string arguments back to variant.

<b>Inputs:</b>
- <b>HEX String</b>: Hex String, which contains no invisible string following CSM's rule

<b>Outputs:</b>
- <b>Variant</b>: Complex data in variant format.
- <b>error out</b>: Error output

## Advance APIs

### CSM - Start Async Call.vi

VI snippet for dropping start async call template code from LabVIEW Quick Drop.

<b>Inputs:</b>
- N/A

<b>Outputs:</b>
- N/A

### CSM - Synchronized Call.vi

VI snippet for dropping sync call template code from LabVIEW Quick Drop.

<b>Inputs:</b>
- N/A
 -
<b>Outputs:</b>
 - N/A

### CSM - Mark As Worker Module.vi

Append '#' to CSM Name, to mark this module is a worker, who shares the same message queue with workers with the same name. A real name with uuid generated will be assigned to this CSM module.

<b>Inputs:</b>
 - <b>CSM Name</b>: CSM module name.

<b>Outputs:</b>
 - <b>CSM Name(marked as worker)</b>: CSM module name with '#' appended.

### CSM - Compact Multiple States.vi

Compact multiple states to a single string for input.

<b>Inputs:</b>
 - <b>States in Lines</b>: Multiple states as string array.

<b>Outputs:</b>
 - <b>States</b>: State String contains all the input state(s)

### CSM - Check If Module Exists.vi

Check if module with specified name exists.

<b>Inputs:</b>
 - <b>CSM Name</b>: CSM Module Name
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>Exist?</b>: Return True if specified module exists.
 - <b>CSM Name(dup)</b>: Return <b>CSM Name</b>
 - <b>Error out</b>: Error cluster

### CSM - List Modules.vi

List all CSM Modules alive in system.

<b>Inputs:</b>
 - <b>Exclude Standalone CSM(T)</b>: 'TRUE' to exclude standalone CSM module, and 'FALSE' to include them.
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>Module Names</b>: Module Names
 - <b>Error out</b>: Error cluster

### CSM - Module Status.vi

Get the CSM+ Module Status

<b>Inputs:</b>
 - <b>CSM Name</b>: CSM module name.
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>Mode</b>: Return the mode of CSM Module. It might be "Stand-alone", "CSM" or "Action Worker".
 - <b>#As Worker</b>: Number of the workers if module in "Action Worker" mode.
 - <b>#msg to be processed</b>: The number of message in CSM Message Queue.
 - <b>CSM Name(dup)</b>: Return <b>CSM Name</b>
 - <b>Error out</b>: Error cluster

### CSM - Register Status Change.vi

Register for notification of other CSM Module's status change. If "Response Message" is not connected or "" is the input, the same state name will be used for acting message.

<b>Inputs:</b>
 - <b>CSM Name</b>: CSM Module name.
 - <b>Source CSM Name ('*' as Default)</b>: CSM who generates the status. You can use '*' for all modules generated the same <b>Status</b>
 - <b>Status</b>: The status string
 - <b>Response Message (if "", same as Source Message)</b>: After registered, If status change, this message will be received.
 - <b>Priority(T:As Status,F:As Interrupt)</b>: The Response Message will be inserted to the front of state queue if it's False, otherwise it wil be append to the tail.
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>CSM Name(dup)</b>: Return <b>CSM Name</b>
 - <b>Error out</b>: Error cluster

### CSM - Unregister Status Change.vi

Unregister the notification of other CSM Module's status change.

<b>Inputs:</b>
 - <b>CSM Name</b>: CSM Module name.
 - <b>Source CSM Name</b>: CSM who generates the status. You can use '*' for all modules generated the same <b>Status</b>
 - <b>Status</b>: The status string
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>CSM Name(dup)</b>: return <b>CSM Name</b>
 - <b>Error out</b>: Error cluster

### CSM - Get New State Notifier Event.vi

<b>Inputs:</b>
 - <b>Name("" to use uuid) in</b>: CSM module name
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>New State Notifier Event</b>: User event to break CSM module from waiting in event structure when message is received.
 - <b>Error out</b>: Error cluster

## Non-CSM Support

### CSM - Post Message.vi

Post a message to CSM specified.

<b>Inputs:</b>
 - <b>Target Module</b>:Target CSM Module name.
 - <b>State</b>: Message to post.
 - <b>Arguments ("")</b>: Argument of the message.
 - <b>Error In (no error)</b>: Error cluster

<b>Outputs:</b>
 - <b>error out</b>: Error cluster

### CSM - Send Message and Wait for Reply.vi

Send a message to CSM specified and wait for the reply with timeout.

<b>Inputs:</b>
 - <b>Target Module</b>: Target CSM Module name.
 - <b>State</b>: Message to send
 - <b>Arguments ("")</b>: Argument of the message.
 - <b>Response Timeout(5000ms)</b>: Timeout for waiting the response.
 - <b>Error In (no error)</b>: Error cluster

<b>Outputs:</b>
 - <b>Arguments</b>: Response returned.
 - <b>error out</b>: Error cluster

### CSM - Status Change Event.vi

Obtain CSM Global Log Event Reference.
- <b>Error in</b>: Error cluster
- <b>CSM Global Log Event</b>: User event reference for CSM global log.
- <b>Error out</b>: Error cluster

<b>Inputs:</b>
 - <b>Error in</b>:
 - <b>Name("" to use uuid) in</b>:

<b>Outputs:</b>
 - <b>Error out</b>:
 - <b>Status Change Event</b>:

### CSM - Destroy Status Change Event.vi

Release CSM Global Log Event Reference.
- <b>CSM Global Log Event</b>:
- <b>Error in</b>: Error cluster
- <b>Error out</b>: Error cluster

<b>Inputs:</b>
 - <b>Error in</b>:
 - <b>Status Change Event</b>:

<b>Outputs:</b>
 - <b>Error out</b>:

## Side-Loop Support

### CSM - Request CSM to Post Message.vi

Request CSM to Post a message to CSM specified. This is usually used in sub-loops with a CSM for acting as a holistic module.

<b>Inputs:</b>
 - <b>Status</b>: Message to post.
 - <b>Arguments ("")</b>: Argument of the message.
 - <b>Target Module</b>:Target CSM Module name.
 - <b>Module Name</b>:Host Module Name
 - <b>Error In (no error)</b>: Error cluster

<b>Outputs:</b>
 - <b>error out</b>: Error cluster

### CSM - Request CSM to Broadcast Status Change.vi

Request CSM to publish status change to CSM specified. This is usually used in sub-loops with a CSM for acting as a holistic module.

<b>Inputs:</b>
 - <b>Status</b>: status to broadcast.
 - <b>Arguments ("")</b>: Argument of the status.
 - <b>Module Name</b>:Host Module Name
 - <b>Broadcast(T)</b>: Trigger for broadcast or not.
 - <b>Error In (no error)</b>: Error cluster

<b>Outputs:</b>
 - <b>error out</b>: Error cluster

### CSM - Module Turns Invalid.vi

Check if CSM module is not valid any more. This is usually used in sub-loops with a CSM for acting as a holistic module. It's used for exit condition of the sub-loops.

<b>Inputs:</b>
 - <b>CSM Name</b>: Host Module Name

<b>Outputs:</b>
 - <b>Turn Invalid(Exit)?</b>: CSM Module turns invalid

## Global Log Event

### CSM - Global Log Event.vi

Obtain CSM Global Log Event Reference.

<b>Inputs:</b>
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>CSM Global Log Event</b>: User event reference for CSM global log.
 - <b>Error out</b>: Error cluster

### CSM - Destroy Global Log Event.vi

Release CSM Global Log Event Reference.

<b>Inputs:</b>
 - <b>CSM Global Log Event</b>:
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>Error out</b>: Error cluster

### CSM - Generate User Global Log.vi

<b>Inputs:</b>
 - <b>Error in</b>:
 - <b>From Who</b>:
 - <b>ModuleName</b>:
 - <b>Log</b>:
 - <b>Arguments</b>:

<b>Outputs:</b>
 - <b>error out</b>:

## Utility VIs

### Build Error Cluster.vi

Creates an error cluster, building the source string from the calling VIs call chain in a standard LabVIEW fashion.  Builds source string as:
"<B>Calling VI</B> in <B>Calling VI's Caller</B>-><B>Calling VI's Caller's Caller</B>->etc...->etc..."
Optional 'String to Prepend to source ("")' string input is used to add extra descriptive info to the source string.  This string, if present, will be enclosed in parenthesis and prepended to the source string.

<b>Inputs:</b>
 - <b>code</b>: error code
 - <b>String to Prepend to source ("")</b>: error string

<b>Outputs:</b>
 - <b>error out</b>: Error cluster

### Build Internal State String.vi

Build a state string that contains arguments for the CSM.

<b>Inputs:</b>s
 - <b>State</b>: The State or message string
 - <b>Arguments ("")</b>: The argument for <b>State</b>
 - <b>Arg-State ("")</b>: Why this message is sent here
 - <b>Source ("")</b>: Who sent this message here

<b>Outputs:</b>
 - <b>State with Arguments</b>: String stands for state with arguments

### String History Cacher.vi

Return the <b>String Cache</b> containing <b>length</b> number of characters, including the new input <b>String</b>.

<b>Inputs:</b>
 - <b>String</b>: History item string
 - <b>length</b>: max history length of cache.
 - <b>Include Timestamp(F)</b>: Include timestamp in the from of every line or not

<b>Outputs:</b>
 - <b>String Cache</b>: The history string

### Timeout Selector.vi

Used in User Event Template VI.

<b>Inputs:</b>
 - <b>Timeout Expected</b>: Expected timeout
 - <b>Remaining States</b>: If any remaining states left, output will be 0, otherwise, output is the expected value.

<b>Outputs:</b>
 - <b>Timeout</b>: timeout will be used.

### Trim Both Whitespace.vi

Removes all ASCII white space (spaces, tabs, carriage returns, and linefeed) from the beginning, end, or both ends of <B>string</B>. The Trim Whitespace VI does not remove double byte characters.

<b>Inputs:</b>
 - <b>string</b>

<b>Outputs:</b>
 - <b>trimmed string</b>

### uuid.vi

Generate <b>Universally Unique Identifier(UUID)</b> according to the standard methods. For example:

     - 59703F3AD837
     - 106A470BA5EC
     - 9B781DB313AF

<b>Inputs:</b>
 - N/A

<b>Outputs:</b>
 - <b>UUID</b>: Generated UUID

### CSM - Broadcast Message Type.ctl

Broadcast Message Type definition.
- <b>Interrupt:</b> High Priority
- <b>Status:</b> Normal Priority

### CSM - Message Type.ctl

Message Type definition.
- <b>Async:</b> Async Message (->)
- <b>Async without Reply:</b> Async Message without reply (->|)
- <b>Sync:</b> Sync Message (-@)

### Global Log To String.vi

<b>Inputs:</b>
 - <b>Log</b>:

<b>Outputs:</b>
 - <b>String</b>:

## Add State(s) to Queue By BOOL++.vi



## Build State String with Arguments++.vi
Builds a state string that contains arguments for the JKI State Machine.
<B>For Example:</B> If State = A and Arguments = B then State with Arguments = A >> B

For instructions on how to use the JKI State Machine, examples and video tutorials, visit:
http://jkisoft.com/state-machine/

<B>Inputs:</B>
     <B>State:</B> The State string that requires the argument.
     <B>Arguments:</B> The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output. <B>Note:</B> The arguments input must not contain any unprintable characters like linefeed or carriage return.

<B>Outputs:</B>
     <B>State with Arguments:</B> This output returns the new string that contains the State and the Argument. <B>For Example:</B> If State = A and Arguments = B then State with Arguments = A >> B



## JKI State Machine ++ No-Event Structure.vi



## JKI State Machine ++ With Event Structure.vi



## Parse State Queue++.vi
Parses the JKI State Machine state queue and returns the current state that will execute next with the associated arguments.

For instructions on how to use the JKI State Machine, examples and video tutorials, visit:
http://jkisoft.com/state-machine/

<B>Inputs:</B>
     <B>State Queue:</B> The entire state queue is wired to this input. This should come from the main JKI State Machine shift register.
     <B>Error In</B> The error cluster from the JKI State Machine is wired to this input. If an error occures and appears on this input, the current state output returns the "Error Handler" state.

<B>Outputs:</B>
     <B>Remaining States:</B> Returns all the next states that should execute after the current state completes. These should be passed through the current state in the state machine. These can also be modified or augmented within the current state if necessary.
     <B>Current State:</B> Returns the current state that should execute next in the state machine. If an error is wired to the Error input then the current state output becomes "Error Handler".
     <B>Arguments:</B>  Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters. <B>Note:</B> The arguments variable must not contain any unprintable characters like linefeed or carriage return.

<B>State Syntax:</B>
StateCategory: State >> Argument
Line Terminator: Line feed
     <B>Example:</B>
UI: Help >> About

Where "UI" is the state category
Where "Help" is the state
Where "About" is the argument
     <B>Other Examples:</B>
App Data: Initialize
UI: Initialize
Help >> About

<B>Commenting:</B>
To add a comment use "//"and all text to the right will be ignored
     <B>Commenting Example:</B>
UI: Initialize // This initializes the UI
// Another comment line

## JKISM++ Broadcast Status Change.vi
Concatenates states in the JKI State Machine. Unwired inputs are safely ignored and will not be added to the state queue.

For instructions on how to use the JKI State Machine, examples and video tutorials, visit:
http://jkisoft.com/state-machine/

<B>Inputs:</B>
     <B>State(s) in Front:</B> This allows you to place new states in the front of the state machine queue. The default is an empty string.
     <B>State(s) in:</B> Wire the existing states to this input. The default is an empty string.
     <B>State(s) in Back:</B> This allows you to place new states in the back of the state machine queue.  The default is an empty string.

<B>Outputs:</B>
     <B>States Out:</B>This output returns a concatenation of all the inputs seperated by a line feed character. The line feed character is required by the JKI State Machine.



## JKISM++ Check If Module Exists.vi



## JKISM++ Compact Multiple States.vi



## JKISM++ Convert Data to HexStr.vi



## JKISM++ Convert HexStr to Data.vi



## JKISM++ Destroy Global Log Event.vi



## JKISM++ Get New State Notifier Event.vi



## JKISM++ Global Log Event.vi



## JKISM++ List Modules.vi



## JKISM++ Mark As Worker Module.vi



## JKISM++ Module Status.vi



## JKISM++ Post Message.vi



## JKISM++ Registrer Status Change.vi



## JKISM++ Send Message and Wait for Reply.vi



## JKISM++ Start Async Call.vi



## JKISM++ Synchronized Call.vi



## JKISM++ Unregistrer Status Change.vi



## JKI State Machine ++ With Event Structure - Tiny.vi



## Build Error Cluster.vi
Creates an error cluster, building the source string from the calling VIs call chain in a standard LabVIEW fashon.  Builds source string as:

"<B>Calling VI</B> in <B>Calling VI's Caller</B>-><B>Calling VI's Caller's Caller</B>->etc...->etc..."

Optional 'String to Prepend to source ("")' string input is used to add extra descriptive info to the source string.  This string, if present, will be enclosed in parenthesis and prepended to the source string.


## Build Internal State String.vi
Builds a state string that contains arguments for the JKI State Machine.
<B>For Example:</B> If State = A and Arguments = B then State with Arguments = A >> B

For instructions on how to use the JKI State Machine, examples and video tutorials, visit:
http://jkisoft.com/state-machine/

<B>Inputs:</B>
     <B>State:</B> The State string that requires the argument.
     <B>Arguments:</B> The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output. <B>Note:</B> The arguments input must not contain any unprintable characters like linefeed or carriage return.

<B>Outputs:</B>
     <B>State with Arguments:</B> This output returns the new string that contains the State and the Argument. <B>For Example:</B> If State = A and Arguments = B then State with Arguments = A >> B



## String History Cacher.vi
Return the <b>String Cache</b> containing <b>length</b> number of characters, including the new input <b>String</b>.


## Timeout Selector.vi



## Trim Both Whitespace.vi
Removes all ASCII white space (spaces, tabs, carriage returns, and linefeeds) from the beginning, end, or both ends of <B>string</B>. The Trim Whitespace VI does not remove double byte characters.


## uuid.vi
Generate <b>Universally Unique Identifier(UUID)</b> according to the standard methods.


## JKISM++ Broadcast Message Type.ctl



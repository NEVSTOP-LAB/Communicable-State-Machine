
## JKISM++ No-Event Structure Template.vi

Template for building JKISM++ Module without User Interface.

<b>Inputs:</b>
- <b>Name("" to use uuid)</b>: Module Name will be used.
   - If Input is "", an uuid will be used for module name. The module is marked as stand-alone mode and will not be included in module list.
   - If Input end with '#', the module will worked in worker mode. Modules with the same name will shared the same message queue. Any external message will be processed by one of the modules, depends on who is free.
   - Otherwise, the input string will be used as module name, which should be unique in system. JKISM will go to "Critical Error" state if duplicated module name is used in system.

<b>Outputs:</b>
 - N/A

## JKISM++ With Event Structure Template.vi

Template for building JKISM++ Module with User Interface. Event Structure is included in template for processing user operations.

<b>Inputs:</b>
 - <b>Name("" to use uuid)</b>: Module Name will be used.
   - If Input is "", an uuid will be used for module name. The module is marked as stand-alone mode and will not be included in module list.
   - Fi Input end with '#', the module will worked in worker mode. Modules with the same name will shared the same message queue. Any external message will be processed by one of the modules, depending who is free.
   - Otherwise, the input string will be used as module name, which should be unique in system. JKISM will  go to "Critical Error" state if duplicated module name is used in system.

<b>Outputs:</b>
 - N/A


## JKISM++ With Event Structure Template - Tiny.vi

Template for building JKISM++ Module without User Interface.

<b>Inputs:</b>
- <b>Name("" to use uuid)</b>: Module Name will be used.
   - If Input is "", an uuid will be used for module name. The module is marked as stand-alone mode and will not be included in module list.
   - Fi Input end with '#', the module will worked in worker mode. Modules with the same name will shared the same message queue. Any external message will be processed by one of the modules, depends on who is free.
   - Otherwise, the input string will be used as module name, which should be unique in system. JKISM will go to "Critical Error" state if duplicated module name is used in system.

<b>Outputs:</b>
 - N/A

## Parse State Queue++.vi

Parses the JKI State Machine state queue and returns the current state that will execute next with the associated arguments.


<b>Inputs:</b>
 - <b>State Queue</b>: The entire state queue is wired to this input. This should come from the main JKI State Machine shift register.
 - <b>Error In (no error)</b>: The error cluster from the JKI State Machine is wired to this input. If an error occures and appears on this input, the current state output returns the "Error Handler" state.
 - <b>Name("" to use uuid)</b>:
 - <b>Response Timeout(5000ms)</b>:
 - <b>Dequeue Timeout(0ms)</b>:
 - <b>Response Arguments</b>:

<b>Outputs:</b>
 - <b>Remaining States</b>:  Returns all the next states that should execute after the current state completes. These should be passed through the current state in the state machine. These can also be modified or augmented within the current state if necessary.
 - <b>Arguments</b>: Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters. <B>Note:</B> The arguments variable must not contain any unprintable characters like linefeed or carriage return.
 - <b>Current State</b>:
 - <b>From Who</b>:
 - <b>Argument - State</b>:
 - <b>Name Used</b>:

<B>State Syntax:</B>

    StateCategory: State >> Argument
    Line Terminator: Line feed

    <B>Example:</B>
        UI: Help >> About
     - Where "UI" is the state category
     - Where "Help" is the state
     - Where "About" is the argument

    <B>Other Examples:</B>

    App Data: Initialize
    UI: Initialize
    Help >> About

    <B>Commenting:</B>
    To add a comment use "//"and all text to the right will be ignored

    <B>Commenting Example:</B>
    UI: Initialize // This initializes the UI
    // Another comment line

## Build State String with Arguments++.vi

Builds a state string that contains arguments for the JKI State Machine.
<B>For Example:</B> If State = A and Arguments = B then State with Arguments = A >> B
For instructions on how to use the JKI State Machine, examples and video tutorials, visit:
http://jkisoft.com/state-machine/

<b>Inputs:</b>
 - <b>State</b>:
 - <b>Arguments ("")</b>:
 - <b>Target Module ("")</b>:
 - <b>Sync-Call(-@) T By Default/Async-Call(->) F</b>:

<b>Outputs:</b>
 - <b>State with Arguments</b>:


## JKISM++ Broadcast Status Change.vi

Broadcast the status change to system. The JKISM++ Module who registered the status will receive the status change.

<b>Inputs:</b>
 - <b>Status with Arguments</b>: The entire state queue is wired to this input.
 - <b>State Queue("")</b>: The entire state queue is wired to this input.
 - <b>Broadcast(T)</b>: Trigger for broadcast or not.

<b>Outputs:</b>
 - <b>Remaining States</b>: Returns all the next states that should execute after the current state completes.


## JKISM++ Check If Module Exists.vi

Check if module with specified name exists.

<b>Inputs:</b>
 - <b>JKISM Name</b>: JKISM Module Name
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>Exist?</b>:
 - <b>JKISM Name(dup)</b>:
 - <b>Error out</b>: Error cluster


## JKISM++ Compact Multiple States.vi

Compact multiple states to a single string for input.

<b>Inputs:</b>
 - <b>States in Lines</b>:

<b>Outputs:</b>
 - <b>States</b>:


## JKISM++ Convert Data to HexStr.vi

Convert complex argument(variant) to hex string, which could be safely used as state argument without broking the string queue logic.

<b>Inputs:</b>
 - <b>Variant</b>:

<b>Outputs:</b>
 - <b>HEX String (0-9,A-F)</b>:


## JKISM++ Convert HexStr to Data.vi

Convert hex string arguments back to variant.

<b>Inputs:</b>
 - <b>HEX String</b>:

<b>Outputs:</b>
 - <b>Variant</b>:


## JKISM++ Destroy Global Log Event.vi

Release JKISM++ Global Log Event Reference.

<b>Inputs:</b>
 - <b>JKISM Global Log Event</b>:
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>Error out</b>: Error cluster


## JKISM++ Get New State Notifier Event.vi

<b>Inputs:</b>
 - <b>Name("" to use uuid) in</b>:
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>New State Notifier Event</b>:
 - <b>Error out</b>: Error cluster


## JKISM++ Global Log Event.vi

Obtain JKISM++ Global Log Event Reference.

<b>Inputs:</b>
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>JKISM Global Log Event</b>:
 - <b>Error out</b>: Error cluster

## JKISM++ List Modules.vi

List all JKISM++ Modules alive in system.

<b>Inputs:</b>
 - <b>Exclude Standalone JKISM(T)</b>:
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>Name</b>:
 - <b>Error out</b>: Error cluster


## JKISM++ Mark As Worker Module.vi

Append '#' to JKISM Name, to mark this module is a worker, who shares the same message queue with workers with the same name. A real name with uuid generated will be assigned to this JKISM module.

<b>Inputs:</b>
 - <b>JKISM Name</b>:

<b>Outputs:</b>
 - <b>JKISM Name(marked as worker)</b>:


## JKISM++ Module Status.vi

Get the JKISM+ Module Status

<b>Inputs:</b>
 - <b>JKISM Name</b>:
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>Mode</b>:
 - <b>#As Worker</b>:
 - <b>#msg to be processed</b>:
 - <b>JKISM Name(dup)</b>:
 - <b>Error out</b>: Error cluster

## JKISM++ Post Message.vi

Post a message to JKISM specified.

<b>Inputs:</b>
 - <b>States</b>:
 - <b>Arguments ("")</b>:
 - <b>Target Module</b>:
 - <b>Error In (no error)</b>: Error cluster

<b>Outputs:</b>
 - <b>error IO</b>: Error cluster


## JKISM++ Register Status Change.vi

Register for notification of other JKISM++ Module's status change. If "Response Message" is not connected or "" is the input, the same state name will be used for acting message.

<b>Inputs:</b>
 - <b>Source JKISM Name (* as Default)</b>:
 - <b>JKISM Name</b>:
 - <b>Status</b>:
 - <b>Response Message (if "", same as Source Message)</b>:
 - <b>Priority(T:As Status,F:As Interrupt)</b>:
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>JKISM Name(dup)</b>:
 - <b>Error out</b>: Error cluster


## JKISM++ Send Message and Wait for Reply.vi

Send a message to JKISM specified and wait for the reply with timeout.

<b>Inputs:</b>
 - <b>States</b>:
 - <b>Response Timeout(1000ms)</b>:
 - <b>Target Module</b>:
 - <b>Arguments ("")</b>:
 - <b>Error In (no error)</b>: Error cluster

<b>Outputs:</b>
 - <b>Arguments</b>:
 - <b>error IO</b>: Error cluster


## JKISM++ Start Async Call.vi

VI snippet for dropping start async call template code from LabVIEW Quick Drop.

<b>Inputs:</b>
 - N/A

<b>Outputs:</b>
 - N/A


## JKISM++ Synchronized Call.vi

VI snippet for dropping sync call template code from LabVIEW Quick Drop.

<b>Inputs:</b>
 - N/A
 -
<b>Outputs:</b>
 - N/A


## JKISM++ Unregister Status Change.vi

Unregister the notification of other JKISM++ Module's status change.

<b>Inputs:</b>
 - <b>JKISM Name</b>:
 - <b>Source JKISM Name</b>:
 - <b>Status</b>:
 - <b>Error in</b>: Error cluster

<b>Outputs:</b>
 - <b>JKISM Name(dup)</b>:
 - <b>Error out</b>: Error cluster

## Build Error Cluster.vi

Creates an error cluster, building the source string from the calling VIs call chain in a standard LabVIEW fashon.  Builds source string as:
"<B>Calling VI</B> in <B>Calling VI's Caller</B>-><B>Calling VI's Caller's Caller</B>->etc...->etc..."
Optional 'String to Prepend to source ("")' string input is used to add extra descriptive info to the source string.  This string, if present, will be enclosed in parenthesis and prepended to the source string.

<b>Inputs:</b>
 - <b>code</b>:
 - <b>String to Prepend to source ("")</b>:

<b>Outputs:</b>
 - <b>error out</b>: Error cluster


## Build Internal State String.vi

Build a state string that contains arguments for the JKI State Machine.

<b>Inputs:</b>
 - <b>State</b>:
 - <b>Arguments ("")</b>:
 - <b>Source ("")</b>:
 - <b>Arg-State ("")</b>:

<b>Outputs:</b>
 - <b>State with Arguments</b>:


## String History Cacher.vi

Return the <b>String Cache</b> containing <b>length</b> number of characters, including the new input <b>String</b>.

<b>Inputs:</b>
 - <b>String</b>:
 - <b>length</b>:
 - <b>Include Timestamp(F)</b>:

<b>Outputs:</b>
 - <b>String Cache</b>:
s

## Timeout Selector.vi

Used in User Event Template VI.

<b>Inputs:</b>
 - <b>Timeout Expected</b>:
 - <b>Remaining States</b>:

<b>Outputs:</b>
 - <b>Timeout</b>:


## Trim Both Whitespace.vi

Removes all ASCII white space (spaces, tabs, carriage returns, and linefeeds) from the beginning, end, or both ends of <B>string</B>. The Trim Whitespace VI does not remove double byte characters.

<b>Inputs:</b>
 - <b>string</b>

<b>Outputs:</b>
 - <b>trimmed string</b>


## uuid.vi

Generate <b>Universally Unique Identifier(UUID)</b> according to the standard methods. For example:

     - 59703F3AD837
     - 106A470BA5EC
     - 9B781DB313AF

<b>Inputs:</b>
 - N/A

<b>Outputs:</b>
 - <b>UUID</b>: Generated UUID


## JKISM++ Broadcast Message Type.ctl

Broadcast Message Type definition.
- <b>Interrupt:</b> High Priority
- <b>Status:</b> Normal Priority
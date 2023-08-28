# Template Description

## README FIRST
This VI template should be used by dragging & dropping it from the Functions palette onto the Block Diagram of a new, blank VI, which will place it's contents into the blank VI.
Do not edit the VI found in the palette.  Only edit the state machine after it is placed into your blank VI.

For instructions on how to use the JKI State Machine, examples and video tutorials, visit: http://jki.net/state-machine/

JKI State Machine?
http://jki.net/state-machine/
Copyright (C) 2005-2018, JKI <info@jki.net>
ALL RIGHTS RESERVED

For information about JKISM++, visit: https://github.com/NEVSTOP-LAB

## State Syntax
Examples:
    // Local Message Example
    DoSth: DoA >> Arguments

    // Sync Call Example
    API: xxxx >> Arguments -@ TargetModule

    // Async Call Example
    API: xxxx >> Arguments -> TargetModule

    // Async Call without Reply Example
    API: xxxx >> Arguments ->| TargetModule

    // Broadcast Status:
    Status >> StatusArguments  -> <all>


## Commenting
To add a comment use "//" or "#" and all text to the right will be ignored

Commenting Example:
UI: Initialize // This initializes the UI
// Another comment line

### Name of the JKISM
If you won't post any state from other JKISM, leave this control blank.


### This controls the loop rate
It means wait forever until new state is coming or user operation is detected in Event Structure

## Case Description

## "Default"
this is used to capture unhandled states and typos

## "Documentation"
Case for holding JKISM++ Documenation

### "Idle/Event Handler"
executes when the state queue is empty

#### "New State Notifier Event"
This user event is used to break out JKISM from waiting in the event structure, to process the next state from external. DO NOT place any code here unless you really need to.

#### Discard Panel Close?
Discard the event because we'll close the front panel ourselves in Macro: Exit

### "Error Handler"
You can also output any states to clean-up after errors occur


### "Critical Error"
When any un-recoverable error occurs, JKISM goes into this case.


#### Stop in Critical Error
When Critical Error occurs, Stop the loop immediately. Do NOT change this unless you fully understand the impact.


### "Target Busy Error"
When this JKISM try to communicate with a Busy target, this JKISM goes into this case.


### "Target Timeout Error"
When this JKISM could not get the sync-call response in time, this JKISM goes into this case.


### "Target Error"
When this JKISM try to communicate with an un-existed JKISM, this JKISM goes into this case.


### "Async Response"
Handle Async-call Response ("Async Response" for ->)


### "Response"
Handle Sync-call Response ("Response" for -@)


#### Response Comments
After Message is executed, JKISM+ goes to this state for receive the response.
    For Async Message(->), "Async Response" is used. This JKISM will goes to "Async Message Posted" immediately and receive the "Async Response" after the callee finishes the message.
    For Sync Message(@),  This JKISM will wait until the message is done and immediately goes to "Response"


### "Async Message Posted"
After Async Message is posted (-> or ->| ), JKISM+ goes to this state for post-action.
You can use Argument - State to tell which Async Message is called.


### "Initialize Core Data"
This is used to determine panel behavior on exit


### "Exit"
Case for exiting the loop. No errors that occur here will be handled.


### "Data: Initialize"
Initialize the shift-register data, here.
(data names are defined by what you wire into the bundle function)


### "Data: Cleanup"
Cleanup any data and references, here.
(this is called automatically, by the Macro: Exit)


### "Events: Register"
Register user event. New Message Event is registered to break JKISM waiting in event structure by default.


#### Register New Message Event
Register message event to break Waiting in Event structure.


### "Events: Unregister"
Unregister user event.

### "UI: Initialize"
Initialize the User Interface, here.
(this is called automatically, by the Macro: Init)


### "UI: Cursor Set"
Set and Unset Cursor Busy.
(Usage: "UI: Cursor Set >> Busy|Idle")


### "UI: Front Panel State"
Set Front Panel Open or Closed
(Usage: "UI: Front Panel State >> Open|Close")


### "Macro: Initialize"
Initialization Macro (This is called once, when the VI starts)


### "Macro: Exit"
Exit Macro (This is called once, when the VI exits)


### API Example
Copy/Rename this case for your own API

#### >> From Who >>
If you need to tell who triggered this state , use this string. If it's this case itself, this string is "".


#### >> Arguments >>
Deal with the parameter if any


#### Response
Connect this to return the response of your API


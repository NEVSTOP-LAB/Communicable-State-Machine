# JKI State Machine ++
基于 JKISM 的过程编程框架

![image](https://github.com/NEVSTOP-LAB/JKI-State-Machine-Plus/assets/8196752/c2633256-ab64-4805-b2fc-71f3f75f732e)

### Documentation

```      
State Syntax:
StateCategory: State >> Argument @|-> JKISMName
Line Terminator: Line feed

Example:
UI: Help >> About @Main
UI: Help >> About ->Main

Where "UI" is the state category
Where "Help" is the state
Where "About" is the argument
Where "Main" is the Name of JKISM,which actually run the "UI: Help >> About"

    "@" stands for sync state. Current JKISM will wait 
    until the state is finished. 
            - if "Main" named JKISM does not exist, "Target Error" will occur.
            - if "Main" named JKISM is in another sync remote state, "Target Buzy Error" will occur.
            - if "Main" named JKISM could not finish the state in time, "Target Timeout Error" will occur.
            - if everything is right. "Response" will occur with Argument back from "Main" named JKISM. 

    "->" stands for async state. Current JKISM will post the state and continue to next state in next iteration.
            - if "Main" named JKISM does not exist, "Target Error" will occur.
            - if everything is right. "Async Message Posted" will occur.

When duplicated name is used for multiple JKISM module or some framework problem happens, "Critical Error" will occur.

Commenting:
To add a comment use "//" or "#" and all text to the right will be ignored
Commenting Example:
UI: Initialize // This initializes the UI
# This whole line is a comment
// Another comment line
```      

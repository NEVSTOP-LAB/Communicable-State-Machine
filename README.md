# JKI State Machine ++

LabVIEW Application Framework extended from JKI State Machine(JKISM).

![image](https://github.com/NEVSTOP-LAB/JKI-State-Machine-Plus/assets/8196752/5d8a8962-cd7b-4b19-bf9a-fb4e092829a8)

### Documentation

```
State Syntax:
StateCategory: State >> Argument -@|-> JKISMName
Line Terminator: Line feed

Example:
UI: Help >> About -@Main
UI: Help >> About ->Main

Where "UI" is the state category
Where "Help" is the state
Where "About" is the argument
Where "Main" is the Name of JKISM,which actually run the "UI: Help >> About"

    "-@" stands for sync state. Current JKISM will wait
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
To add a comment use "//" and all text to the right will be ignored
Commenting Example:
UI: Initialize // This initializes the UI
// Another comment line
```

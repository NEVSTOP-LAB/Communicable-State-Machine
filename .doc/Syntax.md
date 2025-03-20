``` c++
#CSM State Syntax
    // Local Message Example
    DoSth: DoA >> Arguments

    // Sync Call Example
    API: xxxx >> Arguments -@ TargetModule

    // Async Call Example
    API: xxxx >> Arguments -> TargetModule

    // Async Call without Reply Example
    API: xxxx >> Arguments ->| TargetModule

    // Broadcast normal status:
    Status >> StatusArguments  -><status>

    // Broadcast Interrupt status:
    Interrupt >> StatusArguments  -><interrupt>

    // Register Source Module's status to Handler Module
    Status@Source Module >> API@Handler Module -><register>

    // Unregister Source Module's status
    Status@Source Module >> API@Handler Module -><unregister>

#CSM Commenting
    To add a comment use "//" and all text to the right will be ignored

    UI: Initialize // This initializes the UI
    // Another comment line
```
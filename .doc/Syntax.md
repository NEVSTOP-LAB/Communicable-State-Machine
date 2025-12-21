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

    // Register Source Module's interrupt as status and link to Handler Module’s API
    Interrupt@Source Module >> API@Handler Module -><register as Status>

    // Register Source Module's status as interrupt and link to Handler Module’s API
    Status@Source Module >> API@Handler Module -><register as Interrupt>

    // Unregister Source Module's status
    Status@Source Module >> API@Handler Module -><unregister>

#CSM Commenting
    To add a comment use "//" and all text to the right will be ignored

    UI: Initialize // This initializes the UI
    // Another comment line
```
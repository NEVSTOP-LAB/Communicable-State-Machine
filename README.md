# JKI State Machine++ (JKISM++)

LabVIEW Application Framework extended from JKI State Machine(JKISM).

```
#JKISM++ State Syntax

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

#JKISM++ Commenting
To add a comment use "//" and all text to the right will be ignored

    UI: Initialize // This initializes the UI
    // Another comment line
```

# JKISM++ Template
![image](/.doc/JKISM%2B%2B%20With%20Event%20Structure%20Template.png)

Template Description:
[EN](src/help/NEVSTOP/JKI%20State%20Machine%2B%2B/Template%20Description.md) |
[CN](src/help/NEVSTOP/JKI%20State%20Machine%2B%2B/Template%20Description(CN).md)

## JKISM++ API

![image](.doc/JKISM%2B%2B%20Palette.png)

API Description:
[EN](src/help/NEVSTOP/JKI%20State%20Machine%2B%2B/VI%20Description.md) |
[CN](src/help/NEVSTOP/JKI%20State%20Machine%2B%2B/VI%20Description(CN).md)

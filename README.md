# JKI State Machine++ (JKISM++)

LabVIEW Application Framework extended from JKI State Machine(JKISM). [Wiki for JKISM++](https://github.com/NEVSTOP-LAB/JKI-State-Machine-Plus-Plus/wiki)

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

    // Broadcast normal status:
    Status >> StatusArguments  -> <status>

    // Broadcast Interrupt status:
    Interrupt >> StatusArguments  -> <interrupt>

    // Register Source Module's status to Handler Module
    Status@Source Module >> Handler Module@Handler Module -><register>

    // Unegister Source Module's status
    Status@Source Module >> Handler Module -><unregister>

#JKISM++ Commenting
To add a comment use "//" and all text to the right will be ignored

    UI: Initialize // This initializes the UI
    // Another comment line
```

# JKISM++ Template
![image](/.doc/JKISM%2B%2B%20With%20Event%20Structure%20Template.png)

Template Description:
[EN](src/help/NEVSTOP/JKI%20State%20Machine%2B%2B/Template%20Description(EN).md) |
[CN](src/help/NEVSTOP/JKI%20State%20Machine%2B%2B/Template%20Description(CN).md)

## JKISM++ API

![image](.doc/JKISM%2B%2B%20Palette.png)

API Description:
[EN](src/help/NEVSTOP/JKI%20State%20Machine%2B%2B/VI%20Description(EN).md) |
[CN](src/help/NEVSTOP/JKI%20State%20Machine%2B%2B/VI%20Description(CN).md)

## JKISM++ Arguments Support

| a | b |Description|
|---|---|---|
| Safe String | Build-in | "->\| -> -@ & <- , ; []{}`"  wil be replaced with %[HEXCODE] |
| HexStr | Build-in | Data will be converted as variant and changed to Hex String as paramter |
|[ArrayData](https://github.com/NEVSTOP-LAB/JKISMPP-Array-Parameter-Support) |Addons|Pass the StartPos with array-length of a cirlce buffer for numeric array data|
|[MassData](https://github.com/NEVSTOP-LAB/JKISMPP-MassData-Parameter-Support) |Addons|Data will be converted to memory and saved in a cricle byffer. Pass the StartPos with length as parameter. |
|[API String Arguments](https://github.com/NEVSTOP-LAB/JKISMPP-API-String-Arugments-Support) |Addons|Support plain string as JKISM++ API parameter|

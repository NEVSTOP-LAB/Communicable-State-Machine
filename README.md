# Communicable State Machine (CSM)

[English](./README.md) | [中文](./README(zh-cn).md)

[![Image](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/badge.svg?metric=installs)](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/)
[![Image](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/badge.svg?metric=stars)](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/)
[![GitHub all releases](https://img.shields.io/github/downloads/NEVSTOP-LAB/Communicable-State-Machine/total)](https://github.com/NEVSTOP-LAB/Communicable-State-Machine/releases)

Communicable State Machine (CSM) is a LabVIEW application framework built on JKI State Machine (JKISM). It extends JKISM with keywords for inter-module communication, including Sync-Message, Async-Message, and Status Subscription/Unsubscription—essential features for building reusable code modules. For more information, visit the CSM Wiki: <https://nevstop-lab.github.io/CSM-Wiki/>

- Learn more about JKI State Machine (JKISM): <http://jki.net/state-machine/>
- Learn more about NEVSTOP-LAB: <https://github.com/NEVSTOP-LAB>

![image](.doc/_img/csm-intro.png)

_**CSM API Palette**_

![image](.doc/_img/CSM%20Palette.png)

**Template Description:**  
[English](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/Template%20Description(EN).md) | [中文](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/Template%20Description(zh-cn).md)

**API Description:**  
[English](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description(EN).md) | [中文](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description(zh-cn).md)

## Create Reusable Modules

A reusable module typically doesn't need to communicate with other modules—it only needs to provide an external interface and publish status changes. As long as these two aspects are clearly defined, the module can be called without understanding its internal implementation.

In CSM modules, all cases can be invoked as messages, but it's recommended to use API categories as the external interface. To send status updates, use Status or Interrupt Status to notify external entities of changes.

See _**/Example/1. Create a reusable module**_ to learn how to create a CSM module.

## Use CSM as an Application Framework

In this scenario, inter-module communication relies on message string queue operations. You can generate message strings using the **Build Message with Arguments++.vi** function, or write them directly if you're familiar with the syntax.

``` c++
#CSM State Syntax
    // Local Message
    DoSth: DoA >> Arguments

    // Sync Call
    API: xxxx >> Arguments -@ TargetModule

    // Async Call
    API: xxxx >> Arguments -> TargetModule

    // Async Call without Reply
    API: xxxx >> Arguments ->| TargetModule

    // Broadcast Normal Status
    Status >> StatusArguments -><status>

    // Broadcast Interrupt Status
    Interrupt >> StatusArguments -><interrupt>

    // Register Source Module's Status to Handler Module
    Status@Source Module >> API@Handler Module -><register>

    // Unregister Source Module's Status
    Status@Source Module >> API@Handler Module -><unregister>

#CSM Comments
    // Use "//" to add comments - all text to the right will be ignored
    UI: Initialize // This initializes the UI
    // Another comment line
```

For more syntax information, visit: [Syntax.md](https://github.com/NEVSTOP-LAB/Communicable-State-Machine/tree/main/.doc/Syntax.md)

See _**/Example/2. Caller is CSM Scenario**_ for an example.

## Reuse CSM Modules in Other Frameworks

In this scenario, inter-module communication relies on Post/Send Message APIs and module status change user events.

See _**/Example/3. Caller is Other Framework Scenario**_ for an example.

## CSM Parameter Support

JKISM only supports STRING parameters, but applications need to transmit various data types. The table below lists current parameter support options—some built-in, others requiring addon installation.

| Parameter | Type | Description |
|---|---|---|
| SafeStr | Built-in | Special characters ("->\| -> -@ & <- , ; []{}`") are replaced with %[HEXCODE] |
| HexStr | Built-in | Data is converted to variant and encoded as hex string |
| [MassData](https://github.com/NEVSTOP-LAB/CSM-MassData-Parameter-Support) | Addon | Data is stored in a circular buffer; StartPos with length is passed as parameter |
| [API String Arguments](https://github.com/NEVSTOP-LAB/CSM-API-String-Arugments-Support) | Addon | Supports plain string as CSM API parameter |
| [INI Static Variable](https://github.com/NEVSTOP-LAB/CSM-INI-Static-Variable-Support) | Addon | Provides ${variable} support for CSM |

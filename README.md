# Communicable State Machine (CSM)

[English](./README.md) | [中文](./README(zh-cn).md)

[![Image](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/badge.svg?metric=installs)](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/)
[![Image](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/badge.svg?metric=stars)](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/)
[![GitHub all releases](https://img.shields.io/github/downloads/NEVSTOP-LAB/Communicable-State-Machine/total)](https://github.com/NEVSTOP-LAB/Communicable-State-Machine/releases)

Communicable State Machine (CSM) is a LabVIEW application framework built upon JKI State Machine (JKISM). It follows the JKISM design pattern while extending keywords to describe inter-module message communication mechanisms, including key concepts such as Sync-Message, Async-Message, and status Subscription/Unsubscription—all essential elements for creating reusable code modules. For more information, please visit the CSM Wiki: <https://nevstop-lab.github.io/CSM-Wiki/>

- For more information about JKI State Machine (JKISM), visit: <http://jki.net/state-machine/>
- For more information about NEVSTOP-LAB, visit: <https://github.com/NEVSTOP-LAB>

![image](.doc/_img/csm-intro.png)

_**CSM API**_

![image](.doc/_img/CSM%20Palette.png)

Template Description:
[English](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/Template%20Description(EN).md) | [中文](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/Template%20Description(zh-cn).md)

API Description:
[English](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description(EN).md) | [中文](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description(zh-cn).md)

## Create Reusable Modules

Creating a reusable module typically does not require message interaction with other modules; it only needs to provide an external interface and publish module status changes. Therefore, as long as these two aspects are clearly described, you can call the reusable module without understanding its internal implementation details.

In CSM modules, all cases can be considered as messages for invocation, but it is recommended to use API categories as external interfaces. When sending status updates, notify external entities of changes by sending either Status or Interrupt Status.

Refer to _**/Example/1. Create a reusable module**_ to learn how to create a CSM module.

## Use CSM as an Application Framework Scenario

In this scenario, inter-module communication solely relies on message string queue operations. You can generate a Message string using the "**Build Message with Arguments++.vi**" function. Alternatively, if you are familiar with the rules, you can directly write message description strings.

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

For more syntax information, please visit: [Syntax.md](https://github.com/NEVSTOP-LAB/Communicable-State-Machine/tree/main/.doc/Syntax.md)

Refer to _**/Example/2. Caller is CSM Scenario**_ for an example of this scenario.

## Reuse CSM Module in Another Application Framework

In this scenario, inter-module communication solely relies on Post/Send Message API and module status change user events.

Refer to _**/Example/3. Caller is Other Framework Scenario**_ for an example of this scenario.

## CSM Parameter Support

JKISM only supports the STRING TYPE as a parameter, but there is a wide variety of data that needs to be transmitted. Therefore, parameter support is crucial. The table below lists some of the current ways in which different data types are supported, with some being built-in within CSM and others requiring additional installation through addons.

| Parameter | Type | Description |
|---|---|---|
| Safe String | Built-in | "->\| -> -@ & <- , ; []{}`" will be replaced with %[HEXCODE] |
| HexStr | Built-in | Data will be converted as variant and changed to Hex String as parameter |
|[MassData](https://github.com/NEVSTOP-LAB/CSM-MassData-Parameter-Support) |Addons|Data will be converted to memory and saved in a circle buffer. Pass the StartPos with length as parameter. |
|[API String Arguments](https://github.com/NEVSTOP-LAB/CSM-API-String-Arugments-Support) |Addons|Support plain string as CSM API parameter|
|[INI Static Variable Support](https://github.com/NEVSTOP-LAB/CSM-INI-Static-Variable-Support)|Addons|Offering ${variable} support for CSM|

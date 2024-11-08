# Communicable State Machine(CSM)

[English](./README.md) | [中文](./README(CN).md)

[![Image](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/badge.svg?metric=installs)](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/)
[![Image](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/badge.svg?metric=stars)](https://www.vipm.io/package/nevstop_lib_communicable_state_machine/)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![GitHub all releases](https://img.shields.io/github/downloads/NEVSTOP-LAB/Communicable-State-Machine/total)](https://github.com/NEVSTOP-LAB/Communicable-State-Machine/releases)

Communicable State Machine(CSM) is a LabVIEW application framework that builds upon JKI State Machine(JKISM). It follows the pattern of JKISM and extends the keywords to describe message communication between modules, including concepts such as Sync-Message, Async-Message, Subscription/Unsubscription of status - essential elements for creating reusable code modules. For more information, please visit the CSM wiki: <https://nevstop-lab.github.io/CSM-Wiki/>

- For instructions on JKI State Machine(JKISM), visit: <http://jki.net/state-machine/>
- For information on NEVSTOP-LAB, visit: <https://github.com/NEVSTOP-LAB>

![image](https://github.com/NEVSTOP-LAB/Communicable-State-Machine/assets/8196752/318b9363-083c-40e2-86ef-0106e567b2b3)

_**CSM API**_

![image](.doc/_img/CSM%20Palette.png)

Template Description:
[English](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/Template%20Description(en).md) | [中文](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/Template%20Description(zh-cn).md)

API Description:
[English](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description(en).md) | [中文](src/help/NEVSTOP/Communicable%20State%20Machine(CSM)/VI%20Description(zh-cn).md)

## Create Reuseable Modules

Creating a reusable module typically does not require message interaction with other modules; it only needs to provide an external interface and publish the state of the module. Therefore, as long as these two aspects are clearly described, one can call the reusable module without understanding its internal implementation details.

In CSM modules, all cases can be considered as messages for invocation, but it is recommended to use API category as external interfaces. When sending status updates, notify external entities of changes by sending either Status or Interrupt Status.

Go to _**/Example/1. Create a reusable module**_ to learn how to create a CSM module.

## Use CSM as application framework Scenario

In this scenario, inter-module communication solely relies on message string queue operations. You can generate a Message string using the "**Build Message with Arguments++.vi**" function. Alternatively, if you are familiar with the rules, you can directly utilize message description strings.

``` c
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
    Status@Source Module >> Handler Module -><unregister> // API Name could not be specified.

#CSM Commenting
    To add a comment use "//" and all text to the right will be ignored

    UI: Initialize // This initializes the UI
    // Another comment line
```

Go to _**/Example/2. Caller is CSM Scenario**_ to find an example for this scenario.

## Reuse CSM Module in another Application Framework

In this scenario, inter-module communication solely relies on Post/Send Message API and module status change user event.

Go to _**/Example/3. Caller is Other Framework Scenario**_ to find an example for this scenario.

## CSM Arguments Support

JKISM only supports the STRING TYPE as a parameter, but there is a wide variety of data that needs to be transmitted. Therefore, support for parameters is crucial. The table below lists some of the current ways in which different data types are supported, with some being built-in within CSM and others requiring additional installation through addons.

| Arguments | Type | Description |
|---|---|---|
| Safe String | Build-in | "->\| -> -@ & <- , ; []{}`"  wil be replaced with %[HEXCODE] |
| HexStr | Build-in | Data will be converted as variant and changed to Hex String as parameter |
|[MassData](https://github.com/NEVSTOP-LAB/CSM-MassData-Parameter-Support) |Addons|Data will be converted to memory and saved in a circle buffer. Pass the StartPos with length as parameter. |
|[API String Arguments](https://github.com/NEVSTOP-LAB/CSM-API-String-Arugments-Support) |Addons|Support plain string as CSM API parameter|
|[INI Static Variable Support](https://github.com/NEVSTOP-LAB/CSM-INI-Static-Variable-Support)|Addons|offering ${variable} support for CSM|

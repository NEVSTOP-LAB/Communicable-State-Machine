# CSM Massdata Addon

## 概述

> [!NOTE]
> <b>CSM Massdata参数支持</b>
>
> CSM Massdata参数支持提供了一种高效的参数传递机制，用于在CSM中传递大量数据。通过使用内存高效的引用机制而非直接传输数据，从而提高了参数传递的效率和性能。
> - CSM Massdata定义的参数类型为`<MassData>`，可以通过CSM - Argument Type VI获取。
> - CSM Massdata数据传输是完全无损的，但不适合存储需要无限期持久化的数据。
>
> 注意: Massdata Support内部使用循环缓冲区机制，同一应用程序内的所有CSM模块共享相同的Massdata缓冲区空间。当缓冲区满时，新数据将从开始位置覆盖旧数据。因此需要设置合理的缓冲区大小，确保数据在使用完毕前未被覆盖，避免数据丢失。

> [!NOTE]
> <b>CSM Massdata参数格式</b>
>
> 典型的Massdata数据格式为: `<MassData>Start:8057;Size:4004;DataType:1D I32`。其中:
> - `Start`: 数据在内存中的起始地址
> - `Size`: 数据的大小(字节数)
> - `DataType(optional)`: 数据的类型，由CSM Data Type String VI定义

## CSM - Config MassData Parameter Cache Size.vi
配置Massdata后台缓存大小，默认值为1 MB。

建议配置适当的缓存大小: 不要太大(避免浪费内存)，也不要太小(防止频繁覆盖)。可以利用提供的调试工具监控缓存使用情况，确定最佳配置。

> - Ref: CSM Massdata参数支持

-- <b>输入控件(Controls)</b> --
- <b>Size (1M)</b>: 缓存大小，单位为字节(Byte)。

## CSM - Convert Argument to MassData.vim
将Massdata参数转换为原始数据。

> - Ref: CSM Massdata参数格式

-- <b>输入控件(Controls)</b> --
- <b>MassData Argument</b>: 输入的Massdata参数。
- <b>Type</b>: 数据类型。

-- <b>输出控件(Indicators)</b> --
- <b>Data</b>: 恢复出的原始数据。

## CSM - Convert MassData to Argument.vim
将数据转换为Massdata参数，此转换得到的Massdata参数不包含数据类型信息。

> - Ref: CSM Massdata参数格式

-- <b>输入控件(Controls)</b> --
- <b>Data</b>: 输入数据。

-- <b>输出控件(Indicators)</b> --
- <b>MassData Argument</b>: 转换后的Massdata参数。

## CSM - Convert MassData to Argument With DataType.vim
将数据转换为Massdata参数，此转换得到的Massdata参数包含数据类型信息。

> - Ref: CSM Massdata参数格式

-- <b>输入控件(Controls)</b> --
- <b>Data</b>: 输入数据。

-- <b>输出控件(Indicators)</b> --
- <b>MassData Argument</b>: 转换后的Massdata参数。

## CSM - MassData Data Type String.vi
从Massdata参数中提取数据类型字符串。

> - Ref: CSM Massdata参数格式

-- <b>输入控件(Controls)</b> --
- <b>MassData Argument</b>: 输入的Massdata参数。

-- <b>输出控件(Indicators)</b> --
- <b>MassData Argument(dup)</b>: 输入的 massdata 参数副本。
- <b>Data Type String</b>: 解析出的数据类型字符串。

## CSM - MassData Parameter Status.vi
读取Massdata后台缓存的状态信息。

-- <b>输出控件(Indicators)</b> --
- <b>Active Read Operation</b>: 上次读操作的信息，包括起始地址与长度。
- <b>Active Write Operation</b>: 上次写操作的信息，包括起始地址与长度。
- <b>Cache Size</b>: 后台缓存大小，单位为字节(Byte)。

## CSM - MassData Update Status Indicator.vi
辅助VI，用于根据缓存状态更新界面指定的Massdata缓存显示控件，可更加直观地展示缓存的使用情况。

-- <b>输入控件(Controls)</b> --
- <b>MassData Status Indicator</b>: Massdata缓存显示控件引用。

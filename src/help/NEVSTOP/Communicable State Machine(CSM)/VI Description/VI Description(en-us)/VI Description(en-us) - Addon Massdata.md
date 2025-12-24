# CSM Massdata Addon

## Overview

> [!NOTE]
> <b>CSM Massdata Argument Support</b>
>
> CSM Massdata argument support provides an efficient argument passing mechanism for transferring large amounts of data within CSM. By using a memory-efficient reference mechanism instead of direct data transfer, CSM Massdata improves the efficiency and performance of argument passing.
> - The argument type defined by CSM Massdata is `<MassData>`, which can be obtained using the CSM - Argument Type VI.
> - Data transmission of CSM Massdata is completely lossless. However, it is not suitable for storing data that requires indefinite persistence.
>
> <b>Note</b>: CSM Massdata internally uses a circular buffer mechanism. All CSM modules within the same application share the same Massdata buffer space. When the buffer is full, new data will overwrite old data starting from the beginning. Therefore, you need to set a reasonable buffer size to ensure that data is not overwritten before use, avoiding data loss.

> [!NOTE]
> <b>CSM Massdata Argument Format</b>
>
> A typical Massdata data format is: `<MassData>Start:8057;Size:4004;DataType:1D I32`.
>
> where:
> - `Start`: The starting address of the data in memory.
> - `Size`: The size of the data in bytes.
> - `DataType(optional)`: The type of the data, defined by the CSM Data Type String VI.

## CSM - Config MassData Parameter Cache Size.vi
Configures the Massdata background cache size. The default value is 1 MB.

It is recommended to configure an appropriate cache size that is not too large to avoid wasting memory and not too small to prevent frequent overwrites. You can use the provided debugging tools to monitor cache usage and determine the optimal configuration.

> - Ref: CSM Massdata Argument Support

-- <b>Controls</b> --
- <b>Size (1M)</b>: Cache size in bytes. The default is 1 MB.

## CSM - Convert Argument to MassData.vim
Converts a Massdata argument back to raw data.

> - Ref: CSM Massdata Argument Format

-- <b>Controls</b> --
- <b>MassData Argument</b>: Input Massdata argument.
- <b>Type</b>: Data type.

-- <b>Indicators</b> --
- <b>Data</b>: The restored raw data.

## CSM - Convert MassData to Argument.vim
Converts data into a Massdata argument. The Massdata argument obtained from this conversion does not contain data type information.

> - Ref: CSM Massdata Argument Format

-- <b>Controls</b> --
- <b>Data</b>: Input data.

-- <b>Indicators</b> --
- <b>MassData Argument</b>: The converted Massdata argument.

## CSM - Convert MassData to Argument With DataType.vim
Converts data into a Massdata argument. The Massdata argument obtained from this conversion contains data type information.

> - Ref: CSM Massdata Argument Format

-- <b>Controls</b> --
- <b>Data</b>: Input data.

-- <b>Indicators</b> --
- <b>MassData Argument</b>: The converted Massdata argument.

## CSM - MassData Data Type String.vi
Extracts the data type string from a Massdata argument.

> - Ref: CSM Massdata Argument Format

-- <b>Controls</b> --
- <b>MassData Argument</b>: Input Massdata argument.

-- <b>Indicators</b> --
- <b>MassData Argument(dup)</b>: A copy of the input Massdata argument.
- <b>Data Type String</b>: The parsed data type string.

## CSM - MassData Parameter Status.vi
Reads the status information of the Massdata background cache.

-- <b>Indicators</b> --
- <b>Active Read Operation</b>: Information about the last read operation, including start address and length.
- <b>Active Write Operation</b>: Information about the last write operation, including start address and length.
- <b>Cache Size</b>: Background cache size in bytes.

## CSM - MassData Update Status Indicator.vi
Helper VI to update the specified Massdata cache display control on the UI based on the cache status, allowing for a more intuitive visualization of cache usage.

-- <b>Controls</b> --
- <b>MassData Status Indicator</b>: Reference to the Massdata cache display control.

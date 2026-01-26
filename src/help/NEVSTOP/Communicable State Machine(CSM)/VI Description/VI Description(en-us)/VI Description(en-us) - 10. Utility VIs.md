# Utility VIs

## State String Operations

### CSM - Compact Multiple States.vi
Compacts multiple states into a single string for input usage.

> - Ref: Message Building API

-- <b>Controls</b> --
- <b>Multiple States</b>: Array of CSM state strings.

-- <b>Indicators</b> --
- <b>States</b>: String containing multiple lines of CSM state strings.

### CSM - Break Down Multiple States String.vi
Breaks down a string containing multiple lines of CSM state strings into an array of CSM state strings.

> - Ref: Message Building API

-- <b>Controls</b> --
- <b>States</b>: String containing multiple lines of CSM state strings.

-- <b>Indicators</b> --
- <b>Multiple States</b>: Array of CSM state strings.

### CSM - Build Exit Messages of CSMs.vi
Concatenates and generates exit messages (`Macro: Exit`) based on input CSM module names.

> - Ref: Message Building API

-- <b>Controls</b> --
- <b>CSMs</b>: Array of CSM module names.
- <b>State with Arguments("Macro: Exit")</b>: Exit message.

-- <b>Indicators</b> --
- <b>States</b>: The concatenated generated CSM message string.

### CSM - Filter Duplicate Messages By Name.vi
Filters duplicate messages, keeping only the latest message.

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>States</b>: Input message string.
- <b>Whole Messages in Check?(T)</b>: Whether to check the entire message string. If FALSE, only the message name is checked. The default is TRUE.

-- <b>Indicators</b> --
- <b>Filtered States</b>: Filtered message string.

### CSM - Remove Duplicated Following Messages.vi

> - Ref: CSM State Queue Operation API

-- <b>Controls</b> --
- <b>Current State</b>:
- <b>Remaining States</b>:

-- <b>Indicators</b> --
- <b>Remaining States Left</b>:
- <b>Current State</b>: Controls
- <b>Remaining States Left</b>: Indicators

## Data Type String Description

### CSM Data Type String.vi
Obtains the data type description string corresponding to the input data. Typically used in argument descriptions to determine the type of arguments carried.

-- <b>Controls</b> --
- <b>Data</b>: Input data.

-- <b>Indicators</b> --
- <b>Data Type String</b>: Data type description string.

### CSM Data Type String to Enum.vi
Converts a data type description string into a LabVIEW-defined data type enum.

> [!NOTE]
> <b>Polymorphic VI Options</b>
> - CSM Data Type String to Enum(String).vi
> - CSM Data Type String to Enum(TypeEnum).vi
> - CSM Data Type String to Enum(RefnumEnum).vi

#### CSM Data Type String to Enum(String).vi
Converts a data type description string into a LabVIEW-defined data type enum, with the subtype described as a string.

-- <b>Controls</b> --
- <b>Data Type String</b>: Input data type description string.

-- <b>Indicators</b> --
- <b>Primary Type</b>: Data type enum.
- <b>Secondary Type String</b>: If the input is a complex data type, returns the subtype string, such as the element type in an array data type.
- <b>Array Dim</b>: If the input is an array data type, returns the array dimensions.

#### CSM Data Type String to Enum(TypeEnum).vi
Converts a data type description string into a LabVIEW-defined data type enum and returns the array subtype using an enum.

-- <b>Controls</b> --
- <b>Data Type String</b>: Input data type description string.

-- <b>Indicators</b> --
- <b>Primary Type</b>: Data type enum.
- <b>Secondary Type String</b>: Array subtype enum.
- <b>Array Dim</b>: If the input is an array data type, returns the array dimensions.

#### CSM Data Type String to Enum(RefnumEnum).vi
Converts a data type description string into a LabVIEW-defined data type enum and returns the refnum subtype using an enum.

-- <b>Controls</b> --
- <b>Data Type String</b>: Input data type description string.

-- <b>Indicators</b> --
- <b>Primary Type</b>: Data type enum.
- <b>Secondary Type String</b>: Refnum subtype enum.
- <b>Array Dim</b>: If the input is an array data type, returns the array dimensions.

## Other Utility VIs

### uuid.vi
Generates a standard Universally Unique Identifier (UUID). For example:
- 59703F3AD837
- 106A470BA5EC
- 9B781DB313AF

-- <b>Indicators</b> --
- <b>UUID</b>: Generated UUID.

### String History Cacher.vi
Saves the current input string to the cache. When the cached history strings exceed the maximum length limit, the oldest cached string is overwritten. Use this VI for debugging CSM history states.

-- <b>Controls</b> --
- <b>String</b>: String to be cached.
- <b>length</b>: Maximum string length for cached history strings.
- <b>Include Timestamp? (T)</b>: Whether to include a timestamp at the beginning of each line.
- <b>Format String</b>: Timestamp format.

-- <b>Indicators</b> --
- <b>String Cache</b>: Cached history strings.

### Random Change Flag.vi
Generates a random numerical value to mark state changes. In CSM, to improve efficiency, caches in some places use this flag to determine if an update is needed.

-- <b>Indicators</b> --
- <b>Random Change Flag</b>: Generated random numerical value.

### State Triggered Reason.vi
Infers the reason for triggering the current state from the <b>Additional Information</b> and <b>Source CSM</b> outputs of the Parse State Queue++ VI.

The result can be:
- <b>LocalCall</b>: Local call, not triggered externally.
- <b>Message</b>: Triggered by an external message.
- <b>Broadcast</b>: Triggered by a broadcast.

-- <b>Controls</b> --
- <b>Additional Information</b>: Additional information for this state.
- <b>Source CSM</b>: Source module information.

-- <b>Indicators</b> --
- <b>Additional Information (dup)</b>: A copy of the input additional information.
- <b>Source CSM (dup)</b>: A copy of the input source module information.
- <b>Reason</b>: The reason for triggering the current state.

### Format Timestamp.vi
Formats a timestamp into a specified string format. This VI is used in the CSM Global Log.

-- <b>Controls</b> --
- <b>Timestamp</b>: Timestamp in seconds.
- <b>Format String</b>: Timestamp format string, for example: `%<%Y/%m/%d %H:%M:%S%3u>T`.

-- <b>Indicators</b> --
- <b>String</b>: Formatted timestamp string.

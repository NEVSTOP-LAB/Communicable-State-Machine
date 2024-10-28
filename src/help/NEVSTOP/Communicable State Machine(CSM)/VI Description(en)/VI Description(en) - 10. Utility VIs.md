# CSM API

## Utility VIs

### CSM - Compact Multiple States.vi

Compact multiple states into a single string for input use.

-- <b>Controls</b> --
- <b>Multiple States</b>: Array of CSM state strings

-- <b>Indicators</b> --
- <b>States</b>: String containing multiple lines of CSM state strings

### CSM - Break Down Multiple States String.vi

Break down a string containing multiple lines of CSM state strings into an array of CSM state strings.

-- <b>Controls</b> --
- <b>States</b>: String containing multiple lines of CSM state strings

-- <b>Indicators</b> --
- <b>Multiple States</b>: Array of CSM state strings

### CSM - Build Exit Messages of CSMs.vi

Input CSM module names to concatenate and generate exit messages ("Macro: Exit").

> Ref: Message Concatenation API

-- <b>Controls</b> --
- <b>CSMs</b>: Array of CSM module names
- <b>State with Arguments("Macro: Exit")</b>: Exit message

-- <b>Indicators</b> --
- <b>States</b>: Concatenated CSM message string

### CSM - Filter Duplicate Messages By Name.vi

Filter duplicate messages, keeping only the latest messages.

> Ref: Message Concatenation API

-- <b>Controls</b> --
- <b>States</b>: Input message string
- <b>Whole Messages in Check?(T)</b>: Whether to check the entire message string. If FALSE, only the message name is checked.

-- <b>Indicators</b> --
- <b>Filtered States</b>: Filtered message string

### CSM - Filter Messages to Non-Existing Modules.vi

Filter messages sent to non-existing modules.
This VI uses CSM - List Modules.vi to get all active CSM modules and then filters out messages sent to non-existing modules.

-- <b>Controls</b> --
- <b>States</b>: Input message string

-- <b>Indicators</b> --
- <b>Filtered States</b>: Filtered message string

### CSM - Remove Duplicated Following Messages.vi

-- <b>Controls</b> --
- <b>Current State</b>:
- <b>Remaining States</b>:

-- <b>Indicators</b> --
- <b>Remaining States Left</b>:

### CSM Data Type String to Enum.vi

### CSM Data Type String.vi

-- <b>Controls</b> --
- <b>Data</b>:

-- <b>Indicators</b> --
- <b>Data Type String</b>:

### Replace Tag with Array.vi

-- <b>Controls</b> --
- <b>Enum</b>:
- <b>replace string</b>:
- <b>single-line text</b>:

-- <b>Indicators</b> --
- <b>States</b>:

### CSM Data Type String to Enum(RefnumEnum).vi

-- <b>Controls</b> --
- <b>Data Type String</b>:

-- <b>Indicators</b> --
- <b>Array Dim</b>:
- <b>Secondary Type</b>:
- <b>Primary Type</b>:

### CSM Data Type String to Enum(String).vi

-- <b>Controls</b> --
- <b>Data Type String</b>:

-- <b>Indicators</b> --
- <b>Array Dim</b>:
- <b>Secondary Type String</b>:
- <b>Primary Type</b>:

### CSM Data Type String to Enum(TypeEnum).vi

-- <b>Controls</b> --
- <b>Data Type String</b>:

-- <b>Indicators</b> --
- <b>Array Dim</b>:
- <b>Secondary Type</b>:
- <b>Primary Type</b>:

### Build Error Cluster.vi

Create an error cluster in the standard LabVIEW way by constructing the source string from the call chain of the calling VI. The constructed source string is in the form:
"<b>Called VI</b> in <b>Caller of the calling VI</b>-><b>Caller of the caller of the calling VI</b>->and so on...->and so on..."
An optional 'String to Prepend to source ("")' string input can be used to add additional descriptive information to the source string. If this string exists, it will be enclosed in parentheses and added before the source string.

-- <b>Controls</b> --
- <b>code</b>: Error code
- <b>String to Prepend to source ("")</b>: Error message string

### Build Internal State String.vi

Construct a string containing JKI state machine states, arguments, and other information.

-- <b>Controls</b> --
- <b>State</b>: State string
- <b>Arguments ("")</b>: Arguments for <b>State</b>
- <b>Arg-State ("")</b>: State of the module sending this message at the time of sending
- <b>Source ("")</b>: Name of the module sending this message

-- <b>Indicators</b> --
- <b>CSM Message String</b>: Concatenated CSM message string

### String History Cacher.vi

Save the current input string to the cache, caching the historical strings. When the maximum length limit is exceeded, the earliest cached string will be overwritten. Used for debugging the historical state of CSM.

-- <b>Controls</b> --
- <b>String</b>: String to be cached
- <b>length</b>: Maximum length of the cached historical strings
- <b>Include Timestamp(F)</b>: Whether to include a timestamp at the beginning of each line.

-- <b>Indicators</b> --
- <b>String Cache</b>: Cached historical strings

### Trim Both Whitespace.vi

Remove all ASCII whitespace characters (spaces, tabs, carriage returns, and line feeds) from the beginning, end, or both.

-- <b>Controls</b> --
- <b>string</b>: String to be processed

-- <b>Indicators</b> --
- <b>trimmed string</b>: Processed string

### uuid.vi

Generate a <b>Universally Unique Identifier (UUID)</b> according to standard methods. For example:
- 59703F3AD837
- 106A470BA5EC
- 9B781DB313AF

-- <b>Indicators</b> --
- <b>UUID</b>: Generated UUID

### Random Change Flag.vi

Generate a random value to mark state changes. In CSM, this flag is used in some places to determine whether the cache needs to be updated for efficiency.

-- <b>Indicators</b> --
- <b>Random Change Flag</b>: Generated random value

### Global Log To String.vi

Convert the global log data cluster to a string.

-- <b>Controls</b> --
- <b>Log</b>: Global log data cluster

-- <b>Indicators</b> --
- <b>Log String</b>: Global log string

### U8 Data to Hex Str.vi

-- <b>Controls</b> --
- <b>u8 Data[]</b>:

-- <b>Indicators</b> --
- <b>HEX String (0-9,A-F)</b>:

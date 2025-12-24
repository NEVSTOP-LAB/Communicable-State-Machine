# CSM API

## CSM Internal

### Naming Check.vi

-- <b>Controls(输入控件)</b> --
- <b>Name("" to use uuid)</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters

-- <b>Indicators(输出控件)</b> --
- <b>Name(dup)</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters
- <b>Name ("" to Use UUID)</b>:Controls
- <b>Name (Dup)</b>:Indicators
### Check.vi

-- <b>Controls(输入控件)</b> --
- <b>BroadcastRegistry in</b>:
- <b>Status</b>:
- <b>Source</b>:
- <b>Target</b>:

-- <b>Indicators(输出控件)</b> --
- <b>BroadcastRegistry out</b>:
- <b>Response Message Info</b>:
- <b>BroadcastRegistry In</b>:Controls
- <b>BroadcastRegistry Out</b>:Indicators
- <b>Response Message Info</b>:Indicators
- <b>Source</b>:Controls
- <b>Status</b>:Controls
### Delete Source Module.vi

-- <b>Controls(输入控件)</b> --
- <b>BroadcastRegistry in</b>:
- <b>Source</b>:

-- <b>Indicators(输出控件)</b> --
- <b>BroadcastRegistry out</b>:
- <b>BroadcastRegistry In</b>:Controls
- <b>BroadcastRegistry Out</b>:Indicators
### Delete Target Module.vi

-- <b>Controls(输入控件)</b> --
- <b>BroadcastRegistry in</b>:
- <b>Source</b>:

-- <b>Indicators(输出控件)</b> --
- <b>BroadcastRegistry out</b>:
- <b>BroadcastRegistry In</b>:Controls
- <b>BroadcastRegistry Out</b>:Indicators
### Initialize.vi

-- <b>Controls(输入控件)</b> --
- <b>BroadcastRegistry in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>BroadcastRegistry out</b>:
- <b>BroadcastRegistry Out</b>:Indicators
### List Entries.vi

-- <b>Controls(输入控件)</b> --
- <b>BroadcastRegistry in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>BroadcastRegistry out</b>:
- <b>Array</b>:
- <b>Array</b>:Indicators
- <b>BroadcastRegistry Out</b>:Indicators
### List Status in Registry.vi

-- <b>Controls(输入控件)</b> --
- <b>BroadcastRegistry in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>BroadcastRegistry out</b>:
- <b>Status</b>:
- <b>BroadcastRegistry Out</b>:Indicators
- <b>Status</b>:Indicators
### Register.vi

-- <b>Controls(输入控件)</b> --
- <b>BroadcastRegistry in</b>:
- <b>status</b>:
- <b>source</b>:
- <b>api</b>:
- <b>target</b>:

-- <b>Indicators(输出控件)</b> --
- <b>BroadcastRegistry out</b>:
- <b>Api</b>:Controls
- <b>BroadcastRegistry In</b>:Controls
- <b>BroadcastRegistry Out</b>:Indicators
- <b>Source</b>:Controls
- <b>Status</b>:Controls
### Remove Module.vi

-- <b>Controls(输入控件)</b> --
- <b>BroadcastRegistry in</b>:
- <b>Source</b>:

-- <b>Indicators(输出控件)</b> --
- <b>BroadcastRegistry out</b>:
- <b>BroadcastRegistry In</b>:Controls
- <b>BroadcastRegistry Out</b>:Indicators
### Unregister.vi

-- <b>Controls(输入控件)</b> --
- <b>BroadcastRegistry in</b>:
- <b>Status</b>:
- <b>Source</b>:
- <b>api</b>:
- <b>Target</b>:

-- <b>Indicators(输出控件)</b> --
- <b>BroadcastRegistry out</b>:
- <b>Api</b>:Controls
- <b>BroadcastRegistry In</b>:Controls
- <b>BroadcastRegistry Out</b>:Indicators
- <b>Source</b>:Controls
- <b>Status</b>:Controls
### Broadcast Item Key.vi

-- <b>Controls(输入控件)</b> --
- <b>status</b>:
- <b>target</b>:
- <b>source</b>:

-- <b>Indicators(输出控件)</b> --
- <b>key</b>:
- <b>Key</b>:Indicators
- <b>Status</b>:Controls
- <b>Target</b>:Controls
### Preview.vi

-- <b>Controls(输入控件)</b> --
- <b>BroadcastRegistry in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Registry</b>:
- <b>BroadcastRegistry out</b>:
- <b>BroadcastRegistry Out</b>:Indicators
- <b>Registry</b>:Indicators
### Remove response API from List.vi

-- <b>Controls(输入控件)</b> --
- <b>API</b>:
- <b>output cluster in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>output cluster out</b>:
- <b>API</b>:Controls
- <b>Output Cluster Out</b>:Indicators
### Concatenate State with Arguments.vi

-- <b>Controls(输入控件)</b> --
- <b>Arguments</b>:
- <b>State</b>:

-- <b>Indicators(输出控件)</b> --
- <b>State with Arguments</b>:
- <b>Arguments</b>:Controls
- <b>State With Arguements</b>:Indicators
### CSM-Name to CSM-Mode.vi

-- <b>Controls(输入控件)</b> --
- <b>String</b>:

-- <b>Indicators(输出控件)</b> --
- <b>ParentCSM Name</b>:
- <b>CSM Mode</b>:
- <b>Requested Name</b>:
- <b>CSM Mode</b>:Indicators
- <b>ParentCSM Name</b>:Indicators
- <b>Requested Name</b>:Indicators

### Hex Str to U8 Data.vi

-- <b>Controls(输入控件)</b> --
- <b>HEX String (0-9,A-F)</b>:

-- <b>Indicators(输出控件)</b> --
- <b>u8 Data[]</b>:
- <b>HEX String (0-9,A-F)</b>:Controls
- <b>U8 Data[]</b>:Indicators
### Parse Next Single-line State.vi

-- <b>Controls(输入控件)</b> --
- <b>States Queue</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Next Single-line State</b>:
- <b>Remaining States Queue</b>:

### Remove Comments from Line.vi

-- <b>Controls(输入控件)</b> --
- <b>single-line text</b>:

-- <b>Indicators(输出控件)</b> --
- <b>single-line text without comments</b>:

### Splite Reason String Part.vi

-- <b>Controls(输入控件)</b> --
- <b>Single-line -& Reason</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM Name</b>:
- <b>`State</b>:
- <b>`Arguments</b>:

### Splite Single-line Message.vi

-- <b>Controls(输入控件)</b> --
- <b>single-line text</b>:

-- <b>Indicators(输出控件)</b> --
- <b>operator</b>:
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:

### Trim Single line Text.vi

-- <b>Controls(输入控件)</b> --
- <b>single-line text</b>:

-- <b>Indicators(输出控件)</b> --
- <b>trimmed text</b>:

### CSM Not Allowed Message.vi

-- <b>Controls(输入控件)</b> --
- <b>State</b>:
- <b>CSM</b>:
- <b>CSM</b>:Controls
- <b>State</b>:Controls
### Cache-Broadcast Registry Search Result.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM Name</b>:
- <b>Broadcast state</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Array</b>:
- <b>Array</b>:Indicators
- <b>CSM Name</b>:Controls
### FGV-BroadcastRegistry.vi

-- <b>Controls(输入控件)</b> --
- <b>Source</b>:
- <b>Target</b>:
- <b>Status</b>:
- <b>API</b>:
- <b>Operation</b>:

-- <b>Indicators(输出控件)</b> --
- <b>response message</b>:
- <b>API</b>:Controls
- <b>Response Message</b>:Indicators
- <b>Source</b>:Controls
- <b>Status</b>:Controls
- <b>Target</b>:Controls
### global-Broadcast Cache Change Flag.vi

全局变量，用于标记广播缓存是否发生变化

### global-CSMQ FGV Change Flag.vi

全局变量，用于标记 CSM 模块管理信息是否发生变化

### global-GEvnt Filter Change Flag.vi

全局变量，用于标记 Global Event 的过滤条件是否发生变化

### Cache-GEvt Filter Object.vi

-- <b>Indicators(输出控件)</b> --
- <b>CSM:LogFilter.lvclass</b>:
- <b>CSM:LogFilter.lvclass</b>:Indicators
### FGV-GEvt Filter Obj.vi

-- <b>Controls(输入控件)</b> --
- <b>Set(T)/Get(F)</b>:
- <b>Rules-v1</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM:LogFilter.lvclass</b>:

### FGV-GlobalEventRef.vi

-- <b>Controls(输入控件)</b> --
- <b>Create(F)</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM Global Log Event</b>:
- <b>Event</b>:Indicators
- <b>Force Destroy?</b>:Controls
- <b>Operation</b>:Controls
- <b>Timeout In ms (5000 ms)</b>:Controls
### FGV-StatusChangeEventRef.vi

-- <b>Controls(输入控件)</b> --
- <b>Name("" to use uuid) in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Status Change Event</b>:

### GEvt-BackgroundThread.vi

### GEvt-Convert Filter Rules - v1.0.vi

-- <b>Controls(输入控件)</b> --
- <b>Rules-v1</b>:

-- <b>Indicators(输出控件)</b> --
- <b>GlobalLogFilter</b>:
- <b>GlobalLogFilter</b>:Indicators
### GEvt-Filter Global Log - v1.0.vi

-- <b>Controls(输入控件)</b> --
- <b>Rules-v1</b>:
- <b>Cross CSM Data (in)</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>Cross CSM Data</b>:Indicators
- <b>Matched Previous?</b>:Controls
- <b>Matched? (Dup)</b>:Indicators
- <b>Rules-v1</b>:Controls
### GEvt-Generate Complete Log.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM Global Log Event</b>:
- <b>event data</b>:
- <b>Enable?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM Global Log Event out</b>:
- <b>CSM Global Log Event Out</b>:Indicators
- <b>CSM Global Log Event</b>:Controls
- <b>CSM:LogFilter.lvclass</b>:Controls
- <b>Event Data</b>:Controls
### GEvt-Generate Interrupt Log.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:
- <b>Arguments</b>:Controls
- <b>CSM Global Log Event Out</b>:Indicators
- <b>CSM Global Log Event</b>:Controls
- <b>CSM:LogFilter.lvclass</b>:Controls
- <b>Current State</b>:Controls
- <b>Event Data</b>:Indicators
- <b>Name ("" to Use UUID)</b>:Controls
### GEvt-Generate Module Created Log.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM Global Log Event</b>:
- <b>Name("" to use uuid)</b>:
- <b>Created?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:
- <b>CSM Global Log Event Out</b>:Indicators
- <b>CSM Global Log Event</b>:Controls
- <b>CSM:LogFilter.lvclass</b>:Controls
- <b>Event Data</b>:Indicators
- <b>Name ("" to Use UUID)</b>:Controls
### GEvt-Generate Module Destroyed Log.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM Global Log Event</b>:
- <b>Name("" to use uuid)</b>:
- <b>Enable?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:
- <b>CSM Global Log Event Out</b>:Indicators
- <b>CSM Global Log Event</b>:Controls
- <b>CSM:LogFilter.lvclass</b>:Controls
- <b>Event Data</b>:Indicators
- <b>Name ("" to Use UUID)</b>:Controls
### GEvt-Generate Register Log.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:
- <b>Arguments</b>:Controls
- <b>CSM Global Log Event Out</b>:Indicators
- <b>CSM Global Log Event</b>:Controls
- <b>CSM:LogFilter.lvclass</b>:Controls
- <b>Current State</b>:Controls
- <b>Event Data</b>:Indicators
- <b>Name ("" to Use UUID)</b>:Controls
### GEvt-Generate Remaining States Log.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM Global Log Event</b>:
- <b>Remaining States</b>:
- <b>Name("" to use uuid)</b>:
- <b>Enable?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:
- <b>CSM Global Log Event Out</b>:Indicators
- <b>CSM Global Log Event</b>:Controls
- <b>CSM:LogFilter.lvclass</b>:Controls
- <b>Event Data</b>:Indicators
- <b>Name ("" to Use UUID)</b>:Controls
- <b>Remaining States</b>:Controls
### GEvt-Generate State Change Log.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Source Message.*State</b>:
- <b>Source Message.*Arguments</b>:
- <b>Source Module</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:
- <b>CSM Global Log Event Out</b>:Indicators
- <b>CSM Global Log Event</b>:Controls
- <b>CSM:LogFilter.lvclass</b>:Controls
- <b>Current State</b>:Controls
- <b>Event Data</b>:Indicators
- <b>Name ("" to Use UUID)</b>:Controls
- <b>Source Message.*Arguments</b>:Controls
- <b>Source Message.*State</b>:Controls
- <b>Source Module</b>:Controls
### GEvt-Generate Status Log.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:
- <b>Arguments</b>:Controls
- <b>CSM Global Log Event Out</b>:Indicators
- <b>CSM Global Log Event</b>:Controls
- <b>CSM:LogFilter.lvclass</b>:Controls
- <b>Current State</b>:Controls
- <b>Event Data</b>:Indicators
- <b>Name ("" to Use UUID)</b>:Controls
- <b>Source Module</b>:Controls
### GEvt-Generate Unregister Log.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:
- <b>Arguments</b>:Controls
- <b>CSM Global Log Event Out</b>:Indicators
- <b>CSM Global Log Event</b>:Controls
- <b>CSM:LogFilter.lvclass</b>:Controls
- <b>Current State</b>:Controls
- <b>Event Data</b>:Indicators
- <b>Name ("" to Use UUID)</b>:Controls
- <b>Remove For Module Exit? (F)</b>:Controls
### GEvt-Generate with Rule Check.vi

-- <b>Controls(输入控件)</b> --
- <b>LogFilter in</b>:
- <b>event data</b>:
- <b>CSM Global Log Event in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM Global Log Event out</b>:
- <b>CSM Global Log Event Out</b>:Indicators
- <b>Event Data</b>:Controls
- <b>LogFilter In</b>:Controls
### GEvt-Set Source Filter Rules - v1.0.vi

-- <b>Controls(输入控件)</b> --
- <b>Rules-v1</b>:
- <b>Rules-v1</b>:Controls
### GEvt-ThreadQueueName.vi

-- <b>Indicators(输出控件)</b> --
- <b>ThreadQueueName</b>:

### GEvt-WatchdogThread.vi

-- <b>Controls(输入控件)</b> --
- <b>WatchDogQ</b>:

### Filter Check.vi

-- <b>Controls(输入控件)</b> --
- <b>Cross CSM Data in</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data out</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### List Rules as Strings.vi

-- <b>Controls(输入控件)</b> --
- <b>GlobalLogFilter in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Rule Strings</b>:
- <b>GlobalLogFilter out</b>:
- <b>GlobalLogFilter Out</b>:Indicators
- <b>Rule Strings</b>:Indicators
### CSM Check - LogType.vi

-- <b>Controls(输入控件)</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:
- <b>GlobalLogFilter.lvclass (Dup)</b>:Indicators
- <b>GlobalLogFilter.lvclass</b>:Controls
- <b>Matched Previous?</b>:Controls
- <b>Matched? (Dup)</b>:Indicators
### CSM Check - State.vi

-- <b>Controls(输入控件)</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:
- <b>GlobalLogFilter.lvclass (Dup)</b>:Indicators
- <b>GlobalLogFilter.lvclass</b>:Controls
- <b>Matched Previous?</b>:Controls
- <b>Matched? (Dup)</b>:Indicators
### CSM Check - StateType.vi

-- <b>Controls(输入控件)</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:
- <b>GlobalLogFilter.lvclass (Dup)</b>:Indicators
- <b>GlobalLogFilter.lvclass</b>:Controls
- <b>Matched Previous?</b>:Controls
- <b>Matched? (Dup)</b>:Indicators
### Group Check - CSM.vi

-- <b>Controls(输入控件)</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:
- <b>GlobalLogFilter.lvclass (Dup)</b>:Indicators
- <b>GlobalLogFilter.lvclass</b>:Controls
- <b>Matched Previous?</b>:Controls
- <b>Matched? (Dup)</b>:Indicators
### Group Check - LogType.vi

-- <b>Controls(输入控件)</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:
- <b>GlobalLogFilter.lvclass (Dup)</b>:Indicators
- <b>GlobalLogFilter.lvclass</b>:Controls
- <b>Matched Previous?</b>:Controls
- <b>Matched? (Dup)</b>:Indicators
### Group Check - State.vi

-- <b>Controls(输入控件)</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:
- <b>GlobalLogFilter.lvclass (Dup)</b>:Indicators
- <b>GlobalLogFilter.lvclass</b>:Controls
- <b>Matched Previous?</b>:Controls
- <b>Matched? (Dup)</b>:Indicators
### Group Check - StateType.vi

-- <b>Controls(输入控件)</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:
- <b>GlobalLogFilter.lvclass (Dup)</b>:Indicators
- <b>GlobalLogFilter.lvclass</b>:Controls
- <b>Matched Previous?</b>:Controls
- <b>Matched? (Dup)</b>:Indicators
### Set CSM LogType Filter.vi

-- <b>Controls(输入控件)</b> --
- <b>LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>GlobalLogFilter out</b>:
- <b>GlobalLogFilter Out</b>:Indicators
- <b>LogType</b>:Controls
### Set CSM State Filter.vi

-- <b>Controls(输入控件)</b> --
- <b>CSM:State</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>GlobalLogFilter out</b>:
- <b>CSM:State</b>:Controls
- <b>GlobalLogFilter Out</b>:Indicators
### Set CSM StateType Filter.vi

-- <b>Controls(输入控件)</b> --
- <b>LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>GlobalLogFilter out</b>:
- <b>GlobalLogFilter Out</b>:Indicators
- <b>LogType</b>:Controls
### Set Global CSM Filter.vi

-- <b>Controls(输入控件)</b> --
- <b>Group:CSM</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>GlobalLogFilter out</b>:
- <b>GlobalLogFilter Out</b>:Indicators
- <b>Group:CSM</b>:Controls
### Set Global LogType Filter.vi

-- <b>Controls(输入控件)</b> --
- <b>Group:LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>GlobalLogFilter out</b>:
- <b>GlobalLogFilter Out</b>:Indicators
- <b>Group:LogType</b>:Controls
### Set Global State Filter.vi

-- <b>Controls(输入控件)</b> --
- <b>Group:State</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>GlobalLogFilter out</b>:
- <b>GlobalLogFilter Out</b>:Indicators
- <b>Group:State</b>:Controls
### Set Global StateType Filter.vi

-- <b>Controls(输入控件)</b> --
- <b>Group:LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators(输出控件)</b> --
- <b>GlobalLogFilter out</b>:
- <b>GlobalLogFilter Out</b>:Indicators
- <b>Group:LogType</b>:Controls
### Log State Type.vi

-- <b>Controls(输入控件)</b> --
- <b>Complete(T)/Start(F)</b>:
- <b>Source Module</b>:
- <b>State</b>:

-- <b>Indicators(输出控件)</b> --
- <b>CSM_GlobalLog_STATE_TYPE</b>:
- <b>CSM_GlobalLog_STATE_TYPE</b>:Indicators
- <b>Complete? (T)/Start(F)</b>:Controls
- <b>Source Module</b>:Controls
- <b>‘State</b>:Controls
### Parse Register Message.vi

-- <b>Controls(输入控件)</b> --
- <b>state</b>:
- <b>Module Name </b>:
- <b>args</b>:

-- <b>Indicators(输出控件)</b> --
- <b>target</b>:
- <b>source</b>:
- <b>status</b>:
- <b>api</b>:
- <b>Api</b>:Indicators
- <b>Module Name </b>:Controls
- <b>Source</b>:Indicators
- <b>State</b>:Controls
- <b>Status</b>:Indicators
- <b>Target Specified?</b>:Indicators
- <b>Target</b>:Indicators
### Parse State with Arguments String.vi

-- <b>Controls(输入控件)</b> --
- <b>State with Arguments</b>:
The State string that requires the argument.

-- <b>Indicators(输出控件)</b> --
- <b>State</b>:
- <b>Arguments</b>:
- <b>Target Module</b>:
- <b>Message Symbol</b>:
- <b>Arguments</b>:Indicators
- <b>Message Symbol</b>:Indicators
- <b>State</b>:Indicators
- <b>Target Module</b>:Indicators
### Parse Unregister Message.vi

-- <b>Controls(输入控件)</b> --
- <b>state</b>:
- <b>Module Name </b>:
- <b>args</b>:

-- <b>Indicators(输出控件)</b> --
- <b>target</b>:
- <b>source</b>:
- <b>status</b>:
- <b>api</b>:
- <b>Api</b>:Indicators
- <b>Module Name </b>:Controls
- <b>Source</b>:Indicators
- <b>State</b>:Controls
- <b>Status</b>:Indicators
- <b>Target Specified?</b>:Indicators
- <b>Target</b>:Indicators
### Dequeue Element.vi

-- <b>Controls(输入控件)</b> --
- <b>timeout in ms (-1)</b>:
- <b>Priority Queue</b>:

-- <b>Indicators(输出控件)</b> --
- <b>timed out?</b>:
- <b>Cross JKI State Machine State</b>:
- <b>Priority Queue(dup)</b>:
- <b>High Priority?</b>:
- <b>Cross JKI State Machine State</b>:Indicators
- <b>High Priority?</b>:Indicators
- <b>Priority Queue (Dup)</b>:Indicators
- <b>Timed Out?</b>:Indicators
- <b>Timeout In ms (-1)</b>:Controls
### Enqueue Element.vi

-- <b>Controls(输入控件)</b> --
- <b>High Priority?(F)</b>:
- <b>timeout in ms (-1)</b>:
- <b>Cross JKI State Machine State</b>:
- <b>Priority Queue</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Priority Queue(dup)</b>:
- <b>Cross JKI State Machine State</b>:Controls
- <b>High Priority? (F)</b>:Controls
- <b>Priority Queue (Dup)</b>:Indicators
- <b>Timeout In ms (-1)</b>:Controls
### Get Queue Status.vi

-- <b>Controls(输入控件)</b> --
- <b>Priority Queue in</b>:

-- <b>Indicators(输出控件)</b> --
- <b># pending insert</b>:
- <b># pending remove</b>:
- <b>Priority Queue out</b>:
- <b># elements in queue</b>:
- <b># Elements In Queue</b>:Indicators
- <b># Pending Insert</b>:Indicators
- <b># Pending Remove</b>:Indicators
### Not a Refnum.vi

-- <b>Controls(输入控件)</b> --
- <b>Priority Queue.lvclass</b>:

-- <b>Indicators(输出控件)</b> --
- <b>NaN/Path/Refnum?</b>:
- <b>NaN/Path/Refnum?</b>:Indicators
- <b>Priority Queue.lvclass</b>:Controls
### Obtain Priority Queue.vi

-- <b>Controls(输入控件)</b> --
- <b>create if not found? (T)</b>:
- <b>name</b>:

-- <b>Indicators(输出控件)</b> --
- <b>created new?</b>:
- <b>Priority Queue</b>:
- <b>Create If Not Found? (T)</b>:Controls
- <b>Created New?</b>:Indicators
- <b>Priority Queue</b>:Indicators
### Release Priority Queue.vi

-- <b>Controls(输入控件)</b> --
- <b>force destroy? (F)</b>:
- <b>Priority Queue</b>:
- <b>Force Destroy? (F)</b>:Controls
- <b>Priority Queue</b>:Controls
### CSMP-Async Call.vi

-- <b>Controls(输入控件)</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:
- <b>Msg Type</b>:

-- <b>Indicators(输出控件)</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

- <b>Error</b>:Indicators
- <b>Module Name</b>:Controls
- <b>Pre-Args Out</b>:Indicators
- <b>Pre-State Out</b>:Indicators
- <b>Source/target Out</b>:Indicators
- <b>Source/target</b>:Controls
- <b>State Out</b>:Indicators
- <b>State</b>:Controls
### CSMP-Broadcast.vi

-- <b>Controls(输入控件)</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:
- <b>Msg Type</b>:

-- <b>Indicators(输出控件)</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:
- <b>Error</b>:Indicators
- <b>Module Name</b>:Controls
- <b>Pre-Args Out</b>:Indicators
- <b>Pre-State Out</b>:Indicators
- <b>Response For Message.’Error</b>:Controls
- <b>Source/target Out</b>:Indicators
- <b>Source/target</b>:Controls
- <b>State Out</b>:Indicators
- <b>State</b>:Controls
### CSMP-PostPostMsg.vi

-- <b>Controls(输入控件)</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Pre-State in</b>:
- <b>Pre-Args in</b>:
- <b>session error</b>:
- <b>Module Name</b>:
- <b>Response Arguments</b>:

-- <b>Indicators(输出控件)</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:
- <b>Error</b>:Indicators
- <b>Module Name</b>:Controls
- <b>Pre-Args In</b>:Controls
- <b>Pre-Args Out</b>:Indicators
- <b>Pre-State In</b>:Controls
- <b>Pre-State Out</b>:Indicators
- <b>Session Error</b>:Controls
- <b>Source/target Out</b>:Indicators
- <b>Source/target</b>:Controls
- <b>State Out</b>:Indicators
- <b>State</b>:Controls
### CSMP-PostSendMsg.vi

-- <b>Controls(输入控件)</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>session error</b>:
- <b>Module Name</b>:
- <b>Response Arguments</b>:

-- <b>Indicators(输出控件)</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>error</b>:
- <b>Error</b>:Indicators
- <b>Module Name</b>:Controls
- <b>Session Error</b>:Controls
- <b>Source/target Out</b>:Indicators
- <b>Source/target</b>:Controls
- <b>State Out</b>:Indicators
- <b>State</b>:Controls
### CSMP-Register Status.vi

-- <b>Controls(输入控件)</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:

-- <b>Indicators(输出控件)</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:
- <b>CSMQ In</b>:Controls
- <b>CSMQ Out</b>:Indicators
- <b>Error</b>:Indicators
- <b>Pre-Args Out</b>:Indicators
- <b>Pre-State Out</b>:Indicators
- <b>Source/target Out</b>:Indicators
- <b>Source/target</b>:Controls
- <b>State Out</b>:Indicators
- <b>State</b>:Controls
### CSMP-Sync Call.vi

-- <b>Controls(输入控件)</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Response Timeout(-2 using Global Settings)</b>: 同步调用的超时时间，默认为-2，使用全局设置。你可以通过"CSM - Set TMO of Sync-Reply.vi" 设置全局超时时间。
- <b>Module Name</b>:

-- <b>Indicators(输出控件)</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:
- <b>Error</b>:Indicators
- <b>Pre-Args Out</b>:Indicators
- <b>Pre-State Out</b>:Indicators
- <b>Response Timeout (-2 Using Global Settings)</b>:Controls
- <b>Source/target Out</b>:Indicators
- <b>Source/target</b>:Controls
- <b>State Out</b>:Indicators
- <b>State</b>:Controls
### CSMP-Unregister Status.vi

-- <b>Controls(输入控件)</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:

-- <b>Indicators(输出控件)</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:
- <b>CSMQ In</b>:Controls
- <b>CSMQ Out</b>:Indicators
- <b>Error</b>:Indicators
- <b>Pre-Args Out</b>:Indicators
- <b>Pre-State Out</b>:Indicators
- <b>Source/target Out</b>:Indicators
- <b>Source/target</b>:Controls
- <b>State Out</b>:Indicators
- <b>State</b>:Controls
### Auto Resize All MultiListbox Columns (Uniform Text).vi

-- <b>Controls(输入控件)</b> --
- <b>IgnoreCols(Empty as default)</b>:
- <b>Array</b>:
- <b>Control in</b>:
- <b>Array</b>:Controls
- <b>Control In</b>:Controls
- <b>IngoreCols (Empty As Default)</b>:Controls
### Dashboard Cell Resize.vi

-- <b>Controls(输入控件)</b> --
- <b>Cluster</b>:
- <b>Cluster Size:Height</b>:
- <b>Cluster Size:Width</b>:
- <b>ClusterRef</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Bounds:Area Height</b>:
- <b>Bounds:Area Width</b>:
- <b>Bounds:Area Height</b>:Indicators
- <b>Bounds:Area Width</b>:Indicators
- <b>Cluster Size:Height</b>:Controls
- <b>Cluster Size:Width</b>:Controls
### Dashboard Cell2 Array Resize.vi

-- <b>Controls(输入控件)</b> --
- <b>Num Columns</b>:
- <b>Cluster</b>:
- <b>Num Rows</b>:
- <b>area height</b>:
- <b>area width</b>:
- <b>Array 2</b>:
- <b>Area Height</b>:Controls
- <b>Area Width</b>:Controls
- <b>Array 2</b>:Controls
- <b>Cluster</b>:Controls
- <b>Num Columns</b>:Controls
- <b>Num Rows</b>:Controls
### Open CSM BD.vi

-- <b>Controls(输入控件)</b> --
- <b>Current Module("" to generate a ID)</b>:
- <b>CSM</b>:

### Open CSM FP.vi

-- <b>Controls(输入控件)</b> --
- <b>Current Module("" to generate a ID)</b>:
- <b>CSM</b>:

### Select Greater_nevstop.vi

-- <b>Controls(输入控件)</b> --
- <b>A</b>:
- <b>B</b>:

-- <b>Indicators(输出控件)</b> --
- <b>lesser</b>:
- <b>A</b>:Controls
- <b>Lesser</b>:Indicators
### Append Application Directory If Relative.vi

-- <b>Controls(输入控件)</b> --
- <b>Relative path (.)</b>:

-- <b>Indicators(输出控件)</b> --
- <b>Application Directory (+ Relative)</b>:

### Convert File Extension (Path)__ogtk.vi

-- <b>Controls(输入控件)</b> --
- <b>new ending (none)</b>:
- <b>file name</b>:

-- <b>Indicators(输出控件)</b> --
- <b>prev ending</b>:
- <b>new filename</b>:
- <b>New Ending (None)</b>:Controls
- <b>New Filename</b>:Indicators
- <b>Prev Ending</b>:Indicators
### Convert File Extension (String)__ogtk.vi

-- <b>Controls(输入控件)</b> --
- <b>new ending (none)</b>:
- <b>file name</b>:

-- <b>Indicators(输出控件)</b> --
- <b>prev ending</b>:
- <b>new filename</b>:
- <b>New Ending (None)</b>:Controls
- <b>New Filename</b>:Indicators
- <b>Prev Ending</b>:Indicators
### Parse VI Documentation String.vi

-- <b>Controls</b> --
- <b>NOTE-Map</b>:
- <b>Documentation</b>:

-- <b>Indicators</b> --
- <b>Ctrl-Doc Map</b>:
- <b>Control Docs</b>:
- <b>Core Doc</b>:
- <b>Documentation (dup)</b>:

### Gevt-ThreadQueueName.vi

-- <b>Indicators</b> --
- <b>ThreadQueueName</b>:

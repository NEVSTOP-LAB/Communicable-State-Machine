# CSM API

## CSM Internal

### Naming Check.vi

-- <b>输入控件</b> --
- <b>Name("" to use uuid)</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters

-- <b>输出控件</b> --
- <b>Name(dup)</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters

### Check.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:
- <b>Status</b>:
- <b>Source</b>:
- <b>Target</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:
- <b>Response Message Info</b>:

### Delete Source Module.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:
- <b>Source</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:

### Delete Target Module.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:
- <b>Source</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:

### Initialize.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:

### List Entries.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:
- <b>Array</b>:

### List Status in Registry.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:
- <b>Status</b>:

### Register.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:
- <b>status</b>:
- <b>source</b>:
- <b>api</b>:
- <b>target</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:

### Remove Module.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:
- <b>Source</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:

### Unregister.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:
- <b>Status</b>:
- <b>Source</b>:
- <b>api</b>:
- <b>Target</b>:

-- <b>输出控件</b> --
- <b>BroadcastRegistry out</b>:

### Broadcast Item Key.vi

-- <b>输入控件</b> --
- <b>status</b>:
- <b>target</b>:
- <b>source</b>:

-- <b>输出控件</b> --
- <b>key</b>:

### Preview.vi

-- <b>输入控件</b> --
- <b>BroadcastRegistry in</b>:

-- <b>输出控件</b> --
- <b>Registry</b>:
- <b>BroadcastRegistry out</b>:

### Remove response API from List.vi

-- <b>输入控件</b> --
- <b>API</b>:
- <b>output cluster in</b>:

-- <b>输出控件</b> --
- <b>output cluster out</b>:

### Concatenate State with Arguments.vi

-- <b>输入控件</b> --
- <b>Arguments</b>:
- <b>State</b>:

-- <b>输出控件</b> --
- <b>State with Arguments</b>:

### CSM-Name to CSM-Mode.vi

-- <b>输入控件</b> --
- <b>String</b>:

-- <b>输出控件</b> --
- <b>ParentCSM Name</b>:
- <b>CSM Mode</b>:
- <b>Requested Name</b>:

### Format Timestamp.vi

-- <b>输入控件</b> --
- <b>timestamp</b>:
- <b>format string</b>:

-- <b>输出控件</b> --
- <b>String</b>:

### Hex Str to U8 Data.vi

-- <b>输入控件</b> --
- <b>HEX String (0-9,A-F)</b>:

-- <b>输出控件</b> --
- <b>u8 Data[]</b>:

### Parse Next Single-line State.vi

-- <b>输入控件</b> --
- <b>States Queue</b>:

-- <b>输出控件</b> --
- <b>Next Single-line State</b>:
- <b>Remaining States Queue</b>:

### Remove Comments from Line.vi

-- <b>输入控件</b> --
- <b>single-line text</b>:

-- <b>输出控件</b> --
- <b>single-line text without comments</b>:

### Splite Reason String Part.vi

-- <b>输入控件</b> --
- <b>Single-line -& Reason</b>:

-- <b>输出控件</b> --
- <b>CSM Name</b>:
- <b>`State</b>:
- <b>`Arguments</b>:

### Splite Single-line Message.vi

-- <b>输入控件</b> --
- <b>single-line text</b>:

-- <b>输出控件</b> --
- <b>operator</b>:
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:

### Trim Single line Text.vi

-- <b>输入控件</b> --
- <b>single-line text</b>:

-- <b>输出控件</b> --
- <b>trimmed text</b>:

### CSM Not Allowed Message.vi

-- <b>输入控件</b> --
- <b>State</b>:
- <b>CSM</b>:

### Cache-Broadcast Registry Search Result.vi

-- <b>输入控件</b> --
- <b>CSM Name</b>:
- <b>Broadcast state</b>:

-- <b>输出控件</b> --
- <b>Array</b>:

### FGV-BroadcastRegistry.vi

-- <b>输入控件</b> --
- <b>Source</b>:
- <b>Target</b>:
- <b>Status</b>:
- <b>API</b>:
- <b>Operation</b>:

-- <b>输出控件</b> --
- <b>response message</b>:

### global-Broadcast Cache Change Flag.vi

全局变量，用于标记广播缓存是否发生变化

### global-CSMQ FGV Change Flag.vi

全局变量，用于标记 CSM 模块管理信息是否发生变化

### global-GEvnt Filter Change Flag.vi

全局变量，用于标记 Global Event 的过滤条件是否发生变化

### Cache-GEvt Filter Object.vi

-- <b>输出控件</b> --
- <b>CSM:LogFilter.lvclass</b>:

### FGV-GEvt Filter Obj.vi

-- <b>输入控件</b> --
- <b>Set(T)/Get(F)</b>:
- <b>Rules-v1</b>:

-- <b>输出控件</b> --
- <b>CSM:LogFilter.lvclass</b>:

### FGV-GlobalEventRef.vi

-- <b>输入控件</b> --
- <b>Create(F)</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event</b>:

### FGV-StatusChangeEventRef.vi

-- <b>输入控件</b> --
- <b>Name("" to use uuid) in</b>:

-- <b>输出控件</b> --
- <b>Status Change Event</b>:

### GEvt-BackgroundThread.vi

### GEvt-Convert Filter Rules - v1.0.vi

-- <b>输入控件</b> --
- <b>Rules-v1</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter</b>:

### GEvt-Filter Global Log - v1.0.vi

-- <b>输入控件</b> --
- <b>Rules-v1</b>:
- <b>Cross CSM Data (in)</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:

### GEvt-Generate Complete Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>event data</b>:
- <b>Enable?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:

### GEvt-Generate Interrupt Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Module Created Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Name("" to use uuid)</b>:
- <b>Created?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Module Destroyed Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Name("" to use uuid)</b>:
- <b>Enable?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Register Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Remaining States Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Remaining States</b>:
- <b>Name("" to use uuid)</b>:
- <b>Enable?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate State Change Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Source Message.*State</b>:
- <b>Source Message.*Arguments</b>:
- <b>Source Module</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Status Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Unregister Log.vi

-- <b>输入控件</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate with Rule Check.vi

-- <b>输入控件</b> --
- <b>LogFilter in</b>:
- <b>event data</b>:
- <b>CSM Global Log Event in</b>:

-- <b>输出控件</b> --
- <b>CSM Global Log Event out</b>:

### GEvt-Set Source Filter Rules - v1.0.vi

-- <b>输入控件</b> --
- <b>Rules-v1</b>:

### GEvt-ThreadQueueName.vi

-- <b>输出控件</b> --
- <b>ThreadQueueName</b>:

### GEvt-WatchdogThread.vi

-- <b>输入控件</b> --
- <b>WatchDogQ</b>:

### Filter Check.vi

-- <b>输入控件</b> --
- <b>Cross CSM Data in</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data out</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### List Rules as Strings.vi

-- <b>输入控件</b> --
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>Rule Strings</b>:
- <b>GlobalLogFilter out</b>:

### CSM Check - LogType.vi

-- <b>输入控件</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### CSM Check - State.vi

-- <b>输入控件</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### CSM Check - StateType.vi

-- <b>输入控件</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - CSM.vi

-- <b>输入控件</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - LogType.vi

-- <b>输入控件</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - State.vi

-- <b>输入控件</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - StateType.vi

-- <b>输入控件</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>输出控件</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Set CSM LogType Filter.vi

-- <b>输入控件</b> --
- <b>LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter out</b>:

### Set CSM State Filter.vi

-- <b>输入控件</b> --
- <b>CSM:State</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter out</b>:

### Set CSM StateType Filter.vi

-- <b>输入控件</b> --
- <b>LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter out</b>:

### Set Global CSM Filter.vi

-- <b>输入控件</b> --
- <b>Group:CSM</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter out</b>:

### Set Global LogType Filter.vi

-- <b>输入控件</b> --
- <b>Group:LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter out</b>:

### Set Global State Filter.vi

-- <b>输入控件</b> --
- <b>Group:State</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter out</b>:

### Set Global StateType Filter.vi

-- <b>输入控件</b> --
- <b>Group:LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>输出控件</b> --
- <b>GlobalLogFilter out</b>:

### Log State Type.vi

-- <b>输入控件</b> --
- <b>Complete(T)/Start(F)</b>:
- <b>Source Module</b>:
- <b>State</b>:

-- <b>输出控件</b> --
- <b>CSM_GlobalLog_STATE_TYPE</b>:

### Parse Register Message.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>Module Name </b>:
- <b>args</b>:

-- <b>输出控件</b> --
- <b>target</b>:
- <b>source</b>:
- <b>status</b>:
- <b>api</b>:

### Parse State with Arguments String.vi

-- <b>输入控件</b> --
- <b>State with Arguments</b>:
The State string that requires the argument.

-- <b>输出控件</b> --
- <b>State</b>:
- <b>Arguments</b>:
- <b>Target Module</b>:
- <b>Message Symbol</b>:

### Parse Unregister Message.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>Module Name </b>:
- <b>args</b>:

-- <b>输出控件</b> --
- <b>target</b>:
- <b>source</b>:
- <b>status</b>:
- <b>api</b>:

### Dequeue Element.vi

-- <b>输入控件</b> --
- <b>timeout in ms (-1)</b>:
- <b>Priority Queue</b>:

-- <b>输出控件</b> --
- <b>timed out?</b>:
- <b>Cross JKI State Machine State</b>:
- <b>Priority Queue(dup)</b>:
- <b>High Priority?</b>:

### Enqueue Element.vi

-- <b>输入控件</b> --
- <b>High Priority?(F)</b>:
- <b>timeout in ms (-1)</b>:
- <b>Cross JKI State Machine State</b>:
- <b>Priority Queue</b>:

-- <b>输出控件</b> --
- <b>Priority Queue(dup)</b>:

### Get Queue Status.vi

-- <b>输入控件</b> --
- <b>Priority Queue in</b>:

-- <b>输出控件</b> --
- <b># pending insert</b>:
- <b># pending remove</b>:
- <b>Priority Queue out</b>:
- <b># elements in queue</b>:

### Not a Refnum.vi

-- <b>输入控件</b> --
- <b>Priority Queue.lvclass</b>:

-- <b>输出控件</b> --
- <b>NaN/Path/Refnum?</b>:

### Obtain Priority Queue.vi

-- <b>输入控件</b> --
- <b>create if not found? (T)</b>:
- <b>name</b>:

-- <b>输出控件</b> --
- <b>created new?</b>:
- <b>Priority Queue</b>:

### Release Priority Queue.vi

-- <b>输入控件</b> --
- <b>force destroy? (F)</b>:
- <b>Priority Queue</b>:

### CSMP-Async Call.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:
- <b>Msg Type</b>:

-- <b>输出控件</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-Broadcast.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:
- <b>Msg Type</b>:

-- <b>输出控件</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-PostPostMsg.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Pre-State in</b>:
- <b>Pre-Args in</b>:
- <b>session error</b>:
- <b>Module Name</b>:
- <b>Response Arguments</b>:

-- <b>输出控件</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-PostSendMsg.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>session error</b>:
- <b>Module Name</b>:
- <b>Response Arguments</b>:

-- <b>输出控件</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>error</b>:

### CSMP-Register Status.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:

-- <b>输出控件</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-Sync Call.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Response Timeout(5000ms)</b>:
- <b>Module Name</b>:

-- <b>输出控件</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-Unregister Status.vi

-- <b>输入控件</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:

-- <b>输出控件</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### Auto Resize All MultiListbox Columns (Uniform Text).vi

-- <b>输入控件</b> --
- <b>IgnoreCols(Empty as default)</b>:
- <b>Array</b>:
- <b>Control in</b>:

### Dashboard Cell Resize.vi

-- <b>输入控件</b> --
- <b>Cluster</b>:
- <b>Cluster Size:Height</b>:
- <b>Cluster Size:Width</b>:
- <b>ClusterRef</b>:

-- <b>输出控件</b> --
- <b>Bounds:Area Height</b>:
- <b>Bounds:Area Width</b>:

### Dashboard Cell2 Array Resize.vi

-- <b>输入控件</b> --
- <b>Num Columns</b>:
- <b>Cluster</b>:
- <b>Num Rows</b>:
- <b>area height</b>:
- <b>area width</b>:
- <b>Array 2</b>:

### Open CSM BD.vi

-- <b>输入控件</b> --
- <b>Current Module("" to generate a ID)</b>:
- <b>CSM</b>:

### Open CSM FP.vi

-- <b>输入控件</b> --
- <b>Current Module("" to generate a ID)</b>:
- <b>CSM</b>:

### Select Greater_nevstop.vi

-- <b>输入控件</b> --
- <b>A</b>:
- <b>B</b>:

-- <b>输出控件</b> --
- <b>lesser</b>:

### Append Application Directory If Relative.vi

-- <b>输入控件</b> --
- <b>Relative path (.)</b>:

-- <b>输出控件</b> --
- <b>Application Directory (+ Relative)</b>:

### Convert File Extension (Path)__ogtk.vi

-- <b>输入控件</b> --
- <b>new ending (none)</b>:
- <b>file name</b>:

-- <b>输出控件</b> --
- <b>prev ending</b>:
- <b>new filename</b>:

### Convert File Extension (String)__ogtk.vi

-- <b>输入控件</b> --
- <b>new ending (none)</b>:
- <b>file name</b>:

-- <b>输出控件</b> --
- <b>prev ending</b>:
- <b>new filename</b>:

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

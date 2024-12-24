# CSM API

## CSM Internal

### Naming Check.vi

-- <b>Controls</b> --
- <b>Name("" to use uuid)</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters

-- <b>Indicators</b> --
- <b>Name(dup)</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters

### Check.vi

-- <b>Controls</b> --
- <b>BroadcastRegistry in</b>:
- <b>Status</b>:
- <b>Source</b>:
- <b>Target</b>:

-- <b>Indicators</b> --
- <b>BroadcastRegistry out</b>:
- <b>Response Message Info</b>:

### Delete Source Module.vi

-- <b>Controls</b> --
- <b>BroadcastRegistry in</b>:
- <b>Source</b>:

-- <b>Indicators</b> --
- <b>BroadcastRegistry out</b>:

### Delete Target Module.vi

-- <b>Controls</b> --
- <b>BroadcastRegistry in</b>:
- <b>Source</b>:

-- <b>Indicators</b> --
- <b>BroadcastRegistry out</b>:

### Initialize.vi

-- <b>Controls</b> --
- <b>BroadcastRegistry in</b>:

-- <b>Indicators</b> --
- <b>BroadcastRegistry out</b>:

### List Entries.vi

-- <b>Controls</b> --
- <b>BroadcastRegistry in</b>:

-- <b>Indicators</b> --
- <b>BroadcastRegistry out</b>:
- <b>Array</b>:

### List Status in Registry.vi

-- <b>Controls</b> --
- <b>BroadcastRegistry in</b>:

-- <b>Indicators</b> --
- <b>BroadcastRegistry out</b>:
- <b>Status</b>:

### Register.vi

-- <b>Controls</b> --
- <b>BroadcastRegistry in</b>:
- <b>status</b>:
- <b>source</b>:
- <b>api</b>:
- <b>target</b>:

-- <b>Indicators</b> --
- <b>BroadcastRegistry out</b>:

### Remove Module.vi

-- <b>Controls</b> --
- <b>BroadcastRegistry in</b>:
- <b>Source</b>:

-- <b>Indicators</b> --
- <b>BroadcastRegistry out</b>:

### Unregister.vi

-- <b>Controls</b> --
- <b>BroadcastRegistry in</b>:
- <b>Status</b>:
- <b>Source</b>:
- <b>api</b>:
- <b>Target</b>:

-- <b>Indicators</b> --
- <b>BroadcastRegistry out</b>:

### Broadcast Item Key.vi

-- <b>Controls</b> --
- <b>status</b>:
- <b>target</b>:
- <b>source</b>:

-- <b>Indicators</b> --
- <b>key</b>:

### Preview.vi

-- <b>Controls</b> --
- <b>BroadcastRegistry in</b>:

-- <b>Indicators</b> --
- <b>Registry</b>:
- <b>BroadcastRegistry out</b>:

### Remove response API from List.vi

-- <b>Controls</b> --
- <b>API</b>:
- <b>output cluster in</b>:

-- <b>Indicators</b> --
- <b>output cluster out</b>:

### Concatenate State with Arguments.vi

-- <b>Controls</b> --
- <b>Arguments</b>:
- <b>State</b>:

-- <b>Indicators</b> --
- <b>State with Arguments</b>:

### CSM-Name to CSM-Mode.vi

-- <b>Controls</b> --
- <b>String</b>:

-- <b>Indicators</b> --
- <b>ParentCSM Name</b>:
- <b>CSM Mode</b>:
- <b>Requested Name</b>:

### Format Timestamp.vi

-- <b>Controls</b> --
- <b>timestamp</b>:
- <b>format string</b>:

-- <b>Indicators</b> --
- <b>String</b>:

### Hex Str to U8 Data.vi

-- <b>Controls</b> --
- <b>HEX String (0-9,A-F)</b>:

-- <b>Indicators</b> --
- <b>u8 Data[]</b>:

### Parse Next Single-line State.vi

-- <b>Controls</b> --
- <b>States Queue</b>:

-- <b>Indicators</b> --
- <b>Next Single-line State</b>:
- <b>Remaining States Queue</b>:

### Remove Comments from Line.vi

-- <b>Controls</b> --
- <b>single-line text</b>:

-- <b>Indicators</b> --
- <b>single-line text without comments</b>:

### Splite Reason String Part.vi

-- <b>Controls</b> --
- <b>Single-line -& Reason</b>:

-- <b>Indicators</b> --
- <b>CSM Name</b>:
- <b>`State</b>:
- <b>`Arguments</b>:

### Splite Single-line Message.vi

-- <b>Controls</b> --
- <b>single-line text</b>:

-- <b>Indicators</b> --
- <b>operator</b>:
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:

### Trim Single line Text.vi

-- <b>Controls</b> --
- <b>single-line text</b>:

-- <b>Indicators</b> --
- <b>trimmed text</b>:

### CSM Not Allowed Message.vi

-- <b>Controls</b> --
- <b>State</b>:
- <b>CSM</b>:

### Cache-Broadcast Registry Search Result.vi

-- <b>Controls</b> --
- <b>CSM Name</b>:
- <b>Broadcast state</b>:

-- <b>Indicators</b> --
- <b>Array</b>:

### FGV-BroadcastRegistry.vi

-- <b>Controls</b> --
- <b>Source</b>:
- <b>Target</b>:
- <b>Status</b>:
- <b>API</b>:
- <b>Operation</b>:

-- <b>Indicators</b> --
- <b>response message</b>:

### global-Broadcast Cache Change Flag.vi

Global variable used to indicate whether the broadcast cache has changed

### global-CSMQ FGV Change Flag.vi

Global variable used to indicate whether the CSM module management information has changed

### global-GEvnt Filter Change Flag.vi

Global variable used to indicate whether the Global Event filter conditions have changed

### Cache-GEvt Filter Object.vi

-- <b>Indicators</b> --
- <b>CSM:LogFilter.lvclass</b>:

### FGV-GEvt Filter Obj.vi

-- <b>Controls</b> --
- <b>Set(T)/Get(F)</b>:
- <b>Rules-v1</b>:

-- <b>Indicators</b> --
- <b>CSM:LogFilter.lvclass</b>:

### FGV-GlobalEventRef.vi

-- <b>Controls</b> --
- <b>Create(F)</b>:

-- <b>Indicators</b> --
- <b>CSM Global Log Event</b>:

### FGV-StatusChangeEventRef.vi

-- <b>Controls</b> --
- <b>Name("" to use uuid) in</b>:

-- <b>Indicators</b> --
- <b>Status Change Event</b>:

### GEvt-BackgroundThread.vi

### GEvt-Convert Filter Rules - v1.0.vi

-- <b>Controls</b> --
- <b>Rules-v1</b>:

-- <b>Indicators</b> --
- <b>GlobalLogFilter</b>:

### GEvt-Filter Global Log - v1.0.vi

-- <b>Controls</b> --
- <b>Rules-v1</b>:
- <b>Cross CSM Data (in)</b>:

-- <b>Indicators</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:

### GEvt-Generate Complete Log.vi

-- <b>Controls</b> --
- <b>CSM Global Log Event</b>:
- <b>event data</b>:
- <b>Enable?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>CSM Global Log Event out</b>:

### GEvt-Generate Interrupt Log.vi

-- <b>Controls</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Module Created Log.vi

-- <b>Controls</b> --
- <b>CSM Global Log Event</b>:
- <b>Name("" to use uuid)</b>:
- <b>Created?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Module Destroyed Log.vi

-- <b>Controls</b> --
- <b>CSM Global Log Event</b>:
- <b>Name("" to use uuid)</b>:
- <b>Enable?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Register Log.vi

-- <b>Controls</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Remaining States Log.vi

-- <b>Controls</b> --
- <b>CSM Global Log Event</b>:
- <b>Remaining States</b>:
- <b>Name("" to use uuid)</b>:
- <b>Enable?</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### Gevt-ThreadQueueName.vi

-- <b>Indicators</b> --
- <b>ThreadQueueName</b>:

### GEvt-Generate State Change Log.vi

-- <b>Controls</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Source Message.*State</b>:
- <b>Source Message.*Arguments</b>:
- <b>Source Module</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Status Log.vi

-- <b>Controls</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate Unregister Log.vi

-- <b>Controls</b> --
- <b>CSM Global Log Event</b>:
- <b>Current State</b>:
- <b>Arguments</b>:
- <b>Name("" to use uuid)</b>:
- <b>CSM:LogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>CSM Global Log Event out</b>:
- <b>event data</b>:

### GEvt-Generate with Rule Check.vi

-- <b>Controls</b> --
- <b>LogFilter in</b>:
- <b>event data</b>:
- <b>CSM Global Log Event in</b>:

-- <b>Indicators</b> --
- <b>CSM Global Log Event out</b>:

### GEvt-Set Source Filter Rules - v1.0.vi

-- <b>Controls</b> --
- <b>Rules-v1</b>:

### GEvt-ThreadQueueName.vi

-- <b>Indicators</b> --
- <b>ThreadQueueName</b>:

### GEvt-WatchdogThread.vi

-- <b>Controls</b> --
- <b>WatchDogQ</b>:

### Filter Check.vi

-- <b>Controls</b> --
- <b>Cross CSM Data in</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data out</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### List Rules as Strings.vi

-- <b>Controls</b> --
- <b>GlobalLogFilter in</b>:

-- <b>Indicators</b> --
- <b>Rule Strings</b>:
- <b>GlobalLogFilter out</b>:

### CSM Check - LogType.vi

-- <b>Controls</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### CSM Check - State.vi

-- <b>Controls</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### CSM Check - StateType.vi

-- <b>Controls</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - CSM.vi

-- <b>Controls</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - LogType.vi

-- <b>Controls</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - State.vi

-- <b>Controls</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - StateType.vi

-- <b>Controls</b> --
- <b>Matched Previous?</b>:
- <b>Cross CSM Data (in)</b>:
- <b>GlobalLogFilter.lvclass</b>:

-- <b>Indicators</b> --
- <b>Matched? (dup)</b>:
- <b>Cross CSM Data</b>:
- <b>GlobalLogFilter.lvclass (dup)</b>:

### Set CSM LogType Filter.vi

-- <b>Controls</b> --
- <b>LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators</b> --
- <b>GlobalLogFilter out</b>:

### Set CSM State Filter.vi

-- <b>Controls</b> --
- <b>CSM:State</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators</b> --
- <b>GlobalLogFilter out</b>:

### Set CSM StateType Filter.vi

-- <b>Controls</b> --
- <b>LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators</b> --
- <b>GlobalLogFilter out</b>:

### Set Global CSM Filter.vi

-- <b>Controls</b> --
- <b>Group:CSM</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators</b> --
- <b>GlobalLogFilter out</b>:

### Set Global LogType Filter.vi

-- <b>Controls</b> --
- <b>Group:LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators</b> --
- <b>GlobalLogFilter out</b>:

### Set Global State Filter.vi

-- <b>Controls</b> --
- <b>Group:State</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators</b> --
- <b>GlobalLogFilter out</b>:

### Set Global StateType Filter.vi

-- <b>Controls</b> --
- <b>Group:LogType</b>:
- <b>GlobalLogFilter in</b>:

-- <b>Indicators</b> --
- <b>GlobalLogFilter out</b>:

### Log State Type.vi

-- <b>Controls</b> --
- <b>Complete(T)/Start(F)</b>:
- <b>Source Module</b>:
- <b>State</b>:

-- <b>Indicators</b> --
- <b>CSM_GlobalLog_STATE_TYPE</b>:

### Parse Register Message.vi

-- <b>Controls</b> --
- <b>state</b>:
- <b>Module Name </b>:
- <b>args</b>:

-- <b>Indicators</b> --
- <b>target</b>:
- <b>source</b>:
- <b>status</b>:
- <b>api</b>:

### Parse State with Arguments String.vi

-- <b>Controls</b> --
- <b>State with Arguments</b>:
The State string that requires the argument.

-- <b>Indicators</b> --
- <b>State</b>:
- <b>Arguments</b>:
- <b>Target Module</b>:
- <b>Message Symbol</b>:

### Parse Unregister Message.vi

-- <b>Controls</b> --
- <b>state</b>:
- <b>Module Name </b>:
- <b>args</b>:

-- <b>Indicators</b> --
- <b>target</b>:
- <b>source</b>:
- <b>status</b>:
- <b>api</b>:

### Dequeue Element.vi

-- <b>Controls</b> --
- <b>timeout in ms (-1)</b>:
- <b>Priority Queue</b>:

-- <b>Indicators</b> --
- <b>timed out?</b>:
- <b>Cross JKI State Machine State</b>:
- <b>Priority Queue(dup)</b>:
- <b>High Priority?</b>:

### Enqueue Element.vi

-- <b>Controls</b> --
- <b>High Priority?(F)</b>:
- <b>timeout in ms (-1)</b>:
- <b>Cross JKI State Machine State</b>:
- <b>Priority Queue</b>:

-- <b>Indicators</b> --
- <b>Priority Queue(dup)</b>:

### Get Queue Status.vi

-- <b>Controls</b> --
- <b>Priority Queue in</b>:

-- <b>Indicators</b> --
- <b># pending insert</b>:
- <b># pending remove</b>:
- <b>Priority Queue out</b>:
- <b># elements in queue</b>:

### Not a Refnum.vi

-- <b>Controls</b> --
- <b>Priority Queue.lvclass</b>:

-- <b>Indicators</b> --
- <b>NaN/Path/Refnum?</b>:

### Obtain Priority Queue.vi

-- <b>Controls</b> --
- <b>create if not found? (T)</b>:
- <b>name</b>:

-- <b>Indicators</b> --
- <b>created new?</b>:
- <b>Priority Queue</b>:

### Release Priority Queue.vi

-- <b>Controls</b> --
- <b>force destroy? (F)</b>:
- <b>Priority Queue</b>:

### CSMP-Async Call.vi

-- <b>Controls</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:
- <b>Msg Type</b>:

-- <b>Indicators</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-Broadcast.vi

-- <b>Controls</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:
- <b>Msg Type</b>:

-- <b>Indicators</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-PostPostMsg.vi

-- <b>Controls</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Pre-State in</b>:
- <b>Pre-Args in</b>:
- <b>session error</b>:
- <b>Module Name</b>:
- <b>Response Arguments</b>:

-- <b>Indicators</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-PostSendMsg.vi

-- <b>Controls</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>session error</b>:
- <b>Module Name</b>:
- <b>Response Arguments</b>:

-- <b>Indicators</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>error</b>:

### CSMP-Register Status.vi

-- <b>Controls</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:

-- <b>Indicators</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-Sync Call.vi

-- <b>Controls</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Response Timeout(5000ms)</b>:
- <b>Module Name</b>:

-- <b>Indicators</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### CSMP-Unregister Status.vi

-- <b>Controls</b> --
- <b>state</b>:
- <b>args</b>:
- <b>source/target</b>:
- <b>Module Name</b>:

-- <b>Indicators</b> --
- <b>state out</b>:
- <b>args out</b>:
- <b>source/target out</b>:
- <b>Pre-State out</b>:
- <b>Pre-Args out</b>:
- <b>error</b>:

### Auto Resize All MultiListbox Columns (Uniform Text).vi

-- <b>Controls</b> --
- <b>IgnoreCols(Empty as default)</b>:
- <b>Array</b>:
- <b>Control in</b>:

### Dashboard Cell Resize.vi

-- <b>Controls</b> --
- <b>Cluster</b>:
- <b>Cluster Size:Height</b>:
- <b>Cluster Size:Width</b>:
- <b>ClusterRef</b>:

-- <b>Indicators</b> --
- <b>Bounds:Area Height</b>:
- <b>Bounds:Area Width</b>:

### Dashboard Cell2 Array Resize.vi

-- <b>Controls</b> --
- <b>Num Columns</b>:
- <b>Cluster</b>:
- <b>Num Rows</b>:
- <b>area height</b>:
- <b>area width</b>:
- <b>Array 2</b>:

### Open CSM BD.vi

-- <b>Controls</b> --
- <b>Current Module("" to generate a ID)</b>:
- <b>CSM</b>:

### Open CSM FP.vi

-- <b>Controls</b> --
- <b>Current Module("" to generate a ID)</b>:
- <b>CSM</b>:

### Select Greater_nevstop.vi

-- <b>Controls</b> --
- <b>A</b>:
- <b>B</b>:

-- <b>Indicators</b> --
- <b>lesser</b>:

### Append Application Directory If Relative.vi

-- <b>Controls</b> --
- <b>Relative path (.)</b>:

-- <b>Indicators</b> --
- <b>Application Directory (+ Relative)</b>:

### Convert File Extension (Path)__ogtk.vi

-- <b>Controls</b> --
- <b>new ending (none)</b>:
- <b>file name</b>:

-- <b>Indicators</b> --
- <b>prev ending</b>:
- <b>new filename</b>:

### Convert File Extension (String)__ogtk.vi

-- <b>Controls</b> --
- <b>new ending (none)</b>:
- <b>file name</b>:

-- <b>Indicators</b> --
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

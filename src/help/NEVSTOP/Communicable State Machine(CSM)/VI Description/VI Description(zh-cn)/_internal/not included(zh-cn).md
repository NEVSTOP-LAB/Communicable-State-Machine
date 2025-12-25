
## Documentation

### CSM - Copyright QuickDrop.vi

### CSM - Documentation QuickDrop.vi

### CSM - Keywords QuickDrop.vi

### CSM Dummy Module.vi

-- <b>Controls(输入控件)</b> --
- <b>Init State("Macro: Initialize")</b>:
- <b>Name("" to use uuid)</b>:
- <b>Name ("" to Use UUID)</b>:Controls

## CSM-DOC

### csmdoc_import_all_csm_VI_description_doc.vi

选择 CSM VI 功能描述的 markdown 文件，导入到所有的VI。

-- <b>Controls</b> --
- <b>Path</b>: CSM VI 功能描述的 markdown 文件路径

### csmdoc_export_all_csm_VI_description_doc.vi

分析所有CSM VI, 将 VI 功能描述导出到 markdown 文件中。

-- <b>Controls</b> --
- <b>Path</b>: CSM VI 功能描述的 markdown 文件路径

### csmdoc_export_VI_description.vi

-- <b>Controls</b> --
- <b>NOTE-Map</b>:
- <b>Path</b>:

-- <b>Indicators</b> --
- <b>concatenated string</b>:

### csmdoc_import_doc_to_singleVI.vi

### csmdoc_import_VI_description.vi

-- <b>Controls</b> --
- <b>NOTE-Map</b>:
- <b>string</b>:
- <b>Path</b>:

### csmdoc_list_all_csm_documented_VIs.vi

-- <b>Indicators</b> --
- <b>Array</b>:

### csmdoc_load vi description map.vi

-- <b>Controls</b> --
- <b>Path</b>:

-- <b>Indicators</b> --
- <b>text</b>:
- <b>variant 2</b>:
- <b>variant</b>:

## Scripts

### Script - JKISM to CSM.vi

Add CSM Module.vi

- <b>CSM Name</b>:Controls
- <b>CSM-VI</b>:Controls
- <b>Config Path</b>:Controls

Add CSM-VI.vi

- <b>CSM-VI</b>:Controls
- <b>Config Path</b>:Controls

Add State(s) to Queue__jkism.vi

- <b>State(s) at Back ("")</b>:Controls
- <b>State(s) in ("")</b>:Controls
- <b>State(s) in Front ("")</b>:Controls
- <b>States Out</b>:Indicators

Append CSM AppDir If Relative.vi

- <b>Application Directory (+ Relative)</b>:Indicators
- <b>Relative Path (.)</b>:Controls

Auto Broadcast State.vi

- <b>CSM Name</b>:Controls
- <b>Current State</b>:Controls
- <b>Remaining States Queue</b>:Indicators
- <b>States Queue</b>:Controls



Build Interface Menu.vi

- <b>Coords</b>:Controls
- <b>CtlRef</b>:Controls
- <b>Discard?</b>:Indicators
- <b>Menu In</b>:Controls
- <b>Tree</b>:Controls

Build MainTree Menu.vi

- <b>Coords</b>:Controls
- <b>CtlRef</b>:Controls
- <b>Discard?</b>:Indicators
- <b>Menu In</b>:Controls

Build Status Menu.vi

- <b>Coords</b>:Controls
- <b>CtlRef</b>:Controls
- <b>Discard?</b>:Indicators
- <b>Menu In</b>:Controls
- <b>Tree</b>:Controls

Bulid Status List.vi

- <b>Array in</b>:Controls
- <b>Array</b>:Indicators
- <b>Text.Text</b>:Controls

















CSM - Interface Browser.vi

- <b>Init State ("Macro: Initialize")</b>:Controls

CSM - Internal State Debug Log History.vi

- <b>>> Response Source Message >></b>:Controls
- <b>Arguments ("")</b>:Controls
- <b>Debug Log</b>:Indicators
- <b>Enable Periodic State Filter? (T)</b>:Controls
- <b>Length (5000)</b>:Controls
- <b>Settings</b>:Controls
- <b>Skip In Runtime? (T)</b>:Controls
- <b>Source ("")</b>:Controls
- <b>State</b>:Controls







CSM - System States.vi

- <b>items to filter</b>:Indicators

CSM - user.lib Dir.vi

- <b><LabVIEW></b>:Indicators
- <b>csm_user.lib_dir</b>:Indicators

CSM Application Directory.vi

- <b>CSM Application Dir</b>:Indicators

CSM Batch Format Tool.vi



CSM Duplicate Name Error.vi

- <b>CSM Name</b>:Controls
- <b>Occured</b>:Controls



CSM Invalid Name Error.vi

- <b>Name ("" to Use UUID)</b>:Controls
- <b>Occured</b>:Controls

CSM Library Version.vi

- <b>Min-Compatible Version</b>:Indicators

CSM Missing Return State Error.vi

- <b>Arguments (As CSM Name)</b>:Controls

CSM Not Found Error.vi

- <b>Occured?</b>:Controls
- <b>Queue Name</b>:Controls

CSM Part Property at Cursor.vi

- <b>Array</b>:Indicators
- <b>Msg Type</b>:Indicators
- <b>Pos</b>:Controls
- <b>Property</b>:Indicators
- <b>Single-line Text</b>:Controls



CSM-Logger-Thread(Event).vi

- <b>Exit When All Module Exist? (F)</b>:Controls
- <b>File Path (Use Dialog)</b>:Controls
- <b>Format String</b>:Controls
- <b>GlobalLogFilter.lvclass</b>:Controls
- <b>Log Limit</b>:Controls
- <b>WatchDogQ</b>:Controls

CSMKVMap-InitDefaultValues.vi

- <b>KVMap</b>:Indicators

CSMKVMap-Preview.vi

- <b>Array</b>:Indicators

CSMKVMap-Read.vi

- <b>default value (empty variant)</b>:Controls
- <b>name</b>:Controls
- <b>value</b>:Indicators

CSMKVMap-Write.vi

- <b>name</b>:Controls
- <b>value</b>:Controls

CSMKVMapDVR.vi

- <b>KVMapDVR</b>:Indicators

CSM_ExampleBrowser.vi



Cache-BroadcastReg Status of Source.vi

- <b>Broadcast State</b>:Controls
- <b>CSM Name</b>:Controls
- <b>State Matched</b>:Indicators

Cache-CSMKVMapDVR.vi

- <b>KVMapDVR</b>:Indicators

Cache-GEvt Refs.vi

- <b>CSM Global Log Ref</b>:Indicators

Cache-StatusChangeEventRef.vi

- <b>Name ("" to Use UUID) In</b>:Controls
- <b>Status Change Event</b>:Indicators

CaseNames To CSM States.vi

- <b>Array in</b>:Controls
- <b>Array out</b>:Indicators

Center Callee in Window Bounds.vi

- <b>Block Diagram Window:Window Bounds</b>:Controls
- <b>Callee VI Refnum (Caller)</b>:Controls

Change File Extension.vi

- <b>New Extension (Txt)</b>:Controls
- <b>Path In</b>:Controls
- <b>Path Out</b>:Indicators
- <b>Previous Extension</b>:Indicators

Change Speed Counter.vi

- <b>Last Check Time</b>:Indicators
- <b>New?</b>:Indicators
- <b>Numeric</b>:Controls
- <b>Period (0.1s)</b>:Controls
- <b>Speed (#/s)</b>:Indicators

ChangeFlag-Read.vi

- <b>ChangeFlag</b>:Indicators
- <b>ChangeFlagQ</b>:Controls

ChangeFlag-Write.vi

- <b>ChangeFlag</b>:Controls
- <b>ChangeFlagQ</b>:Controls

ChangeFlagDB.vi

- <b>ChangeFlagName</b>:Controls
- <b>ChangeFlagQ</b>:Indicators

Check Compatibility for CSM.vi

- <b>Compactible</b>:Indicators
- <b>force check(F)</b>:Controls

Check Timeout.vi

- <b>Force Timeout?</b>:Controls
- <b>Timeout Expected (ms)</b>:Controls
- <b>Timeout</b>:Indicators

Command Editor Dialog.vi

- <b>CSM States</b>:Controls
- <b>Command Out</b>:Indicators
- <b>Name ("" to Use Uuid)</b>:Controls

Concatenate Non-Empty Strings.vi

- <b>Result String</b>:Indicators
- <b>String1</b>:Controls
- <b>String2</b>:Controls

Concatenate PostPostMsg Message.vi

- <b>Arguments</b>:Controls
- <b>Async-Message</b>:Controls
- <b>PostPostMsg Message</b>:Indicators
- <b>Source</b>:Controls

Concatenate State with Comments.vi

- <b>Comments</b>:Controls
- <b>State With Arguments</b>:Indicators
- <b>State</b>:Controls

Debounced Signal.vi

- <b>Debounce Period (5s)</b>:Controls
- <b>Reset Value</b>:Controls
- <b>Reset? (F)</b>:Controls
- <b>Signal (Safe)</b>:Indicators
- <b>Signal</b>:Controls
- <b>Since Last Change (S)</b>:Indicators

Defer Panel Updates_csm.vi

- <b>Defer Updates?</b>:Controls
- <b>VI Reference (Caller) 2</b>:Indicators
- <b>VI Reference (Caller)</b>:Controls

Delete CSM Module.vi

- <b>CSM Name</b>:Controls
- <b>Config Path</b>:Controls

Delete CSM State.vi

- <b>Application Reference (Local)</b>:Controls
- <b>Config Path ("" For Lvcsm File)</b>:Controls
- <b>Name</b>:Controls
- <b>State</b>:Controls
- <b>Type</b>:Controls

Delete CSM-VI.vi

- <b>CSM Name</b>:Controls
- <b>Config Path</b>:Controls

Destroy JKISM Message Event.vi

- <b>Module</b>:Controls

Export Single VI Help.vi

- <b>Path</b>:Controls
- <b>Show FP</b>:Controls
- <b>VI Description Out</b>:Indicators
- <b>VI Description</b>:Controls

Export VI Help.vi

- <b>Language Ring</b>:Controls

FGV-BroadcastRegistry(lvlibp).vi

- <b>API</b>:Controls
- <b>Operation</b>:Controls
- <b>Response Message</b>:Indicators
- <b>Source</b>:Controls
- <b>Status</b>:Controls
- <b>Target</b>:Controls

FGV-GEvt Filter Rules(lvlibp).vi

- <b>Rules-v1</b>:Controls
- <b>Rules-v1</b>:Indicators
- <b>Set? (T)/Get(F)</b>:Controls

FGV-GEvt Filter Rules.vi

- <b>Rules-v1</b>:Controls
- <b>Rules-v1</b>:Indicators
- <b>Set? (T)/Get(F)</b>:Controls

FGV-GEvt Refs.vi



FGV-GlobalEventQueues(lvlibp).vi

- <b>Create? (F)</b>:Controls
- <b>CreatedQueue</b>:Indicators
- <b>Queue</b>:Indicators

FGV-GlobalEventQueues.vi

- <b>Create? (F)</b>:Controls
- <b>CreatedQueue</b>:Indicators
- <b>Queue</b>:Indicators

FGV-GlobalEventRef(lvlibp).vi

- <b>Event</b>:Indicators
- <b>Force Destroy?</b>:Controls
- <b>Operation</b>:Controls
- <b>Timeout In ms (5000 ms)</b>:Controls

Falling Edge.vi

- <b>Falling Edge</b>:Indicators
- <b>Signal</b>:Controls

Filter StrArray By Input.vi

- <b>Array In</b>:Controls
- <b>Array</b>:Indicators
- <b>Filter String</b>:Controls

Filter Tree Data.vi

- <b>Filter</b>:Controls
- <b>FilterOption</b>:Controls
- <b>TreeData 2</b>:Indicators
- <b>TreeData</b>:Controls

First Existing Folder in Path.vi

- <b>Stripped Path In</b>:Controls
- <b>Stripped Path Out</b>:Indicators

FlagInstance-Broadcast Cache.vi

- <b>Changed</b>:Indicators

FlagInstance-CSMKVMap.vi

- <b>Changed</b>:Indicators

FlagInstance-CSMQ FGV.vi

- <b>Changed</b>:Indicators

FlagInstance-GEvt Filter.vi

- <b>Changed</b>:Indicators

FlagInstance-GEvt Refs.vi

- <b>Changed</b>:Indicators

FlagInstance-Update Broadcast Cache.vi

- <b>New Random Change Flag</b>:Indicators

FlagInstance-Update CSMKVMap.vi

- <b>New Random Change Flag</b>:Indicators

FlagInstance-Update CSMQ FGV.vi

- <b>New Random Change Flag</b>:Indicators

FlagInstance-Update GEvt Filter.vi

- <b>New Random Change Flag</b>:Indicators

FlagInstance-Update GEvt Refs.vi

- <b>New Random Change Flag</b>:Indicators

FrameNames to StateNames.vi

- <b>Array of Strings</b>:Indicators
- <b>FrameNames</b>:Controls

GEvt-Convert Filter Rules - Periodic Setting Only.vi

- <b>GlobalLogFilter</b>:Indicators
- <b>PeriodicMessageFilter</b>:Controls

GEvt-Convert Filter Rules - v1.1.vi

- <b>GlobalLogFilter</b>:Indicators
- <b>Rules-v1</b>:Controls

GEvt-Filter Global Log - v1.1.vi

- <b>Additional Info</b>:Indicators
- <b>Cross CSM Data (In)</b>:Controls
- <b>Cross CSM Data</b>:Indicators
- <b>Level (Normal)</b>:Controls
- <b>Matched Previous?</b>:Controls
- <b>Matched? (Dup)</b>:Indicators
- <b>Rules</b>:Controls

GEvt-Valid Subscribers.vi

- <b>CSM Global Log Event In</b>:Controls
- <b>CSM Global Log Event Out</b>:Indicators
- <b>Valid</b>:Indicators

Generate JKISM Message Event.vi

- <b>JKISM Message</b>:Controls
- <b>Module</b>:Controls

Get Status List From Term.vi

- <b>Array</b>:Indicators
- <b>CSM CaseRef</b>:Controls
- <b>Term Refnum</b>:Controls
- <b>need Symbol?</b>:Controls



Global Log To String(Periodic Check).vi

- <b> Time Format String</b>:Controls
- <b>Cross CSM Data</b>:Controls
- <b>Level (Normal)</b>:Controls
- <b>Periodic Info</b>:Indicators
- <b>Remove Immediately? (F)</b>:Controls
- <b>Reset?</b>:Controls
- <b>Settings</b>:Controls
- <b>String</b>:Indicators



Interface Browser.vi

- <b>Caller Window Bounds</b>:Controls
- <b>Init State ("Macro: Initialize")</b>:Controls
- <b>Name ("" to Use Uuid)</b>:Controls

Is Asynchronous Call.vi

- <b>Async Call?</b>:Indicators

Jump to CSM State.vi

- <b>Application Reference (Local)</b>:Controls
- <b>Config Path ("" For Lvcsm File)</b>:Controls
- <b>Name</b>:Controls
- <b>State</b>:Controls
- <b>Type</b>:Controls

List Status Of Source Module.vi

- <b>Array</b>:Indicators
- <b>BroadcastRegistry In</b>:Controls
- <b>BroadcastRegistry Out</b>:Indicators
- <b>Source</b>:Controls

LogFilter - Check.vi

- <b>Cross CSM Data In</b>:Controls
- <b>Cross CSM Data Out</b>:Indicators
- <b>GlobalLogFilter In</b>:Controls
- <b>GlobalLogFilter.lvclass (Dup)</b>:Indicators
- <b>Matched Previous?</b>:Controls
- <b>Matched? (Dup)</b>:Indicators

LogFilter - Periodic Log Check.vi

- <b>Additional Info</b>:Indicators
- <b>Cross CSM Data In</b>:Controls
- <b>Cross CSM Data Out</b>:Indicators
- <b>Filtered Status</b>:Indicators
- <b>GlobalLogFilter In</b>:Controls
- <b>GlobalLogFilter.lvclass (Dup)</b>:Indicators
- <b>Level (Normal)</b>:Controls
- <b>Matched Previous?</b>:Controls
- <b>Matched? (Dup)</b>:Indicators

Make Bent Wire Straight.vi

- <b>CSM-Helper In</b>:Controls
- <b>CSM-Helper Out</b>:Indicators
- <b>Index (-1 For All)</b>:Controls

Match Asterisk Pattern.vi

- <b>* Expression</b>:Controls
- <b>Matched</b>:Indicators
- <b>String (Dup)</b>:Indicators
- <b>String</b>:Controls

Minimum Compatible Version.vi

- <b>Min-Compatible Version</b>:Indicators

Obtain JKISM Message Event.vi

- <b>JKISM Message Event</b>:Indicators
- <b>Module</b>:Controls

Occurrence Speed Counter.vi

- <b>Last Check Time</b>:Indicators
- <b>New?</b>:Indicators
- <b>Occured? (T)</b>:Controls
- <b>Period (0.1s)</b>:Controls
- <b>Speed (#/s)</b>:Indicators

Parse Action State After Exit.vi

- <b>Need to Process</b>:Indicators
- <b>Remaining States</b>:Indicators
- <b>States</b>:Controls

Parse Next Single-line.vi

- <b>Next Single-line State</b>:Indicators
- <b>Remaining States Queue</b>:Indicators
- <b>States Queue</b>:Controls

Path to lvcsm String.vi

- <b>Common Path</b>:Indicators
- <b>Path</b>:Controls

Periodic Log Filter Check.vi

- <b>Additional Info</b>:Indicators
- <b>Cross CSM Data Out</b>:Indicators
- <b>Cross CSM Data</b>:Controls
- <b>Current Time</b>:Indicators
- <b>Filtered Status</b>:Indicators
- <b>Filtered</b>:Indicators
- <b>Level (Normal)</b>:Controls
- <b>Remove Immediately? (F)</b>:Controls
- <b>Reset?</b>:Controls
- <b>Settings</b>:Controls

Periodic String Filter.vi

- <b>Additional Info</b>:Indicators
- <b>Current Time</b>:Indicators
- <b>Filtered Status</b>:Indicators
- <b>Filtered?</b>:Indicators
- <b>Input String (Dup)</b>:Indicators
- <b>Input String</b>:Controls
- <b>Level (Normal)</b>:Controls
- <b>Parameter</b>:Controls
- <b>Remove Immediately? (F)</b>:Controls
- <b>Reset?</b>:Controls
- <b>Settings</b>:Controls
- <b>State</b>:Controls

PeriodicFilter-Append Filtered Status.vi

- <b>Filtered Status</b>:Controls
- <b>String Cache In</b>:Controls
- <b>String Cache Out</b>:Indicators

PeriodicFilter-Auto Set Filter.vi

- <b>Data In</b>:Controls
- <b>Data Out</b>:Indicators

PeriodicFilter-Check Key.vi

- <b>Data In</b>:Controls
- <b>Data Out</b>:Indicators
- <b>Index</b>:Indicators
- <b>Key</b>:Controls
- <b>Seconds Since 1Jan1904 2</b>:Controls

PeriodicFilter-Check Speed.vi

- <b>Data In</b>:Controls
- <b>Data Out</b>:Indicators
- <b>Index</b>:Controls
- <b>New Filtered Item</b>:Indicators
- <b>Over Threshold?</b>:Indicators
- <b>Parameter</b>:Controls
- <b>Seconds Since 1Jan1904</b>:Controls
- <b>Settings</b>:Controls

PeriodicFilter-Filtered Entry.vi

- <b>Data In</b>:Controls
- <b>Data Out</b>:Indicators
- <b>Entry</b>:Indicators

PeriodicFilter-Filtered Keys.vi

- <b>Data In</b>:Controls
- <b>Data Out</b>:Indicators
- <b>Filtered Keys</b>:Indicators

PeriodicFilter-Format L1 Info String.vi

- <b> Time Format String</b>:Controls
- <b>Array</b>:Indicators
- <b>Entry</b>:Controls

PeriodicFilter-Format L3 Info String.vi

- <b>Array</b>:Indicators

PeriodicFilter-Format Normal Info String.vi

- <b> Time Format String</b>:Controls
- <b>Array</b>:Indicators
- <b>Removed Info</b>:Controls

PeriodicFilter-Format Result.vi

- <b> Time Format String</b>:Controls
- <b>Additional Info</b>:Controls
- <b>Cross CSM Data In</b>:Controls
- <b>Current Time</b>:Controls
- <b>Filtered</b>:Controls
- <b>States</b>:Indicators

PeriodicFilter-Format Stop Filter Entrys.vi

- <b> Time Format String</b>:Controls
- <b>Array</b>:Indicators
- <b>Removed Info</b>:Controls
- <b>Seconds Since 1Jan1904 2</b>:Controls

PeriodicFilter-Is String Filtered.vi

- <b>Data In</b>:Controls
- <b>Data Out</b>:Indicators
- <b>Filtered</b>:Indicators
- <b>Input String (Dup)</b>:Indicators
- <b>Input String</b>:Controls

PeriodicFilter-Remove Filtered Entry2.vi

- <b>Data In</b>:Controls
- <b>Data Out</b>:Indicators
- <b>Removed Info</b>:Indicators
- <b>Seconds Since 1Jan1904 2</b>:Controls
- <b>Settings</b>:Controls
- <b>State</b>:Controls

PeriodicFilter-Remove invalid Entry.vi

- <b>Data In</b>:Controls
- <b>Data Out</b>:Indicators
- <b>Removed Info</b>:Indicators
- <b>Seconds Since 1Jan1904 2</b>:Controls
- <b>Settings</b>:Controls

PeriodicFilter-Update Filtered Info.vi

- <b>Data In</b>:Controls
- <b>Data Out</b>:Indicators
- <b>Seconds Since 1Jan1904</b>:Controls
- <b>Settings</b>:Controls

Pick Lines by Section Pattern.vi

- <b>Config Text List out</b>:Indicators
- <b>Config Text List</b>:Controls
- <b>End</b>:Indicators
- <b>Front</b>:Indicators
- <b>RegExp Lef("^[")</b>:Controls
- <b>RegExp Right("^[")</b>:Controls
- <b>Session Name</b>:Controls
- <b>Session</b>:Indicators

Populate Example Description.vi

- <b>Language Ring</b>:Controls

Populate Single Example Description.vi

- <b>Path</b>:Controls
- <b>Show FP</b>:Controls
- <b>VI Description</b>:Controls

Populate Single VI Help.vi

- <b>Force?(F)</b>:Controls
- <b>Path</b>:Controls
- <b>Show FP</b>:Controls
- <b>VI Description</b>:Controls

Populate Tree with Delimited Strings_csm.vi

- <b>Default Symbol</b>:Controls
- <b>Delimiter</b>:Controls
- <b>Items (Delimited)</b>:Controls
- <b>Parents Added</b>:Indicators
- <b>Tree Control Dup</b>:Indicators
- <b>Tree Control</b>:Controls
- <b>Use Child Only?</b>:Controls

Populate VI Help.vi

- <b>Language Ring</b>:Controls

Read CSM API By CSM-VI.vi

- <b>Array</b>:Indicators
- <b>CSM VI</b>:Controls
- <b>Config Path</b>:Controls

Read CSM API By CSM.vi

- <b>Array</b>:Indicators
- <b>CSM Name</b>:Controls
- <b>Config Path</b>:Controls

Read CSM API with lvcsm Support.vi

- <b>CSM Name</b>:Controls
- <b>CSMAPI List</b>:Indicators
- <b>Config Path ("" For Lvcsm File)</b>:Controls
- <b>Current Module ("" to Generate an ID)</b>:Controls
- <b>Force? (F)</b>:Controls

Read CSM Module Info.vi

- <b>CSM Name</b>:Controls
- <b>Cluster</b>:Indicators
- <b>Config Path</b>:Controls

Read CSM States By CSM-VI.vi

- <b>Array</b>:Indicators
- <b>CSM VI</b>:Controls
- <b>Config Path</b>:Controls

Read CSM States By CSM.vi

- <b>Array</b>:Indicators
- <b>CSM Name</b>:Controls
- <b>Config Path</b>:Controls

Read CSM States with lvcsm Support.vi

- <b>CSM Name</b>:Controls
- <b>CSMAPI List</b>:Indicators
- <b>Config Path ("" For Lvcsm File)</b>:Controls
- <b>Current Module ("" to Generate an ID)</b>:Controls
- <b>Force? (F)</b>:Controls

Read CSM Status By CSM-VI.vi

- <b>Array 3</b>:Indicators
- <b>CSM VI</b>:Controls
- <b>Config Path</b>:Controls

Read CSM Status By CSM.vi

- <b>Array 3</b>:Indicators
- <b>CSM Name</b>:Controls
- <b>Config Path</b>:Controls

Read CSM Status with lvcsm Support.vi

- <b>CSM Name</b>:Controls
- <b>CSMAPI List</b>:Indicators
- <b>Config Path ("" For Lvcsm File)</b>:Controls
- <b>Current Module ("" to Generate an ID)</b>:Controls
- <b>Force? (F)</b>:Controls

Read CSM User-States with lvcsm Support.vi

- <b>CSM Name</b>:Controls
- <b>CSMAPI List</b>:Indicators
- <b>Config Path ("" For Lvcsm File)</b>:Controls
- <b>Current Module ("" to Generate an ID)</b>:Controls
- <b>Force? (F)</b>:Controls

Read CSM-VI Info.vi

- <b>CSM Name</b>:Controls
- <b>Cluster 2</b>:Indicators
- <b>Config Path</b>:Controls

Read CSM-VIs.vi

- <b>Array</b>:Indicators
- <b>Config Path</b>:Controls

Read CSMs.vi

- <b>Array</b>:Indicators
- <b>Config Path</b>:Controls

Read Rules.vi

- <b>LogFilter In</b>:Controls
- <b>LogFilter Out</b>:Indicators
- <b>Rules</b>:Indicators

Read Status.vi

- <b>Array 3</b>:Indicators
- <b>CSM-Helper in</b>:Controls
- <b>CSM-Helper out</b>:Indicators

Refresh Online CSMs in lvcsm.vi

- <b>Array W/ Subset Deleted</b>:Indicators
- <b>Caller</b>:Controls

Relocate Splitter Posistion.vi

- <b>Array</b>:Controls
- <b>Splitter in</b>:Controls

Remove Comments from Single-line.vi

- <b>single-line text without comments</b>:Indicators
- <b>single-line text</b>:Controls

Remove Duplicates From StrArray.vi

- <b>Removed Index</b>:Indicators
- <b>StrArray In</b>:Controls
- <b>StrArray</b>:Indicators

Remove Emptys From StrArray.vi

- <b>Array In</b>:Controls
- <b>Array Out</b>:Indicators

Rename Copyright Year.vi

- <b>CSM-Helper in</b>:Controls
- <b>CSM-Helper out</b>:Indicators
- <b>seconds since 1Jan1904</b>:Controls

Replace Debug Log History Method.vi

- <b>CSM-Helper in</b>:Controls
- <b>CSM-Helper out</b>:Indicators

Replace LastResp Token.vi

- <b>Argument Out</b>:Indicators
- <b>Argument</b>:Controls
- <b>LastResp</b>:Controls

ResMgr-BackgroundThread.vi

- <b>Name (Unnamed)</b>:Controls

ResMgr-ObtainBKThreadQ.vi

- <b>ObtainBKThreadQ</b>:Indicators

ResMgr-Request ExitEvent.vi

- <b>CSMExit</b>:Indicators
- <b>Timeout In ms (5000 ms)</b>:Controls
- <b>WatchDogQ</b>:Controls

ResMgr-Request GlobalLogEvent.vi

- <b>GlobalLogEvent</b>:Indicators
- <b>Timeout In ms (5000 ms)</b>:Controls
- <b>WatchDogQ</b>:Controls

ResMgr-Request KVMap.vi

- <b>KVMapDVR</b>:Indicators
- <b>Timeout In ms (5000 ms)</b>:Controls
- <b>WatchDogQ</b>:Controls

ResMgr-Request NewStateEvent.vi

- <b>Timeout In ms (5000 ms)</b>:Controls
- <b>User Event Out</b>:Indicators
- <b>WatchDogQ</b>:Controls

ResMgr-Request PriorityQueue.vi

- <b>Priority Queue</b>:Indicators
- <b>Timeout In ms (5000 ms)</b>:Controls
- <b>WatchDogQ</b>:Controls

ResMgr-Request SharedDataDVR.vi

- <b>DVR</b>:Indicators
- <b>Timeout In ms (5000 ms)</b>:Controls
- <b>WatchDogQ</b>:Controls

ResMgr-Request StatusEvent.vi

- <b>Status Message</b>:Indicators
- <b>Timeout In ms (5000ms)</b>:Controls
- <b>WatchDogQ</b>:Controls

ResMgr-Request TagMap.vi

- <b>Data Value Reference</b>:Indicators
- <b>Timeout In ms (5000 ms)</b>:Controls
- <b>WatchDogQ</b>:Controls

ResMgr-Request lvlibp Minimum Version.vi

- <b>CSM Version</b>:Indicators
- <b>Timeout In ms (5000 ms)</b>:Controls

ResMgr-RequestDef.vi

- <b>ResMgr-RequestDef.ctl</b>:Indicators

ResMgr-StartWatchDog.vi

- <b>Force?</b>:Controls
- <b>ModuleName</b>:Controls
- <b>WatchDogQ</b>:Indicators

ResMgr-WatchdogThread.vi

- <b>From Who</b>:Controls
- <b>WatchDogQ</b>:Controls

Rising Edge.vi

- <b>Rising Edge</b>:Indicators
- <b>Signal</b>:Controls

Scan CSM-VI.vi

- <b>Block Diagram Window:Window Bounds</b>:Controls
- <b>Config Path</b>:Controls
- <b>Root</b>:Controls

Script Editor Dialog.vi

- <b>Name ("" to Use Uuid)</b>:Controls
- <b>Script Out</b>:Indicators
- <b>Script</b>:Controls
- <b>VI Refnum</b>:Controls

Semaphore Lock.vi

- <b>name</b>:Controls
- <b>semaphore</b>:Indicators

Semaphore Unlock.vi

- <b>semaphore</b>:Controls

Set Periodic Log Filter.vi

- <b>GlobalLogFilter In</b>:Controls
- <b>GlobalLogFilter Out</b>:Indicators
- <b>PeriodicLogFilter</b>:Controls

Single-Line To CSM Parts.vi

- <b>Comment Pos</b>:Indicators
- <b>Comments</b>:Indicators
- <b>Msg Type</b>:Indicators
- <b>Property</b>:Indicators
- <b>Single-line Text</b>:Controls

Split Single-line Message.vi

- <b>args</b>:Indicators
- <b>operator</b>:Indicators
- <b>single-line text</b>:Controls
- <b>source/target</b>:Indicators
- <b>state</b>:Indicators

Split Single-line Reason Parts.vi

- <b>CSM Name</b>:Indicators
- <b>Single-line -& Reason</b>:Controls
- <b>`Arguments</b>:Indicators
- <b>`State</b>:Indicators

Split String Array By Patterns_CSM.vi

- <b>Array</b>:Indicators
- <b>Patterns</b>:Controls
- <b>Text Array</b>:Controls



Text To Lines_CSM.vi

- <b>Lines</b>:Indicators
- <b>Remove Empty Lines? (T)</b>:Controls
- <b>String</b>:Controls

Tree Rows from Delimited String Array_csm.vi

- <b>Default Symbol</b>:Controls
- <b>Delimiter</b>:Controls
- <b>Item to Add[]</b>:Indicators
- <b>Items (Delimited)</b>:Controls
- <b>Parent Tag Added[]</b>:Indicators
- <b>Use Child Only? (F)</b>:Controls

Trim Single-line Text.vi

- <b>single-line text</b>:Controls
- <b>trimed text</b>:Indicators

TxtFile Load_CSM.vi

- <b>Path</b>:Controls
- <b>Text</b>:Indicators

TxtFile Save_CSM.vi

- <b>Path</b>:Controls
- <b>text</b>:Controls

Update Case Frame to Image.vi

- <b>Application Reference (Local)</b>:Controls
- <b>Config Path ("" For Lvcsm File)</b>:Controls
- <b>Name</b>:Controls
- <b>New Picture</b>:Indicators
- <b>Picture Control Reference</b>:Controls
- <b>State</b>:Controls
- <b>Type</b>:Controls
- <b>Zoom Factor</b>:Controls

Update Connect Panel Doc.vi

- <b>Array</b>:Indicators
- <b>vi path</b>:Controls

Update lvcsm Section in VI Description.vi

- <b>CSM-Helper in</b>:Controls
- <b>CSM-Helper out</b>:Indicators

User Visible Strings.vi



_Array of VData to VCluster.vi

- <b>Array</b>:Controls
- <b>VCluster</b>:Indicators

_BMarkInfo to MCTable.vi

- <b>BookmarkInfo</b>:Controls
- <b>sorted 2D array</b>:Indicators

_Change Bookmark Image.vi

- <b>Bookmark ID</b>:Controls
- <b>No Image?</b>:Controls
- <b>Picture Control Reference</b>:Controls
- <b>vi path</b>:Controls

_Common Path to Specific Path.vi

- <b>Common Path</b>:Controls
- <b>Specific Path</b>:Indicators

_Generate ControlDocMap.vi

- <b>Array</b>:Controls
- <b>Variant</b>:Indicators

_Generate DocMap.vi

- <b>Array 2</b>:Controls
- <b>Array</b>:Controls
- <b>Replace Ref(T)</b>:Controls
- <b>Variant</b>:Indicators

_Get App Ref from Info.vi

- <b>Analysis App Info</b>:Controls
- <b>Analysis App ref</b>:Indicators

_Get Bookmarks for VI.vi

- <b>Array of bookmarks</b>:Indicators
- <b>VI</b>:Controls
- <b>possible undisplayed bookmarks</b>:Indicators

_Get Bookmarks.vi

- <b>App Info</b>:Controls
- <b>bookmarks</b>:Indicators
- <b>possible undisplayed bookmarks</b>:Indicators
- <b>show vi in llb?</b>:Controls

_Get VIs in Project.vi

- <b>Array of VIs</b>:Indicators
- <b>project out</b>:Indicators
- <b>project</b>:Controls

_Highlight Bookmark.vi

- <b>bookmarks</b>:Controls
- <b>tag</b>:Controls

_Highlight Object.vi

- <b>Analysis App Ref</b>:Controls
- <b>GObj Refnum</b>:Controls
- <b>Poly Path</b>:Controls
- <b>Run Prog?</b>:Controls

_List Example VIs.vi

- <b>Array</b>:Indicators
- <b>root</b>:Controls

_Load Markdown File.vi

- <b>Array 2</b>:Indicators
- <b>Array</b>:Indicators
- <b>Path</b>:Controls

_Match String Inside Pattern.vi

- <b>Cluster</b>:Controls
- <b>String inside</b>:Indicators
- <b>string</b>:Controls

_N-MarkdownTitle.vi

- <b>Numeric</b>:Controls
- <b>String</b>:Indicators

_Open VI Reference Without Loading Deps.vi

- <b>CSM-VI</b>:Controls
- <b>Options</b>:Controls
- <b>VI Out</b>:Indicators

_Overwrite Decoration Content.vi

- <b>Decos[]</b>:Controls
- <b>Variant in</b>:Controls
- <b>Variant out</b>:Indicators

_Parse Markdown Control Elements.vi

- <b>Array</b>:Indicators
- <b>Lines (dup)</b>:Indicators
- <b>Lines</b>:Controls

_Parse Markdown Doc Elements.vi

- <b>Array</b>:Indicators
- <b>Lines (dup)</b>:Indicators
- <b>Lines</b>:Controls

_Parse Markdown Note Elements.vi

- <b>Array</b>:Indicators
- <b>Lines (dup)</b>:Indicators
- <b>Lines</b>:Controls

_Read CSM Status Content.vi

- <b>Array</b>:Indicators
- <b>CSM-Helper In</b>:Controls
- <b>CSM-Helper Out</b>:Indicators

_Read ItemArray.vi

- <b>Array</b>:Indicators
- <b>Config Path</b>:Controls
- <b>Section Prefix</b>:Controls
- <b>Section</b>:Controls

_Remove Duplicates Strings.vi

- <b>Indices of Removed Elements</b>:Indicators
- <b>Input Array</b>:Controls
- <b>Output Array</b>:Indicators

_Request StringList with lvcsm Support.vi

- <b>API Name</b>:Controls
- <b>API Ref</b>:Controls
- <b>CSM Name</b>:Controls
- <b>CSMAPI List</b>:Indicators
- <b>Config Path ("" For Lvcsm File)</b>:Controls
- <b>Current Module ("" to Generate an ID)</b>:Controls
- <b>Force? (F)</b>:Controls

_Return App Info.vi

- <b>App Info</b>:Indicators
- <b>App Refnum for Opening VI</b>:Indicators
- <b>App Refnum in</b>:Controls

_Specific Path to Common Path.vi

- <b>Common Path</b>:Indicators
- <b>Specific Path</b>:Controls

_System Locations.vi

- <b>SystemLocations</b>:Indicators

_UpdatePictureControl.vi

- <b>Center Object Reference</b>:Controls
- <b>Picture Control Reference</b>:Controls

_VI Missing or Broken.vi

- <b>Missing Or Broken?</b>:Indicators
- <b>Path</b>:Controls

_list_CSM documented VIs.vi

- <b>Array</b>:Indicators
- <b>Only CSM Folder</b>:Controls

_parse Log Line.vi

- <b>CSM</b>:Indicators
- <b>LogType</b>:Indicators
- <b>State</b>:Indicators
- <b>String</b>:Controls

_scriptEditor.Input Candidates.vi

- <b>Array</b>:Indicators
- <b>Selection</b>:Controls

build tree table in CSM mode.vi

- <b>Config Path</b>:Controls
- <b>Tree Table</b>:Indicators
- <b>Type</b>:Indicators

build tree table in CSM-VI mode.vi

- <b>Config Path</b>:Controls
- <b>Option</b>:Controls
- <b>Tree Table</b>:Indicators
- <b>Type</b>:Indicators

global-GEvt Refs Change Flag.vi



global-TMO for Sync-Rep.vi



is UTF-8_CSM.vi

- <b>String</b>:Controls
- <b>UTF8</b>:Indicators

lvcsm File Path.vi

- <b>Appended Path</b>:Indicators

lvcsm List Sesctions.vi

- <b>Config Path</b>:Controls
- <b>Section Names</b>:Indicators

lvcsm Read Cluster.vim

- <b>Cluster (Dup)</b>:Indicators
- <b>Config Path</b>:Controls
- <b>Default Prototype</b>:Controls
- <b>Section</b>:Controls
- <b>Sub-section ("")</b>:Controls

lvcsm Read section As StringList.vi

- <b>API Name</b>:Controls
- <b>CSM Name</b>:Controls
- <b>CSMAPI List</b>:Indicators
- <b>Config Path ("" For Lvcsm File)</b>:Controls

lvcsm String to Path.vi

- <b>Common Path</b>:Controls
- <b>Path</b>:Indicators

lvcsm Write Cluster.vim

- <b>Config Path</b>:Controls
- <b>Configuration</b>:Controls
- <b>Default Configuration</b>:Controls
- <b>Section</b>:Controls
- <b>Sub-section ("")</b>:Controls
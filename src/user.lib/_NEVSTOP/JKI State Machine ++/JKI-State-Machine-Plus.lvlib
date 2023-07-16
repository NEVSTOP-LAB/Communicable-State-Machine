﻿<?xml version='1.0' encoding='UTF-8'?>
<Library LVVersion="14008000">
	<Property Name="NI.Lib.Icon" Type="Bin">&amp;!#!!!!!!!)!"1!&amp;!!!-!%!!!@````]!!!!"!!%!!!(]!!!*Q(C=\&gt;8"&lt;2MR%!813:!!O;K$1#V-#WJ",5Q,OPKI&amp;K9&amp;N;!7JA7VI";=JQVBZ"4F%#-ZG/O26X_ZZ$/87%&gt;M\6P%FXB^VL\_NHV=@X&lt;^39O0^N(_&lt;8NZOEH@@=^_CM?,3)VK63LD-&gt;8LS%=_]J'0@/1N&lt;XH,7^\SFJ?]Z#5P?=F,HP+5JTTF+5`Z&gt;MB$(P+1)YX*RU2DU$(![)Q3YW.YBG&gt;YBM@8'*\B':\B'2Z&gt;9HC':XC':XD=&amp;M-T0--T0-.DK%USWS(H'2\$2`-U4`-U4`/9-JKH!&gt;JE&lt;?!W#%;UC_WE?:KH?:R']T20]T20]\A=T&gt;-]T&gt;-]T?/7&lt;66[UTQ//9^BIHC+JXC+JXA-(=640-640-6DOCC?YCG)-G%:(#(+4;6$_6)]R?.8&amp;%`R&amp;%`R&amp;)^,WR/K&lt;75?GM=BZUG?Z%G?Z%E?1U4S*%`S*%`S'$;3*XG3*XG3RV320-G40!G3*D6^J-(3D;F4#J,(T\:&lt;=HN+P5FS/S,7ZIWV+7.NNFC&lt;+.&lt;GC0819TX-7!]JVO,(7N29CR6L%7,^=&lt;(1M4#R*IFV][.DX(X?V&amp;6&gt;V&amp;G&gt;V&amp;%&gt;V&amp;\N(L@_Z9\X_TVONVN=L^?Y8#ZR0J`D&gt;$L&amp;]8C-Q_%1_`U_&gt;LP&gt;WWPAO_0NB@$TP@4C`%`KH@[8`A@PRPA=PYZLD8Y![_ML^!!!!!!</Property>
	<Property Name="NI.Lib.SourceVersion" Type="Int">335577088</Property>
	<Property Name="NI.Lib.Version" Type="Str">1.0.0.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.SortType" Type="Int">3</Property>
	<Item Name="Support" Type="Folder">
		<Property Name="NI.LibItem.Scope" Type="Int">2</Property>
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Item Name="JKISMQ" Type="Folder">
			<Item Name="_Create Data Queue.vi" Type="VI" URL="../_Support/_Create Data Queue.vi"/>
			<Item Name="_Create Resp Queue.vi" Type="VI" URL="../_Support/_Create Resp Queue.vi"/>
			<Item Name="_Obtain JKISMQ.vi" Type="VI" URL="../_Support/_Obtain JKISMQ.vi"/>
			<Item Name="_Unlock JKISMQ.vi" Type="VI" URL="../_Support/_Unlock JKISMQ.vi"/>
			<Item Name="_Dequeue JKISMQ.vi" Type="VI" URL="../_Support/_Dequeue JKISMQ.vi"/>
			<Item Name="_Enqueue JKISMQ.vi" Type="VI" URL="../_Support/_Enqueue JKISMQ.vi"/>
			<Item Name="_LockState JKISMQ.vi" Type="VI" URL="../_Support/_LockState JKISMQ.vi"/>
			<Item Name="_JKISMQ.ctl" Type="VI" URL="../_Support/_JKISMQ.ctl"/>
			<Item Name="_JKISMQFGV.vi" Type="VI" URL="../_Support/_JKISMQFGV.vi"/>
			<Item Name="_JKISMQFGVOPER.ctl" Type="VI" URL="../_Support/_JKISMQFGVOPER.ctl"/>
		</Item>
		<Item Name="_Cross JKI StateMachine State Data.ctl" Type="VI" URL="../_Support/_Cross JKI StateMachine State Data.ctl"/>
		<Item Name="_Cross JKI StateMachine State Response.ctl" Type="VI" URL="../_Support/_Cross JKI StateMachine State Response.ctl"/>
		<Item Name="_uuid.vi" Type="VI" URL="../_Support/_uuid.vi"/>
	</Item>
	<Item Name="Templates" Type="Folder">
		<Item Name="JKI State Machine ++ With Event Structure.vi" Type="VI" URL="../Templates/JKI State Machine ++ With Event Structure.vi"/>
		<Item Name="JKI State Machine ++ No Event Structure.vi" Type="VI" URL="../Templates/JKI State Machine ++ No Event Structure.vi"/>
		<Item Name="JKI State Machine ++ Slave Mode Template.vi" Type="VI" URL="../Templates/JKI State Machine ++ Slave Mode Template.vi"/>
	</Item>
	<Item Name="Advance" Type="Folder">
		<Property Name="NI.LibItem.Scope" Type="Int">1</Property>
		<Item Name="Args" Type="Folder">
			<Item Name="JKISM++ Convert Data to HexStr.vi" Type="VI" URL="../AdvanceAPI/JKISM++ Convert Data to HexStr.vi"/>
			<Item Name="JKISM++ Convert HexStr to Data.vi" Type="VI" URL="../AdvanceAPI/JKISM++ Convert HexStr to Data.vi"/>
		</Item>
		<Item Name="JKISM++ List Modules.vi" Type="VI" URL="../AdvanceAPI/JKISM++ List Modules.vi"/>
		<Item Name="JKISM++ Send Message and Wait for Reply.vi" Type="VI" URL="../AdvanceAPI/JKISM++ Send Message and Wait for Reply.vi"/>
		<Item Name="JKISM++ Post Message.vi" Type="VI" URL="../AdvanceAPI/JKISM++ Post Message.vi"/>
		<Item Name="JKISM++ Start Async Call.vi" Type="VI" URL="../AdvanceAPI/JKISM++ Start Async Call.vi"/>
		<Item Name="JKISM++ Synchronized Call.vi" Type="VI" URL="../AdvanceAPI/JKISM++ Synchronized Call.vi"/>
		<Item Name="JKISM++ Get New State Notifier Event.vi" Type="VI" URL="../AdvanceAPI/JKISM++ Get New State Notifier Event.vi"/>
	</Item>
	<Item Name="Utility" Type="Folder">
		<Item Name="Build Internal State String.vi" Type="VI" URL="../Utility/Build Internal State String.vi"/>
		<Item Name="String History Cacher.vi" Type="VI" URL="../Utility/String History Cacher.vi"/>
	</Item>
	<Item Name="Parse State Queue++.vi" Type="VI" URL="../Parse State Queue++.vi"/>
	<Item Name="Add State(s) to Queue++.vi" Type="VI" URL="../Add State(s) to Queue++.vi"/>
	<Item Name="Build State String with Arguments++.vi" Type="VI" URL="../Build State String with Arguments++.vi"/>
</Library>

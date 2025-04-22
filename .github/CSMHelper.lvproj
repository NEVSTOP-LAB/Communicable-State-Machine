<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="17008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="CSM-Helper.lvclass" Type="LVClass" URL="../../src/user.lib/_NEVSTOP/Communicable State Machine(CSM)/_csmHelper/CSM-Helper.lvclass"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Add State(s) to Queue__JKI_lib_State_Machine.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/State Machine/_JKI_lib_State_Machine.llb/Add State(s) to Queue__JKI_lib_State_Machine.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVDeltaXY32Cluster.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVDeltaXY32Cluster.ctl"/>
				<Item Name="LVPointTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVPointTypeDef.ctl"/>
				<Item Name="LVPositionTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVPositionTypeDef.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="NI_Data Type.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/Data Type/NI_Data Type.lvlib"/>
				<Item Name="Parse State Queue__JKI_lib_State_Machine.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/State Machine/_JKI_lib_State_Machine.llb/Parse State Queue__JKI_lib_State_Machine.vi"/>
				<Item Name="TRef Traverse.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef Traverse.vi"/>
				<Item Name="TRef TravTarget.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef TravTarget.ctl"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="VI Scripting - Traverse.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/traverseref.llb/VI Scripting - Traverse.lvlib"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
			</Item>
			<Item Name="CSM - System States.vi" Type="VI" URL="../../src/user.lib/_NEVSTOP/Communicable State Machine(CSM)/_Documentation/CSM - System States.vi"/>
			<Item Name="CSM - user.lib Dir.vi" Type="VI" URL="../../src/user.lib/_NEVSTOP/Communicable State Machine(CSM)/_Documentation/CSM - user.lib Dir.vi"/>
			<Item Name="CSM Shared.lvlib" Type="Library" URL="../../src/user.lib/_NEVSTOP/Communicable State Machine(CSM)/_Shared/CSM Shared.lvlib"/>
			<Item Name="CSM-Helper Utility.lvlib" Type="Library" URL="../../src/user.lib/_NEVSTOP/Communicable State Machine(CSM)/_csmHelper/Utility/CSM-Helper Utility.lvlib"/>
			<Item Name="csmHelper-CaseStructure.lvlib" Type="Library" URL="../../src/user.lib/_NEVSTOP/Communicable State Machine(CSM)/_csmHelper/Utility/_Support/CaseStructure.llb/csmHelper-CaseStructure.lvlib"/>
			<Item Name="csmHelper-Diagram.lvlib" Type="Library" URL="../../src/user.lib/_NEVSTOP/Communicable State Machine(CSM)/_csmHelper/Utility/_Support/Diagram.llb/csmHelper-Diagram.lvlib"/>
			<Item Name="csmHelper-GObject.lvlib" Type="Library" URL="../../src/user.lib/_NEVSTOP/Communicable State Machine(CSM)/_csmHelper/Utility/_Support/GObject.llb/csmHelper-GObject.lvlib"/>
			<Item Name="csmHelper-PairedTunnels.lvlib" Type="Library" URL="../../src/user.lib/_NEVSTOP/Communicable State Machine(CSM)/_csmHelper/Utility/_Support/PairedTunnels.llb/csmHelper-PairedTunnels.lvlib"/>
			<Item Name="csmHelper-Relationship.lvlib" Type="Library" URL="../../src/user.lib/_NEVSTOP/Communicable State Machine(CSM)/_csmHelper/Utility/_Support/Relationship.llb/csmHelper-Relationship.lvlib"/>
			<Item Name="csmHelper-SubVI.lvlib" Type="Library" URL="../../src/user.lib/_NEVSTOP/Communicable State Machine(CSM)/_csmHelper/Utility/_Support/SubVI.llb/csmHelper-SubVI.lvlib"/>
			<Item Name="csmHelper-Terminals.lvlib" Type="Library" URL="../../src/user.lib/_NEVSTOP/Communicable State Machine(CSM)/_csmHelper/Utility/_Support/Terminals.llb/csmHelper-Terminals.lvlib"/>
			<Item Name="csmHelper-Wire.lvlib" Type="Library" URL="../../src/user.lib/_NEVSTOP/Communicable State Machine(CSM)/_csmHelper/Utility/_Support/Wire.llb/csmHelper-Wire.lvlib"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>

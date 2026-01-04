<table>  
  <tr align="left">
      <td> Test Case No. </td>
      <td> Test Case Description </td>
      <td> Test Case VI </td>
      <td> Normal Mode </td>
      <td> Submodule Mode </td>
      <td> System-Level Mode </td>
      <td> Worker Mode </td>
      <td> Chain Mode </td>
      <td> lvlibp </td>
  </tr>
  <tr align="left">
    <td>1</td>
    <td>CSM1 throws Status, can use Register/Unregister internally or externally to control Status triggering the State bound to CSM2</td>
    <td>test1-LocalExternalStatusRegistration.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>      
  </tr>
  <tr align="left">
    <td>2</td>
    <td>CSM1 throws Status, can use API internally or externally to control Status triggering the State bound to CSM2</td>
    <td>test2-LocalExternalStatusRegistrationViaAPI.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>3</td>
    <td>CSM1 throws Status, can use API internally or externally to control Status triggering the State bound to CSM2</td>
    <td>test24-MappingRelationshipByExternalRegistration_API.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>4</td>
    <td>CSM1 throws Status, when subscribing externally with string syntax, the subscription does not disappear after CSM exits</td>
    <td>test25-MappingRelationshipByExternalRegistration.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>5</td>
    <td>CSM1 throws Status, when subscribing internally to its own State: if the subscriber name is explicitly written as CSM1, the subscription does not disappear after exit; if the subscriber name is omitted, the subscription is automatically removed after exit.</td>
    <td>test26-MappingRelationshipByLocalRegistration_WithSubcriberName.vi
       <br><br>
test27-MappingRelationshipByLocalRegistration_WithoutSubcriberName.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>6</td>
    <td>CSM1 throws Status, can be subscribed to multiple States in multiple modules, all will be triggered automatically after throwing</td>
    <td>test3-1ToNBroadcastStatus.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>7</td>
    <td>CSM1 throws Status, can be subscribed in non-CSM using UserEvent</td>
    <td>test4-RegisterStatusFromNonCSM.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>8</td>
    <td>CSM1/CSM3 throw different Statuses, can be subscribed to CSM2's State, both can trigger CSM2 to execute State</td>
    <td>test5-RegisterMultipleStatusesToOneState.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
    <tr align="left">
    <td>9</td>
    <td>When subscribing, Source Module Name can use * as a wildcard to subscribe to the same Status from multiple modules at once; unsubscribing from one module's Status does not affect others</td>
    <td>test6-AsteriskWildcardStatusRegistration.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>10</td>
    <td>After successful subscription, CSM1 throws Status multiple times, the subscriber receives all State triggers without loss</td>
    <td>test15-LosslessRegisterStatusMultipleTimes.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>11</td>
    <td>After successful subscription, CSM1 throws Status multiple times, the subscriber receives all State triggers without loss (subscribed in non-CSM using UserEvent)</td>
    <td>test16-LosslessRegisterStatusMultipleTimesNonCSM.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>12</td>
    <td>The Argument of Status is the Argument of the triggered State</td>
    <td>Tested, see test1-LocalExternalStatusRegistration.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>13</td>
    <td>The triggered Status can obtain Source State Name/Source module from Argument Info</td>
    <td>test7-TestArgumentInfoOfTriggeredState_Status.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>14</td>
    <td>CSM1 throws Interrupt, can be subscribed to multiple States in multiple modules, all will be triggered automatically after throwing</td>
    <td>test19-1ToNInterruptStatus.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>15</td>
    <td>CSM1 throws Interrupt, can be subscribed in non-CSM using Interrupt User Event; Status User Event will not trigger</td>
    <td>test21-RegisterInterruptFromNonCSM.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>16</td>
    <td>CSM1 throws Status, subscribed as interrupt, can be subscribed in non-CSM using Interrupt User Event; Status User Event will not trigger</td>
    <td>test20-RegisterStatusAsInterruptFromNonCSM.vi
    </td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
    <tr align="left">
    <td>17</td>
    <td>CSM1 throws Interrupt, subscribed as Status, can be subscribed in non-CSM using Status User Event; Interrupt User Event will not trigger</td>
    <td>test22-RegisterInterruptAsStatusFromNonCSM.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>18</td>
    <td>CSM1 does not throw Status, its State can use Register/Unregister internally or externally to control Status triggering the State bound to CSM2</td>
    <td>test8-LocalExternalStateRegistration.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>19</td>
    <td>CSM1 does not throw Status, its State can use API internally or externally to control Status triggering the State bound to CSM2</td>
    <td>test9-LocalExternalStateRegistrationViaAPI.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>20</td>
    <td>CSM1 does not throw Status, when subscribing externally to its State with string syntax, the subscription does not disappear after exit</td>
    <td>test29-MappingRelationshipByExternalRegistration_State.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>21</td>
    <td>CSM1 does not throw Status, when subscribing externally to its State via API, the subscription does not disappear after exit</td>
    <td>test28-MappingRelationshipByExternalRegistration_API_State.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
            <td>22</td>
            <td>CSM1 does not throw Status, when subscribing internally to its own State: if the subscriber name is explicitly written as CSM1, the subscription does not disappear after exit; if the subscriber name is omitted, the subscription is automatically removed after exit.</td>
            <td>test30-MappingRelationshipByLocalRegistration_WIthSubscriberName_State.vi
        <br><br>
test31-MappingRelationshipByLocalRegistration_WIthoutSubscriberName_State.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>23</td>
    <td>CSM1 does not throw Status, its State can be subscribed to multiple States in multiple modules, all will be triggered automatically after throwing</td>
    <td>test10-1ToNBroadcastState.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>24</td>
    <td>CSM1 does not throw Status, its State can be subscribed in non-CSM using UserEvent</td>
    <td>test11-RegisterStatesFromNonCSM_State.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>25</td>
    <td>CSM1/CSM3 have different States, can be subscribed to CSM2's State, both can trigger CSM2 to execute State</td>
    <td>test12-RegisterMultipleStatesToOneState.vi/td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>26</td>
    <td>When subscribing, Source Module Name can use * as a wildcard to subscribe to the same State from multiple modules at once; unsubscribing from one module's State does not affect others</td>
    <td>test13-AsteriskWildcardStateRegistration.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>27</td>
    <td>After successful subscription, CSM1 throws State multiple times, the subscriber receives all State triggers without loss</td>
    <td>test17-LosslessRegisterStateMultipleTimes.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>28</td>
    <td>After successful subscription, CSM1 throws State multiple times, the subscriber receives all State triggers without loss (subscribed in non-CSM using UserEvent)</td>
    <td>test16-LosslessRegisterStateMultipleTimesNonCSM.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>29</td>
    <td>The Response of State is the Argument of the triggered State</td>
    <td>Tested, see test8-LocalExternalStateRegistration.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>30</td>
    <td>The triggered State can obtain Source State Name/Source module from Argument Info</td>
    <td>test14-TestArgumentInfoOfTriggeredState_State.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>31</td>
    <td>Subscribe State as interrupt, in Non-CSM mode, events can only be obtained in interrupt User Event, not in Status User Event</td>
    <td>test23-RegisterStatusAsInterruptFromNonCSM_State.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr>
    <td colspan="9">
¹: The unit test VIs of this class are not sorted from top to bottom according to this table, but are sorted according to the actual test machine, especially the performance of the actual running machine for Git CI/CD.
<br><br>
        Note: CSM modes include Normal Mode, Submodule Mode, System-Level Mode, Worker Mode, Chain Mode, and lvlibp. All possible CSM mode relationships between CSM1 and CSM2 are included.
    </td>
  </tr>
</table>

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
    <td>Module creation and destruction logs (module created/module destroyed) can be obtained through the global log queue, and the number of logs can be checked for correctness</td>
    <td>test1-ModuleCreatedDestroyed_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>2</td>
    <td>Module state change logs (state change) can be obtained through the global log queue: sending a message via external API triggers an internal state change in the CSM module. Both the triggering message and the resulting state change can be seen in the global log.</td>
    <td>test2-StateChange_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>3</td>
    <td>Subscription and unsubscription logs can be obtained through the global log queue. CSM module names in Worker and Chain modes must not have suffixes.</td>
    <td>test3-RegisterUnregister_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>4</td>
    <td>Module message communication logs (message) can be obtained through the global log queue: sending a synchronous message via external API triggers an internal state in CSM1, which then sends a synchronous message to CSM2. Both messages should be strictly logged in the correct format.</td>
    <td>test4-Message_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>5</td>
    <td>Module broadcast logs (broadcast) can be obtained through the global log queue</td>
    <td>test5-Broadcast_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>6</td>
    <td>Module high-priority broadcast logs (interrupt) can be obtained through the global log queue</td>
    <td>test6-Interrupt_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>7</td>
    <td>Module state broadcast logs (state) can be obtained through the global log queue</td>
    <td>test7-StateBroadcast_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>8</td>
    <td>Module custom user message logs can be obtained through the global log queue</td>
    <td>test8-UserLog_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
    <tr align="left">
    <td>9</td>
    <td>Module Sync/Async/NoRep-Async message logs can be obtained through the global log queue</td>
    <td>Tested, see test4-Message_Queue.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>10</td>
    <td>Module creation and destruction logs (module created/module destroyed) can be obtained through global log custom events, and the number of logs can be checked for correctness</td>
    <td>test9-ModuleCreatedDestroyed_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>11</td>
    <td>Module state change logs (state change) can be obtained through global log custom events: sending a message via external API triggers an internal state change in the CSM module. Both the triggering message and the resulting state change can be seen in the global log.</td>
    <td>test10-StateChange_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>12</td>
    <td>Subscription and unsubscription logs can be obtained through global log custom events. CSM module names in Worker and Chain modes must not have suffixes.</td>
    <td>test11-RegisterUnregister_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>13</td>
    <td>Module message communication logs (message) can be obtained through global log custom events</td>
    <td>test12-Message_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>14</td>
    <td>Module broadcast logs (broadcast) can be obtained through global log custom events</td>
    <td>test13-Broadcast_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>15</td>
    <td>Module high-priority broadcast logs (interrupt) can be obtained through global log custom events</td>
    <td>test14-Interrupt_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>16</td>
    <td>Module state broadcast logs (state) can be obtained through global log custom events</td>
    <td>test15-StateBroadcast_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
    <tr align="left">
    <td>17</td>
    <td>Module custom user message logs can be obtained through global log custom events</td>
    <td>test16-UserLog_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
    <td>18</td>
    <td>Module Sync/Async/NoRep-Async message logs can be obtained through global log custom events</td>
    <td>Tested, see test12-Message_Event.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr>
    <td colspan="9">

Note: CSM modes include Normal Mode, Submodule Mode, System-Level Mode, Worker Mode, Chain Mode, and lvlibp. All possible CSM mode relationships between CSM1 and CSM2 are included.
    </td>
  </tr>
</table>

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
      <td>CSM1 sends a synchronous message to CSM2, CSM2 returns the correct reply, CSM1 enters Response Case to process the reply info</td>
      <td>test1-SyncMessage.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>CSM1 sends a synchronous message to CSM2, CSM2 encounters an error, CSM1 enters Response Case carrying the Response and error information</td>
      <td>test2-SycnMessageWithError.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>3</td>
      <td>CSM1 uses API to send a synchronous message to CSM2, CSM2 returns the correct Response, CSM1 obtains the return via API</td>
      <td>test3-SyncMessage_API.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>4</td>
      <td>CSM1 uses API to send a synchronous message to CSM2, CSM2 encounters an error, CSM1 obtains the Response and error information via API</td>
      <td>test4-SyncMessageWithError_API.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>5</td>
      <td>CSM1 sends an asynchronous message with reply to CSM2, CSM2 returns the correct Response, CSM1 enters Async Response to process the reply</td>
      <td>test5-AsyncMessageWithReply.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>6</td>
      <td>CSM1 sends an asynchronous message with reply to CSM2, CSM2 encounters an error, CSM1 enters Async Response carrying the Response and error information</td>
      <td>test6-AsyncMessageWithReplyWithError.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>7</td>
      <td>CSM1 sends an asynchronous message without reply to CSM2, verifies that CSM2 executes, CSM1 does not process the reply</td>
      <td>test7-AsyncMessageWithoutReply.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>8</td>
      <td>CSM1 uses API to send an asynchronous message without reply to CSM, verifies that the caller executes asynchronously, does not process the reply</td>
      <td>test8-AsyncMessageWithoutReply_API.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr>
      <td colspan="9">
          Note: CSM modes include Normal Mode, Submodule Mode, System-Level Mode, Worker Mode, Chain Mode, and lvlibp. All possible CSM mode relationships between CSM1 and CSM2 are covered.
      </td>
  </tr>
</table>

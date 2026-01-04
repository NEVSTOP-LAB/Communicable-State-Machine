<table>
  <tr align="left">
      <td> Test Case No. </td>
      <td> Test Case Description </td>
      <td> Test Case VI </td>
      <td> Normal Mode </td>
  </tr>
  <tr align="left">
      <td>1</td>
      <td>Create preset information and verify HexString conversion works correctly: 1. Check a nested complex Cluster; 2. Check empty string parsing behavior.</td>
      <td>test1-HexStr conversion.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>Create preset information and verify ErrorString conversion works correctly: 1. Conversion of Error; 2. Conversion of No Error; 3. Empty string behavior.</td>
      <td>test2-ErrorStr conversion.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>3</td>
      <td>Create preset information and verify SafeString conversion works correctly: 1. Empty string behavior (no conversion for empty string); 2. Behavior with special characters; 3. Behavior with carriage return.</td>
      <td>test3-SafeStr conversion.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>4</td>
      <td>CSM - Argument Type.vi can correctly identify HexString/ErrorString/SafeString types.</td>
      <td>Integrated in test1,2,3</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>5</td>
      <td>Parameters sent from CSM1 to CSM2 are correctly carried into the TargetCSM, i.e., into the CSM.</td>
      <td>test4-ArgumentCanBeTakenToTargetModule.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr>
      <td colspan="9">
          Note: Only normal mode is tested between CSM1 and CSM2, other modes have been tested in the message test class.
      </td>
  </tr>
</table>
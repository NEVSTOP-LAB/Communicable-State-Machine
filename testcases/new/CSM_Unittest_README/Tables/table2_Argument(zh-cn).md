<table>  
  <tr align="left">
      <td> 测试项序号 </td>
      <td> 测试项内容 </td>
      <td> 对应测试项VI </td>
      <td> 普通模式 </td>
  </tr>
  <tr align="left">
      <td>1</td>
      <td>创建预设的信息，检查HexString转换没有问题  1.检查一个嵌套的复杂Cluster; 2. 检查空字符串解析行为</td>
      <td>test1-HexStr conversion.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>创建预设的信息，检查ErrorString转换没有问题  1. Error 的转换; 2. No Error 的转换; 3. 空字符串行为</td>
      <td>test2-ErrorStr conversion.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>3</td>
      <td>创建预设的信息，检查SafeString转换没有问题 1. 空字符串行为，空字符串不做转换 2. 带有特殊字符的字符串行为；3. 有回车的行为</td>
      <td>test3-SafeStr conversion.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>4</td>
      <td>CSM - Argument Type.vi 能够正常的识别 HexString/ErrorString/SafeString 的Type</td>
      <td>集成于test1,2,3</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>5</td>
      <td>CSM1发送到CSM2的参数，会正常的被携带到TargetCSM中，即CSM中</td>
      <td>test4-ArgumentCanBeTakenToTargetModule.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  </tr>
    <tr>
      <td colspan="4">
          备注：CSM1和CSM2之间只测试普通模式，其他的模式在消息类中已经测试。
      </td>
  </tr>
</table>

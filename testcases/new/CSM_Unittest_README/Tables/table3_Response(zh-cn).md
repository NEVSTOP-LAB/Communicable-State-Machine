<table>  
  <tr align="left">
      <td> 测试项序号 </td>
      <td> 测试项内容 </td>
      <td> 对应测试项VI </td>
      <td> 普通模式 </td>
      <td> 子模块模式 </td>
      <td> 系统级模式 </td>
      <td> 协作者模式 </td>
      <td> 责任链模式 </td>
      <td> 打包项目库模式 </td>
  </tr>
  <tr align="left">
      <td>1</td>
      <td>普通的消息返回功能，已经在 包含Sync/Async/AsyncNoRep 的消息类测试过</td>
      <td>已测试</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>CSM1发送消息给CSM2，单条消息的返回，当产生错误后，会首先进入Error Handler, 但是依然会返回消息执行case的Response</td>
      <td>test1-ResponseWithError.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>3</td>
      <td>宏消息执行，会返回最后一条 SubMessage 的返回</td>
      <td>test2-MacroWithSubMessages.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>4</td>
      <td>宏消息执行，包含PostStep的消息，会返回最后一条 SubMessage 的返回</td>
      <td>test3-MacroWithSubAndPostMessages.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>5¹</td>
      <td>宏消息执行，如果SubMessage最后一条是发送消息到其他模块(同步/异步有返回/异步无返回)，最终返回值为空</td>
      <td>test4-MacroWithNonLocalSubMessages.vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  </tr>
  <tr align="left">
      <td>6</td>
      <td>消息返回，同步消息API会携带执行模块的名称，在消息测试类的test3-SyncMessage_API.vi已测</td>
      <td>已测试</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>7</td>
      <td>Response/Async Response 中，可以获取Source Module 名称、消息名称、消息参数，已经在 Sync/Async/AsyncNoRep 消息的 testcases 中测试过</td>
      <td>已测试</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>8</td>
      <td>消息返回携带Error的功能，已经在 Sync/Async/AsyncNoRep 消息的 testcases 中测试过</td>
      <td>已测试</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr>
      <td colspan="9">
       ¹ 相关问题跟踪：  
          <a href="https://github.com/NEVSTOP-LAB/Communicable-State-Machine/issues/547">
          https://github.com/NEVSTOP-LAB/Communicable-State-Machine/issues/547
          </a>
          <br><br>
          备注：CSM模式包含普通模式、子模块模式、系统级模式、协作者模式、责任链模式、打包项目库模式，CSM1和CSM2之间包含所有可能的CSM模式对应关系。
      </td>
  </tr>
</table>

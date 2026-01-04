<table>  
  <tr align="left">
      <td> 测试项序号 </td>
      <td> 测试项内容 </td>
      <td> 对应测试项VI </td>
      <td> 普通模式 </td>
      <td> 子模块模式 </td>
      <td> 系统级模式 </td>
      <td> 打包项目库模式 </td>
  </tr>
  <tr align="left">
      <td>1</td>
      <td>Loop 模式运行中，1. 可以接收外部发送的同步消息并相应处理；2.也可以发送同步消息到其他模块；</td>
      <td>test1-ProcessSyncMessageInCSMLoop(SendAndReceive).vi</td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>2</td>
      <td>Loop 模式运行中，1. 可以接收外部发送的异步有返回消息并相应处理；2.也可以发送异步有返回消息到其他模块；	</td>
      <td>test2-ProcessAsyncMessageWithReplyInCSMLoop(SendAndReceive).vi
      </td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr align="left">
      <td>3</td>
      <td>Loop 模式运行中，1. 可以接收外部发送的异步无返回消息并相应处理；2.也可以发送异步无返回消息到其他模块；	 </td>
      <td>test3-ProcessAsyncMessageWithoutReplyInCSMLoop(SendAndReceive).vi
      </td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
      <td><span style="color: lightgreen;">✔</span></td>
  </tr>
  <tr>
      <td colspan="7">
          备注：CSM 的协作者模式(worker) 和 责任链(chain)模式，是由多个运行的节点组成特殊的模块，发送的消息，并不能明确的让某个节点执行。当某节点使用此模式时，就不能明确的使用消息通知它停止循环，因此，不建议在协作者模式(worker) 和 责任链(chain)模式中使用CSM LOOP Support,固该类单元测试不包含协作者模式和责任链模式的测试。
      </td>
  </tr>
</table>

<table>  
  <tr align = "center">
      <th > 测试项序号 </th>
      <th > 测试项内容 </th>
      <th> 对应测试项VI </th>
  </tr>
  <tr align = "center">
      <th >1 </th>
      <th> CSM1发送同步消息给CSM2，CSM2返回正确的Response, CSM1进入Response Case 处理返回 </th>
      <th> test1-SyncMessage.vi </th>
  </tr>
  <tr align = "center">
      <th >2 </th>
      <th> CSM1发送同步消息给CSM2，CSM2执行出错，CSM1进入Response Case, 携带了Response和错误信息 </th>
      <th> test2-SycnMessageWithError.vi </th>
  </tr>  
  </tr>
  <tr align = "center">
      <th >3 </th>
      <th> CSM1使用API发送同步消息给CSM2，CSM2返回正确的Response, CSM1通过API拿到返回 </th>
      <th> test3-SyncMessage_API.vi</th>
  </tr>  
    </tr>
  <tr align = "center">
      <th >4 </th>
      <th>CSM1使用API发送同步消息给CSM2，CSM2执行出错，CSM1通过API拿到Response和错误信息 </th>
      <th> test4-SyncMessageWithError_API.vi </th>
  </tr>  
    </tr>
  <tr align = "center">
      <th >5 </th>
      <th> CSM1发送异步有返回消息给CSM2，CSM2返回正确的Response, CSM1进入Async Response 处理返回 </th>
      <th> test5-AsyncMessageWithReply.vi </th>
  </tr>  
    </tr>
  <tr align = "center">
      <th >6 </th>
      <th> CSM1发送异步有返回消息给CSM2，CSM2执行出错，CSM1进入Async Response, 携带了Response和错误信息 </th>
      <th> test6-AsyncMessageWithReplyWithError.vi </th>
  </tr>  
    </tr>
  <tr align = "center">
      <th >7 </th>
      <th> CSM1发送异步无返回消息给CSM2，检查确认CSM2执行，CSM1不处理返回 </th>
      <th> test7-AsyncMessageWithoutReply.vi </th>
  </tr>  
    </tr>
  <tr align = "center">
      <th >8 </th>
      <th> CSM1使用API发送异步无返回消息给CSM，检查确认调用方异步执行，不处理返回 </th>
      <th> test8-AsyncMessageWithoutReply_API.vi </th>
  </tr>  
</table>
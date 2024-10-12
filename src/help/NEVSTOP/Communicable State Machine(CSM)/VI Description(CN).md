# CSM API

## Template Palette

### CSM - No-Event Structure Template.vi

���ڴ����������û������ CSM ģ���ģ��

-- <b>Inputs:</b> --
<b>Name("" to use uuid)</b>: CSM ģ������
  - �������Ϊ ""����ʹ�� UUID ��Ϊģ�����ơ���ģ�鱻���Ϊ����ģʽ�����������ģ���б��С�
  - ��������� '#' ��β�����ģ�齫�ڹ���ģʽ�����С�������ͬ���Ƶ�ģ�齫����ͬһ��Ϣ���С��κ��ⲿ��Ϣ��������һ��ģ�鴦��ȡ�����ĸ�ģ����С�
  - ���������ַ�����������ģ�����ƣ�������Ӧ��ϵͳ�б���Ψһ�������ϵͳ��ʹ���ظ���ģ�����ƣ�CSM ������ "Critical Error" ״̬��


### CSM User Interface(UI) Module Template.vi

���ڴ��������û������ CSM ģ���ģ�壬ģ���а����û��¼��ṹ������Ӧ�û�������

-- <b>Inputs:</b> --
<b>Name("" to use uuid)</b>: CSM ģ������
  - �������Ϊ ""����ʹ�� UUID ��Ϊģ�����ơ���ģ�鱻���Ϊ����ģʽ�����������ģ���б��С�
  - ��������� '#' ��β�����ģ�齫�ڹ���ģʽ�����С�������ͬ���Ƶ�ģ�齫����ͬһ��Ϣ���С��κ��ⲿ��Ϣ��������һ��ģ�鴦��ȡ�����ĸ�ģ����С�
  - ���������ַ�����������ģ�����ƣ�������Ӧ��ϵͳ�б���Ψһ�������ϵͳ��ʹ���ظ���ģ�����ƣ�CSM ������ "Critical Error" ״̬��


### CSM - With Event Structure Template - Tiny.vi

���ڴ��������û������ CSM ģ���ģ�壬ģ���а����û��¼��ṹ������Ӧ�û���������ģ��Ĵ���ȽϽ��ա�

-- <b>Inputs:</b> --
<b>Name("" to use uuid)</b>: CSM ģ������
  - �������Ϊ ""����ʹ�� UUID ��Ϊģ�����ơ���ģ�鱻���Ϊ����ģʽ�����������ģ���б��С�
  - ��������� '#' ��β�����ģ�齫�ڹ���ģʽ�����С�������ͬ���Ƶ�ģ�齫����ͬһ��Ϣ���С��κ��ⲿ��Ϣ��������һ��ģ�鴦��ȡ�����ĸ�ģ����С�
  - ���������ַ�����������ģ�����ƣ�������Ӧ��ϵͳ�б���Ψһ�������ϵͳ��ʹ���ظ���ģ�����ƣ�CSM ������ "Critical Error" ״̬��


### Parse State Queue++.vi

����JKI״̬��״̬���У����ؽ�ִ�е���һ����ǰ״̬����������Ϣ��

-- <b>Inputs:</b> --
<b>State Queue</b>: ����״̬���б����ӵ������롣��Ӧ������ CSM ����λ�Ĵ�����
<b>Error In (no error)</b>: ����JKI״̬���Ĵ���ر����ӵ������롣����������󲢳����ڴ������ϣ���ǰ״̬��������� "Error Handler" ״̬��
<b>Name("" to use uuid)</b>: CSM ģ������
  - �������Ϊ ""����ʹ�� UUID ��Ϊģ�����ơ���ģ�鱻���Ϊ����ģʽ�����������ģ���б��С�
  - ��������� '#' ��β�����ģ�齫�ڹ���ģʽ�����С�������ͬ���Ƶ�ģ�齫����ͬһ��Ϣ���С��κ��ⲿ��Ϣ��������һ��ģ�鴦��ȡ�����ĸ�ģ����С�
  - ���������ַ�����������ģ�����ƣ�������Ӧ��ϵͳ�б���Ψһ�������ϵͳ��ʹ���ظ���ģ�����ƣ�CSM ������ "Critical Error" ״̬��
<b>Response Timeout(5000ms)</b>:ͬ������ʱ����Ӧ��ʱ���ã�Ĭ�� 5000 ms.
<b>Dequeue Timeout(0ms)</b>: ��� CSM ��Ϣ���еĳ�ʱ���ã�Ĭ��Ϊ0�������еȴ���
<b>Response Arguments</b>: ������һ��״̬����Ӧ��������Ӧ�������� CSM ����λ�Ĵ��������ڴ����ⲿ���õķ���ֵ��

-- <b>Outputs:</b> --
<b>Remaining States</b>:  ���ؼ���ִ�е�����״̬�������� These should be passed through the current state in the state machine. These can also be modified or augmented within the current state if necessary.
<b>Arguments</b>: ���ؿ����ڵ�ǰ״̬�ַ�����ʹ�õ��κβ�������Щ����λ�ڡ�>>���ַ�֮��<b>ע�⣺</b>�����������ð����κβ��ɴ�ӡ���ַ������绻�з���س�����
<b>Current State</b>: ��ִ�е���һ����ǰ״̬
<b>Name Used</b>: �������CSMģ���ʵ������
<b>Argument - State</b>: ����� CSM ���������״̬���˲�����ʾ��״̬��ǰ״̬
<b>From Who</b>: ���<b>Current State</b> �����ⲿ���͵ģ�������ԴCSMģ�����ơ�

### Build State String with Arguments++.vi

����һ������JKI״̬��������״̬�ַ�����

<B>����:</B>

���͸�����״̬��ʱ, <b>Target Module ("")</b> Ӧ��Ϊ��.

      If State = A ����û�в���, ��ô <b>State with Arguments</b> = A
      If State = A , Arguments = B ��ô <b>State with Arguments</b> = A >> B

�ڷ��͸�����CSM�������, ���� <b>Target Module ("")</b> �������� "Target"

- ͬ�����ã����͵���Ϣ��ȴ�����:

         If State = A ����û�в���, ��ô <b>State with Arguments</b> = A -@target
         If State = A , Arguments = B ��ô <b>State with Arguments</b> = A >> B -@target

- �첽���ã�������Ϣ�󣬽�����"Async Message Posted" ״̬�����ⲿģ�鴦����Ϻ󣬱���ģ�齫�յ� "Async Response" ��Ϣ:

         If State = A ����û�в���, ��ô <b>State with Arguments</b> = A ->target
         If State = A , Arguments = B ��ô <b>State with Arguments</b> = A >> B ->target

-- <b>Inputs:</b> --
<b>State</b>: ״̬����Ϣ�����ַ���
<b>Arguments ("")</b>: <b>State</b> �Ĳ���
<b>Target Module ("")</b>: ����Ϣ���͵�Ŀ�� CSM ģ������
<b>Sync-Call(-@) T By Default/Async-Call(->) F</b>: ͬ����������"TRUE"; �첽��������"FALSE"

-- <b>Outputs:</b> --
<b>State with Arguments</b>: ���� JKI ״̬��״̬����������Ϣ���ַ���

### CSM Module Template.vi

-- <b>Inputs:</b> --
<b>Init State("Macro: Initialize")</b>:

<b>Name("" to use uuid)</b>:


-- <b>Outputs:</b> --

### Build Message with Arguments++.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. Different message type symbol(->|,->,-@) will be used in different Polymorphic Vi instance.

Polymorphic Option:
- Build Message with Arguments(Auto Check).vi
- Build Asynchronous Message with Arguments.vi
- Build No-Reply Asynchronous Message with Arguments.vi
- Build Synchronous Message with Arguments.vi

-- <b>Inputs:</b> --
<b>State with Arguments</b>: Input Message which might contain Arguments or target Module
<b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
<b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

-- <b>Outputs:</b> --
<b>State with Arguments</b>: String stands for state with arguments

-- <b>Inputs:</b> --

-- <b>Outputs:</b> --

#### Build Message with Arguments(Auto Check).vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. The message type from input <b>State with Arguments</b> will be used.

<B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
<b>Arguments ("")</b> input is "Arguments"
<b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments" as no message symbol is detected.

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is ""
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -@ Callee"

-- <b>Inputs:</b> --
<b>State with Arguments</b>: Input Message which might contain Arguments or target Module
<b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
<b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

-- <b>Outputs:</b> --
<b>State with Arguments</b>: String stands for state with arguments

#### Build Asynchronous Message with Arguments.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values with async-message symbol "->" if <b>Target Module ("")</b> is specified.

<B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
<b>Arguments ("")</b> input is "Arguments"
<b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments -> Callee". It's different with Build Message with Arguments(Auto Check).vi. . Message Type Symbol is replaced with "->".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is ""
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee". Message Type Symbol is replaced with "->".

-- <b>Inputs:</b> --
<b>State with Arguments</b>: Input Message which might contain Arguments or target Module
<b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
<b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

-- <b>Outputs:</b> --
<b>State with Arguments</b>: String stands for state with arguments

#### Build No-Reply Asynchronous Message with Arguments.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values with No-Reply async-message symbol "->|" if <b>Target Module ("")</b> is specified.

<B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
<b>Arguments ("")</b> input is "Arguments"
<b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments ->| Callee". It's different with Build Message with Arguments(Auto Check).vi. Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments ->| NewCallee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is ""
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth ->| NewCallee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "->|".

-- <b>Inputs:</b> --
<b>State with Arguments</b>: Input Message which might contain Arguments or target Module
<b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
<b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

-- <b>Outputs:</b> --
<b>State with Arguments</b>: String stands for state with arguments

#### Build Synchronous Message with Arguments.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values with sync-message symbol "-@" if <b>Target Module ("")</b> is specified.

<B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
<b>Arguments ("")</b> input is "Arguments"
<b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments ->| Callee". It's different with Build Message with Arguments(Auto Check).vi. Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -@ NewCallee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
<b>Arguments ("")</b> input is ""
<b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -@ NewCallee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
<b>Arguments ("")</b> input is "NewArguments"
<b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -@ Callee".

-- <b>Inputs:</b> --
<b>State with Arguments</b>: Input Message which might contain Arguments or target Module
<b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
<b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

-- <b>Outputs:</b> --
<b>State with Arguments</b>: String stands for state with arguments

#### Build Interrupt Status Message.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. The message type from input <b>State with Arguments</b> will be used.
<B>For Example:</B>
If <b>State with Arguments</b> input is "API: DoSth"
Then result string is "API: DoSth >> Arguments" as no message symbol is detected.
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth >> NewArguments -> Callee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth -> NewCallee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
Then result string is "API: DoSth >> NewArguments -@ Callee"
<b>State with Arguments</b>: Input Message which might contain Arguments or target Module
<b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
<b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.
<b>State with Arguments</b>: String stands for state with arguments

-- <b>Inputs:</b> --
<b>State with Arguments</b>:
<b>Arguments ("")</b>:

-- <b>Outputs:</b> --
<b>State with Arguments</b>:

#### Build Normal Status Message.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. The message type from input <b>State with Arguments</b> will be used.
<B>For Example:</B>
If <b>State with Arguments</b> input is "API: DoSth"
Then result string is "API: DoSth >> Arguments" as no message symbol is detected.
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth >> NewArguments -> Callee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
Then result string is "API: DoSth -> NewCallee"
If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
Then result string is "API: DoSth >> NewArguments -@ Callee"
<b>State with Arguments</b>: Input Message which might contain Arguments or target Module
<b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
<b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.
<b>State with Arguments</b>: String stands for state with arguments

-- <b>Inputs:</b> --
<b>State with Arguments</b>:
<b>Arguments ("")</b>:

-- <b>Outputs:</b> --
<b>State with Arguments</b>:

#### Build Register Status Message.vi

Builds register status message. The message looks like:
[source-state]@[source-module] >> [response-message]@[response-module] -><register>
For examples:
DownloadFinished@Downloader >> StartPlay@Player -><register>
DownloadFinished@Downloader >> StartPlay -><register> // response-module is current module
DownloadFinished@Downloader  -><register> // response-module is current module. response-message is DownloadFinished
DownloadFinished@* >> StartPlay@Player -><register> // Any Module's DownloadFinished is registered to Player's StartPlay state.

-- <b>Inputs:</b> --
<b>Source CSM Name (* as Default)</b>:
<b>CSM Name</b>:
<b>Status</b>:
<b>Response Message (if "", same as Source Message)</b>:

-- <b>Outputs:</b> --
<b>State with Arguments</b>:

#### Build Unregister Status Message.vi

Builds unregister status message. The message looks like:
[source-state]@[source-module] >> [response-module] -><unregister>
For examples:
DownloadFinished@Downloader >> StartPlay -><unregister>
DownloadFinished@Downloader  -><unregister>

-- <b>Inputs:</b> --
<b>Source CSM Name (* as Default)</b>:
<b>CSM Name</b>:
<b>Status</b>:

-- <b>Outputs:</b> --
<b>State with Arguments</b>:

### Add State(s) to Queue By BOOL++.vi

���ݸ����ȼ���Bool���룬��VI����TRUE/False��ʣ��״̬������״̬��High Priority��������Ƿ���ʣ��״̬֮ǰ��֮������TRUE��False�ַ�����Bool�������Ҫ���ӵ��ַ�����TRUE����False��

-- <b>Inputs:</b> --
<b>State Queue("")</b>: ����״̬���б����ӵ�������
<b>TRUE("")</b>: <b>Bool</b> Ϊ True ʱ�����״̬�ַ���
<b>False("")</b>: <b>Bool</b> Ϊ False ʱ�����״̬�ַ���
<b>Bool</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
<b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>�Ķ��������ΪFalse���������ӵ�β����

-- <b>Outputs:</b> --
<b>State Queue Out</b>: ���ؼ���ִ�е�����״̬��������

#### Add State(s) to Queue By BOOL(Element).vi

���ݸ����ȼ���Bool���룬��VI����TRUE/False��ʣ��״̬������״̬��High Priority��������Ƿ���ʣ��״̬֮ǰ��֮������TRUE��False�ַ�����Bool�������Ҫ���ӵ��ַ�����TRUE����False��

-- <b>Inputs:</b> --
<b>State Queue("")</b>: ����״̬���б����ӵ�������
<b>TRUE("")</b>: <b>Bool</b> Ϊ True ʱ�����״̬�ַ���
<b>False("")</b>: <b>Bool</b> Ϊ False ʱ�����״̬�ַ���
<b>Bool</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
<b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>�Ķ��������ΪFalse���������ӵ�β����

-- <b>Outputs:</b> --
<b>State Queue Out</b>: ���ؼ���ִ�е�����״̬��������

#### Add State(s) to Queue By BOOL(Array Left).vi

���ݸ����ȼ���Bool���룬��VI����TRUE/False��ʣ��״̬������״̬��High Priority��������Ƿ���ʣ��״̬֮ǰ��֮������TRUE��False�ַ�����Bool�������Ҫ���ӵ��ַ�����TRUE����False��

-- <b>Inputs:</b> --
<b>State Queue("")</b>: ����״̬���б����ӵ�������
<b>TRUE("")</b>: <b>Bool</b> Ϊ True ʱ�����״̬�ַ���
<b>False("")</b>: <b>Bool</b> Ϊ False ʱ�����״̬�ַ���
<b>Bool</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
<b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>�Ķ��������ΪFalse���������ӵ�β����

-- <b>Outputs:</b> --
<b>State Queue Out</b>: ���ؼ���ִ�е�����״̬��������

#### Add State(s) to Queue By BOOL(Array Right).vi

���ݸ����ȼ���Bool���룬��VI����TRUE/False��ʣ��״̬������״̬��High Priority��������Ƿ���ʣ��״̬֮ǰ��֮������TRUE��False�ַ�����Bool�������Ҫ���ӵ��ַ�����TRUE����False��

-- <b>Inputs:</b> --
<b>State Queue("")</b>: ����״̬���б����ӵ�������
<b>TRUE("")</b>: <b>Bool</b> Ϊ True ʱ�����״̬�ַ���
<b>False("")</b>: <b>Bool</b> Ϊ False ʱ�����״̬�ַ���
<b>Bool</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
<b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>�Ķ��������ΪFalse���������ӵ�β����

-- <b>Outputs:</b> --
<b>State Queue Out</b>: ���ؼ���ִ�е�����״̬��������

#### Add State(s) to Queue By BOOL(Array All).vi

���ݸ����ȼ���Bool���룬��VI����TRUE/False��ʣ��״̬������״̬��
High Priority��������Ƿ���ʣ��״̬֮ǰ��֮������TRUE��False�ַ�����
Bool�������Ҫ���ӵ��ַ�����TRUE����False��

-- <b>Inputs:</b> --
<b>State Queue("")</b>: ����״̬���б����ӵ�������
<b>TRUE("")</b>: <b>Bool</b> Ϊ True ʱ�����״̬�ַ���
<b>False("")</b>: <b>Bool</b> Ϊ False ʱ�����״̬�ַ���
<b>Bool</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
<b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>�Ķ��������ΪFalse���������ӵ�β����

-- <b>Outputs:</b> --
<b>State Queue Out</b>: ���ؼ���ִ�е�����״̬��������

### CSM - Broadcast Status Change.vi

��ϵͳ�㲥״̬���ġ���ע��״̬�� CSM ģ�齫���յ�״̬���ġ�

-- <b>Inputs:</b> --
<b>Status with Arguments</b>: �����㲥��״̬������
<b>State Queue("")</b>: ����״̬���б����ӵ�������
<b>Broadcast(T)</b>: �����Ƿ�㲥�Ŀ�������

-- <b>Outputs:</b> --
<b>Remaining States</b>: ���ؼ���ִ�е�����״̬��������

## Arguments

### CSM - Make String Arguments Safe.vi

'->','->|','-@','-&','<-" �ǹؼ��֣����ܳ����ڲ����С�ʹ�ô� VI ��֤������ȫ��

-- <b>Inputs:</b> --
<b>Argument String</b>: ���ܰ����ؼ��ֵĲ��� '->','->|','-@','-&','<-".

-- <b>Outputs:</b> --
<b>Safe Argument String</b>: ��ȫ����

### CSM - Revert Arguments-Safe String.vi

'->','->|','-@','-&','<-" �ǹؼ��֣����ܳ����ڲ����С�ʹ��<b>CSM Make String Arguments Safe.vi</b>��֤������ȫ����VI���ڽ���ȫ����ת��Ϊԭʼ������

-- <b>Inputs:</b> --
<b>Safe Argument String</b>: ��ȫ����

-- <b>Outputs:</b> --
<b>Origin Argument String</b>: ���ܰ����ؼ��ֵĲ��� '->','->|','-@','-&','<-".

### CSM - Convert Data to HexStr.vi

�����Ӳ��������壩ת��Ϊʮ�������ַ��������ַ������԰�ȫ������״̬�������������ƻ��ַ��������߼���

-- <b>Inputs:</b> --
<b>Variant</b>: ���ݣ�����Ϊ����(variant)��ʽ

-- <b>Outputs:</b> --
<b>HEX String (0-9,A-F)</b>: Hex�ַ�����ʽ�����������ɼ��ַ������� CSM �Ĳ���Ҫ��

### CSM - Convert HexStr to Data.vi

��ʮ�������ַ�������ת���ر������ݡ�

-- <b>Inputs:</b> --
<b>HEX String</b>: Hex�ַ�����ʽ�����������ɼ��ַ������� CSM �Ĳ���Ҫ��

-- <b>Outputs:</b> --
<b>Variant</b>: ���ݣ�����Ϊ����(variant)��ʽ
<b>error out</b>: �����

## Advance APIs

### CSM - Start Async Call.vi

�첽����ģ������VIƬ��

-- <b>Inputs:</b> --
- ��


### CSM - Synchronized Call.vi

ͬ������ģ������VIƬ��

-- <b>Inputs:</b> --
- ��
 -
-- <b>Outputs:</b> --
 - ��

### CSM - Mark As Worker Module.vi

��CSM���ƺ���ӡ��������Ա�Ǵ�ģ��Ϊ�����ߣ����������ͬ���Ƶ����������߹�����ͬ����Ϣ���С�һ���������ɵ�UUID��ʵ�����ƽ����������CSMģ�顣

-- <b>Inputs:</b> --
<b>CSM Name</b>: CSM ģ������

-- <b>Outputs:</b> --
<b>CSM Name(marked as worker)</b>: ��ӡ�������� ��CSM ģ������

### CSM - Compact Multiple States.vi

�����״̬���ճɵ����ַ����Թ�����ʹ��

-- <b>Inputs:</b> --
<b>States in Lines</b>: ���״̬���ַ�������

-- <b>Outputs:</b> --
<b>States</b>: ������������״̬���ַ���

### CSM - Check If Module Exists.vi

��� CSM ģ���Ƿ����

-- <b>Inputs:</b> --
<b>CSM Name</b>: CSM ģ������
<b>Error in</b>: �����

-- <b>Outputs:</b> --
<b>Exist?</b>: ����ģʽ�Ƿ���ڣ����ڷ���True�������ڷ���False
<b>CSM Name(dup)</b>: ���� <b>CSM Name</b>
<b>Error out</b>: �����

### CSM - List Modules.vi

�г�ϵͳ�����л��CSMģ�顣

-- <b>Inputs:</b> --
<b>Exclude Standalone CSM(T)</b>: �Ƿ������������ģʽ��ģ��
<b>Error in</b>: �����

-- <b>Outputs:</b> --
<b>Module Names</b>: ģ�������б�
<b>Error out</b>: �����

### CSM - Module Status.vi

��ȡCSMģ���״̬

-- <b>Inputs:</b> --
<b>CSM Name</b>: CSM ģ������.
<b>Error in</b>: �����

-- <b>Outputs:</b> --
<b>Mode</b>: ����ģ��Ĺ���ģʽ��"Stand-alone", "CSM" �� "Action Worker".
<b>#As Worker</b>: ������ģʽ�£���ģ��Ĺ���������
<b>#msg to be processed</b>: CSM��Ϣ�����еĴ�������Ϣ����
<b>CSM Name(dup)</b>: ���� <b>CSM Name</b>
<b>Error out</b>: �����

### CSM - Register Status Change.vi

ע���Խ�������CSMģ��״̬���ĵ�֪ͨ�����δ���� ��Response Message�� ������Ϊ�գ���ʹ����ͬ��<b>Status</b> ������Ϊ��Ӧ��Ϣ��

-- <b>Inputs:</b> --
<b>CSM Name</b>: CSM ģ������.
<b>Source CSM Name ('*' as Default)</b>: ����״̬��CSMģ�顣������ʹ�á�*������ʾ����������ͬ״̬��ģ�顣
<b>Status</b>: ״̬�ַ���
<b>Response Message (if "", same as Source Message)</b>: ע������״̬�����仯�������յ�����Ϣ��
<b>Priority(T:As Status,F:As Interrupt)</b>: �����Ӧ��ϢΪFalse��������뵽״̬���е�ǰ�棻���򣬽��丽�ӵ����е�β����
<b>Error in</b>: �����

-- <b>Outputs:</b> --
<b>CSM Name(dup)</b>: ���� <b>CSM Name</b>
<b>Error out</b>: �����

### CSM - Unregister Status Change.vi

ȡ��ע������ CSM ģ��״̬���ĵ�֪ͨ��

-- <b>Inputs:</b> --
<b>CSM Name</b>: CSM ģ������.
<b>Source CSM Name</b>: ����״̬��CSMģ�顣������ʹ�á�*������ʾ����������ͬ״̬��ģ�顣
<b>Status</b>: ״̬�ַ���
<b>Error in</b>: �����

-- <b>Outputs:</b> --
<b>CSM Name(dup)</b>: ���� <b>CSM Name</b>
<b>Error out</b>: �����

### CSM - Get New State Notifier Event.vi

-- <b>Inputs:</b> --
<b>Name("" to use uuid) in</b>: CSM ģ������
<b>Error in</b>: �����

-- <b>Outputs:</b> --
<b>New State Notifier Event</b>: �û��¼�������������յ���Ϣʱ��ʹ��CSMģ���ж����¼��ṹ�еĵȴ�
<b>Error out</b>: �����

## Non-CSM Support
----

### CSM - Post Message.vi

��ָ����CSM����һ����Ϣ���൱���첽���ã������ȴ����ز�����

-- <b>Inputs:</b> --
<b>Target Module</b>:Ŀ�� CSM ģ������
<b>State</b>: ��Ϣ�ַ���
<b>Arguments ("")</b>: ��Ϣ����
<b>Error In (no error)</b>: �����

-- <b>Outputs:</b> --
<b>error out</b>: �����

### CSM - Send Message and Wait for Reply.vi

��ָ����CSM����һ����Ϣ���ȴ��ظ����൱��ͬ�����ã���ָ����ʱ��û���յ����أ������س�ʱ����

-- <b>Inputs:</b> --
<b>Target Module</b>: Ŀ�� CSM ģ������
<b>State</b>: ��Ϣ�ַ���
<b>Arguments ("")</b>: ��Ϣ����
<b>Response Timeout(5000ms)</b>: �ȴ����صĳ�ʱ���ã�Ĭ�� 5000ms.
<b>Error In (no error)</b>: �����

-- <b>Outputs:</b> --
<b>Arguments</b>: Response returned.
<b>error out</b>: �����

### CSM - Wait and Post Message.vi
-- <b>Inputs:</b> --
<b>State</b>:

<b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
<b>Arguments ("")</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
<b>Target Module</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
<b>Wait(5000ms)</b>:

<b>Error In (no error)</b>:
The error cluster from the JKI State Machine is wired to this input. If an error occures and appears on this input, the current state output returns the "Error Handler" state.

-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Wait and Send Message for Reply.vi
-- <b>Inputs:</b> --
<b>State</b>:

<b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
<b>Arguments ("")</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
<b>Target Module</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
<b>Wait(5000ms)</b>:

<b>Error In (no error)</b>:
The error cluster from the JKI State Machine is wired to this input. If an error occures and appears on this input, the current state output returns the "Error Handler" state.
<b>Response Timeout(5000ms)</b>:


-- <b>Outputs:</b> --
<b>Response</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters
<b>>> Source CSM >></b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Status Change Event

Obtain CSM Global Log Event Reference.
<b>Error in</b>: Error cluster
<b>CSM Global Log Event</b>: User event reference for CSM global log.
<b>Error out</b>: Error cluster

-- <b>Inputs:</b> --
<b>Error in</b>:
<b>Name("" to use uuid) in</b>:

-- <b>Outputs:</b> --
<b>Error out</b>:
<b>Status Change Event</b>:

### CSM - Destroy Status Change Event.vi

Release CSM Global Log Event Reference.
<b>CSM Global Log Event</b>:
<b>Error in</b>: Error cluster
<b>Error out</b>: Error cluster

-- <b>Inputs:</b> --
<b>Error in</b>:
<b>Status Change Event</b>:

-- <b>Outputs:</b> --
<b>Error out</b>:

## Side-Loop Support

### CSM - Request CSM to Post Message.vi

���� CSM ������Ϣ��ͨ�����ں�CSM���еĹ���ѭ������Щ����ѭ���� CSM һ���������ģ�鹦�ܡ�

-- <b>Inputs:</b> --
<b>Module Name</b>:����״̬��CSM
<b>Status</b>: �����㲥��״̬
<b>Arguments ("")</b>: �����㲥��״̬����
<b>Target Module</b>:Ŀ��ģ��
<b>Error In (no error)</b>: �����
 -
-- <b>Outputs:</b> --
<b>error out</b>: �����

### CSM - Request CSM to Broadcast Status Change.vi

���� CSM ����״̬��ͨ�����ں�CSM���еĹ���ѭ������Щ����ѭ���� CSM һ���������ģ�鹦�ܡ�

-- <b>Inputs:</b> --
<b>Module Name</b>:����״̬��CSM
<b>Status</b>: �����㲥��״̬
<b>Arguments ("")</b>: �����㲥��״̬����
<b>Broadcast(T)</b>: �����Ƿ�㲥�Ŀ�������
<b>Error In (no error)</b>: �����

-- <b>Outputs:</b> --
<b>error out</b>: �����

### CSM - Module Turns Invalid.vi

���CSM�Ƿ��Ѿ��˳���ͨ�����ں�CSM���еĹ���ѭ������Щ����ѭ���� CSM һ���������ģ�鹦�ܡ� ��VI���ڲ���ѭ�����˳�������

-- <b>Inputs:</b> --
<b>CSM Name</b>: ģ������

-- <b>Outputs:</b> --
<b>Turn Invalid(Exit)?</b>: �Ƿ��Ѿ��˳�

## Global Log Event

### CSM - Global Log Event.vi

��ȡ CSM ȫ��״̬�û��¼����

-- <b>Inputs:</b> --
<b>Error in</b>: �����

-- <b>Outputs:</b> --
<b>CSM Global Log Event</b>: CSM ȫ��״̬�û��¼����
<b>Error out</b>: �����

### CSM - Destroy Global Log Event.vi

�ͷ� CSM ȫ��״̬�û��¼����

-- <b>Inputs:</b> --
<b>CSM Global Log Event</b>: CSM ȫ��״̬�û��¼����
<b>Error in</b>: �����

-- <b>Outputs:</b> --
<b>Error out</b>: �����

### CSM - Generate User Global Log.vi

-- <b>Inputs:</b> --
<b>Error in</b>:
<b>From Who</b>:
<b>ModuleName</b>:
<b>Log</b>:
<b>Arguments</b>:

-- <b>Outputs:</b> --
<b>error out</b>:

## Utility VIs

### Build Error Cluster.vi

����һ������أ�error cluster�����Ա�׼ LabVIEW �ķ�ʽ�ӵ��� VI �ĵ������й���Դ�ַ�����������Դ�ַ�����ʽΪ��
"<B>���õ� VI</B> �� <B>���� VI �ĵ�����</B>-><B>���� VI �ĵ����ߵĵ�����</B>->�ȵ�...->�ȵ�..."
��ѡ�� 'String to Prepend to source ("")' �ַ��������������Դ�ַ�������Ӷ����������Ϣ�������������ַ���������������������������ӵ�Դ�ַ���֮ǰ��

-- <b>Inputs:</b> --
<b>code</b>: ������
<b>String to Prepend to source ("")</b>: ������Ϣ�ַ���

-- <b>Outputs:</b> --
<b>error out</b>: �����

### Build Internal State String.vi

�������� JKI ״̬��״̬����������Ϣ���ַ�����

-- <b>Inputs:</b> --s
<b>State</b>: ״̬�ַ���
<b>Arguments ("")</b>: <b>State</b>�Ĳ���
<b>Arg-State ("")</b>: ���ʹ���Ϣ��ģ���ڷ��ʹ���Ϣʱ���ڵ�״̬
<b>Source ("")</b>: ���ʹ���Ϣ��ģ������

-- <b>Outputs:</b> --
<b>State with Arguments</b>: ���� JKI ״̬��״̬����������Ϣ���ַ���

### String History Cacher.vi

���浱ǰ������ַ��������棬�������ʷ�ַ�������������󳤶�����ʱ�����Ƚ���Ļ����ַ����������ǡ����ڵ���CSM����ʷ״̬��

-- <b>Inputs:</b> --
<b>String</b>: �������ַ���
<b>length</b>: �������ʷ�ַ�������ַ�������
<b>Include Timestamp(F)</b>: �Ƿ���ÿ�п�ͷ����ʱ�����

-- <b>Outputs:</b> --
<b>String Cache</b>: �������ʷ�ַ���

### Timeout Selector.vi

���ڰ����û��¼��ṹ��ģ����

-- <b>Inputs:</b> --
<b>Timeout Expected</b>: Ԥ�ڵĳ�ʱ����
<b>Remaining States</b>: �������ʣ���״̬�������Ϊ 0���������ΪԤ��ֵ

-- <b>Outputs:</b> --
<b>Timeout</b>: �ٲú�ʹ�õĳ�ʱ����

### Trim Both Whitespace.vi

��ͷ����β������ͬʱ�Ƴ����� ASCII �հ��ַ����ո��Ʊ�����س��ͻ��У���

-- <b>Inputs:</b> --
<b>string</b>: �������ַ���

-- <b>Outputs:</b> --
<b>trimmed string</b>: �������ַ���

### uuid.vi

���ݱ�׼�������� <b>Universally Unique Identifier(UUID)</b>�� ����:

     - 59703F3AD837
     - 106A470BA5EC
     - 9B781DB313AF

-- <b>Outputs:</b> --
<b>UUID</b>: ���ɵ� UUID

### Random Change Flag.vi

����һ���������ֵ�����ڱ��״̬�ı仯��CSM��Ϊ�����Ч�ʣ���Щ�ط��Ļ���(cache)�������������ж��Ƿ���Ҫ���¡�

-- <b>Outputs:</b> --
<b>Random Change Flag</b>: ���ɵ������ֵ

### Global Log To String.vi

ȫ����־(Global Log)���ݴ�ת��Ϊ�ַ�����

-- <b>Inputs:</b> --
<b>Log</b>: ȫ����־���ݴ�

-- <b>Outputs:</b> --
<b>Log String</b>: ȫ����־�ַ���

## CSM-Helper API

### CSM-Helper API.vi

-- <b>Inputs:</b> --


-- <b>Outputs:</b> --


### _Add VI Reference Case.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>element</b>:

<b>Add Frame</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Connect Information.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Case</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Backend Connected Info</b>:

<b>FrontEnd Connected Info</b>:

<b>CSM-Helper out</b>:

### Diagram Node Information.vi
-- <b>Inputs:</b> --
<b>InnerTerminal in</b>:

<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Array in</b>:

<b>Front Tunnels</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Array</b>:

<b>Array out</b>:

### Get Argument Info From back Term.vi
-- <b>Inputs:</b> --
<b>Terminal in</b>:


-- <b>Outputs:</b> --
<b>Array</b>:

### Get Argument Info From Front Term.vi
-- <b>Inputs:</b> --
<b>Terminal in</b>:


-- <b>Outputs:</b> --
<b>Array</b>:

### GObject Terminals.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>GObject in</b>:


-- <b>Outputs:</b> --
<b>error in (no error) (dup)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Class Name</b>:

<b>Terms[]</b>:

<b>Node Object</b>:

<b>tunnel Relative Pos</b>:

### Relative Pos to InterData Tunnel of CaseContent.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>element</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Position</b>:

<b>CSM-Helper out</b>:

### Resize CaseStructure By Making Space.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Bounds</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>DiffBound</b>:

<b>MakeSpace.Rect</b>:

<b>CSM-Helper out</b>:

### Search With Pattern.vi
-- <b>Inputs:</b> --
<b>regular expression</b>:

<b>Array</b>:


-- <b>Outputs:</b> --
<b>Numeric</b>:

### sub1.vi
-- <b>Inputs:</b> --
<b>Part References.Parse State Queue</b>:

<b>regular expression</b>:

<b>Array</b>:


-- <b>Outputs:</b> --
<b>Tunnel out</b>:

### sub2.vi
-- <b>Inputs:</b> --
<b>Part References.Parse State Queue</b>:

<b>regular expression</b>:

<b>Array</b>:


-- <b>Outputs:</b> --
<b>Tunnel out</b>:

### Refresh References.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper out</b>:

### Get ParentRef Until Type Matched.vi
-- <b>Inputs:</b> --
<b>Class Name</b>:

<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>reference in</b>:


-- <b>Outputs:</b> --
<b>Error out</b>:
<B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Target Ref</b>:

### Is in JKISM or CSM.vi
-- <b>Inputs:</b> --
<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>reference in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>is in JKISM or CSM?</b>:

### Relationship Check.vi
-- <b>Inputs:</b> --
<b>TestRef</b>:

<b>reference in</b>:


-- <b>Outputs:</b> --
<b>Is TestRef</b>:

<b>Is Child of TestRef</b>:

### Add State Frame.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>index(-1, use same group)</b>:

<b>element</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Add Frame</b>:

<b>CSM-Helper out</b>:

### Check NewStateNotify is Registered.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>NewStateNotify Registed</b>:

<b>CSM-Helper out</b>:

### Connect Error Wire If not Connected.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>case</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Connect EventReg Wire If not Connected.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>case</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Connect Internal Data Wire If not Connected.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>case</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Connect LastResp to Response in Error Case.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Connect Paired Tunnels.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Connect StateQ Wire If not Connected.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>case</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Copy State.vi
-- <b>Inputs:</b> --
<b>Already Exist Action:
Replace(T) / Skip(F)</b>:

<b>SourceCSM</b>:

<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>New(Empty to Use same Name)</b>:

<b>Case</b>:

<b>CSM-Helper.lvclass</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out 2</b>:

### Create From Basic Refs.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM Basic Refs</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper.lvclass</b>:

### Create From CaseStructure Reference.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CaseStructure</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper.lvclass</b>:

### Create From EventStructure Reference.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CaseStructure</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper.lvclass</b>:

### Create From VI Reference.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>VI</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper.lvclass</b>:

### Create From WhileLoop Reference.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Structure</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper.lvclass</b>:

### Destroy.vi
-- <b>Inputs:</b> --
<b>Save Instruments?(F)</b>:

<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper out</b>:

### Doc.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>String 2</b>:

<b>String</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>String 4</b>:

<b>String 3</b>:

<b>CSM-Helper out</b>:

### Get All API Interface Info.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Array</b>:

<b>CSM-Helper out</b>:

### Get All Status Interface Info.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Array 3</b>:

<b>CSM-Helper out</b>:

### Get CaseFrame Index By CaseName.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CASE</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>index</b>:

<b>CSM-Helper out</b>:

### Get CaseFrame Reference By CaseName.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CASE</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Frame Refs</b>:

<b>CSM-Helper out</b>:

### Get Event Structure Num.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>EvtStruNum</b>:

<b>CSM-Helper out</b>:

### Get Interface Info.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CASE</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Response</b>:

<b>Array</b>:

<b>CSM-Helper out</b>:

### Get Internal Data Info.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Array</b>:

<b>CSM-Helper out</b>:

### Open Block Diagram.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Open Front Panel.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Remove State Frame.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>element</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Save Instrument.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Set Error Tunnel Use Default If not Connected.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Use Default if Unwired</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Set Visible Case Frame.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>element</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Set Wire Label Visible.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Connected Wire.Label.Visible</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper out</b>:

### Start Undo.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Name</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Stop Undo.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Undo.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Read APIs.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Value</b>:

<b>CSM-Helper out</b>:

### Read Back Tunnel Internal TermRefs.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>element</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Back Tunnels</b>:

<b>CSM-Helper out</b>:

### Read Back Tunnels Refs.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Back Tunnels</b>:

<b>CSM-Helper out</b>:

### Read Block Diagram Ref.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Diagram</b>:

<b>CSM-Helper out</b>:

### Read Case Structure Ref.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Case Structure</b>:

<b>CSM-Helper out</b>:

### Read Event Structure Ref.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Event Structure</b>:

<b>CSM-Helper out</b>:

### Read Front Tunnel Internal TermRefs.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>case</b>:

<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Front Tunnels</b>:

<b>CSM-Helper out</b>:

### Read Front Tunnels Refs.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Front Tunnels</b>:

<b>CSM-Helper out</b>:

### Read New State Notifier Event State Ref.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>New State Notifier Event State Ref</b>:

<b>CSM-Helper out</b>:

### Read Paired Tunnels of Case Structure.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Paired Tunnels</b>:

<b>CSM-Helper out</b>:

### Read Parse State Queue Ref.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Parse State Queue</b>:

<b>CSM-Helper out</b>:

### Read States.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Value</b>:

<b>CSM-Helper out</b>:

### Read Timeout Event State Ref.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>New State Notifier Event State Ref</b>:

<b>CSM-Helper out</b>:

### Read Type.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Part References.Type</b>:

<b>CSM-Helper out</b>:

### Read User-Defined States.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Array</b>:

<b>CSM-Helper out</b>:

### Read VI Ref.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>VI</b>:

<b>CSM-Helper out</b>:

### Read While Loop Ref.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>While Loop</b>:

<b>CSM-Helper out</b>:

### Add VI Reference Case.vi
-- <b>Inputs:</b> --
<b>error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### Remove All CSM Bookmarks.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### standardize CSM Module.vi
-- <b>Inputs:</b> --
<b>error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:

### CSM Essential States.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --
<b>CSM Essential States</b>:

### CSM Module Type.vi
-- <b>Inputs:</b> --
<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM Basic Refs</b>:


-- <b>Outputs:</b> --
<b>Error out</b>:
<B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM Basic Refs (dup)</b>:

### Is CSM Module - CaseStructure.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CaseStructure</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Is CSM Module?</b>:

<b>CSM Basic Refs</b>:

### Is CSM Module - EventStructure.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>EventStructure</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Is CSM Module?</b>:

<b>CSM Basic Refs</b>:

### Is CSM Module - ParseStateVI.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Parse State VI Ref</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Is CSM Module?</b>:

<b>CSM Basic Refs</b>:

### Is CSM Module - Structure.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Structure</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Is CSM Module?</b>:

<b>CSM Basic Refs</b>:

### Is CSM Module - VIRef.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>VIRef</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Is CSM Module?</b>:

<b>CSM Basic Refs</b>:

### Is CSM Module - WhileLoop.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>WhileLoop in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Is CSM Module?</b>:

<b>CSM Basic Refs</b>:

### Is CSM Module.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### CaseStructure - Add Frame.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Case Name</b>:

<b>Reference Frame Index</b>:

<b>CaseStructure in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Add Frame</b>:

<b>CaseStructure out</b>:

### CaseStructure - Case Name to Group Name.vi
-- <b>Inputs:</b> --
<b>element</b>:


-- <b>Outputs:</b> --
<b>String</b>:

### CaseStructure - Check If State Exist.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Group Name</b>:

<b>CaseStructure in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Numeric</b>:

<b>CaseStructure out</b>:

### CaseStructure - Get Group Seperator Case Index.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Group Name</b>:

<b>CaseStructure in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Numeric</b>:

<b>CaseStructure out</b>:

### Diagram - Connect Tunnel with Wire 2.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Wire Indexs</b>:

<b>Front Tunnels</b>:

<b>Diagram in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Array out</b>:

<b>Diagram out</b>:

### Diagram - Connect Tunnel with Wire.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>FrontEnd Connected Info</b>:

<b>Front Tunnels</b>:

<b>Diagram in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Array out</b>:

<b>Diagram out</b>:

### Diagram - Get All Decoration Refs.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>TopLevelDiagram in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>TextRefs</b>:

<b>TopLevelDiagram out</b>:

### Diagram - Get All Text Refs.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>TopLevelDiagram in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>TextRefs</b>:

<b>TopLevelDiagram out</b>:

### PairedTunnels - Connect Wire.vi
-- <b>Inputs:</b> --
<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>index(-1 for all)</b>:

<b>PairedTunnels</b>:


-- <b>Outputs:</b> --
<b>Error out</b>:
<B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>PairedTunnels</b>:

### Find Event Structure from Case Structure.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CaseStructure</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>EvntStruct Refnum</b>:

### Find Parse State Queue from Case Structure.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CaseStructure</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CaseStructure</b>:

<b>Parse State Queue</b>:

### Find Parse State Queue from Event Strcture.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>EvntStruct Refnum</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CaseStructure</b>:

<b>Parse State Queue</b>:

### Find Parse State Queue from While Loop.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>WhileLoop in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CaseStructure</b>:

<b>Parse State Queue</b>:

<b>WhileLoop out</b>:

### Terminals - Filter Control Terms.vi
-- <b>Inputs:</b> --
<b>Terms[]</b>:


-- <b>Outputs:</b> --
<b>Terms[] out</b>:

### Terminals - Filter Error Terms.vi
-- <b>Inputs:</b> --
<b>Terms[]</b>:


-- <b>Outputs:</b> --
<b>Terms[] out</b>:

### Terminals - Filter Indicator Terms.vi
-- <b>Inputs:</b> --
<b>Terms[]</b>:


-- <b>Outputs:</b> --
<b>Terms[] out</b>:

### Terminals - Filter Input Term.vi
-- <b>Inputs:</b> --
<b>InnerTerminal in</b>:

<b>Wire.Terms[] in</b>:


-- <b>Outputs:</b> --
<b>Wire.Terms[] out</b>:

### Terminals - Filter invalid Terms.vi
-- <b>Inputs:</b> --
<b>Terms[]</b>:


-- <b>Outputs:</b> --
<b>Terms[] out</b>:

### Terminals - Filter Left-Top Term.vi
-- <b>Inputs:</b> --
<b>Terms[]</b>:


-- <b>Outputs:</b> --
<b>Terms[] out</b>:

### Terminals - Left-Top Term.vi
-- <b>Inputs:</b> --
<b>Terms[]</b>:


-- <b>Outputs:</b> --
<b>Terms[] out</b>:

### Terminals - Lower Term.vi
-- <b>Inputs:</b> --
<b>Terms[]</b>:


-- <b>Outputs:</b> --
<b>Terms[] out</b>:

### Terminals - Upper Term.vi
-- <b>Inputs:</b> --
<b>Terms[]</b>:


-- <b>Outputs:</b> --
<b>Terms[] out</b>:

## Documentation

### CSM - Copyright QuickDrop.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### CSM - Documentation QuickDrop.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### CSM - Keywords QuickDrop.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### CSM Dummy Module.vi
-- <b>Inputs:</b> --
<b>Init State("Macro: Initialize")</b>:

<b>Name("" to use uuid)</b>:


-- <b>Outputs:</b> --

## CSM Internal

### Naming Check.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Name("" to use uuid)</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters

-- <b>Outputs:</b> --
<b>error out</b>:
<B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Name(dup)</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters

### Check.vi
-- <b>Inputs:</b> --
<b>BroadcastRegistry in</b>:

<b>Status</b>:

<b>Source</b>:

<b>Target</b>:


-- <b>Outputs:</b> --
<b>BroadcastRegistry out</b>:

<b>Response Message Info</b>:

### Delete Source Module.vi
-- <b>Inputs:</b> --
<b>BroadcastRegistry in</b>:

<b>Source</b>:


-- <b>Outputs:</b> --
<b>BroadcastRegistry out</b>:

### Delete Target Module.vi
-- <b>Inputs:</b> --
<b>BroadcastRegistry in</b>:

<b>Source</b>:


-- <b>Outputs:</b> --
<b>BroadcastRegistry out</b>:

### Initialize.vi
-- <b>Inputs:</b> --
<b>BroadcastRegistry in</b>:


-- <b>Outputs:</b> --
<b>BroadcastRegistry out</b>:

### List Entries.vi
-- <b>Inputs:</b> --
<b>BroadcastRegistry in</b>:


-- <b>Outputs:</b> --
<b>BroadcastRegistry out</b>:

<b>Array</b>:

### List Status in Registry.vi
-- <b>Inputs:</b> --
<b>BroadcastRegistry in</b>:


-- <b>Outputs:</b> --
<b>BroadcastRegistry out</b>:

<b>Status</b>:

### Register.vi
-- <b>Inputs:</b> --
<b>BroadcastRegistry in</b>:

<b>status</b>:

<b>source</b>:

<b>api</b>:

<b>target</b>:


-- <b>Outputs:</b> --
<b>BroadcastRegistry out</b>:

### Remove Module.vi
-- <b>Inputs:</b> --
<b>BroadcastRegistry in</b>:

<b>Source</b>:


-- <b>Outputs:</b> --
<b>BroadcastRegistry out</b>:

### Unregister.vi
-- <b>Inputs:</b> --
<b>BroadcastRegistry in</b>:

<b>Status</b>:

<b>Source</b>:

<b>api</b>:

<b>Target</b>:


-- <b>Outputs:</b> --
<b>BroadcastRegistry out</b>:

### Broadcast Item Key.vi
-- <b>Inputs:</b> --
<b>status</b>:

<b>target</b>:

<b>source</b>:


-- <b>Outputs:</b> --
<b>key</b>:

### Preview.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>BroadcastRegistry in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Registry</b>:

<b>BroadcastRegistry out</b>:

### Remove response API from List.vi
-- <b>Inputs:</b> --
<b>API</b>:

<b>output cluster in</b>:


-- <b>Outputs:</b> --
<b>output cluster out</b>:

### Concatenate State with Arguments.vi
-- <b>Inputs:</b> --
<b>Arguments</b>:

<b>State</b>:


-- <b>Outputs:</b> --
<b>State with Arguements</b>:

### CSM-Name to CSM-Mode.vi
-- <b>Inputs:</b> --
<b>String</b>:


-- <b>Outputs:</b> --
<b>ParentCSM Name</b>:

<b>CSM Mode</b>:

<b>Requested Name</b>:

### Format Timestamp.vi
-- <b>Inputs:</b> --
<b>timestamp</b>:

<b>format string</b>:


-- <b>Outputs:</b> --
<b>String</b>:

### Hex Str to U8 Data.vi
-- <b>Inputs:</b> --
<b>HEX String (0-9,A-F)</b>:


-- <b>Outputs:</b> --
<b>u8 Data[]</b>:

### Parse Next Single-line State.vi
-- <b>Inputs:</b> --
<b>States Queue</b>:


-- <b>Outputs:</b> --
<b>Next Single-line State</b>:

<b>Remaining States Queue</b>:

### Remove Comments from Line.vi
-- <b>Inputs:</b> --
<b>single-line text</b>:


-- <b>Outputs:</b> --
<b>single-line text without comments</b>:

### Splite Reason String Part.vi
-- <b>Inputs:</b> --
<b>Single-line -& Reason</b>:


-- <b>Outputs:</b> --
<b>CSM Name</b>:

<b>`State</b>:

<b>`Arguments</b>:

### Splite Single-line Message.vi
-- <b>Inputs:</b> --
<b>single-line text</b>:


-- <b>Outputs:</b> --
<b>operator</b>:

<b>state</b>:

<b>args</b>:

<b>source/target</b>:

### Trim Single line Text.vi
-- <b>Inputs:</b> --
<b>single-line text</b>:


-- <b>Outputs:</b> --
<b>trimed text</b>:

### U8 Data to Hex Str.vi
-- <b>Inputs:</b> --
<b>u8 Data[]</b>:


-- <b>Outputs:</b> --
<b>HEX String (0-9,A-F)</b>:

### CSM Critical Error.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Arugments(as Reason)</b>:

<b>CSM Name</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM No Target Error.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM Not Allowed Message.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>State</b>:

<b>CSM</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM Target Error.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Arguments(as CSM Name)</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM Target Timeout Error.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Arguments(as CSM Name)</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM Unhandled State Error.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Current State</b>:

<b>CSM Name</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Cache-Broadcast Registry Search Result.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM Name</b>:

<b>Broadcast state</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Array</b>:

### FGV-BroadcastRegistry.vi
-- <b>Inputs:</b> --
<b>Source</b>:

<b>Target</b>:

<b>Status</b>:

<b>API</b>:

<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Operation</b>:


-- <b>Outputs:</b> --
<b>response message</b>:

<b>Error out</b>:
<B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### global-Broadcast Cache Change Flag.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### global-CSMQ FGV Change Flag.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### Cache-GEvt Filter Object.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --
<b>CSM:LogFilter.lvclass</b>:

### FGV-GEvt Filter Obj.vi
-- <b>Inputs:</b> --
<b>Set(T)/Get(F)</b>:

<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Rules-v1</b>:


-- <b>Outputs:</b> --
<b>Error out</b>:
<B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM:LogFilter.lvclass</b>:

### FGV-GlobalEventRef.vi
-- <b>Inputs:</b> --
<b>Create(F)</b>:

<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM Global Log Event</b>:

### FGV-StatusChangeEventRef.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Name("" to use uuid) in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Status Change Event</b>:

### GEvt-BackgroundThread.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### GEvt-Convert Filter Rules - v1.0.vi
-- <b>Inputs:</b> --
<b>Rules-v1</b>:


-- <b>Outputs:</b> --
<b>GlobalLogFilter</b>:

### GEvt-Filter Global Log - v1.0.vi
-- <b>Inputs:</b> --
<b>Rules-v1</b>:

<b>Cross CSM Data (in)</b>:


-- <b>Outputs:</b> --
<b>Matched? (dup)</b>:

<b>Cross CSM Data</b>:

### GEvt-Generate Complete Log.vi
-- <b>Inputs:</b> --
<b>CSM Global Log Event</b>:

<b>event data</b>:

<b>Enable?</b>:

<b>CSM:LogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>CSM Global Log Event out</b>:

### GEvt-Generate Interrupt Log.vi
-- <b>Inputs:</b> --
<b>CSM Global Log Event</b>:

<b>Current State</b>:

<b>Arguments</b>:

<b>Name("" to use uuid)</b>:

<b>CSM:LogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>CSM Global Log Event out</b>:

<b>event data</b>:

### GEvt-Generate Module Created Log.vi
-- <b>Inputs:</b> --
<b>CSM Global Log Event</b>:

<b>Name("" to use uuid)</b>:

<b>Created?</b>:

<b>CSM:LogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>CSM Global Log Event out</b>:

<b>event data</b>:

### GEvt-Generate Module Destroyed Log.vi
-- <b>Inputs:</b> --
<b>CSM Global Log Event</b>:

<b>Name("" to use uuid)</b>:

<b>Enable?</b>:

<b>CSM:LogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>CSM Global Log Event out</b>:

<b>event data</b>:

### GEvt-Generate Register Log.vi
-- <b>Inputs:</b> --
<b>CSM Global Log Event</b>:

<b>Current State</b>:

<b>Arguments</b>:

<b>Name("" to use uuid)</b>:

<b>CSM:LogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>CSM Global Log Event out</b>:

<b>event data</b>:

### GEvt-Generate Remaining States Log.vi
-- <b>Inputs:</b> --
<b>CSM Global Log Event</b>:

<b>Remaining States</b>:

<b>Name("" to use uuid)</b>:

<b>Enable?</b>:

<b>CSM:LogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>CSM Global Log Event out</b>:

<b>event data</b>:

### GEvt-Generate State Change Log.vi
-- <b>Inputs:</b> --
<b>CSM Global Log Event</b>:

<b>Current State</b>:

<b>Arguments</b>:

<b>Source Message.*State</b>:

<b>Source Message.*Arguments</b>:

<b>Source Module</b>:

<b>Name("" to use uuid)</b>:

<b>CSM:LogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>CSM Global Log Event out</b>:

<b>event data</b>:

### GEvt-Generate Status Log.vi
-- <b>Inputs:</b> --
<b>CSM Global Log Event</b>:

<b>Current State</b>:

<b>Arguments</b>:

<b>Name("" to use uuid)</b>:

<b>CSM:LogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>CSM Global Log Event out</b>:

<b>event data</b>:

### GEvt-Generate Unregister Log.vi
-- <b>Inputs:</b> --
<b>CSM Global Log Event</b>:

<b>Current State</b>:

<b>Arguments</b>:

<b>Name("" to use uuid)</b>:

<b>CSM:LogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>CSM Global Log Event out</b>:

<b>event data</b>:

### GEvt-Generate with Rule Check.vi
-- <b>Inputs:</b> --
<b>LogFilter in</b>:

<b>event data</b>:

<b>CSM Global Log Event in</b>:


-- <b>Outputs:</b> --
<b>CSM Global Log Event out</b>:

### GEvt-Set Source Filter Rules - v1.0.vi
-- <b>Inputs:</b> --
<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Rules-v1</b>:


-- <b>Outputs:</b> --
<b>Error out</b>:
<B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Gevt-ThreadQueueName.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --
<b>ThreadQueueName</b>:

### GEvt-WatchdogThread.vi
-- <b>Inputs:</b> --
<b>WatchDogQ</b>:


-- <b>Outputs:</b> --

### global-GEvnt Filter Change Flag.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### Filter Check.vi
-- <b>Inputs:</b> --
<b>Cross CSM Data in</b>:

<b>GlobalLogFilter in</b>:


-- <b>Outputs:</b> --
<b>Matched? (dup)</b>:

<b>Cross CSM Data out</b>:

<b>GlobalLogFilter.lvclass (dup)</b>:

### List Rules as Strings.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>GlobalLogFilter in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Rule Strings</b>:

<b>GlobalLogFilter out</b>:

### CSM Check - LogType.vi
-- <b>Inputs:</b> --
<b>Matched Previous?</b>:

<b>Cross CSM Data (in)</b>:

<b>GlobalLogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>Matched? (dup)</b>:

<b>Cross CSM Data</b>:

<b>GlobalLogFilter.lvclass (dup)</b>:

### CSM Check - State.vi
-- <b>Inputs:</b> --
<b>Matched Previous?</b>:

<b>Cross CSM Data (in)</b>:

<b>GlobalLogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>Matched? (dup)</b>:

<b>Cross CSM Data</b>:

<b>GlobalLogFilter.lvclass (dup)</b>:

### CSM Check - StateType.vi
-- <b>Inputs:</b> --
<b>Matched Previous?</b>:

<b>Cross CSM Data (in)</b>:

<b>GlobalLogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>Matched? (dup)</b>:

<b>Cross CSM Data</b>:

<b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - CSM.vi
-- <b>Inputs:</b> --
<b>Matched Previous?</b>:

<b>Cross CSM Data (in)</b>:

<b>GlobalLogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>Matched? (dup)</b>:

<b>Cross CSM Data</b>:

<b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - LogType.vi
-- <b>Inputs:</b> --
<b>Matched Previous?</b>:

<b>Cross CSM Data (in)</b>:

<b>GlobalLogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>Matched? (dup)</b>:

<b>Cross CSM Data</b>:

<b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - State.vi
-- <b>Inputs:</b> --
<b>Matched Previous?</b>:

<b>Cross CSM Data (in)</b>:

<b>GlobalLogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>Matched? (dup)</b>:

<b>Cross CSM Data</b>:

<b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - StateType.vi
-- <b>Inputs:</b> --
<b>Matched Previous?</b>:

<b>Cross CSM Data (in)</b>:

<b>GlobalLogFilter.lvclass</b>:


-- <b>Outputs:</b> --
<b>Matched? (dup)</b>:

<b>Cross CSM Data</b>:

<b>GlobalLogFilter.lvclass (dup)</b>:

### Set CSM LogType Filter.vi
-- <b>Inputs:</b> --
<b>LogType</b>:

<b>GlobalLogFilter in</b>:


-- <b>Outputs:</b> --
<b>GlobalLogFilter out</b>:

### Set CSM State Filter.vi
-- <b>Inputs:</b> --
<b>CSM:State</b>:

<b>GlobalLogFilter in</b>:


-- <b>Outputs:</b> --
<b>GlobalLogFilter out</b>:

### Set CSM StateType Filter.vi
-- <b>Inputs:</b> --
<b>LogType</b>:

<b>GlobalLogFilter in</b>:


-- <b>Outputs:</b> --
<b>GlobalLogFilter out</b>:

### Set Global CSM Filter.vi
-- <b>Inputs:</b> --
<b>Group:CSM</b>:

<b>GlobalLogFilter in</b>:


-- <b>Outputs:</b> --
<b>GlobalLogFilter out</b>:

### Set Global LogType Filter.vi
-- <b>Inputs:</b> --
<b>Group:LogType</b>:

<b>GlobalLogFilter in</b>:


-- <b>Outputs:</b> --
<b>GlobalLogFilter out</b>:

### Set Global State Filter.vi
-- <b>Inputs:</b> --
<b>Group:State</b>:

<b>GlobalLogFilter in</b>:


-- <b>Outputs:</b> --
<b>GlobalLogFilter out</b>:

### Set Global StateType Filter.vi
-- <b>Inputs:</b> --
<b>Group:LogType</b>:

<b>GlobalLogFilter in</b>:


-- <b>Outputs:</b> --
<b>GlobalLogFilter out</b>:

### Log State Type.vi
-- <b>Inputs:</b> --
<b>Complete(T)/Start(F)</b>:

<b>Source Module</b>:

<b>��State</b>:


-- <b>Outputs:</b> --
<b>CSM_GlobalLog_STATE_TYPE</b>:

### Parse Register Message.vi
-- <b>Inputs:</b> --
<b>state</b>:

<b>Module Name </b>:

<b>args</b>:


-- <b>Outputs:</b> --
<b>target</b>:

<b>source</b>:

<b>status</b>:

<b>api</b>:

### Parse State with Arguments String.vi
-- <b>Inputs:</b> --
<b>State with Arguments</b>:
The State string that requires the argument.

-- <b>Outputs:</b> --
<b>State</b>:

<b>Arguments</b>:

<b>Target Module</b>:

<b>Message Symbol</b>:

### Parse Unregister Message.vi
-- <b>Inputs:</b> --
<b>state</b>:

<b>Module Name </b>:

<b>args</b>:


-- <b>Outputs:</b> --
<b>target</b>:

<b>source</b>:

<b>status</b>:

<b>api</b>:

### Dequeue Element.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>timeout in ms (-1)</b>:

<b>Priority Queue</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>timed out?</b>:

<b>Cross JKI State Machine State</b>:

<b>Priority Queue(dup)</b>:

<b>High Priority?</b>:

### Enqueue Element.vi
-- <b>Inputs:</b> --
<b>High Priority?(F)</b>:

<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>timeout in ms (-1)</b>:

<b>Cross JKI State Machine State</b>:

<b>Priority Queue</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Priority Queue(dup)</b>:

### Get Queue Status.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Priority Queue in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b># pending insert</b>:

<b># pending remove</b>:

<b>Priority Queue out</b>:

<b># elements in queue</b>:

### Not a Refnum.vi
-- <b>Inputs:</b> --
<b>Priority Queue.lvclass</b>:


-- <b>Outputs:</b> --
<b>NaN/Path/Refnum?</b>:

### Obtain Priority Queue.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>create if not found? (T)</b>:

<b>name</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>created new?</b>:

<b>Priority Queue</b>:

### Release Priority Queue.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>force destroy? (F)</b>:

<b>Priority Queue</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-Async Call.vi
-- <b>Inputs:</b> --
<b>state</b>:

<b>args</b>:

<b>source/target</b>:

<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Module Name</b>:

<b>Msg Type</b>:


-- <b>Outputs:</b> --
<b>state out</b>:

<b>args out</b>:

<b>source/target out</b>:

<b>Pre-State out</b>:

<b>Pre-Args out</b>:

<b>error</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-Broadcast.vi
-- <b>Inputs:</b> --
<b>state</b>:

<b>args</b>:

<b>source/target</b>:

<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Module Name</b>:

<b>Msg Type</b>:


-- <b>Outputs:</b> --
<b>state out</b>:

<b>args out</b>:

<b>source/target out</b>:

<b>Pre-State out</b>:

<b>Pre-Args out</b>:

<b>error</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-PostPostMsg.vi
-- <b>Inputs:</b> --
<b>state</b>:

<b>args</b>:

<b>source/target</b>:

<b>Pre-State in</b>:

<b>Pre-Args in</b>:

<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>session error</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Module Name</b>:

<b>Response Arguments</b>:


-- <b>Outputs:</b> --
<b>state out</b>:

<b>args out</b>:

<b>source/target out</b>:

<b>Pre-State out</b>:

<b>Pre-Args out</b>:

<b>error</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-PostSendMsg.vi
-- <b>Inputs:</b> --
<b>state</b>:

<b>args</b>:

<b>source/target</b>:

<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>session error</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Module Name</b>:

<b>Response Arguments</b>:


-- <b>Outputs:</b> --
<b>state out</b>:

<b>args out</b>:

<b>source/target out</b>:

<b>error</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-Register Status.vi
-- <b>Inputs:</b> --
<b>state</b>:

<b>args</b>:

<b>source/target</b>:

<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Module Name</b>:


-- <b>Outputs:</b> --
<b>state out</b>:

<b>args out</b>:

<b>source/target out</b>:

<b>Pre-State out</b>:

<b>Pre-Args out</b>:

<b>error</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-Sync Call.vi
-- <b>Inputs:</b> --
<b>state</b>:

<b>args</b>:

<b>source/target</b>:

<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Response Timeout(5000ms)</b>:

<b>Module Name</b>:


-- <b>Outputs:</b> --
<b>state out</b>:

<b>args out</b>:

<b>source/target out</b>:

<b>Pre-State out</b>:

<b>Pre-Args out</b>:

<b>error</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-Unregister Status.vi
-- <b>Inputs:</b> --
<b>state</b>:

<b>args</b>:

<b>source/target</b>:

<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Module Name</b>:


-- <b>Outputs:</b> --
<b>state out</b>:

<b>args out</b>:

<b>source/target out</b>:

<b>Pre-State out</b>:

<b>Pre-Args out</b>:

<b>error</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Add VI Reference Case to CSMs.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### CSM - Debug Console - DebugTool.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### CSM - Remove all CSM Bookmarks.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### CSM - Running Log - DebugTool.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### CSM - State Dashboard - DebugTool.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### CSM - State Table - DebugTool.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### CSM - Switch Language Tool.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### Script - JKISM to CSM.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### Autosize All MultiListbox Columns (Uniform Text).vi
-- <b>Inputs:</b> --
<b>IngoreCols(Empty as default)</b>:

<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Array</b>:

<b>Control in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Dashboard Cell Resize.vi
-- <b>Inputs:</b> --
<b>Cluster</b>:

<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Cluster Size:Height</b>:

<b>Cluster Size:Width</b>:

<b>����ѹ��P4 4</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Bounds:Area Height</b>:

<b>Bounds:Area Width</b>:

### Dashboard Cell2 Array Resize.vi
-- <b>Inputs:</b> --
<b>Num Columns</b>:

<b>Cluster</b>:

<b>Num Rows</b>:

<b>error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>area height</b>:

<b>area width</b>:

<b>Array 2</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Open CSM BD.vi
-- <b>Inputs:</b> --
<b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Open CSM FP.vi
-- <b>Inputs:</b> --
<b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Select Greater_nevstop.vi
-- <b>Inputs:</b> --
<b>A</b>:

<b>B</b>:


-- <b>Outputs:</b> --
<b>lesser</b>:

### CSM - Start File Logger.vi
-- <b>Inputs:</b> --
<b>Filter Rules</b>:

<b>Timestamp format</b>:

<b>Enable? (T)</b>:

<b>log limit</b>:

<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>WatchDog? (T)</b>:

<b>Exit When All Module Exist?(F)</b>:

<b>Log File Path</b>:


-- <b>Outputs:</b> --
<b>Error out</b>:
<B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>LogFile</b>:

<b>WatchDogQueue</b>:

### CSM-Logger-Thread.vi
-- <b>Inputs:</b> --
<b>log limit</b>:

<b>Exit When All Module Exist?(F)</b>:

<b>format string</b>:

<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>WatchDogQ</b>:

<b>GlobalLogFilter.lvclass</b>:

<b>file path (use dialog)</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Append Application Directory If Relative.vi
-- <b>Inputs:</b> --
<b>Relative path (.)</b>:


-- <b>Outputs:</b> --
<b>Application Directory (+ Relative)</b>:

### Convert File Extension (Path)__ogtk.vi
-- <b>Inputs:</b> --
<b>new ending (none)</b>:

<b>file name</b>:


-- <b>Outputs:</b> --
<b>prev ending</b>:

<b>new filename</b>:

### Convert File Extension (String)__ogtk.vi
-- <b>Inputs:</b> --
<b>new ending (none)</b>:

<b>file name</b>:


-- <b>Outputs:</b> --
<b>prev ending</b>:

<b>new filename</b>:

### CSMLS - Add Exit State(s) with Loop Check.vi
-- <b>Inputs:</b> --
<b>States Out in</b>:

<b>Remaining States</b>:


-- <b>Outputs:</b> --
<b>States Out out</b>:

### CSMLS - Append Continuous State.vi
-- <b>Inputs:</b> --
<b>Loop State(s) and Arguments</b>:
 This allows you to place new states in the front of the state machine queue. The default is an empty string.
<b>Append(T)</b>:

<b>Continous Arguments ("")</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
<b>Continous State</b>:
The State string that requires the argument.
<b>Remaining States</b>:


-- <b>Outputs:</b> --
<b>States Out</b>:

### CSMLS - Define Loop State(s).vi
-- <b>Inputs:</b> --
<b>States Out in</b>:

<b>Remaining States</b>:


-- <b>Outputs:</b> --
<b>States Out out</b>:

### CSMLS - Remove Loop Tag and previous State(s) to Break.vi
-- <b>Inputs:</b> --
<b>Remaining States</b>:


-- <b>Outputs:</b> --
<b>States</b>:

### CSMLS - Remove Loop Tag to Break.vi
-- <b>Inputs:</b> --
<b>Remaining States</b>:


-- <b>Outputs:</b> --
<b>States</b>:

### CSM - Start Watchdog to Ensure All Modules Exit.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.

-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.


## Unsorted

### CSM Watchdog Thread.vi
-- <b>Inputs:</b> --
<b>WatchdogQ</b>:


-- <b>Outputs:</b> --

### CSM - Break Down Multiple States String.vi
-- <b>Inputs:</b> --
<b>States</b>:


-- <b>Outputs:</b> --
<b>Multiple States</b>:

### CSM - Build Exit Messages of CSMs.vi
-- <b>Inputs:</b> --
<b>State with Arguments("Macro: Exit��)</b>:

<b>CSMs</b>:


-- <b>Outputs:</b> --
<b>States</b>:

### CSM - Check Mapping Relastionship in Broadcast Registry.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM Name</b>:

<b>Broadcast state</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Array</b>:

### CSM - Check Status Registration.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM Name</b>:

<b>Broadcast state</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Array</b>:

### CSM - Convert Argument to Error.vi
-- <b>Inputs:</b> --
<b>Argument</b>:


-- <b>Outputs:</b> --
<b>error</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Convert Error to Argument.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>Outputs:</b> --
<b>Arguments</b>:

### CSM - Convert Filter Rules.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### CSM - Filter Duplicate Messages By Name.vi
-- <b>Inputs:</b> --
<b>Whole Messages in Check?(T)</b>:

<b>States</b>:


-- <b>Outputs:</b> --
<b>States out</b>:

### CSM - Filter Global Log.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### CSM - Filter Messages to Non-Existing Modules.vi
-- <b>Inputs:</b> --
<b>State(s) in ("")</b>:
Wire the existing states to this input. The default is an empty string.

-- <b>Outputs:</b> --
<b>States Out</b>:
This output returns a concatenation of all the inputs seperated by a line feed character. The line feed character is required by the JKI State Machine.

### CSM - Flood of Events Handler Side Loop.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### CSM - Forward States to CSM.vi
-- <b>Inputs:</b> --
<b>High Priority(T)</b>:

<b>Module Name</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters
<b>Error In (no error)</b>:
The error cluster from the JKI State Machine is wired to this input. If an error occures and appears on this input, the current state output returns the "Error Handler" state.
<b>State(s) in ("")</b>:
Wire the existing states to this input. The default is an empty string.

-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Forward UI Operations to CSM.vi
-- <b>Inputs:</b> --
<b>Name("" to use uuid)</b>:

<b>State(s) in ("")</b>:


-- <b>Outputs:</b> --
<b>States Out</b>:

### CSM - Global Log Error Handler.vi
-- <b>Inputs:</b> --
<b>Clear Error(T)</b>:

<b>Place("" to use VI's Name)</b>:

<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Keywords.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --
<b>%[hex] Code</b>:

<b>Source</b>:

### CSM - List All Status Registration.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Array</b>:

### CSM - List Log Filter Rules As Strings.vi
-- <b>Inputs:</b> --
<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>Outputs:</b> --
<b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
<b>Rule Strings</b>:

### CSM - List Mapping Relationships in Broadcast Registry.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Array</b>:

### CSM - List Rules in Broadcast Registry.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Entries</b>:

### CSM - List Status in Broadcast Registry.vi
-- <b>Inputs:</b> --
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Status in Registry</b>:

### CSM - Mark As Chain Module.vi
-- <b>Inputs:</b> --
<b>Order</b>:

<b>CSM Name</b>:


-- <b>Outputs:</b> --
<b>CSM Name(marked as Chain)</b>:

### CSM - Module Exit Event.vi
-- <b>Inputs:</b> --
<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Name("" to use uuid) in</b>:


-- <b>Outputs:</b> --
<b>Error out</b>:
<B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM Exit Event</b>:

### CSM - Module VI Reference.vi
-- <b>Inputs:</b> --
<b>Response Timeout(5000ms)</b>:

<b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM Module VIRef</b>:

### CSM - Remove Duplicated Following Messages.vi
-- <b>Inputs:</b> --
<b>Current State</b>:

<b>Remaining States</b>:


-- <b>Outputs:</b> --
<b>Remaining States Left</b>:

### CSM - Remove Module in Boradcast Registry.vi
-- <b>Inputs:</b> --
<b>CSM Name</b>:

<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>Outputs:</b> --
<b>CSM Name(dup)</b>:

<b>Error out</b>:
<B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Replace Substitution Marks in Messages.vi
-- <b>Inputs:</b> --
<b>States with Replace Token</b>:

<b><param></b>:

<b><target></b>:

<b><1></b>:

<b><2></b>:


-- <b>Outputs:</b> --
<b>States</b>:

### CSM - Run Script.vi
-- <b>Inputs:</b> --
<b>single-line text</b>:

<b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
<b>Continue If Error?(F)</b>:

<b>Wait(5000ms)</b>:

<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Response Timeout(5000ms)</b>:


-- <b>Outputs:</b> --
<b>States Left</b>:

<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Set Log Filter Rules.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --



### CSM - Wait for All Modules to be Alive.vi
-- <b>Inputs:</b> --
<b>Timeout(5000ms)</b>:

<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Module Names (in)</b>:


-- <b>Outputs:</b> --
<b>Error out</b>:
<B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>waited(ms)</b>:

<b>Left Modules</b>:

### CSM - Wait for All Modules to Exit.vi
-- <b>Inputs:</b> --
<b>Timeout(5000ms)</b>:

<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Module Names (in)</b>:


-- <b>Outputs:</b> --
<b>Error out</b>:
<B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>waited(ms)</b>:

<b>Left Modules</b>:

### CSM - Wait for Module to Be Alive.vi
-- <b>Inputs:</b> --
<b>Target Module</b>:

<b>Wait(5000ms)</b>:

<b>error in (no error)</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>Outputs:</b> --
<b>Target Module (dup)</b>:

<b>Waited(ms)</b>:

<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM Data Type String to Enum.vi
-- <b>Inputs:</b> --


-- <b>Outputs:</b> --

### CSM Data Type String.vi
-- <b>Inputs:</b> --
<b>Data</b>:


-- <b>Outputs:</b> --
<b>Data Type String</b>:

### Replace Tag with Array.vi
-- <b>Inputs:</b> --
<b>Error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>Enum</b>:

<b>replace string</b>:

<b>single-line text</b>:


-- <b>Outputs:</b> --
<b>Error out</b>:
<B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>States</b>:

### CSM Data Type String to Enum(RefnumEnum).vi
-- <b>Inputs:</b> --
<b>Data Type String</b>:


-- <b>Outputs:</b> --
<b>Array Dim</b>:

<b>Secondary Type</b>:

<b>Primary Type</b>:

### CSM Data Type String to Enum(String).vi
-- <b>Inputs:</b> --
<b>Data Type String</b>:


-- <b>Outputs:</b> --
<b>Array Dim</b>:

<b>Secondary Type String</b>:

<b>Primary Type</b>:

### CSM Data Type String to Enum(TypeEnum).vi
-- <b>Inputs:</b> --
<b>Data Type String</b>:


-- <b>Outputs:</b> --
<b>Array Dim</b>:

<b>Secondary Type</b>:

<b>Primary Type</b>:

### CSM-Helper usecase Template.vit
-- <b>Inputs:</b> --
<b>error in</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper in</b>:


-- <b>Outputs:</b> --
<b>error out</b>:
<B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
<b>CSM-Helper out</b>:
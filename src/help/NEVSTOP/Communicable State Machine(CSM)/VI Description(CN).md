# CSM API

## ģ��(Templates)

> [!NOTE]CSM Name ����
> - CSM ģ������Ӧ����Ψһ�ģ�����ᵼ�� CSM ���� "Critical Error" ״̬��
> - �������Ϊ ""����ʹ�� UUID ��Ϊģ�����ơ���ģ�鱻���Ϊ����ģʽ�����������ģ���б��С�
> - ��������� '#' ��β�����ģ�齫�ڹ���ģʽ�����С�������ͬ���Ƶ�ģ�齫����ͬһ��Ϣ���С��κ��ⲿ��Ϣ��������һ��ģ�鴦��ȡ�����ĸ�ģ����С�
>

> [!NOTE]CSM ��ʼ��״̬
> - Ĭ��ֵ�� JKISM ״̬������һ��, �� "Macro: Initialize"��
> - ͨ�������޸Ĵ�״̬����Ϊ�����Ŀ����Ϊ�˷����ⲿ�����޸ĳ�ʼ��״̬��
>

### CSM Module Template.vi

���ڴ����������û������ CSM ģ���ģ��

-- <b>����ؼ�</b> --
- <b>Name("" to use uuid)</b>: CSM ģ������
- <b>Init State("Macro: Initialize")</b>: CSM ��ʼ��״̬, Ĭ��Ϊ "Macro: Initialize"


### CSM User Interface(UI) Module Template.vi

���ڴ��������û������ CSM ģ���ģ�壬ģ���а����û��¼��ṹ������Ӧ�û�������

-- <b>����ؼ�</b> --
- <b>Name("" to use uuid)</b>: CSM ģ������
- <b>Init State("Macro: Initialize")</b>: CSM ��ʼ��״̬, Ĭ��Ϊ "Macro: Initialize"

### CSM Module Template - Tiny.vi

���ڴ����������û������ CSM ģ���ģ�塣��ģ��Ĵ���ȽϽ��ա�

-- <b>����ؼ�</b> --
- <b>Name("" to use uuid)</b>: CSM ģ������
- <b>Init State("Macro: Initialize")</b>: CSM ��ʼ��״̬, Ĭ��Ϊ "Macro: Initialize"

### CSM User Interface(UI) Module Template - Tiny.vi

���ڴ��������û������ CSM ģ���ģ�壬ģ���а����û��¼��ṹ������Ӧ�û���������ģ��Ĵ���ȽϽ��ա�

-- <b>����ؼ�</b> --
- <b>Name("" to use uuid)</b>: CSM ģ������
- <b>Init State("Macro: Initialize")</b>: CSM ��ʼ��״̬, Ĭ��Ϊ "Macro: Initialize"

## ���Ĺ���(Core Functions)

### Parse State Queue++.vi

����JKI״̬��״̬���У����ؽ�ִ�е���һ����ǰ״̬����������Ϣ��

-- <b>����ؼ�</b> --
- <b>State Queue</b>: ����״̬���б����ӵ������롣��Ӧ������ CSM ����λ�Ĵ�����
- <b>Previous Error</b>: ����JKI״̬���Ĵ���ر����ӵ������롣����������󲢳����ڴ������ϣ���ǰ״̬��������� "Error Handler" ״̬��
- <b>Name("" to use uuid)</b>: CSM ģ������
- <b>Response Timeout(5000ms)</b>:ͬ������ʱ����Ӧ��ʱ���ã�Ĭ�� 5000 ms.
- <b>Dequeue Timeout(0ms)</b>: ��� CSM ��Ϣ���еĳ�ʱ���ã�Ĭ��Ϊ0�������еȴ���
- <b>Response Arguments</b>: ������һ��״̬����Ӧ��������Ӧ�������� CSM ����λ�Ĵ��������ڴ����ⲿ���õķ���ֵ��

-- <b>����ؼ�</b> --
- <b>Remaining States</b>:  ���ؼ���ִ�е�����״̬������
- <b>Arguments</b>: ���ؿ����ڵ�ǰ״̬�ַ�����ʹ�õ��κβ�������Щ����λ�ڡ�>>���ַ�֮��<b>ע�⣺</b>�����������ð����κβ��ɴ�ӡ���ַ������绻�з���س�����
- <b>Current State</b>: ��ִ�е���һ����ǰ״̬
- <b>Name Used</b>: �������CSMģ���ʵ������
- <b>Argument - State</b>: ����� CSM ���������״̬���˲�����ʾ��״̬��ǰ״̬
- <b>From Who</b>: ���<b>Current State</b> �����ⲿ���͵ģ�������ԴCSMģ�����ơ�

### Build State String with Arguments++.vi

����һ������JKI״̬��������״̬�ַ�����

- <B>����:</B>

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

-- <b>����ؼ�</b> --
- <b>State</b>: ״̬����Ϣ�����ַ���
- <b>Arguments ("")</b>: <b>State</b> �Ĳ���
- <b>Target Module ("")</b>: ����Ϣ���͵�Ŀ�� CSM ģ������
- <b>Sync-Call(-@) T By Default/Async-Call(->) F</b>: ͬ����������"TRUE"; �첽��������"FALSE"

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: ���� JKI ״̬��״̬����������Ϣ���ַ���

### Build Message with Arguments++.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. Different message type symbol(->|,->,-@) will be used in different Polymorphic Vi instance.

Polymorphic Option:
- Build Message with Arguments(Auto Check).vi
- Build Asynchronous Message with Arguments.vi
- Build No-Reply Asynchronous Message with Arguments.vi
- Build Synchronous Message with Arguments.vi

#### Build Message with Arguments(Auto Check).vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. The message type from input <b>State with Arguments</b> will be used.

- <B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
- <b>Arguments ("")</b> input is "Arguments"
- <b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments" as no message symbol is detected.

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is ""
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -@ Callee"

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: String stands for state with arguments

#### Build Asynchronous Message with Arguments.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values with async-message symbol "->" if <b>Target Module ("")</b> is specified.

- <B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
- <b>Arguments ("")</b> input is "Arguments"
- <b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments -> Callee". It's different with Build Message with Arguments(Auto Check).vi. . Message Type Symbol is replaced with "->".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is ""
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -> NewCallee"

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -> Callee". Message Type Symbol is replaced with "->".

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: String stands for state with arguments

#### Build No-Reply Asynchronous Message with Arguments.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values with No-Reply async-message symbol "->|" if <b>Target Module ("")</b> is specified.

- <B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
- <b>Arguments ("")</b> input is "Arguments"
- <b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments ->| Callee". It's different with Build Message with Arguments(Auto Check).vi. Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments ->| NewCallee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is ""
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth ->| NewCallee". Message Type Symbol is replaced with "->|".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "->|".

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: String stands for state with arguments

#### Build Synchronous Message with Arguments.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values with sync-message symbol "-@" if <b>Target Module ("")</b> is specified.

- <B>For Example:</B>

If <b>State with Arguments</b> input is "API: DoSth"
- <b>Arguments ("")</b> input is "Arguments"
- <b>Target Module ("")</b> input is "Callee"
Then result string is "API: DoSth >> Arguments ->| Callee". It's different with Build Message with Arguments(Auto Check).vi. Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments ->| Callee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth >> NewArguments -@ NewCallee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -> Callee"
- <b>Arguments ("")</b> input is ""
- <b>Target Module ("")</b> input is "NewCallee"
Then result string is "API: DoSth -@ NewCallee". Message Type Symbol is replaced with "-@".

If <b>State with Arguments</b> input is "API: DoSth >> Arguments -@ Callee"
- <b>Arguments ("")</b> input is "NewArguments"
- <b>Target Module ("")</b> input is ""
Then result string is "API: DoSth >> NewArguments -@ Callee".

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: String stands for state with arguments

#### Build Interrupt Status Message.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. The message type from input <b>State with Arguments</b> will be used.
- <B>For Example:</B>
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
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.
- <b>State with Arguments</b>: String stands for state with arguments

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>:
- <b>Arguments ("")</b>:

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>:

#### Build Normal Status Message.vi

Builds a message that contains arguments for CSM. This VI will parse "State with Arguments" for message type, message string, arguments and target module from input <b>State with Arguments</b> and replace corresponding parts in the message with input values. The message type from input <b>State with Arguments</b> will be used.
- <B>For Example:</B>
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
- <b>State with Arguments</b>: Input Message which might contain Arguments or target Module
- <b>Arguments ("")</b>: The arguments which will be used to replace arguments in <b>State with Arguments</b>. if empty, no arguments will be included in output strings.
- <b>Target Module ("")</b>: The target which will be used to replace target in <b>State with Arguments</b>. if empty, target in <b>State with Arguments</b> will be used.
- <b>State with Arguments</b>: String stands for state with arguments

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>:
- <b>Arguments ("")</b>:

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>:

#### Build Register Status Message.vi

Builds register status message. The message looks like:
[source-state]@[source-module] >> [response-message]@[response-module] -><register>
For examples:
DownloadFinished@Downloader >> StartPlay@Player -><register>
DownloadFinished@Downloader >> StartPlay -><register> // response-module is current module
DownloadFinished@Downloader  -><register> // response-module is current module. response-message is DownloadFinished
DownloadFinished@* >> StartPlay@Player -><register> // Any Module's DownloadFinished is registered to Player's StartPlay state.

-- <b>����ؼ�</b> --
- <b>Source CSM Name (* as Default)</b>:
- <b>CSM Name</b>:
- <b>Status</b>:
- <b>Response Message (if "", same as Source Message)</b>:

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>:

#### Build Unregister Status Message.vi

Builds unregister status message. The message looks like:
[source-state]@[source-module] >> [response-module] -><unregister>
For examples:
DownloadFinished@Downloader >> StartPlay -><unregister>
DownloadFinished@Downloader  -><unregister>

-- <b>����ؼ�</b> --
- <b>Source CSM Name (* as Default)</b>:
- <b>CSM Name</b>:
- <b>Status</b>:

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>:

### Add State(s) to Queue By BOOL++.vi

���ݸ����ȼ���Bool���룬��VI����TRUE/False��ʣ��״̬������״̬��High Priority��������Ƿ���ʣ��״̬֮ǰ��֮������TRUE��False�ַ�����Bool�������Ҫ���ӵ��ַ�����TRUE����False��

#### Add State(s) to Queue By BOOL(Element).vi

���ݸ����ȼ���Bool���룬��VI����TRUE/False��ʣ��״̬������״̬��High Priority��������Ƿ���ʣ��״̬֮ǰ��֮������TRUE��False�ַ�����Bool�������Ҫ���ӵ��ַ�����TRUE����False��

-- <b>����ؼ�</b> --
- <b>State Queue("")</b>: ����״̬���б����ӵ�������
- <b>TRUE("")</b>: <b>Bool</b> Ϊ True ʱ�����״̬�ַ���
- <b>False("")</b>: <b>Bool</b> Ϊ False ʱ�����״̬�ַ���
- <b>Bool</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
- <b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>�Ķ��������ΪFalse���������ӵ�β����

-- <b>����ؼ�</b> --
- <b>State Queue Out</b>: ���ؼ���ִ�е�����״̬��������

#### Add State(s) to Queue By BOOL(Array Left).vi

���ݸ����ȼ���Bool���룬��VI����TRUE/False��ʣ��״̬������״̬��High Priority��������Ƿ���ʣ��״̬֮ǰ��֮������TRUE��False�ַ�����Bool�������Ҫ���ӵ��ַ�����TRUE����False��

-- <b>����ؼ�</b> --
- <b>State Queue("")</b>: ����״̬���б����ӵ�������
- <b>TRUE("")</b>: <b>Bool</b> Ϊ True ʱ�����״̬�ַ���
- <b>False("")</b>: <b>Bool</b> Ϊ False ʱ�����״̬�ַ���
- <b>Bool</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
- <b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>�Ķ��������ΪFalse���������ӵ�β����

-- <b>����ؼ�</b> --
- <b>State Queue Out</b>: ���ؼ���ִ�е�����״̬��������

#### Add State(s) to Queue By BOOL(Array Right).vi

���ݸ����ȼ���Bool���룬��VI����TRUE/False��ʣ��״̬������״̬��High Priority��������Ƿ���ʣ��״̬֮ǰ��֮������TRUE��False�ַ�����Bool�������Ҫ���ӵ��ַ�����TRUE����False��

-- <b>����ؼ�</b> --
- <b>State Queue("")</b>: ����״̬���б����ӵ�������
- <b>TRUE("")</b>: <b>Bool</b> Ϊ True ʱ�����״̬�ַ���
- <b>False("")</b>: <b>Bool</b> Ϊ False ʱ�����״̬�ַ���
- <b>Bool</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
- <b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>�Ķ��������ΪFalse���������ӵ�β����

-- <b>����ؼ�</b> --
- <b>State Queue Out</b>: ���ؼ���ִ�е�����״̬��������

#### Add State(s) to Queue By BOOL(Array All).vi

���ݸ����ȼ���Bool���룬��VI����TRUE/False��ʣ��״̬������״̬��
High Priority��������Ƿ���ʣ��״̬֮ǰ��֮������TRUE��False�ַ�����
Bool�������Ҫ���ӵ��ַ�����TRUE����False��

-- <b>����ؼ�</b> --
- <b>State Queue("")</b>: ����״̬���б����ӵ�������
- <b>TRUE("")</b>: <b>Bool</b> Ϊ True ʱ�����״̬�ַ���
- <b>False("")</b>: <b>Bool</b> Ϊ False ʱ�����״̬�ַ���
- <b>Bool</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
- <b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>�Ķ��������ΪFalse���������ӵ�β����

-- <b>����ؼ�</b> --
- <b>State Queue Out</b>: ���ؼ���ִ�е�����״̬��������

### CSM - Broadcast Status Change.vi

��ϵͳ�㲥״̬���ġ���ע��״̬�� CSM ģ�齫���յ�״̬���ġ�

-- <b>����ؼ�</b> --
- <b>Status with Arguments</b>: �����㲥��״̬������
- <b>State Queue("")</b>: ����״̬���б����ӵ�������
- <b>Broadcast(T)</b>: �����Ƿ�㲥�Ŀ�������

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ���ؼ���ִ�е�����״̬��������

## ����(Arguments)

### CSM - Make String Arguments Safe.vi

'->','->|','-@','-&','<-" �ǹؼ��֣����ܳ����ڲ����С�ʹ�ô� VI ��֤������ȫ��

-- <b>����ؼ�</b> --
- <b>Argument String</b>: ���ܰ����ؼ��ֵĲ��� '->','->|','-@','-&','<-".

-- <b>����ؼ�</b> --
- <b>Safe Argument String</b>: ��ȫ����

### CSM - Revert Arguments-Safe String.vi

'->','->|','-@','-&','<-" �ǹؼ��֣����ܳ����ڲ����С�ʹ��<b>CSM Make String Arguments Safe.vi</b>��֤������ȫ����VI���ڽ���ȫ����ת��Ϊԭʼ������

-- <b>����ؼ�</b> --
- <b>Safe Argument String</b>: ��ȫ����

-- <b>����ؼ�</b> --
- <b>Origin Argument String</b>: ���ܰ����ؼ��ֵĲ��� '->','->|','-@','-&','<-".

### CSM - Convert Data to HexStr.vi

�����Ӳ��������壩ת��Ϊʮ�������ַ��������ַ������԰�ȫ������״̬�������������ƻ��ַ��������߼���

-- <b>����ؼ�</b> --
- <b>Variant</b>: ���ݣ�����Ϊ����(variant)��ʽ

-- <b>����ؼ�</b> --
- <b>HEX String (0-9,A-F)</b>: Hex�ַ�����ʽ�����������ɼ��ַ������� CSM �Ĳ���Ҫ��

### CSM - Convert HexStr to Data.vi

��ʮ�������ַ�������ת���ر������ݡ�

-- <b>����ؼ�</b> --
- <b>HEX String</b>: Hex�ַ�����ʽ�����������ɼ��ַ������� CSM �Ĳ���Ҫ��

-- <b>����ؼ�</b> --
- <b>Variant</b>: ���ݣ�����Ϊ����(variant)��ʽ
- <b>error out</b>: �����

## Advance APIs

### CSM - Start Async Call.vi

�첽����ģ������VIƬ��

### CSM - Synchronized Call.vi

ͬ������ģ������VIƬ��

### CSM - Mark As Worker Module.vi

��CSM���ƺ���ӡ��������Ա�Ǵ�ģ��Ϊ�����ߣ����������ͬ���Ƶ����������߹�����ͬ����Ϣ���С�һ���������ɵ�UUID��ʵ�����ƽ����������CSMģ�顣

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������

-- <b>����ؼ�</b> --
- <b>CSM Name(marked as worker)</b>: ��ӡ�������� ��CSM ģ������

### CSM - Compact Multiple States.vi

�����״̬���ճɵ����ַ����Թ�����ʹ��

-- <b>����ؼ�</b> --
- <b>States in Lines</b>: ���״̬���ַ�������

-- <b>����ؼ�</b> --
- <b>States</b>: ������������״̬���ַ���

### CSM - Check If Module Exists.vi

��� CSM ģ���Ƿ����

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������
- <b>Error in</b>: �����

-- <b>����ؼ�</b> --
- <b>Exist?</b>: ����ģʽ�Ƿ���ڣ����ڷ���True�������ڷ���False
- <b>CSM Name(dup)</b>: ���� <b>CSM Name</b>
- <b>Error out</b>: �����

### CSM - List Modules.vi

�г�ϵͳ�����л��CSMģ�顣

-- <b>����ؼ�</b> --
- <b>Exclude Standalone CSM(T)</b>: �Ƿ������������ģʽ��ģ��
- <b>Error in</b>: �����

-- <b>����ؼ�</b> --
- <b>Module Names</b>: ģ�������б�
- <b>Error out</b>: �����

### CSM - Module Status.vi

��ȡCSMģ���״̬

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������.
- <b>Error in</b>: �����

-- <b>����ؼ�</b> --
- <b>Mode</b>: ����ģ��Ĺ���ģʽ��"Stand-alone", "CSM" �� "Action Worker".
- <b>#As Worker</b>: ������ģʽ�£���ģ��Ĺ���������
- <b>#msg to be processed</b>: CSM��Ϣ�����еĴ�������Ϣ����
- <b>CSM Name(dup)</b>: ���� <b>CSM Name</b>
- <b>Error out</b>: �����

### CSM - Register Status Change.vi

ע���Խ�������CSMģ��״̬���ĵ�֪ͨ�����δ���� ��Response Message�� ������Ϊ�գ���ʹ����ͬ��<b>Status</b> ������Ϊ��Ӧ��Ϣ��

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������.
- <b>Source CSM Name ('*' as Default)</b>: ����״̬��CSMģ�顣������ʹ�á�*������ʾ����������ͬ״̬��ģ�顣
- <b>Status</b>: ״̬�ַ���
- <b>Response Message (if "", same as Source Message)</b>: ע������״̬�����仯�������յ�����Ϣ��
- <b>Priority(T:As Status,F:As Interrupt)</b>: �����Ӧ��ϢΪFalse��������뵽״̬���е�ǰ�棻���򣬽��丽�ӵ����е�β����
- <b>Error in</b>: �����

-- <b>����ؼ�</b> --
- <b>CSM Name(dup)</b>: ���� <b>CSM Name</b>
- <b>Error out</b>: �����

### CSM - Unregister Status Change.vi

ȡ��ע������ CSM ģ��״̬���ĵ�֪ͨ��

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������.
- <b>Source CSM Name</b>: ����״̬��CSMģ�顣������ʹ�á�*������ʾ����������ͬ״̬��ģ�顣
- <b>Status</b>: ״̬�ַ���
- <b>Error in</b>: �����

-- <b>����ؼ�</b> --
- <b>CSM Name(dup)</b>: ���� <b>CSM Name</b>
- <b>Error out</b>: �����

### CSM - Get New State Notifier Event.vi

-- <b>����ؼ�</b> --
- <b>Name("" to use uuid) in</b>: CSM ģ������
- <b>Error in</b>: �����

-- <b>����ؼ�</b> --
- <b>New State Notifier Event</b>: �û��¼�������������յ���Ϣʱ��ʹ��CSMģ���ж����¼��ṹ�еĵȴ�
- <b>Error out</b>: �����

## Non-CSM Support

### CSM - Post Message.vi

��ָ����CSM����һ����Ϣ���൱���첽���ã������ȴ����ز�����

-- <b>����ؼ�</b> --
- <b>Target Module</b>:Ŀ�� CSM ģ������
- <b>State</b>: ��Ϣ�ַ���
- <b>Arguments ("")</b>: ��Ϣ����
- <b>Error In (no error)</b>: �����

-- <b>����ؼ�</b> --
- <b>error out</b>: �����

### CSM - Send Message and Wait for Reply.vi

��ָ����CSM����һ����Ϣ���ȴ��ظ����൱��ͬ�����ã���ָ����ʱ��û���յ����أ������س�ʱ����

-- <b>����ؼ�</b> --
- <b>Target Module</b>: Ŀ�� CSM ģ������
- <b>State</b>: ��Ϣ�ַ���
- <b>Arguments ("")</b>: ��Ϣ����
- <b>Response Timeout(5000ms)</b>: �ȴ����صĳ�ʱ���ã�Ĭ�� 5000ms.
- <b>Error In (no error)</b>: �����

-- <b>����ؼ�</b> --
- <b>Arguments</b>: Response returned.
- <b>error out</b>: �����

### CSM - Wait and Post Message.vi

-- <b>����ؼ�</b> --
- <b>State</b>:

- <b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Arguments ("")</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Target Module</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Wait(5000ms)</b>:

- <b>Error In (no error)</b>:
The error cluster from the JKI State Machine is wired to this input. If an error occures and appears on this input, the current state output returns the "Error Handler" state.

-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Wait and Send Message for Reply.vi

-- <b>����ؼ�</b> --
- <b>State</b>:

- <b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Arguments ("")</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Target Module</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Wait(5000ms)</b>:

- <b>Error In (no error)</b>:
The error cluster from the JKI State Machine is wired to this input. If an error occures and appears on this input, the current state output returns the "Error Handler" state.
- <b>Response Timeout(5000ms)</b>:

-- <b>����ؼ�</b> --
- <b>Response</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters
- <b>>> Source CSM >></b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Status Change Event

Obtain CSM Global Log Event Reference.
- <b>Error in</b>: Error cluster
- <b>CSM Global Log Event</b>: User event reference for CSM global log.
- <b>Error out</b>: Error cluster

-- <b>����ؼ�</b> --
- <b>Error in</b>:
- <b>Name("" to use uuid) in</b>:

-- <b>����ؼ�</b> --
- <b>Error out</b>:
- <b>Status Change Event</b>:

### CSM - Destroy Status Change Event.vi

Release CSM Global Log Event Reference.
- <b>CSM Global Log Event</b>:
- <b>Error in</b>: Error cluster
- <b>Error out</b>: Error cluster

-- <b>����ؼ�</b> --
- <b>Error in</b>:
- <b>Status Change Event</b>:

-- <b>����ؼ�</b> --
- <b>Error out</b>:

## Side-Loop Support

### CSM - Request CSM to Post Message.vi

���� CSM ������Ϣ��ͨ�����ں�CSM���еĹ���ѭ������Щ����ѭ���� CSM һ���������ģ�鹦�ܡ�

-- <b>����ؼ�</b> --
- <b>Module Name</b>:����״̬��CSM
- <b>Status</b>: �����㲥��״̬
- <b>Arguments ("")</b>: �����㲥��״̬����
- <b>Target Module</b>:Ŀ��ģ��
- <b>Error In (no error)</b>: �����

-- <b>����ؼ�</b> --
- <b>error out</b>: �����

### CSM - Request CSM to Broadcast Status Change.vi

���� CSM ����״̬��ͨ�����ں�CSM���еĹ���ѭ������Щ����ѭ���� CSM һ���������ģ�鹦�ܡ�

-- <b>����ؼ�</b> --
- <b>Module Name</b>:����״̬��CSM
- <b>Status</b>: �����㲥��״̬
- <b>Arguments ("")</b>: �����㲥��״̬����
- <b>Broadcast(T)</b>: �����Ƿ�㲥�Ŀ�������
- <b>Error In (no error)</b>: �����

-- <b>����ؼ�</b> --
- <b>error out</b>: �����

### CSM - Module Turns Invalid.vi

���CSM�Ƿ��Ѿ��˳���ͨ�����ں�CSM���еĹ���ѭ������Щ����ѭ���� CSM һ���������ģ�鹦�ܡ� ��VI���ڲ���ѭ�����˳�������

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: ģ������

-- <b>����ؼ�</b> --
- <b>Turn Invalid(Exit)?</b>: �Ƿ��Ѿ��˳�

## Global Log Event

### CSM - Global Log Event.vi

��ȡ CSM ȫ��״̬�û��¼����

-- <b>����ؼ�</b> --
- <b>Error in</b>: �����

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>: CSM ȫ��״̬�û��¼����
- <b>Error out</b>: �����

### CSM - Destroy Global Log Event.vi

�ͷ� CSM ȫ��״̬�û��¼����

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>: CSM ȫ��״̬�û��¼����
- <b>Error in</b>: �����

-- <b>����ؼ�</b> --
- <b>Error out</b>: �����

### CSM - Generate User Global Log.vi

-- <b>����ؼ�</b> --
- <b>Error in</b>:
- <b>From Who</b>:
- <b>ModuleName</b>:
- <b>Log</b>:
- <b>Arguments</b>:

-- <b>����ؼ�</b> --
- <b>error out</b>:

## Utility VIs

### Build Error Cluster.vi

����һ������أ�error cluster�����Ա�׼ LabVIEW �ķ�ʽ�ӵ��� VI �ĵ������й���Դ�ַ�����������Դ�ַ�����ʽΪ��
"<B>���õ� VI</B> �� <B>���� VI �ĵ�����</B>-><B>���� VI �ĵ����ߵĵ�����</B>->�ȵ�...->�ȵ�..."
��ѡ�� 'String to Prepend to source ("")' �ַ��������������Դ�ַ�������Ӷ����������Ϣ�������������ַ���������������������������ӵ�Դ�ַ���֮ǰ��

-- <b>����ؼ�</b> --
- <b>code</b>: ������
- <b>String to Prepend to source ("")</b>: ������Ϣ�ַ���

-- <b>����ؼ�</b> --
- <b>error out</b>: �����

### Build Internal State String.vi

�������� JKI ״̬��״̬����������Ϣ���ַ�����

-- <b>����ؼ�</b> --s
- <b>State</b>: ״̬�ַ���
- <b>Arguments ("")</b>: <b>State</b>�Ĳ���
- <b>Arg-State ("")</b>: ���ʹ���Ϣ��ģ���ڷ��ʹ���Ϣʱ���ڵ�״̬
- <b>Source ("")</b>: ���ʹ���Ϣ��ģ������

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: ���� JKI ״̬��״̬����������Ϣ���ַ���

### String History Cacher.vi

���浱ǰ������ַ��������棬�������ʷ�ַ�������������󳤶�����ʱ�����Ƚ���Ļ����ַ����������ǡ����ڵ���CSM����ʷ״̬��

-- <b>����ؼ�</b> --
- <b>String</b>: �������ַ���
- <b>length</b>: �������ʷ�ַ�������ַ�������
- <b>Include Timestamp(F)</b>: �Ƿ���ÿ�п�ͷ����ʱ�����

-- <b>����ؼ�</b> --
- <b>String Cache</b>: �������ʷ�ַ���

### Timeout Selector.vi

���ڰ����û��¼��ṹ��ģ����

-- <b>����ؼ�</b> --
- <b>Timeout Expected</b>: Ԥ�ڵĳ�ʱ����
- <b>Remaining States</b>: �������ʣ���״̬�������Ϊ 0���������ΪԤ��ֵ

-- <b>����ؼ�</b> --
- <b>Timeout</b>: �ٲú�ʹ�õĳ�ʱ����

### Trim Both Whitespace.vi

��ͷ����β������ͬʱ�Ƴ����� ASCII �հ��ַ����ո��Ʊ�����س��ͻ��У���

-- <b>����ؼ�</b> --
- <b>string</b>: �������ַ���

-- <b>����ؼ�</b> --
- <b>trimmed string</b>: �������ַ���

### uuid.vi

���ݱ�׼�������� <b>Universally Unique Identifier(UUID)</b>�� ����:
  - 59703F3AD837
  - 106A470BA5EC
  - 9B781DB313AF

-- <b>����ؼ�</b> --
- <b>UUID</b>: ���ɵ� UUID

### Random Change Flag.vi

����һ���������ֵ�����ڱ��״̬�ı仯��CSM��Ϊ�����Ч�ʣ���Щ�ط��Ļ���(cache)�������������ж��Ƿ���Ҫ���¡�

-- <b>����ؼ�</b> --
- <b>Random Change Flag</b>: ���ɵ������ֵ

### Global Log To String.vi

ȫ����־(Global Log)���ݴ�ת��Ϊ�ַ�����

-- <b>����ؼ�</b> --
- <b>Log</b>: ȫ����־���ݴ�

-- <b>����ؼ�</b> --
- <b>Log String</b>: ȫ����־�ַ���

## CSM-Helper API

### CSM-Helper API.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --


### _Add VI Reference Case.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>element</b>:

- <b>Add Frame</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Connect Information.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Case</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Backend Connected Info</b>:

- <b>FrontEnd Connected Info</b>:

- <b>CSM-Helper out</b>:

### Diagram Node Information.vi

-- <b>����ؼ�</b> --
- <b>InnerTerminal in</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array in</b>:

- <b>Front Tunnels</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array</b>:

- <b>Array out</b>:

### Get Argument Info From back Term.vi

-- <b>����ؼ�</b> --
- <b>Terminal in</b>:


-- <b>����ؼ�</b> --
- <b>Array</b>:

### Get Argument Info From Front Term.vi

-- <b>����ؼ�</b> --
- <b>Terminal in</b>:


-- <b>����ؼ�</b> --
- <b>Array</b>:

### GObject Terminals.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>GObject in</b>:


-- <b>����ؼ�</b> --
- <b>error in (no error) (dup)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Class Name</b>:

- <b>Terms[]</b>:

- <b>Node Object</b>:

- <b>tunnel Relative Pos</b>:

### Relative Pos to InterData Tunnel of CaseContent.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>element</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Position</b>:

- <b>CSM-Helper out</b>:

### Resize CaseStructure By Making Space.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Bounds</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>DiffBound</b>:

- <b>MakeSpace.Rect</b>:

- <b>CSM-Helper out</b>:

### Search With Pattern.vi

-- <b>����ؼ�</b> --
- <b>regular expression</b>:

- <b>Array</b>:


-- <b>����ؼ�</b> --
- <b>Numeric</b>:

### sub1.vi

-- <b>����ؼ�</b> --
- <b>Part References.Parse State Queue</b>:

- <b>regular expression</b>:

- <b>Array</b>:


-- <b>����ؼ�</b> --
- <b>Tunnel out</b>:

### sub2.vi

-- <b>����ؼ�</b> --
- <b>Part References.Parse State Queue</b>:

- <b>regular expression</b>:

- <b>Array</b>:


-- <b>����ؼ�</b> --
- <b>Tunnel out</b>:

### Refresh References.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper out</b>:

### Get ParentRef Until Type Matched.vi

-- <b>����ؼ�</b> --
- <b>Class Name</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>reference in</b>:


-- <b>����ؼ�</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Target Ref</b>:

### Is in JKISM or CSM.vi

-- <b>����ؼ�</b> --
- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>reference in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>is in JKISM or CSM?</b>:

### Relationship Check.vi

-- <b>����ؼ�</b> --
- <b>TestRef</b>:

- <b>reference in</b>:


-- <b>����ؼ�</b> --
- <b>Is TestRef</b>:

- <b>Is Child of TestRef</b>:

### Add State Frame.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>index(-1, use same group)</b>:

- <b>element</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Add Frame</b>:

- <b>CSM-Helper out</b>:

### Check NewStateNotify is Registered.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>NewStateNotify Registed</b>:

- <b>CSM-Helper out</b>:

### Connect Error Wire If not Connected.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>case</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Connect EventReg Wire If not Connected.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>case</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Connect Internal Data Wire If not Connected.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>case</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Connect LastResp to Response in Error Case.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Connect Paired Tunnels.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Connect StateQ Wire If not Connected.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>case</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Copy State.vi

-- <b>����ؼ�</b> --
- <b>Already Exist Action:
Replace(T) / Skip(F)</b>:

- <b>SourceCSM</b>:

- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>New(Empty to Use same Name)</b>:

- <b>Case</b>:

- <b>CSM-Helper.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out 2</b>:

### Create From Basic Refs.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM Basic Refs</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper.lvclass</b>:

### Create From CaseStructure Reference.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CaseStructure</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper.lvclass</b>:

### Create From EventStructure Reference.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CaseStructure</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper.lvclass</b>:

### Create From VI Reference.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>VI</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper.lvclass</b>:

### Create From WhileLoop Reference.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Structure</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper.lvclass</b>:

### Destroy.vi

-- <b>����ؼ�</b> --
- <b>Save Instruments?(F)</b>:

- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper out</b>:

### Doc.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>String 2</b>:

- <b>String</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>String 4</b>:

- <b>String 3</b>:

- <b>CSM-Helper out</b>:

### Get All API Interface Info.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array</b>:

- <b>CSM-Helper out</b>:

### Get All Status Interface Info.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Array 3</b>:

- <b>CSM-Helper out</b>:

### Get CaseFrame Index By CaseName.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CASE</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>index</b>:

- <b>CSM-Helper out</b>:

### Get CaseFrame Reference By CaseName.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CASE</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Frame Refs</b>:

- <b>CSM-Helper out</b>:

### Get Event Structure Num.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>EvtStruNum</b>:

- <b>CSM-Helper out</b>:

### Get Interface Info.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CASE</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Response</b>:

- <b>Array</b>:

- <b>CSM-Helper out</b>:

### Get Internal Data Info.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Array</b>:

- <b>CSM-Helper out</b>:

### Open Block Diagram.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Open Front Panel.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Remove State Frame.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>element</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Save Instrument.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Set Error Tunnel Use Default If not Connected.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Use Default if Unwired</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Set Visible Case Frame.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>element</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Set Wire Label Visible.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Connected Wire.Label.Visible</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper out</b>:

### Start Undo.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Name</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Stop Undo.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Undo.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Read APIs.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Value</b>:

- <b>CSM-Helper out</b>:

### Read Back Tunnel Internal TermRefs.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>element</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Back Tunnels</b>:

- <b>CSM-Helper out</b>:

### Read Back Tunnels Refs.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Back Tunnels</b>:

- <b>CSM-Helper out</b>:

### Read Block Diagram Ref.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Diagram</b>:

- <b>CSM-Helper out</b>:

### Read Case Structure Ref.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Case Structure</b>:

- <b>CSM-Helper out</b>:

### Read Event Structure Ref.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Event Structure</b>:

- <b>CSM-Helper out</b>:

### Read Front Tunnel Internal TermRefs.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>case</b>:

- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Front Tunnels</b>:

- <b>CSM-Helper out</b>:

### Read Front Tunnels Refs.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Front Tunnels</b>:

- <b>CSM-Helper out</b>:

### Read New State Notifier Event State Ref.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>New State Notifier Event State Ref</b>:

- <b>CSM-Helper out</b>:

### Read Paired Tunnels of Case Structure.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Paired Tunnels</b>:

- <b>CSM-Helper out</b>:

### Read Parse State Queue Ref.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Parse State Queue</b>:

- <b>CSM-Helper out</b>:

### Read States.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Value</b>:

- <b>CSM-Helper out</b>:

### Read Timeout Event State Ref.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>New State Notifier Event State Ref</b>:

- <b>CSM-Helper out</b>:

### Read Type.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Part References.Type</b>:

- <b>CSM-Helper out</b>:

### Read User-Defined States.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Array</b>:

- <b>CSM-Helper out</b>:

### Read VI Ref.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>VI</b>:

- <b>CSM-Helper out</b>:

### Read While Loop Ref.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>While Loop</b>:

- <b>CSM-Helper out</b>:

### Add VI Reference Case.vi

-- <b>����ؼ�</b> --
- <b>error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### Remove All CSM Bookmarks.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### standardize CSM Module.vi

-- <b>����ؼ�</b> --
- <b>error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:

### CSM Essential States.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --
- <b>CSM Essential States</b>:

### CSM Module Type.vi

-- <b>����ؼ�</b> --
- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Basic Refs</b>:


-- <b>����ؼ�</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Basic Refs (dup)</b>:

### Is CSM Module - CaseStructure.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CaseStructure</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Is CSM Module?</b>:

- <b>CSM Basic Refs</b>:

### Is CSM Module - EventStructure.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>EventStructure</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Is CSM Module?</b>:

- <b>CSM Basic Refs</b>:

### Is CSM Module - ParseStateVI.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Parse State VI Ref</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Is CSM Module?</b>:

- <b>CSM Basic Refs</b>:

### Is CSM Module - Structure.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Structure</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Is CSM Module?</b>:

- <b>CSM Basic Refs</b>:

### Is CSM Module - VIRef.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>VIRef</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Is CSM Module?</b>:

- <b>CSM Basic Refs</b>:

### Is CSM Module - WhileLoop.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>WhileLoop in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Is CSM Module?</b>:

- <b>CSM Basic Refs</b>:

### Is CSM Module.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### CaseStructure - Add Frame.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Case Name</b>:

- <b>Reference Frame Index</b>:

- <b>CaseStructure in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Add Frame</b>:

- <b>CaseStructure out</b>:

### CaseStructure - Case Name to Group Name.vi

-- <b>����ؼ�</b> --
- <b>element</b>:


-- <b>����ؼ�</b> --
- <b>String</b>:

### CaseStructure - Check If State Exist.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Group Name</b>:

- <b>CaseStructure in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Numeric</b>:

- <b>CaseStructure out</b>:

### CaseStructure - Get Group Seperator Case Index.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Group Name</b>:

- <b>CaseStructure in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Numeric</b>:

- <b>CaseStructure out</b>:

### Diagram - Connect Tunnel with Wire 2.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Wire Indexs</b>:

- <b>Front Tunnels</b>:

- <b>Diagram in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array out</b>:

- <b>Diagram out</b>:

### Diagram - Connect Tunnel with Wire.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>FrontEnd Connected Info</b>:

- <b>Front Tunnels</b>:

- <b>Diagram in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array out</b>:

- <b>Diagram out</b>:

### Diagram - Get All Decoration Refs.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>TopLevelDiagram in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>TextRefs</b>:

- <b>TopLevelDiagram out</b>:

### Diagram - Get All Text Refs.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>TopLevelDiagram in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>TextRefs</b>:

- <b>TopLevelDiagram out</b>:

### PairedTunnels - Connect Wire.vi

-- <b>����ؼ�</b> --
- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>index(-1 for all)</b>:

- <b>PairedTunnels</b>:


-- <b>����ؼ�</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>PairedTunnels</b>:

### Find Event Structure from Case Structure.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CaseStructure</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>EvntStruct Refnum</b>:

### Find Parse State Queue from Case Structure.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CaseStructure</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CaseStructure</b>:

- <b>Parse State Queue</b>:

### Find Parse State Queue from Event Strcture.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>EvntStruct Refnum</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CaseStructure</b>:

- <b>Parse State Queue</b>:

### Find Parse State Queue from While Loop.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>WhileLoop in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CaseStructure</b>:

- <b>Parse State Queue</b>:

- <b>WhileLoop out</b>:

### Terminals - Filter Control Terms.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:


-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Error Terms.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:


-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Indicator Terms.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:


-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Input Term.vi

-- <b>����ؼ�</b> --
- <b>InnerTerminal in</b>:

- <b>Wire.Terms[] in</b>:


-- <b>����ؼ�</b> --
- <b>Wire.Terms[] out</b>:

### Terminals - Filter invalid Terms.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:


-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

### Terminals - Filter Left-Top Term.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:


-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

### Terminals - Left-Top Term.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:


-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

### Terminals - Lower Term.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:


-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

### Terminals - Upper Term.vi

-- <b>����ؼ�</b> --
- <b>Terms[]</b>:


-- <b>����ؼ�</b> --
- <b>Terms[] out</b>:

## Documentation

### CSM - Copyright QuickDrop.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### CSM - Documentation QuickDrop.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### CSM - Keywords QuickDrop.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### CSM Dummy Module.vi

-- <b>����ؼ�</b> --
- <b>Init State("Macro: Initialize")</b>:

- <b>Name("" to use uuid)</b>:


-- <b>����ؼ�</b> --

## CSM Internal

### Naming Check.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Name("" to use uuid)</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters

-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Name(dup)</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters

### Check.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:

- <b>Status</b>:

- <b>Source</b>:

- <b>Target</b>:


-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:

- <b>Response Message Info</b>:

### Delete Source Module.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:

- <b>Source</b>:


-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:

### Delete Target Module.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:

- <b>Source</b>:


-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:

### Initialize.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:


-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:

### List Entries.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:


-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:

- <b>Array</b>:

### List Status in Registry.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:


-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:

- <b>Status</b>:

### Register.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:

- <b>status</b>:

- <b>source</b>:

- <b>api</b>:

- <b>target</b>:


-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:

### Remove Module.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:

- <b>Source</b>:


-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:

### Unregister.vi

-- <b>����ؼ�</b> --
- <b>BroadcastRegistry in</b>:

- <b>Status</b>:

- <b>Source</b>:

- <b>api</b>:

- <b>Target</b>:


-- <b>����ؼ�</b> --
- <b>BroadcastRegistry out</b>:

### Broadcast Item Key.vi

-- <b>����ؼ�</b> --
- <b>status</b>:

- <b>target</b>:

- <b>source</b>:


-- <b>����ؼ�</b> --
- <b>key</b>:

### Preview.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>BroadcastRegistry in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Registry</b>:

- <b>BroadcastRegistry out</b>:

### Remove response API from List.vi

-- <b>����ؼ�</b> --
- <b>API</b>:

- <b>output cluster in</b>:


-- <b>����ؼ�</b> --
- <b>output cluster out</b>:

### Concatenate State with Arguments.vi

-- <b>����ؼ�</b> --
- <b>Arguments</b>:

- <b>State</b>:


-- <b>����ؼ�</b> --
- <b>State with Arguements</b>:

### CSM-Name to CSM-Mode.vi

-- <b>����ؼ�</b> --
- <b>String</b>:


-- <b>����ؼ�</b> --
- <b>ParentCSM Name</b>:

- <b>CSM Mode</b>:

- <b>Requested Name</b>:

### Format Timestamp.vi

-- <b>����ؼ�</b> --
- <b>timestamp</b>:

- <b>format string</b>:


-- <b>����ؼ�</b> --
- <b>String</b>:

### Hex Str to U8 Data.vi

-- <b>����ؼ�</b> --
- <b>HEX String (0-9,A-F)</b>:


-- <b>����ؼ�</b> --
- <b>u8 Data[]</b>:

### Parse Next Single-line State.vi

-- <b>����ؼ�</b> --
- <b>States Queue</b>:


-- <b>����ؼ�</b> --
- <b>Next Single-line State</b>:

- <b>Remaining States Queue</b>:

### Remove Comments from Line.vi

-- <b>����ؼ�</b> --
- <b>single-line text</b>:


-- <b>����ؼ�</b> --
- <b>single-line text without comments</b>:

### Splite Reason String Part.vi

-- <b>����ؼ�</b> --
- <b>Single-line -& Reason</b>:


-- <b>����ؼ�</b> --
- <b>CSM Name</b>:

- <b>`State</b>:

- <b>`Arguments</b>:

### Splite Single-line Message.vi

-- <b>����ؼ�</b> --
- <b>single-line text</b>:


-- <b>����ؼ�</b> --
- <b>operator</b>:

- <b>state</b>:

- <b>args</b>:

- <b>source/target</b>:

### Trim Single line Text.vi

-- <b>����ؼ�</b> --
- <b>single-line text</b>:


-- <b>����ؼ�</b> --
- <b>trimed text</b>:

### U8 Data to Hex Str.vi

-- <b>����ؼ�</b> --
- <b>u8 Data[]</b>:


-- <b>����ؼ�</b> --
- <b>HEX String (0-9,A-F)</b>:

### CSM Critical Error.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Arugments(as Reason)</b>:

- <b>CSM Name</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM No Target Error.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM Not Allowed Message.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>State</b>:

- <b>CSM</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM Target Error.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Arguments(as CSM Name)</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM Target Timeout Error.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Arguments(as CSM Name)</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM Unhandled State Error.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Current State</b>:

- <b>CSM Name</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Cache-Broadcast Registry Search Result.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Name</b>:

- <b>Broadcast state</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array</b>:

### FGV-BroadcastRegistry.vi

-- <b>����ؼ�</b> --
- <b>Source</b>:

- <b>Target</b>:

- <b>Status</b>:

- <b>API</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Operation</b>:


-- <b>����ؼ�</b> --
- <b>response message</b>:

- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### global-Broadcast Cache Change Flag.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### global-CSMQ FGV Change Flag.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### Cache-GEvt Filter Object.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --
- <b>CSM:LogFilter.lvclass</b>:

### FGV-GEvt Filter Obj.vi

-- <b>����ؼ�</b> --
- <b>Set(T)/Get(F)</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Rules-v1</b>:


-- <b>����ؼ�</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM:LogFilter.lvclass</b>:

### FGV-GlobalEventRef.vi

-- <b>����ؼ�</b> --
- <b>Create(F)</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Global Log Event</b>:

### FGV-StatusChangeEventRef.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Name("" to use uuid) in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Status Change Event</b>:

### GEvt-BackgroundThread.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### GEvt-Convert Filter Rules - v1.0.vi

-- <b>����ؼ�</b> --
- <b>Rules-v1</b>:


-- <b>����ؼ�</b> --
- <b>GlobalLogFilter</b>:

### GEvt-Filter Global Log - v1.0.vi

-- <b>����ؼ�</b> --
- <b>Rules-v1</b>:

- <b>Cross CSM Data (in)</b>:


-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:

- <b>Cross CSM Data</b>:

### GEvt-Generate Complete Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:

- <b>event data</b>:

- <b>Enable?</b>:

- <b>CSM:LogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:

### GEvt-Generate Interrupt Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:

- <b>Current State</b>:

- <b>Arguments</b>:

- <b>Name("" to use uuid)</b>:

- <b>CSM:LogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:

- <b>event data</b>:

### GEvt-Generate Module Created Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:

- <b>Name("" to use uuid)</b>:

- <b>Created?</b>:

- <b>CSM:LogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:

- <b>event data</b>:

### GEvt-Generate Module Destroyed Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:

- <b>Name("" to use uuid)</b>:

- <b>Enable?</b>:

- <b>CSM:LogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:

- <b>event data</b>:

### GEvt-Generate Register Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:

- <b>Current State</b>:

- <b>Arguments</b>:

- <b>Name("" to use uuid)</b>:

- <b>CSM:LogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:

- <b>event data</b>:

### GEvt-Generate Remaining States Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:

- <b>Remaining States</b>:

- <b>Name("" to use uuid)</b>:

- <b>Enable?</b>:

- <b>CSM:LogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:

- <b>event data</b>:

### GEvt-Generate State Change Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:

- <b>Current State</b>:

- <b>Arguments</b>:

- <b>Source Message.*State</b>:

- <b>Source Message.*Arguments</b>:

- <b>Source Module</b>:

- <b>Name("" to use uuid)</b>:

- <b>CSM:LogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:

- <b>event data</b>:

### GEvt-Generate Status Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:

- <b>Current State</b>:

- <b>Arguments</b>:

- <b>Name("" to use uuid)</b>:

- <b>CSM:LogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:

- <b>event data</b>:

### GEvt-Generate Unregister Log.vi

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>:

- <b>Current State</b>:

- <b>Arguments</b>:

- <b>Name("" to use uuid)</b>:

- <b>CSM:LogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:

- <b>event data</b>:

### GEvt-Generate with Rule Check.vi

-- <b>����ؼ�</b> --
- <b>LogFilter in</b>:

- <b>event data</b>:

- <b>CSM Global Log Event in</b>:


-- <b>����ؼ�</b> --
- <b>CSM Global Log Event out</b>:

### GEvt-Set Source Filter Rules - v1.0.vi

-- <b>����ؼ�</b> --
- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Rules-v1</b>:


-- <b>����ؼ�</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Gevt-ThreadQueueName.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --
- <b>ThreadQueueName</b>:

### GEvt-WatchdogThread.vi

-- <b>����ؼ�</b> --
- <b>WatchDogQ</b>:


-- <b>����ؼ�</b> --

### global-GEvnt Filter Change Flag.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### Filter Check.vi

-- <b>����ؼ�</b> --
- <b>Cross CSM Data in</b>:

- <b>GlobalLogFilter in</b>:


-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:

- <b>Cross CSM Data out</b>:

- <b>GlobalLogFilter.lvclass (dup)</b>:

### List Rules as Strings.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>GlobalLogFilter in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Rule Strings</b>:

- <b>GlobalLogFilter out</b>:

### CSM Check - LogType.vi

-- <b>����ؼ�</b> --
- <b>Matched Previous?</b>:

- <b>Cross CSM Data (in)</b>:

- <b>GlobalLogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:

- <b>Cross CSM Data</b>:

- <b>GlobalLogFilter.lvclass (dup)</b>:

### CSM Check - State.vi

-- <b>����ؼ�</b> --
- <b>Matched Previous?</b>:

- <b>Cross CSM Data (in)</b>:

- <b>GlobalLogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:

- <b>Cross CSM Data</b>:

- <b>GlobalLogFilter.lvclass (dup)</b>:

### CSM Check - StateType.vi

-- <b>����ؼ�</b> --
- <b>Matched Previous?</b>:

- <b>Cross CSM Data (in)</b>:

- <b>GlobalLogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:

- <b>Cross CSM Data</b>:

- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - CSM.vi

-- <b>����ؼ�</b> --
- <b>Matched Previous?</b>:

- <b>Cross CSM Data (in)</b>:

- <b>GlobalLogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:

- <b>Cross CSM Data</b>:

- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - LogType.vi

-- <b>����ؼ�</b> --
- <b>Matched Previous?</b>:

- <b>Cross CSM Data (in)</b>:

- <b>GlobalLogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:

- <b>Cross CSM Data</b>:

- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - State.vi

-- <b>����ؼ�</b> --
- <b>Matched Previous?</b>:

- <b>Cross CSM Data (in)</b>:

- <b>GlobalLogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:

- <b>Cross CSM Data</b>:

- <b>GlobalLogFilter.lvclass (dup)</b>:

### Group Check - StateType.vi

-- <b>����ؼ�</b> --
- <b>Matched Previous?</b>:

- <b>Cross CSM Data (in)</b>:

- <b>GlobalLogFilter.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>Matched? (dup)</b>:

- <b>Cross CSM Data</b>:

- <b>GlobalLogFilter.lvclass (dup)</b>:

### Set CSM LogType Filter.vi

-- <b>����ؼ�</b> --
- <b>LogType</b>:

- <b>GlobalLogFilter in</b>:


-- <b>����ؼ�</b> --
- <b>GlobalLogFilter out</b>:

### Set CSM State Filter.vi

-- <b>����ؼ�</b> --
- <b>CSM:State</b>:

- <b>GlobalLogFilter in</b>:


-- <b>����ؼ�</b> --
- <b>GlobalLogFilter out</b>:

### Set CSM StateType Filter.vi

-- <b>����ؼ�</b> --
- <b>LogType</b>:

- <b>GlobalLogFilter in</b>:


-- <b>����ؼ�</b> --
- <b>GlobalLogFilter out</b>:

### Set Global CSM Filter.vi

-- <b>����ؼ�</b> --
- <b>Group:CSM</b>:

- <b>GlobalLogFilter in</b>:


-- <b>����ؼ�</b> --
- <b>GlobalLogFilter out</b>:

### Set Global LogType Filter.vi

-- <b>����ؼ�</b> --
- <b>Group:LogType</b>:

- <b>GlobalLogFilter in</b>:


-- <b>����ؼ�</b> --
- <b>GlobalLogFilter out</b>:

### Set Global State Filter.vi

-- <b>����ؼ�</b> --
- <b>Group:State</b>:

- <b>GlobalLogFilter in</b>:


-- <b>����ؼ�</b> --
- <b>GlobalLogFilter out</b>:

### Set Global StateType Filter.vi

-- <b>����ؼ�</b> --
- <b>Group:LogType</b>:

- <b>GlobalLogFilter in</b>:


-- <b>����ؼ�</b> --
- <b>GlobalLogFilter out</b>:

### Log State Type.vi

-- <b>����ؼ�</b> --
- <b>Complete(T)/Start(F)</b>:

- <b>Source Module</b>:

- <b>��State</b>:


-- <b>����ؼ�</b> --
- <b>CSM_GlobalLog_STATE_TYPE</b>:

### Parse Register Message.vi

-- <b>����ؼ�</b> --
- <b>state</b>:

- <b>Module Name </b>:

- <b>args</b>:


-- <b>����ؼ�</b> --
- <b>target</b>:

- <b>source</b>:

- <b>status</b>:

- <b>api</b>:

### Parse State with Arguments String.vi

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>:
The State string that requires the argument.

-- <b>����ؼ�</b> --
- <b>State</b>:

- <b>Arguments</b>:

- <b>Target Module</b>:

- <b>Message Symbol</b>:

### Parse Unregister Message.vi

-- <b>����ؼ�</b> --
- <b>state</b>:

- <b>Module Name </b>:

- <b>args</b>:


-- <b>����ؼ�</b> --
- <b>target</b>:

- <b>source</b>:

- <b>status</b>:

- <b>api</b>:

### Dequeue Element.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>timeout in ms (-1)</b>:

- <b>Priority Queue</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>timed out?</b>:

- <b>Cross JKI State Machine State</b>:

- <b>Priority Queue(dup)</b>:

- <b>High Priority?</b>:

### Enqueue Element.vi

-- <b>����ؼ�</b> --
- <b>High Priority?(F)</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>timeout in ms (-1)</b>:

- <b>Cross JKI State Machine State</b>:

- <b>Priority Queue</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Priority Queue(dup)</b>:

### Get Queue Status.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Priority Queue in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b># pending insert</b>:

- <b># pending remove</b>:

- <b>Priority Queue out</b>:

- <b># elements in queue</b>:

### Not a Refnum.vi

-- <b>����ؼ�</b> --
- <b>Priority Queue.lvclass</b>:


-- <b>����ؼ�</b> --
- <b>NaN/Path/Refnum?</b>:

### Obtain Priority Queue.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>create if not found? (T)</b>:

- <b>name</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>created new?</b>:

- <b>Priority Queue</b>:

### Release Priority Queue.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>force destroy? (F)</b>:

- <b>Priority Queue</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-Async Call.vi

-- <b>����ؼ�</b> --
- <b>state</b>:

- <b>args</b>:

- <b>source/target</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Name</b>:

- <b>Msg Type</b>:


-- <b>����ؼ�</b> --
- <b>state out</b>:

- <b>args out</b>:

- <b>source/target out</b>:

- <b>Pre-State out</b>:

- <b>Pre-Args out</b>:

- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-Broadcast.vi

-- <b>����ؼ�</b> --
- <b>state</b>:

- <b>args</b>:

- <b>source/target</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Name</b>:

- <b>Msg Type</b>:


-- <b>����ؼ�</b> --
- <b>state out</b>:

- <b>args out</b>:

- <b>source/target out</b>:

- <b>Pre-State out</b>:

- <b>Pre-Args out</b>:

- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-PostPostMsg.vi

-- <b>����ؼ�</b> --
- <b>state</b>:

- <b>args</b>:

- <b>source/target</b>:

- <b>Pre-State in</b>:

- <b>Pre-Args in</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>session error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Name</b>:

- <b>Response Arguments</b>:


-- <b>����ؼ�</b> --
- <b>state out</b>:

- <b>args out</b>:

- <b>source/target out</b>:

- <b>Pre-State out</b>:

- <b>Pre-Args out</b>:

- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-PostSendMsg.vi

-- <b>����ؼ�</b> --
- <b>state</b>:

- <b>args</b>:

- <b>source/target</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>session error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Name</b>:

- <b>Response Arguments</b>:


-- <b>����ؼ�</b> --
- <b>state out</b>:

- <b>args out</b>:

- <b>source/target out</b>:

- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-Register Status.vi

-- <b>����ؼ�</b> --
- <b>state</b>:

- <b>args</b>:

- <b>source/target</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Name</b>:


-- <b>����ؼ�</b> --
- <b>state out</b>:

- <b>args out</b>:

- <b>source/target out</b>:

- <b>Pre-State out</b>:

- <b>Pre-Args out</b>:

- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-Sync Call.vi

-- <b>����ؼ�</b> --
- <b>state</b>:

- <b>args</b>:

- <b>source/target</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Response Timeout(5000ms)</b>:

- <b>Module Name</b>:


-- <b>����ؼ�</b> --
- <b>state out</b>:

- <b>args out</b>:

- <b>source/target out</b>:

- <b>Pre-State out</b>:

- <b>Pre-Args out</b>:

- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSMP-Unregister Status.vi

-- <b>����ؼ�</b> --
- <b>state</b>:

- <b>args</b>:

- <b>source/target</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Name</b>:


-- <b>����ؼ�</b> --
- <b>state out</b>:

- <b>args out</b>:

- <b>source/target out</b>:

- <b>Pre-State out</b>:

- <b>Pre-Args out</b>:

- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Add VI Reference Case to CSMs.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### CSM - Debug Console - DebugTool.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### CSM - Remove all CSM Bookmarks.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### CSM - Running Log - DebugTool.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### CSM - State Dashboard - DebugTool.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### CSM - State Table - DebugTool.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### CSM - Switch Language Tool.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### Script - JKISM to CSM.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### Autosize All MultiListbox Columns (Uniform Text).vi

-- <b>����ؼ�</b> --
- <b>IngoreCols(Empty as default)</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array</b>:

- <b>Control in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Dashboard Cell Resize.vi

-- <b>����ؼ�</b> --
- <b>Cluster</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Cluster Size:Height</b>:

- <b>Cluster Size:Width</b>:

- <b>����ѹ��P4 4</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Bounds:Area Height</b>:

- <b>Bounds:Area Width</b>:

### Dashboard Cell2 Array Resize.vi

-- <b>����ؼ�</b> --
- <b>Num Columns</b>:

- <b>Cluster</b>:

- <b>Num Rows</b>:

- <b>error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>area height</b>:

- <b>area width</b>:

- <b>Array 2</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Open CSM BD.vi

-- <b>����ؼ�</b> --
- <b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Open CSM FP.vi

-- <b>����ؼ�</b> --
- <b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Select Greater_nevstop.vi

-- <b>����ؼ�</b> --
- <b>A</b>:

- <b>B</b>:


-- <b>����ؼ�</b> --
- <b>lesser</b>:

### CSM - Start File Logger.vi

-- <b>����ؼ�</b> --
- <b>Filter Rules</b>:

- <b>Timestamp format</b>:

- <b>Enable? (T)</b>:

- <b>log limit</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>WatchDog? (T)</b>:

- <b>Exit When All Module Exist?(F)</b>:

- <b>Log File Path</b>:


-- <b>����ؼ�</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>LogFile</b>:

- <b>WatchDogQueue</b>:

### CSM-Logger-Thread.vi

-- <b>����ؼ�</b> --
- <b>log limit</b>:

- <b>Exit When All Module Exist?(F)</b>:

- <b>format string</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>WatchDogQ</b>:

- <b>GlobalLogFilter.lvclass</b>:

- <b>file path (use dialog)</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### Append Application Directory If Relative.vi

-- <b>����ؼ�</b> --
- <b>Relative path (.)</b>:


-- <b>����ؼ�</b> --
- <b>Application Directory (+ Relative)</b>:

### Convert File Extension (Path)__ogtk.vi

-- <b>����ؼ�</b> --
- <b>new ending (none)</b>:

- <b>file name</b>:


-- <b>����ؼ�</b> --
- <b>prev ending</b>:

- <b>new filename</b>:

### Convert File Extension (String)__ogtk.vi

-- <b>����ؼ�</b> --
- <b>new ending (none)</b>:

- <b>file name</b>:


-- <b>����ؼ�</b> --
- <b>prev ending</b>:

- <b>new filename</b>:

### CSMLS - Add Exit State(s) with Loop Check.vi

-- <b>����ؼ�</b> --
- <b>States Out in</b>:

- <b>Remaining States</b>:


-- <b>����ؼ�</b> --
- <b>States Out out</b>:

### CSMLS - Append Continuous State.vi

-- <b>����ؼ�</b> --
- <b>Loop State(s) and Arguments</b>:
 This allows you to place new states in the front of the state machine queue. The default is an empty string.
- <b>Append(T)</b>:

- <b>Continous Arguments ("")</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Continous State</b>:
The State string that requires the argument.
- <b>Remaining States</b>:


-- <b>����ؼ�</b> --
- <b>States Out</b>:

### CSMLS - Define Loop State(s).vi

-- <b>����ؼ�</b> --
- <b>States Out in</b>:

- <b>Remaining States</b>:


-- <b>����ؼ�</b> --
- <b>States Out out</b>:

### CSMLS - Remove Loop Tag and previous State(s) to Break.vi

-- <b>����ؼ�</b> --
- <b>Remaining States</b>:


-- <b>����ؼ�</b> --
- <b>States</b>:

### CSMLS - Remove Loop Tag to Break.vi

-- <b>����ؼ�</b> --
- <b>Remaining States</b>:


-- <b>����ؼ�</b> --
- <b>States</b>:

### CSM - Start Watchdog to Ensure All Modules Exit.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
The <B>error in</B> cluster can accept error information wired from VIs previously called.  Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.

-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.


## Unsorted

### CSM Watchdog Thread.vi

-- <b>����ؼ�</b> --
- <b>WatchdogQ</b>:


-- <b>����ؼ�</b> --

### CSM - Break Down Multiple States String.vi

-- <b>����ؼ�</b> --
- <b>States</b>:


-- <b>����ؼ�</b> --
- <b>Multiple States</b>:

### CSM - Build Exit Messages of CSMs.vi

-- <b>����ؼ�</b> --
- <b>State with Arguments("Macro: Exit��)</b>:

- <b>CSMs</b>:


-- <b>����ؼ�</b> --
- <b>States</b>:

### CSM - Check Mapping Relastionship in Broadcast Registry.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Name</b>:

- <b>Broadcast state</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array</b>:

### CSM - Check Status Registration.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Name</b>:

- <b>Broadcast state</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array</b>:

### CSM - Convert Argument to Error.vi

-- <b>����ؼ�</b> --
- <b>Argument</b>:


-- <b>����ؼ�</b> --
- <b>error</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Convert Error to Argument.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>����ؼ�</b> --
- <b>Arguments</b>:

### CSM - Convert Filter Rules.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### CSM - Filter Duplicate Messages By Name.vi

-- <b>����ؼ�</b> --
- <b>Whole Messages in Check?(T)</b>:

- <b>States</b>:


-- <b>����ؼ�</b> --
- <b>States out</b>:

### CSM - Filter Global Log.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### CSM - Filter Messages to Non-Existing Modules.vi

-- <b>����ؼ�</b> --
- <b>State(s) in ("")</b>:
Wire the existing states to this input. The default is an empty string.

-- <b>����ؼ�</b> --
- <b>States Out</b>:
This output returns a concatenation of all the inputs seperated by a line feed character. The line feed character is required by the JKI State Machine.

### CSM - Flood of Events Handler Side Loop.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### CSM - Forward States to CSM.vi

-- <b>����ؼ�</b> --
- <b>High Priority(T)</b>:

- <b>Module Name</b>:
Returns any argument(s) that may be used in the current state string. These arguments come after the ">>" characters
- <b>Error In (no error)</b>:
The error cluster from the JKI State Machine is wired to this input. If an error occures and appears on this input, the current state output returns the "Error Handler" state.
- <b>State(s) in ("")</b>:
Wire the existing states to this input. The default is an empty string.

-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Forward UI Operations to CSM.vi

-- <b>����ؼ�</b> --
- <b>Name("" to use uuid)</b>:

- <b>State(s) in ("")</b>:


-- <b>����ؼ�</b> --
- <b>States Out</b>:

### CSM - Global Log Error Handler.vi

-- <b>����ؼ�</b> --
- <b>Clear Error(T)</b>:

- <b>Place("" to use VI's Name)</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Keywords.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --
- <b>%[hex] Code</b>:

- <b>Source</b>:

### CSM - List All Status Registration.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array</b>:

### CSM - List Log Filter Rules As Strings.vi

-- <b>����ؼ�</b> --
- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>����ؼ�</b> --
- <b>error out</b>:
The <B>error out</B> cluster passes error or warning information out of a VI to be used by other VIs.

The pop-up option <B>Explain Error</B> (or Explain Warning) gives more information about the error displayed.
- <b>Rule Strings</b>:

### CSM - List Mapping Relationships in Broadcast Registry.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Array</b>:

### CSM - List Rules in Broadcast Registry.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Entries</b>:

### CSM - List Status in Broadcast Registry.vi

-- <b>����ؼ�</b> --
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Status in Registry</b>:

### CSM - Mark As Chain Module.vi

-- <b>����ؼ�</b> --
- <b>Order</b>:

- <b>CSM Name</b>:


-- <b>����ؼ�</b> --
- <b>CSM Name(marked as Chain)</b>:

### CSM - Module Exit Event.vi

-- <b>����ؼ�</b> --
- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Name("" to use uuid) in</b>:


-- <b>����ؼ�</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Exit Event</b>:

### CSM - Module VI Reference.vi

-- <b>����ؼ�</b> --
- <b>Response Timeout(5000ms)</b>:

- <b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM Module VIRef</b>:

### CSM - Remove Duplicated Following Messages.vi

-- <b>����ؼ�</b> --
- <b>Current State</b>:

- <b>Remaining States</b>:


-- <b>����ؼ�</b> --
- <b>Remaining States Left</b>:

### CSM - Remove Module in Boradcast Registry.vi

-- <b>����ؼ�</b> --
- <b>CSM Name</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>����ؼ�</b> --
- <b>CSM Name(dup)</b>:

- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Replace Substitution Marks in Messages.vi

-- <b>����ؼ�</b> --
- <b>States with Replace Token</b>:

- <b><param></b>:

- <b><target></b>:

- <b><1></b>:

- <b><2></b>:


-- <b>����ؼ�</b> --
- <b>States</b>:

### CSM - Run Script.vi

-- <b>����ؼ�</b> --
- <b>single-line text</b>:

- <b>Current Module("" to generate a ID)</b>:
The Argument string to add to the state. The default is an empty string. If Argument is an empty string then State will be returned to the output.
- <b>Continue If Error?(F)</b>:

- <b>Wait(5000ms)</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Response Timeout(5000ms)</b>:


-- <b>����ؼ�</b> --
- <b>States Left</b>:

- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM - Set Log Filter Rules.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --



### CSM - Wait for All Modules to be Alive.vi

-- <b>����ؼ�</b> --
- <b>Timeout(5000ms)</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Names (in)</b>:


-- <b>����ؼ�</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>waited(ms)</b>:

- <b>Left Modules</b>:

### CSM - Wait for All Modules to Exit.vi

-- <b>����ؼ�</b> --
- <b>Timeout(5000ms)</b>:

- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Module Names (in)</b>:


-- <b>����ؼ�</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>waited(ms)</b>:

- <b>Left Modules</b>:

### CSM - Wait for Module to Be Alive.vi

-- <b>����ؼ�</b> --
- <b>Target Module</b>:

- <b>Wait(5000ms)</b>:

- <b>error in (no error)</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

-- <b>����ؼ�</b> --
- <b>Target Module (dup)</b>:

- <b>Waited(ms)</b>:

- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.

### CSM Data Type String to Enum.vi

-- <b>����ؼ�</b> --


-- <b>����ؼ�</b> --

### CSM Data Type String.vi

-- <b>����ؼ�</b> --
- <b>Data</b>:


-- <b>����ؼ�</b> --
- <b>Data Type String</b>:

### Replace Tag with Array.vi

-- <b>����ؼ�</b> --
- <b>Error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>Enum</b>:

- <b>replace string</b>:

- <b>single-line text</b>:


-- <b>����ؼ�</b> --
- <b>Error out</b>:
- <B>error out</B> passes error or warning information out of a VI to be used by other VIs.

Right-click the <B>error out</B> indicator on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>States</b>:

### CSM Data Type String to Enum(RefnumEnum).vi

-- <b>����ؼ�</b> --
- <b>Data Type String</b>:


-- <b>����ؼ�</b> --
- <b>Array Dim</b>:

- <b>Secondary Type</b>:

- <b>Primary Type</b>:

### CSM Data Type String to Enum(String).vi

-- <b>����ؼ�</b> --
- <b>Data Type String</b>:


-- <b>����ؼ�</b> --
- <b>Array Dim</b>:

- <b>Secondary Type String</b>:

- <b>Primary Type</b>:

### CSM Data Type String to Enum(TypeEnum).vi

-- <b>����ؼ�</b> --
- <b>Data Type String</b>:


-- <b>����ؼ�</b> --
- <b>Array Dim</b>:

- <b>Secondary Type</b>:

- <b>Primary Type</b>:

### CSM-Helper usecase Template.vit
-- <b>����ؼ�</b> --
- <b>error in</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper in</b>:


-- <b>����ؼ�</b> --
- <b>error out</b>:
- <B>error in</B> can accept error information wired from VIs previously called. Use this information to decide if any functionality should be bypassed in the event of errors from other VIs.

Right-click the <B>error in</B> control on the front panel and select <B>Explain Error</B> or <B>Explain Warning</B> from the shortcut menu for more information about the error.
- <b>CSM-Helper out</b>:
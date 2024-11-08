# CSM API

## ���Ĺ���(Core Functions)

> [!NOTE] CSM ��Ϣ��ʽ����
> [CSM ��Ϣ�ַ���(CSM Message)] >> [����(Arguments)] [��Ϣ���ͷ���(Message Symbol) ->|,->,-@] [Ŀ��ģ��(Target Module)] // [ע��(Comments)]
> - CSM ��Ϣ�ַ���(CSM Message): CSM����Ϣ�������԰���CSM�ؼ��ֺͻ��з�
> - ">>": CSM ��Ϣ�ַ���(CSM Message) �� ����(Arguments) �ķָ���
> - ����(Arguments): CSM ��Ϣ�Ĳ����������԰���CSM�ؼ��ֺͻ��з�
> - ��Ϣ���ͷ���(Message Symbol): ��Ϣ���ͷ��ţ����ڱ�ʶ��Ϣ���ͣ�����ͬ������(-@)���첽����(->)���첽���ȴ�����(->|)��
> - Ŀ��ģ��(Target Module): ��Ϣ���͵�Ŀ��ģ�飬���Ϊ�գ����ʾ��Ϣ�ᱻ��ģ�鴦��Ϊ��ʱ����Ϣ���ͷ���Ҳ���ܴ���
> - ע��(Comments): ע����Ϣ�����ᱻ����

> [!NOTE] CSM ������Ϣ��ʽ����
> [CSM �����ַ���(CSM Operation)] >> [����(Arguments)] -> <[��������(operation)]> // [ע��(Comments)]
> TODO

### Parse State Queue++.vi

���� CSM ״̬���У����ؽ�ִ�е���һ����ǰ״̬����������Ϣ��

-- <b>����ؼ�</b> --
- <b>State Queue</b>: ����״̬���б����ӵ������롣��Ӧ������ CSM ����λ�Ĵ�����
- <b>Previous Error</b>: ���� CSM �Ĵ���ر����ӵ������롣����������󲢳����ڴ������ϣ���ǰ״̬��������� "Error Handler" ״̬��
- <b>Name("" to use uuid)</b>: CSM ģ������
- <b>Response Timeout(5000ms)</b>:ͬ������ʱ����Ӧ��ʱ���ã�Ĭ�� 5000 ms.
- <b>Dequeue Timeout(0ms)</b>: ��� CSM ��Ϣ���еĳ�ʱ���ã�Ĭ��Ϊ0�������еȴ���
- <b>Response Arguments</b>: ������һ��״̬����Ӧ��������Ӧ�������� CSM ����λ�Ĵ��������ڴ����ⲿ���õķ���ֵ��

-- <b>����ؼ�</b> --
- <b>Remaining States</b>:  ƴ�Ӻ������״̬������
- <b>Arguments</b>: ���ؿ����ڵ�ǰ״̬�ַ�����ʹ�õ��κβ�������Щ����λ�ڡ�>>���ַ�֮��<b>ע�⣺</b>�����������ð����κβ��ɴ�ӡ���ַ������绻�з���س�����
- <b>Current State</b>: ��ִ�е���һ����ǰ״̬
- <b>Name Used</b>: �������CSMģ���ʵ������
- <b>Argument - State</b>: ����� CSM ���������״̬���˲�����ʾ��״̬��ǰ״̬
- <b>From Who</b>: ���<b>Current State</b> �����ⲿ���͵ģ�������ԴCSMģ�����ơ�

### Build State String with Arguments++.vi

�� VI ���ڹ��� CSM ��Ϣ�ַ���(����״̬��������Ŀ��ģ�顢��Ϣ���͵���Ϣ)���Ա㷢�͵����� CSM ģ�顣

> [!NOTE]
> �� VI ֻ�ܲ���ƴ��"�첽���ȴ�����"���첽��Ϣ�����ں���������أ�����ʹ�� Build Message with Arguments++.vi ����� VI��

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
- <b>CSM Message String</b>: ƴ�����ɵ� CSM ��Ϣ�ַ���

### Build Message with Arguments++.vi

�� VI ���ڹ��� CSM ��Ϣ�ַ����������ַ�����

> [!NOTE] ��Ϣƴ��API
> ������API����ֱ�ӷ�����Ϣ��ֻ��ƴ����Ϣ�ַ�������Ҫ���ַ������� CSM ��״̬���к��� Parse State Queue++.vi �з�����Ϣ��ִ�в�����
> ����Ϥ CSM ���������£����Բ�ʹ�ô���API, ֱ�����ַ����м����Ӧ����Ϣ�ַ����������ַ�����

> [!NOTE] ��̬VI(Polymorphic VI)ѡ��:
> - Build Message with Arguments(Auto Check).vi
> - Build Asynchronous Message with Arguments.vi
> - Build No-Reply Asynchronous Message with Arguments.vi
> - Build Synchronous Message with Arguments.vi
> - Build Interrupt Status Message.vi
> - Build Normal Status Message.vi
> - Build Register Status Message.vi
> - Build Unregister Status Message.vi
> - CSM - Replace Substitution Marks in Messages.vi

#### Build Message with Arguments(Auto Check).vi

ƴ������ CSM ��Ϣ�ַ���, ��Ϣ�����ͷ��Ż��������� <b>State with Arguments</b> �Զ���⡣

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: CSM ״̬�ַ��������԰���������Ŀ��ģ����Ϣ��
- <b>Arguments ("")</b>: ������Ϣ��<b>State with Arguments</b>�а����Ĳ������ᱻ�滻��
- <b>Target Module ("")</b>: Ŀ��ģ�顣Ϊ��ʱ, ��ʹ�� <b>State with Arguments</b> �е�Ĭ��ģ�顣

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>: ƴ�����ɵ� CSM ��Ϣ�ַ���

#### Build Synchronous Message with Arguments.vi

ƴ������ CSM ͬ����Ϣ�ַ�������Ϣ���ͷ���Ϊ "-@", ����:

      Message >> Arguments -@ Target

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: CSM ״̬�ַ�����
- <b>Arguments ("")</b>: ������Ϣ��<b>State with Arguments</b>�а����Ĳ������ᱻ�滻��
- <b>Target Module ("")</b>: Ŀ��ģ�顣Ϊ��ʱ, ��ʹ�� <b>State with Arguments</b> �е�Ĭ��ģ�顣

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>: ƴ�����ɵ� CSM ��Ϣ�ַ���

#### Build Asynchronous Message with Arguments.vi

ƴ�����ɵ� CSM �첽��Ϣ�ַ�������Ϣ���ͷ���Ϊ "->", ����:

      Message >> Arguments -> Target

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: CSM ״̬�ַ�����
- <b>Arguments ("")</b>: ������Ϣ��<b>State with Arguments</b>�а����Ĳ������ᱻ�滻��
- <b>Target Module ("")</b>: Ŀ��ģ�顣Ϊ��ʱ, ��ʹ�� <b>State with Arguments</b> �е�Ĭ��ģ�顣

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>: ƴ�����ɵ� CSM ��Ϣ�ַ���

#### Build No-Reply Asynchronous Message with Arguments.vi

ƴ�����ɵ� CSM �첽��Ϣ�ַ�������Ϣ���ͷ���Ϊ "->|", ����:

      Message >> Arguments ->| Target

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: CSM ״̬�ַ�����
- <b>Arguments ("")</b>: ������Ϣ��<b>State with Arguments</b>�а����Ĳ������ᱻ�滻��
- <b>Target Module ("")</b>: Ŀ��ģ�顣Ϊ��ʱ, ��ʹ�� <b>State with Arguments</b> �е�Ĭ��ģ�顣

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>: ƴ�����ɵ� CSM ��Ϣ�ַ���

#### Build Normal Status Message.vi

ƴ����ͨ״̬��Ϣ�ַ�������Ϣ��ʽ����:

      Status >> Arguments -><status>
      //�����ַ���Ϊ��Ч������ֻ��Ϊ�˸����׼�����䣬�����˸���Ĳ����ַ�
      Status >> Arguments -><broadcast>
      Status >> Arguments -><all>

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: CSM ��ͨ״̬��Ϣ�ַ�����
- <b>Arguments ("")</b>: ������Ϣ��<b>State with Arguments</b>�а����Ĳ������ᱻ�滻��

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>:ƴ�����ɵ� CSM ��Ϣ�ַ���

#### Build Interrupt Status Message.vi

ƴ���ж�״̬��Ϣ����Ϣ��ʽ����:

      Status >> Arguments -><interrupt>

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>State with Arguments</b>: CSM �ж�״̬��Ϣ�ַ�����
- <b>Arguments ("")</b>: ������Ϣ��<b>State with Arguments</b>�а����Ĳ������ᱻ�滻��

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>:ƴ�����ɵ� CSM ��Ϣ�ַ���

#### Build Register Status Message.vi

ƴ��ע��״̬������Ϣ�ַ�������Ϣ��ʽ����:

      //[source-state]@[source-module] >> [response-message]@[response-module] -><register>
      status @ Source >> API @ Target -><register>

����: ����������ģ������������Ϣ���󶨵�������ģ��Ŀ�ʼ����API

      //������ģ������������Ϣ���󶨵�������ģ��Ŀ�ʼ����API
      DownloadFinished@Downloader >> StartPlay@Player -><register>
      //��������ģ����ִ����Ϣʱ��Player ��ȱʡ
      DownloadFinished@Downloader >> StartPlay -><register>
      //���ж��ģ�鶼�����������Ϣ������ʹ�� * ��ʾ����ģ�����Ϣ���󶨵�������ģ��Ŀ�ʼ����API
      DownloadFinished@* >> StartPlay@Player -><register>

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>Target CSM</b>: ����״̬�� CSM ģ������
- <b>Source CSM(* as Default)</b>: ����״̬�� CSM ģ������
- <b>Status</b>: ע���״̬
- <b>API (if "", same as Status)</b>: ����״̬ģ����Ӧ�� API ����

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>:ƴ�����ɵ� CSM ��Ϣ�ַ���

#### Build Unregister Status Message.vi

ƴ��ȡ��ע��״̬������Ϣ�ַ�������Ϣ��ʽ���£�

      //[source-state]@[source-module] >> [response-message]@[response-module] -><unregister>
      status @ Source >> API @ Target -><unregister>

������ ȡ��������ģ������������Ϣ���󶨵�������ģ��Ŀ�ʼ����API

      //������ģ������������Ϣ���󶨵�������ģ��Ŀ�ʼ����API
      DownloadFinished@Downloader >> StartPlay@Player -><unregister>
      //��������ģ����ִ����Ϣʱ��Player ��ȱʡ
      DownloadFinished@Downloader >> StartPlay -><unregister>

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>Target CSM</b>: ����״̬�� CSM ģ������
- <b>Source CSM(* as Default)</b>: ����״̬�� CSM ģ������
- <b>Status</b>: ע���״̬

-- <b>����ؼ�</b> --
- <b>CSM Message String</b>:ƴ�����ɵ� CSM ��Ϣ�ַ���

#### CSM - Replace Substitution Marks in Messages.vi

Ϊ���ܹ������ı༭���� CSM ��Ϣ�ַ������ṩ�����滻��ǵĹ��ܡ���4����ǿ����滻��
- <param> ��ǣ� ͨ����ʾ��ͬ�Ĳ���
- <target> ��ǣ� ͨ����ʾ��ͬ��Ŀ��
- <1> ��ǣ���ʾ�Զ�����1
- <2> ��ǣ���ʾ�Զ�����2

���磺���߶� <target> �������ַ���Ϊ "DAQDevice"��<b>States with Replace Token</b> �ַ���Ϊ��

      ``` text
      Initialize -@ <target>
      Configure -@ <target>
      Read -@ <target>
      Close -@ <target>
      ```

<b>States</b>���Ϊ��

      ``` text
      Initialize -@ DAQDevice
      Configure -@ DAQDevice
      Read -@ DAQDevice
      Close -@ DAQDevice
      ```

> Ref: ��Ϣƴ��API

-- <b>����ؼ�</b> --
- <b>States with Replace Token</b>: �����滻��ǵ� CSM ״̬�ַ���
- <b><param></b>: <param> ��ǣ� ͨ����ʾ��ͬ�Ĳ���
- <b><target></b>: <target> ��ǣ� ͨ����ʾ��ͬ��Ŀ��
- <b><1></b>: �Զ�����1
- <b><2></b>: �Զ�����2

-- <b>����ؼ�</b> --
- <b>States</b>: �滻��

### CSM - Broadcast Status Change.vi

��ϵͳ�㲥״̬���ġ���ע��״̬�� CSM ģ�齫���յ�״̬���ġ����磺

      //�㲥״̬����
      Status >> Arguments -><broadcast>

> [!NOTE] CSM ��״̬���в���API
> ������ API ����ֱ�ӷ�����Ϣ��ֻ��ƴ����Ϣ�ַ������� Parse State Queue++.vi �з�����Ϣ��ִ�в�����
> �� ��Ϣƴ��API ��ͬ���ǣ����� API ����� CSM ��״̬�����ַ����������룬�൱����״̬�����в�����Ϣ��

-- <b>����ؼ�</b> --
- <b>Status with Arguments</b>: �����㲥��״̬��������֧�ֶ���, ÿ��״̬��������� "-><broadcast>"
- <b>State Queue("")</b>: ����״̬���б����ӵ�������
- <b>Broadcast(T)</b>: �����Ƿ�㲥�Ŀ�������

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ƴ�Ӻ������״̬��������

### Add State(s) to Queue By BOOL++.vi

�� CSM ��Ϣ�ַ������� CSM ��Ϣ�����С��ṩ�� TRUE/FALSE ����״̬���ַ���ѡ��ܹ�����ʹ�������ṹ����ߴ���ɶ��ԣ���߱��Ч�ʡ�

> Ref: CSM ��״̬���в���API

> [!NOTE] ��̬VI(Polymorphic VI)ѡ��:
> - add State(s) to Queue By BOOL(Element).vi
> - add State(s) to Queue By BOOL(Array Left).vi
> - add State(s) to Queue By BOOL(Array Right).vi
> - add State(s) to Queue By BOOL(Array All).vi

#### Add State(s) to Queue By BOOL(Element).vi

�� CSM ��Ϣ�ַ������� CSM ��Ϣ�����С��ṩ�� TRUE/FALSE ����״̬���ַ���ѡ��ܹ�����ʹ�������ṹ����ߴ���ɶ��ԣ���߱��Ч�ʡ�

> Ref: CSM ��״̬���в���API

-- <b>����ؼ�</b> --
- <b>State Queue("")</b>: ����״̬���б����ӵ�������
- <b>TRUE("")</b>: <b>Condition</b> Ϊ True ʱ�����״̬�ַ���
- <b>FALSE("")</b>: <b>Condition</b> Ϊ False ʱ�����״̬�ַ���
- <b>Condition</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
- <b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>��ǰ�ˡ����ΪFalse���������ӵ�β����

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ƴ�Ӻ������״̬��������

#### Add State(s) to Queue By BOOL(Array Left).vi

�� CSM ��Ϣ�ַ������� CSM ��Ϣ�����С��ṩ�� TRUE/FALSE ����״̬���ַ���ѡ��ܹ�����ʹ�������ṹ����ߴ���ɶ��ԣ���߱��Ч�ʡ�

> Ref: CSM ��״̬���в���API

-- <b>����ؼ�</b> --
- <b>State Queue("")</b>: ����״̬���б����ӵ�������
- <b>TRUE("")</b>: <b>Condition</b> Ϊ True ʱ�����״̬�ַ���
- <b>FALSE("")</b>: <b>Condition</b> Ϊ False ʱ�����״̬�ַ���
- <b>Condition</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
- <b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>��ǰ�ˡ����ΪFalse���������ӵ�β����

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ƴ�Ӻ������״̬��������

#### Add State(s) to Queue By BOOL(Array Right).vi

�� CSM ��Ϣ�ַ������� CSM ��Ϣ�����С��ṩ�� TRUE/FALSE ����״̬���ַ���ѡ��ܹ�����ʹ�������ṹ����ߴ���ɶ��ԣ���߱��Ч�ʡ�

> Ref: CSM ��״̬���в���API

-- <b>����ؼ�</b> --
- <b>State Queue("")</b>: ����״̬���б����ӵ�������
- <b>TRUE("")</b>: <b>Condition</b> Ϊ True ʱ�����״̬�ַ���
- <b>FALSE("")</b>: <b>Condition</b> Ϊ False ʱ�����״̬�ַ���
- <b>Condition</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
- <b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>��ǰ�ˡ����ΪFalse���������ӵ�β����

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ƴ�Ӻ������״̬��������

#### Add State(s) to Queue By BOOL(Array All).vi

���ݸ����ȼ���Bool���룬��VI����TRUE/False��ʣ��״̬������״̬��
High Priority��������Ƿ���ʣ��״̬֮ǰ��֮������TRUE��False�ַ�����
Bool�������Ҫ���ӵ��ַ�����TRUE����False��

> Ref: CSM ��״̬���в���API

-- <b>����ؼ�</b> --
- <b>State Queue("")</b>: ����״̬���б����ӵ�������
- <b>TRUE("")</b>: <b>Condition</b> Ϊ True ʱ�����״̬�ַ���
- <b>FALSE("")</b>: <b>Condition</b> Ϊ False ʱ�����״̬�ַ���
- <b>Condition</b>: ѡ�����ӵ�TRUE�ն˻�False�ն˵�״̬�ַ����ı�־��
- <b>High Priority(FALSE)</b>: ���ΪTrue��״̬�������뵽<b>State Queue("")</b>��ǰ�ˡ����ΪFalse���������ӵ�β����

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ƴ�Ӻ������״̬��������

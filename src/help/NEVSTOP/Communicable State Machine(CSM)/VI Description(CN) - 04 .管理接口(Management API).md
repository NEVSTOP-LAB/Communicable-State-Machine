# CSM API

## ����ӿ�(Management API)

> [!NOTE] CSM ����ģʽ
> 1. Stand-alone: ��������ģʽ��������ģ�����ƣ����Զ�����һ�����ID, ���ڱ�ʶģ�顣
> 2. CSM: ��ͨ CSM ģ�顣
> 3. Action Worker: ������ģʽ����ģ�����ƺ���ӡ�#�����Ա�Ǵ�ģ��Ϊ�����ߣ����������ͬ���Ƶ����������߹�����ͬ����Ϣ���С�
> 4. Chain Node: ��ʽ�ڵ㡣��ģ�����ƺ���ӡ�$�����Ա�Ǵ�ģ��Ϊ��ʽ�ڵ㣬ͬһ�����ϵ���Ϣ�������δ��ݣ�ֱ��ĳ���ڵ㴦����Ϣ��

### CSM - Start Async Call.vi

�첽����ģ������VIƬ��

### CSM - Synchronized Call.vi

ͬ������ģ������VIƬ��

### CSM - Module VI Reference.vi

ͨ�� ���� "VI Reference" ͬ����Ϣ����ѯ��ȡ CSM ģ��� VI ���á�

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������
- <b>Current Module("" to generate a ID)</b>: ��ѯCSMģ��ı��, Ϊ��ʱ��������һ��Ψһ��ID
- <b>Response Timeout(5000ms)</b>: ͬ����Ϣ��ʱʱ�䣬Ĭ�� 5000 ms

-- <b>����ؼ�</b> --
- <b>CSM Module VIRef</b>: CSM ģ��� VI ����

### CSM - Check If Module Exists.vi

��� CSM ģ���Ƿ����

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������

-- <b>����ؼ�</b> --
- <b>Exist?</b>: ����ģʽ�Ƿ����
- <b>CSM Name(dup)</b>: ���� <b>CSM Name</b>

### CSM - List Modules.vi

�г����л��CSMģ�顣

> Ref: CSM ����ģʽ

-- <b>����ؼ�</b> --
- <b>Exclude Standalone CSM(T)</b>: �Ƿ������������ģʽ��ģ��

-- <b>����ؼ�</b> --
- <b>Module Names</b>: CSM ģ�������б�

### CSM - Module Status.vi

��ȡCSMģ���״̬������������ģʽ����������������Ϣ�����еĴ�������Ϣ������

> Ref: CSM ����ģʽ

-- <b>����ؼ�</b> --
- <b>CSM Name</b>: CSM ģ������.

-- <b>����ؼ�</b> --
- <b>Mode</b>: ����ģ��Ĺ���ģʽ
- <b>#As Worker</b>: ������ģʽ�£���ģ��Ĺ���������
- <b>#msg to be processed</b>: CSM��Ϣ�����еĴ�������Ϣ����
- <b>CSM Name(dup)</b>: ���� <b>CSM Name</b>

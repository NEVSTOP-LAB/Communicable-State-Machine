# CSM API

## ȫ����־(Global Log)

> [!NOTE] CSM ȫ����־����
> CSM ȫ����־���ܣ����ڼ�¼ȫ��״̬�����¼������ڵ��ԡ���صȳ�����
>
> ���Լ�¼����Ϣ������
> 1. CSM ״̬����״̬�޸�
> 2. CSM ģ������ϢͨѶ���������ݷ���
> 3. CSM ģ���״̬����
> 4. CSM ģ��Ĵ���������
> 5. CSM ģ���״̬���ĺ�ȡ������
> 6. CSM ģ�鴦��Ĵ�����Ϣ
> 7. �û��Զ����¼�
>
> ���Թ�����Ҫ����ȫ����־����API���п������û����Ը����Լ�����Ҫ���������Թ��ߡ�

### CSM - Global Log Event.vi

��ȡ CSM ȫ��״̬�û��¼����

> Ref: CSM ȫ����־����

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>: CSM ȫ��״̬�û��¼����

### CSM - Destroy Global Log Event.vi

�ͷ� CSM ȫ��״̬�û��¼����

> Ref: CSM ȫ����־����

-- <b>����ؼ�</b> --
- <b>CSM Global Log Event</b>: CSM ȫ��״̬�û��¼����

### CSM - Generate User Global Log.vi

�����û�ȫ���¼�����;���Եȳ�����

-- <b>����ؼ�</b> --
- <b>Log</b>: �¼�����
- <b>Arguments</b>: �¼�����
- <b>From Who</b>: ��Դ
- <b>ModuleName</b>: ģ������

### CSM - Global Log Error Handler.vi

CSM ��������������������󣬴�����Ϣ��ͨ�� CSM Global log �������ڵ��Թ��ߡ���̨ log ��¼�ж��ܼ�¼��

-- <b>����ؼ�</b> --
- <b>Place("" to use VI's Name)</b>: ��Ƿ�������ĵص�
- <b>Clear Error(T)</b>: �Ƿ��������Ĭ�����

### CSM - Set Log Filter Rules.vi

����ȫ�ֵĹ��˹����������Ӧ���ڷ���Դͷ���� log ������˹���ʱ����������Դͷ�����ͣ�����κι���Ҳ�������ټ�⵽��� log ��¼��

### CSM - List Log Filter Rules As Strings.vi

�г�ȫ�ֵĹ��˹���

-- <b>����ؼ�</b> --
- <b>Rule Strings</b>: ���˹����ַ���

### CSM - Convert Filter Rules.vi

�����˹�����б�ת��Ϊ���˹�����ʵ����

### CSM - Filter Global Log.vi

���ݹ����ж��Ƿ�log�����ˡ����VI �Ĺ����жϷ����ڶ��Ķˣ���˲���Ӱ���������ߵĶ��ġ�

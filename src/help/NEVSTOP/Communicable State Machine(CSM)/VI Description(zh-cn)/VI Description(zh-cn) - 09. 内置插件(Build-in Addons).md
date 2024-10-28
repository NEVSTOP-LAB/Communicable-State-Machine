# CSM API

## ���ò��(Build-in Addons)

### CSM WatchDog

> [!NOTE] CSM WatchDog ʵ�ֵ�ԭ��
> LabVIEW VI �˳�ʱ�����Զ��ͷ����ж��С��¼��Ⱦ����Դ����ˣ����ǿ���ͨ������һ�� WatchDog �̣߳����һ����������VI���봴���Ķ�����Դ�������������Դ����VI�˳����ͷ�ʱ������ WatchDog �̸߳���δ�˳��� CSM ģ�鷢�� "Macro: Exit"����֤�����������˳���

#### CSM - Start Watchdog to Ensure All Modules Exit.vi

����CSM Watchdog �̣߳����ڱ�֤���������˳������е��첽������ CSM ģ�鶼�������˳���

> Ref: CSM WatchDog ʵ�ֵ�ԭ��

#### CSM Watchdog Thread.vi

CSM Watchdog �̣߳����ڱ�֤���������˳������е��첽������ CSM ģ�鶼�������˳���

> Ref: CSM WatchDog ʵ�ֵ�ԭ��

-- <b>����ؼ�</b> --
- <b>WatchdogQ</b>: Watchdog ������Դ��

### CSM File Logger

> [!NOTE] CSM File Logger ʵ�ֵ�ԭ��
> ͨ������ CSM �� Global Log Event �¼������Խ�Ӧ���е�ȫ�� CSM ���Ϣ��¼���������ں��ڷ����ʹ���λ��
> �ļ�Ϊ�ı��ļ�����׺��Ϊ .csmlog������ͨ�����±����ı��༭��ѯ���ߴ򿪡�

#### CSM - Start File Logger.vi

���� CSM �¼��ļ���¼���ܡ�

> Ref: CSM File Logger ʵ�ֵ�ԭ��

-- <b>����ؼ�</b> --
- <b>Log File Path</b>: ��¼�ļ�·��
- <b>Enable? (T)</b>: �Ƿ�����
- <b>log limit</b>: ��¼�ļ�����
- <b>Timestamp format</b>: ʱ���ʽ
- <b>WatchDog? (T)</b>: �Ƿ����� WatchDog
- <b>Filter Rules</b>: ʱ����˹���
- <b>Exit When All Module Exist?(F)</b>: CSM ȫ��ģ���˳����Ƿ��˳�

-- <b>����ؼ�</b> --
- <b>LogFile</b>: CSM lOG �ļ�·��
- <b>WatchDogQueue</b>: WatchDog ��Դ���

#### CSM-Logger-Thread.vi

���� CSM Global Log �ļ���¼�߳�VI��

> Ref: CSM File Logger ʵ�ֵ�ԭ��

-- <b>����ؼ�</b> --
- <b>Log File Path</b>: ��¼�ļ�·��
- <b>log limit</b>: ��¼�ļ�����
- <b>Timestamp format</b>: ʱ���ʽ
- <b>WatchDogQ</b>: WatchDog��Դ�����ڼ���������Ƿ��˳�
- <b>GlobalLogFilter.lvclass</b>: �¼�����������
- <b>Exit When All Module Exist?(F)</b>: CSM ȫ��ģ���˳����Ƿ��˳�

### CSM Loop Support

> [!NOTE] CSM LOOP ��Ƶ�ԭ��
> JKISM/CSM ��һ��״̬����ܣ����ѭ��������һ�ֳ����ĳ�����ʵ��ѭ��û��һ���Ϻõķ�����
> - �����һ��Case��֧��ʹ��ѭ��ʵ�֣��ᵼ��״̬���Ŀ����ڴ�״̬�У��޷������л���Ҳ������Ӧ�ⲿ����Ϣ��
> - ���ͨ����״̬ѭ�������һ��״̬�У�����������һ��ѭ����״̬��Ҳ�ᵼ�²��ܺܺõ���Ӧ�ⲿ����Ϣ���Һܲ�ֱ�ۡ�
> ��ˣ���������Ҫ��Ϊ���ṩһ����׼��ѭ��ʵ�ַ�ʽ��������ϵ����⡣
>

#### CSMLS - Add Exit State(s) with Loop Check.vi

�˳�ʱ���ѭ����

-- <b>����ؼ�</b> --
- <b>States Queue</b>: ����״̬���б����ӵ�������
- <b>Exiting States</b>: �˳������״̬

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ʣ�����Ϣ����

#### CSMLS - Append Continuous State.vi

���ѭ��״̬��

-- <b>����ؼ�</b> --
- <b>States Queue</b>: ����״̬���б����ӵ�������
- <b>Loop State(s) and Arguments</b>: ѭ��״̬
- <b>Continuous State</b>:ѭ��״̬����
- <b>Continuous Arguments ("")</b>: ѭ��״̬����
- <b>Append(T)</b>: �Ƿ����

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ʣ�����Ϣ����

#### CSMLS - Define Loop State(s).vi

����ѭ��������

-- <b>����ؼ�</b> --
- <b>States Queue</b>: ����״̬���б����ӵ�������
- <b>Loop State(s) and Arguments</b>: ѭ��״̬

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ʣ�����Ϣ����

#### CSMLS - Remove Loop Tag and previous State(s) to Break.vi

ͨ���Ƴ� <loop> ��Ǻ� <loop> ���ǰ������״̬���ﵽֹͣѭ����

������

���� CSM ����Ϣ�����У�������������Ϣ����ʱִ�е�ǰAPI���������Ƴ�ע�����ڵ���Ϣ

    DAQ: Acquire                    //<b>�����Ƴ�</b>
    DAQ: Continuous Check -><loop>  //<b>�����Ƴ�</b>
    DAQ: Stop
    DAQ: Release

�൱�ڲ���ִ���κ�DAQ����������ֱ�ӽ���ֹͣ���ͷš�

-- <b>����ؼ�</b> --
- <b>States Queue</b>: ����״̬���б����ӵ�������

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ʣ�����Ϣ����

#### CSMLS - Remove Loop Tag to Break.vi

ͨ���Ƴ� <loop> ��ǣ��ﵽֹͣѭ����

������

���� CSM ����Ϣ�����У�������������Ϣ����ʱִ�е�ǰAPI���������Ƴ�ע�����ڵ���Ϣ

    DAQ: Acquire
    DAQ: Continuous Check -><loop>  //<b>�����Ƴ�</b>
    DAQ: Stop
    DAQ: Release

�൱����Ȼ��ִ�е�ǰ��DAQ������Ȼ�����ֹͣ���ͷš�

-- <b>����ؼ�</b> --
- <b>States Queue</b>: ����״̬���б����ӵ�������

-- <b>����ؼ�</b> --
- <b>Remaining States</b>: ʣ�����Ϣ����

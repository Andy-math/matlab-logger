%#ok<*NASGU> �ر�'����û�õ�'����
% ���Ե��������ǰ׺'logger2.'
% import('logger2.*');
% ʹ��֮ǰ��ʼ��
logger2.init('log1.txt','log2.txt'); % �����ж�����Ŀ��
% ����ʱ���
timestamp = logger2.timestamp();
% ָ����ʽ��ʱ���
timestamp = logger2.timestamp('yyyymmdd HH:MM:SS');
% ���ɷֽ���
line = logger2.line();
% ָ������
line = logger2.line('abab');
% ָ�����źͳ���
line = logger2.line('*',100);
% ����ַ���
logger2.fputs(line);
% ���printf
logger2.printf('\n\t%s',timestamp)
% ���disp(�൱�ڴ����е�fputs)
logger2.disp(newline);
% ����һЩ����
A = 1;
B = 2;
% �������������������
logger2.output(A);
logger2.output(B);
% ��������
logger2.output(A+B);
% �������ݽṹ
struc.a = 1;
struc.b = 2;
struc.c = {};
logger2.output({struc,struc});
logger2.output(struc);
logger2.output(1:10);
% ִ�����
logger2.eval('AAAA = exp(-1i)');
% ����ļ��ض���
logger2.redirect('log1.txt','log3.txt');
% ����
logger2.disp(logger2.line('��'));
% �ر������ٻ��ߣ�stdout�������ֻ������ļ���
logger2.echo(false);
logger2.disp(logger2.line('_no_stdout_',10));
% �����Ի���
logger2.echo(true);
logger2.disp(logger2.line('_stdout_',10));

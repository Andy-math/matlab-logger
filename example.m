%#ok<*NASGU> 关闭'变量没用到'警告
% 可以导入包来简化前缀'logger2.'
% import('logger2.*');
% 使用之前初始化
logger2.init('log1.txt','log2.txt'); % 可以有多个输出目标
% 生成时间戳
timestamp = logger2.timestamp();
% 指定格式的时间戳
timestamp = logger2.timestamp('yyyymmdd HH:MM:SS');
% 生成分界线
line = logger2.line();
% 指定符号
line = logger2.line('abab');
% 指定符号和长度
line = logger2.line('*',100);
% 输出字符串
logger2.fputs(line);
% 输出printf
logger2.printf('\n\t%s',timestamp)
% 输出disp(相当于带换行的fputs)
logger2.disp(newline);
% 定义一些变量
A = 1;
B = 2;
% 输出变量（含变量名）
logger2.output(A);
logger2.output(B);
% 匿名变量
logger2.output(A+B);
% 复杂数据结构
struc.a = 1;
struc.b = 2;
struc.c = {};
logger2.output({struc,struc});
logger2.output(struc);
logger2.output(1:10);
% 执行语句
logger2.eval('AAAA = exp(-1i)');
% 输出文件重定向
logger2.redirect('log1.txt','log3.txt');
% 划线
logger2.disp(logger2.line('线'));
% 关闭屏显再划线（stdout不输出，只输出到文件）
logger2.echo(false);
logger2.disp(logger2.line('_no_stdout_',10));
% 打开屏显划线
logger2.echo(true);
logger2.disp(logger2.line('_stdout_',10));

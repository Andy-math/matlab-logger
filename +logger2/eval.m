function varargout = eval(expr)
	[s,varargout{1:nargout}] = evalin('caller',['evalc(''' expr ''');']);
	logger2.fputs(s);
end
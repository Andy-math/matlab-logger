function output(ans) %#ok<INUSD,*NOANS>
	name = inputname(1);
	if isempty(name)
		s = evalc('ans');
	else
		s = evalin('caller',['evalc(''' name ''');']);
	end
	logger2.fputs(s);
end
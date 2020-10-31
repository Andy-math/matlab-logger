function disp(var) %#ok<INUSD>
	s = evalc('disp(var);');
	logger2.fputs(s);
end
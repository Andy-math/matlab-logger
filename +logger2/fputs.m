function fputs(s)
	assert((isstring(s) && isscalar(s)) || ...
		(ischar(s) && isrow(s)));
	if isstring(s)
		s = char(s);
	end
	if logger2.echo()
		fprintf(1,'%s',s);
	end
	object = logger2.container('get');
	for i = 1:numel(object)
		if isequal(object{i},'__DEBUG__')
			continue
		end
		fid = fopen(object{i},'a');
		fprintf(fid,'%s',s);
		fclose(fid);
	end
end
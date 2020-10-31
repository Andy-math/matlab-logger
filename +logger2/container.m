function result = container(mode,object)
	persistent path
	stack = dbstack();
	switch stack(2).name
		case 'init'
			result = path;
			return
		case 'redirect'
		case 'fputs'
		otherwise
			error('permission denied.');
	end
	switch mode
		case 'set'
			path = object;
		case 'get'
			assert(~isequal(path,[]));
			result = path;
	end
end
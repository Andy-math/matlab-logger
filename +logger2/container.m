function result = container(mode,object)
	persistent path
	stack = dbstack();
	switch stack(2).name
		case 'init'
			result = path;
			path = '__WAITING_FOR_REDIRECTION__';
		case {'redirect','fputs'}
			assert(~isequal(path,[]));
			switch mode
				case 'set'
					path = object;
				case 'get'
					result = path;
			end
		otherwise
			error('permission denied.');
	end
end
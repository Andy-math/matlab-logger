function flag = echo(flag)
	persistent state
	if nargin
		assert(islogical(flag) && isscalar(flag));
		state = flag;
	end
	if nargout
		assert(~isequal(state,[]));
		flag = state;
	end
end
function flag = echo(flag)
	persistent state
	if nargin
		assert(islogical(flag) && isscalar(flag));
		state = flag;
	end
	if nargout
		flag = state;
	end
end
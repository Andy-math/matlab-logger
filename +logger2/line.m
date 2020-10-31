function s = line(c,n)
	if nargin >= 1
		assert((isstring(c) && isscalar(c)) || ...
			(ischar(c) && isrow(c)));
		if isstring(c)
			c = char(c);
		end
		assert(~isempty(c));
	else
		c = '=';
	end
	if nargin >= 2
		assert(isscalar(n) && isnumeric(n) && ...
			n > 0 && n == floor(n));
	else
		n = 80;
	end
	s = repmat(c,1,n);
end
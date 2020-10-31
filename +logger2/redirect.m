function redirect(varargin)
	narginchk(1,inf);
	for i = 1:numel(varargin)
		object = varargin{i};
		assert((isstring(object) && isscalar(object)) || ...
			(ischar(object) && isrow(object)));
		if isstring(object)
			object = char(object);
		end
		assert(~isempty(object));
		varargin{i} = object;
	end
	logger2.container('set',varargin);
end
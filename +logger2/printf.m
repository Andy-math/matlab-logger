function printf(varargin)
	s = sprintf(varargin{:});
	logger2.fputs(s);
end
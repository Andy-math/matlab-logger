function init(varargin)
	assert(isequal(logger2.container('get'),[]));
	logger2.redirect(varargin{:});
	logger2.echo(true);
end
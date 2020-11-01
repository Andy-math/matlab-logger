function init(varargin)
	logger2.container(); % init container
	logger2.redirect(varargin{:});
	logger2.echo(true);
end
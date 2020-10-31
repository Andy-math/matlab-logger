function s = timestamp(formatspec)
	if ~nargin
		formatspec = 'yyyy_mm_dd HH.MM.SS';
	end
	s = datestr(datetime('now'),formatspec);
end
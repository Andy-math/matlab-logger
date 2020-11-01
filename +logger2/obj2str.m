function str = obj2str(obj,restrict_enable,restrict_value)
	if nargin < 2
		restrict_enable = true;
	end
	if nargin < 3
		restrict_value = [];
	end
	if ~restrict_enable
		restrict_value = entry(restrict_value,true,[]);
	end
	str = join(entry(obj,restrict_enable,restrict_value),newline());
	assert(strcmp(str,join(entry(eval(str),true,[]),newline())));
end
function str = entry(obj,restrict_enable,restrict_value)
	if isstruct(obj)
		str = entry_struct(obj,restrict_enable,restrict_value);
	elseif ~ismatrix(obj)
		str = entry_ndarray(obj,restrict_enable,restrict_value);
	elseif iscell(obj)
		str = entry_cell(obj,restrict_enable,restrict_value);
	elseif isnumeric(obj) || islogical(obj) || ischar(obj)
		str = entry_numericOrLogicalOrChar(obj,restrict_enable,restrict_value);
	elseif isstring(obj)
		str = entry_string(obj,restrict_enable,restrict_value);
	else
		if restrict_enable
			error('unexpected type %s.',class(obj));
		else
			str = restrict_value;
		end
	end
end
function str = entry_struct(obj,restrict_enable,restrict_value)
	fn = fieldnames(obj);
	str = cell(1,numel(fn));
	for i = 1:numel(fn)
		str{i} = entry(reshape({obj.(fn{i})},size(obj)),restrict_enable,restrict_value);
		str{i}(1) = tab()+"'"+fn{i}+"',"+str{i}(1);
		str{i}(2:end) = tab()+str{i}(2:end);
		if i ~= numel(fn)
			str{i}(end) = str{i}(end)+",...";
		else
			str{i}(end) = str{i}(end)+"...";
		end
	end
	str = vertcat(str{:});
	str = ["struct(...";str;")"];
end
function str = entry_ndarray(obj,restrict_enable,restrict_value)
	dim = ndims(obj);
	baseidx = repmat({':'},1,dim-1);
	n = size(obj,ndims(obj));
	str = cell(1,n);
	for i = 1:n
		str{i} = tab()+entry(obj(baseidx{:},i),restrict_enable,restrict_value);
		if i ~= n
			str{i}(end) = str{i}(end)+",...";
		else
			str{i}(end) = str{i}(end)+"...";
		end
	end
	str = vertcat(str{:});
	str = ["cat("+dim+",...";str;")"];
end
function str = entry_cell(obj,restrict_enable,restrict_value)
	str = cell(size(obj));
	for i = 1:size(obj,1)
		for j = 1:size(obj,2)
			str{i,j} = tab()+entry(obj{i,j},restrict_enable,restrict_value);
			if j ~= size(obj,2)
				str{i,j}(end) = str{i,j}(end)+",...";
			elseif i ~= size(obj,1)
				str{i,j}(end+1,1) = string(tab());
			end
		end
	end
	str = str.';
	str = vertcat(str{:});
	str = ["{";str;"}"];
end
function str = entry_numericOrLogicalOrChar(obj,~,~)
	if ischar(obj)
		str = string(mat2str(obj));
	else
		str = string(mat2str(obj,16,'class'));
	end
	str = str.replace(' ',',');
	if size(obj,1) > 1
		str = str.replace("[","["+newline()).replace("]",newline()+"]");
		str = str.replace(';',newline()).split(newline());
		str(2:end-1) = tab()+str(2:end-1);
	end
end
function str = entry_string(obj,~,~)
	if isempty(obj)
		str = "strings("+size(obj,1)+","+size(obj,2)+")";
		return
	end
	str = strings(size(obj,1),1);
	for i = 1:size(obj,1)
		obj(i,:) = """"+obj(i,:)+"""";
		obj(i,ismissing(obj(i,:))) = "missing()";
		str(i) = join(obj(i,:),',');
	end
	if size(obj,1) > 1
		str = ["[";tab()+str;"]"];
	elseif isscalar(obj)
		% nothing
	else
		str = "["+str+"]";
	end
end
function c = tab()
	c = char(9);
end
function pr=findminmax(p)

if iscell(p)
  [m,n] = size(p);
  pr = cell(m,1);
  for i=1:m
    pr{i} = minmax([p{i,:}]);
  end
elseif isa(p,'double')
  pr = [min(p,[],2) max(p,[],2)];
else
  error('Argument has illegal type.')
end

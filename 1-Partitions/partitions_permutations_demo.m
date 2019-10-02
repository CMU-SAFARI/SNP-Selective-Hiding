clc
clear
plist = partitions(3,[1 2]);    %partitions(total_sum, candidate_set)
size(plist,1)
plist;
p= 2; %define it as the number of other participants included in the query results other than the target j.


%%

for j = 1: size(plist,1)
   s=sum(plist(j,:));
   if s > (p+1)
	plist(j,:) = [];  %remove the raws containing partitions for >p+1 participants
   end
end

%%

for j = 1: size(plist,1)
	v = [0 1 2]; %according to the values in candidate_set of partitions
	P = perms(v);
	A = unique(P,'rows'); % remove duplicated rows
	size(P)
	size(A)
end


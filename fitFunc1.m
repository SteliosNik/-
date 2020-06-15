function [ result ] = fitFunc1( input )

userid = 196;
scores = [];
mids = [];
uids= [];
userdata = [];
data1 = importdata('data1.mat');
for n = 1:100000
    
    if (data1(n,1) == userid)
        scores = [scores;data1(n,3)];
        mids = [mids;data1(n,2)];
    end
end
userdata = [scores,mids];
for k = 1:39
    for m = 1:100000
        if (mids(k) == data1(m,2) && data1(m,1) ~= userid)
            uids = [uids,data1(m,1)];
        end
    end
end 
uuids = unique(uids,'stable');
[~,numCols] = size(uuids);
tmid = [];
for n = 1:numCols
    for k = 1:100000
        if data1(k,1) == uuids(n)
            tmid = [tmid;uuids(n),data1(k,2),data1(k,3)];
        end
    end
end
[dsa,~] = size(tmid);
vec= 0;
for n = 1:dsa
    for k = 1:39
    if (tmid(n,2)== mids(k))
        vec = vec + 1;
    end
    end
end


result = vec ;
    
function [M]=normalize_data(M)
%fields in Dataset as per column
% sex Age Cholestrol BP chest_pain ECG heart_rate Physical_activity Diebetis Slope num_vessels Thal Result
[r c]=size(M);
for ii=1:r
    %     Normalize age
    x=M(ii,1);
    if x >= 20 && x <= 34
        Age=-2;
    elseif  x >= 35 && x <= 50
        Age=-1;
    elseif x>= 51 && x <= 60
        Age=0;

    elseif x>= 61 && x <= 79
        Age=1;

    elseif x >= 80 ;
        Age=2;
    end

    M(ii,1)=Age;
    % normalize Blood Pressure
    x=M(ii,4);
    if x < 120
        BP=-1;
    elseif x > 120 && x <= 139
        BP=0;
    elseif x >= 140
        BP=1;
    end
    M(ii,4)=BP;

    %         Normalize Blood Cholestrol

    x=M(ii,5);
    if x < 200
        Cholestrol=-1;
    elseif x > 200 && x <= 239
        Cholestrol=0;
    elseif x >= 240
        Cholestrol=1;
    end
    M(ii,5)=Cholestrol;
    % Normalize Heart Rate
    x=M(ii,8);
    if x <= 100
        HtRate=-1;
    elseif x > 100 && x <= 150
        HtRate=0;
    elseif x >= 151
        HtRate=1;
    end

    M(ii,8)=HtRate;
    
end


count=1;
row_num=[];
while count ~= length(M)
    if M(count,9)==0
        row_num=[row_num count];
    end
count=count+1;
end

M(row_num(1,:),:)=[]; %consdier only dataset which has diabetes=true and delete other data with sugar=0;


    


%% Level 1
clear
clc
[FN,PN] = uigetfile({'*.txt'},'Select a Data File');
FP=[PN,FN];
D = myDataLoader(FP,'%s%s%s%s%.2f\n',1,'^')
F_N=D{1};
LN=D{2};
AGE=D{3};
GENDER=D{4};
BAL=D{5};
runs=0;
uc=0;
ct=0;
male=0;
female=0;

for i=1:length(AGE)
    runs=runs+1;
    if strcmp(AGE{i},'N/A') || strcmp(GENDER{i},'NS')
        uc=uc+1;
        UNCAT(uc)=i;
    else
        ct=ct+1;
        CT(ct)=i;
    end   
end

bal1=0;
bal2=0;
bal3=0;
bal1m=0;
bal2m=0;
bal3m=0;
bal1f=0;
bal2f=0;
bal3f=0;

for i=1:length(CT)
    y(i)=BAL(CT(i));
end

for i=1:length(CT)
    if strcmp(GENDER{CT(i)},'M')
        male=male+1;
        if y(i)<9999.99
            bal1m=bal1m+1;
            bal1=bal1+1;
            bal1_all(bal1)=CT(i);
        elseif y(i)<24999.99
            bal2m=bal2m+1;
            bal2=bal2+1;
            bal2_all(bal2)=CT(i);
        else
            bal3m=bal3m+1;
            bal3=bal3+1;
            bal3_all(bal3)=CT(i);
        end
    elseif strcmp(GENDER{CT(i)},'F')
        female=female+1;
        if y(i)<9999.99
            bal1f=bal1f+1;
            bal1=bal1+1;
            bal1_all(bal1)=CT(i);
        elseif y(i)<24999.99
            bal2f=bal2f+1;
            bal2=bal2+1;
            bal2_all(bal2)=CT(i);
        else
            bal3f=bal3f+1;
            bal3=bal3+1;
            bal3_all(bal3)=CT(i);
            
        end
    
    end  
end

%Would be able to find all that is needed in the balance summary
%Ran out of time, but finding mean ages and ratio is easy as I have tracked
%all that information.  
%As you can see I  have filtered the correct number of people per each
%balance category

m2f1=bal1m/bal1f;
m2f2=bal2m/bal2f;
m2f3=bal3m/bal3f;

avg1=mean(str2double(AGE(bal1_all(:,:))));
avg2=mean(str2double(AGE(bal2_all(:,:))));
avg3=mean(str2double(AGE(bal3_all(:,:))));

j1=fopen('Data Summary Q5.txt','wt')

fprintf(j1,'Total Customers: %.0f\n',length(BAL))
fprintf(j1,'Categorized Customers: %.0f\n',length(CT))
fprintf(j1,'Uncategorized Customers: %.0f\n',length(BAL))
fprintf(j1,'\n')
fprintf(j1,'Summary:\n')
fprintf(j1,'%-25s%-15s%-25s%-20s\n','Balance Category','Avg. Age','Male-to-Female Ratio','Count')
fprintf(j1,'%-25s%-15.5f%-25e%-20.0f\n','$0 - $9,999.99',avg1,m2f1,bal1)
fprintf(j1,'%-25s%-15.5f%-25e%-20.0f\n','$10,000 - 24,999.99',avg2,m2f2,bal2)
fprintf(j1,'%-25s%-15.5f%-25e%-20.0f\n','$25,000+',avg3,m2f3,bal3)

fclose(j1)   
    
  
    
    
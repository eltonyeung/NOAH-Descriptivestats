%Demographics Table

%Initializing
clc
clear

source = 'scorebook.xlsx';
pathOUT = 'D:\Box Sync\Box Sync\Clinical Scores\Stat\Demographics Figures\'

%Load demographics tables into different datacubes
dataCube_apple = readtable(source,'Sheet',1,'TreatAsEmpty','on');
dataCube_XsensC = readtable(source,'Sheet',2,'TreatAsEmpty','on');
dataCube_XsensN = readtable(source,'Sheet',3,'TreatAsEmpty','on');

clear source

% %Define parameters (nj, N, j)
% nApple = height(dataCube_Apple);
% nXsens_C = height(dataCube_Xsens_C);
% nXsens_N = height(dataCube_Xsens_N);
% 
% N = nApple + nXsens_C + nXsens_N;
% j = 3;


%% Demographics (Gender rendered)

%AGE
%switch all zeros into NaNs
dataCube_apple.Age(dataCube_apple.Age == 0) = NaN;
dataCube_XsensC.Age(dataCube_XsensC.Age == 0) = NaN;
dataCube_XsensN.Age(dataCube_XsensN.Age == 0) = NaN;

%predefine apple, xsens controls and natural column space for plotting
group = [ones(size(dataCube_apple.Age)); 2 * ones(size(dataCube_XsensC.Age)); 3 * ones(size(dataCube_XsensN.Age))];

%generate boxplot figure
figure(1)
subplot(1,4,1)
boxplot([dataCube_apple.Age; dataCube_XsensC.Age; dataCube_XsensN.Age],group,'Whisker',1,'Notch','off')  %'Notch','on'
set(gca,'XTickLabel',{'Apple','Xsens Control','Xsens Natural'})
ylabel('Years')
title('Age')
hold on

%add scatter plot for displaying individual data points
group1= zeros(length(dataCube_apple.Age),1).*2;
group1(dataCube_apple.Gender_1M_2F_ == 1) = 1;
group1(dataCube_apple.Gender_1M_2F_ == 2) = 2;
group1(isnan(dataCube_apple.Gender_1M_2F_)) = NaN;

group2= zeros(length(dataCube_XsensC.Age),1).*2;
group2(dataCube_XsensC.Gender_1M_2F_ == 1) = 1;
group2(dataCube_XsensC.Gender_1M_2F_ == 2) = 2;
group2(isnan(dataCube_XsensC.Gender_1M_2F_)) = NaN;

group3= zeros(length(dataCube_XsensN.Age),1).*2;
group3(dataCube_XsensN.Gender_1M_2F_ == 1) = 1;
group3(dataCube_XsensN.Gender_1M_2F_ == 2) = 2;
group3(isnan(dataCube_XsensN.Gender_1M_2F_)) = NaN;

groupColors1 = [0 0 1; 1 0 0];  %render male as blue, female as red
groupColors2 = [1 0 0; 0 0 1];
groupColors3 = [0 0 1; 1 0 0];

x=ones(length(dataCube_apple.Age)).*(1+(rand(length(dataCube_apple.Age))-0.7)/5);
x1=ones(length(dataCube_XsensC.Age)).*(1+(rand(length(dataCube_XsensC.Age))-0.7)/10);
x2=ones(length(dataCube_XsensN.Age)).*(1+(rand(length(dataCube_XsensN.Age))-0.7)/15);
f1=gscatter(x(:,1),dataCube_apple.Age,group1,groupColors1,'.',15);%f1.MarkerFaceAlpha = 0.4; hold on 
f2=gscatter(x1(:,2).*2,dataCube_XsensC.Age,group2,groupColors2,'.',15);%f2.MarkerFaceAlpha = f1.MarkerFaceAlpha; hold on
f3=gscatter(x2(:,3).*3,dataCube_XsensN.Age,group3,groupColors3,'.',15);%f3.MarkerFaceAlpha = f1.MarkerFaceAlpha; hold off

hFig=findall(0,'type','figure');
hLeg=findobj(hFig(1,1),'type','legend');
set(hLeg,'visible','off')

clear group* f* x*


%HEIGHT
%switch all zeros into NaNs
dataCube_apple.Height(dataCube_apple.Height == 0) = NaN;
dataCube_XsensC.Height(dataCube_XsensC.Height == 0) = NaN;
dataCube_XsensN.Height(dataCube_XsensN.Height == 0) = NaN;

group = [ones(size(dataCube_apple.Height)); 2 * ones(size(dataCube_XsensC.Height)); 3 * ones(size(dataCube_XsensN.Height))];

subplot(1,4,2)
boxplot([dataCube_apple.Height; dataCube_XsensC.Height; dataCube_XsensN.Height],group,'Whisker',1,'Notch','off')  %'Notch','on'
set(gca,'XTickLabel',{'Apple','Xsens Control','Xsens Natural'})
ylabel('Centimeters')
title('Height')
hold on

%add scatter plot for displaying individual data points
group1= zeros(length(dataCube_apple.Height),1).*2;
group1(dataCube_apple.Gender_1M_2F_ == 1) = 1;
group1(dataCube_apple.Gender_1M_2F_ == 2) = 2;
group1(isnan(dataCube_apple.Gender_1M_2F_)) = NaN;

group2= zeros(length(dataCube_XsensC.Height),1).*2;
group2(dataCube_XsensC.Gender_1M_2F_ == 1) = 1;
group2(dataCube_XsensC.Gender_1M_2F_ == 2) = 2;
group2(isnan(dataCube_XsensC.Gender_1M_2F_)) = NaN;

group3= zeros(length(dataCube_XsensN.Height),1).*2;
group3(dataCube_XsensN.Gender_1M_2F_ == 1) = 1;
group3(dataCube_XsensN.Gender_1M_2F_ == 2) = 2;
group3(isnan(dataCube_XsensN.Gender_1M_2F_)) = NaN;

groupColors1 = [0 0 1; 1 0 0];  %render male as blue, female as red
groupColors2 = [1 0 0; 0 0 1];
groupColors3 = [0 0 1; 1 0 0];

x=ones(length(dataCube_apple.Height)).*(1+(rand(length(dataCube_apple.Height))-0.7)/5);
x1=ones(length(dataCube_XsensC.Height)).*(1+(rand(length(dataCube_XsensC.Height))-0.7)/10);
x2=ones(length(dataCube_XsensN.Height)).*(1+(rand(length(dataCube_XsensN.Height))-0.7)/15);
f1=gscatter(x(:,1),dataCube_apple.Height,group1,groupColors1,'.',15);%f1.MarkerFaceAlpha = [0.4; 0.4]; hold on 
f2=gscatter(x1(:,2).*2,dataCube_XsensC.Height,group2,groupColors2,'.',15);%f2.MarkerFaceAlpha = f1.MarkerFaceAlpha; hold on
f3=gscatter(x2(:,3).*3,dataCube_XsensN.Height,group3,groupColors3,'.',15);%f3.MarkerFaceAlpha = f1.MarkerFaceAlpha; hold off

hFig=findall(0,'type','figure');
hLeg=findobj(hFig(1,1),'type','legend');
set(hLeg,'visible','off')

clear group* f* x*


%WEIGHT
%switch all zeros into NaNs
dataCube_apple.Weight(dataCube_apple.Weight == 0) = NaN;
dataCube_XsensC.Weight(dataCube_XsensC.Weight == 0) = NaN;
dataCube_XsensN.Weight(dataCube_XsensN.Weight == 0) = NaN;

subplot(1,4,3)
group = [ones(size(dataCube_apple.Weight)); 2 * ones(size(dataCube_XsensC.Weight)); 3 * ones(size(dataCube_XsensN.Weight))];
boxplot([dataCube_apple.Weight; dataCube_XsensC.Weight; dataCube_XsensN.Weight],group,'Whisker',1,'Notch','off')  %'Notch','on'
set(gca,'XTickLabel',{'Apple','Xsens Control','Xsens Natural'})
ylabel('Kilograms')
title('Weight')
hold on

%add scatter plot for displaying individual data points
group1= zeros(length(dataCube_apple.Weight),1).*2;
group1(dataCube_apple.Gender_1M_2F_ == 1) = 1;
group1(dataCube_apple.Gender_1M_2F_ == 2) = 2;
group1(isnan(dataCube_apple.Gender_1M_2F_)) = NaN;

group2= zeros(length(dataCube_XsensC.Weight),1).*2;
group2(dataCube_XsensC.Gender_1M_2F_ == 1) = 1;
group2(dataCube_XsensC.Gender_1M_2F_ == 2) = 2;
group2(isnan(dataCube_XsensC.Gender_1M_2F_)) = NaN;

group3= zeros(length(dataCube_XsensN.Weight),1).*2;
group3(dataCube_XsensN.Gender_1M_2F_ == 1) = 1;
group3(dataCube_XsensN.Gender_1M_2F_ == 2) = 2;
group3(isnan(dataCube_XsensN.Gender_1M_2F_)) = NaN;

groupColors1 = [0 0 1; 1 0 0];  %render male as blue, female as red
groupColors2 = [1 0 0; 0 0 1];
groupColors3 = [0 0 1; 1 0 0];

x=ones(length(dataCube_apple.Weight)).*(1+(rand(length(dataCube_apple.Weight))-0.7)/5);
x1=ones(length(dataCube_XsensC.Weight)).*(1+(rand(length(dataCube_XsensC.Weight))-0.7)/10);
x2=ones(length(dataCube_XsensN.Weight)).*(1+(rand(length(dataCube_XsensN.Weight))-0.7)/15);
f1=gscatter(x(:,1),dataCube_apple.Weight,group1,groupColors1,'.',15);%f1.MarkerFaceAlpha = [0.4; 0.4]; hold on 
f2=gscatter(x1(:,2).*2,dataCube_XsensC.Weight,group2,groupColors2,'.',15);%f2.MarkerFaceAlpha = f1.MarkerFaceAlpha; hold on
f3=gscatter(x2(:,3).*3,dataCube_XsensN.Weight,group3,groupColors3,'.',15);%f3.MarkerFaceAlpha = f1.MarkerFaceAlpha; hold off

legend('Male','Female');

clear group* f* x*



%% Clinical Scores
%%
%NIHSS
%predefine apple, xsens controls and natural column space for plotting
group = [ones(size(dataCube_apple.NIHSSScore)); 2 * ones(size(dataCube_XsensC.NIHSSScore)); 3 * ones(size(dataCube_XsensN.NIHSSScore))];

%generate boxplot figure
figure(2)
boxplot([dataCube_apple.NIHSSScore; dataCube_XsensC.NIHSSScore; dataCube_XsensN.NIHSSScore],group,'Whisker',1,'Notch','off')  %'Notch','on'
set(gca,'XTickLabel',{'Apple','Xsens Control','Xsens Natural'})
ylabel('Score')
title('NIHSS')
hold on

%add scatter plot for displaying individual data points
group1= zeros(length(dataCube_apple.NIHSSScore),1).*2;
group1(dataCube_apple.Gender_1M_2F_ == 1) = 1;
group1(dataCube_apple.Gender_1M_2F_ == 2) = 2;
group1(isnan(dataCube_apple.Gender_1M_2F_)) = NaN;

group2= zeros(length(dataCube_XsensC.NIHSSScore),1).*2;
group2(dataCube_XsensC.Gender_1M_2F_ == 1) = 1;
group2(dataCube_XsensC.Gender_1M_2F_ == 2) = 2;
group2(isnan(dataCube_XsensC.Gender_1M_2F_)) = NaN;

group3= zeros(length(dataCube_XsensN.NIHSSScore),1).*2;
group3(dataCube_XsensN.Gender_1M_2F_ == 1) = 1;
group3(dataCube_XsensN.Gender_1M_2F_ == 2) = 2;
group3(isnan(dataCube_XsensN.Gender_1M_2F_)) = NaN;

groupColors1 = [0 0 1; 1 0 0];  %render male as blue, female as red
groupColors2 = [1 0 0; 0 0 1];
groupColors3 = [0 0 1; 1 0 0];

x=ones(length(dataCube_apple.NIHSSScore)).*(1+(rand(length(dataCube_apple.NIHSSScore))-0.7)/5);
x1=ones(length(dataCube_XsensC.NIHSSScore)).*(1+(rand(length(dataCube_XsensC.NIHSSScore))-0.7)/10);
x2=ones(length(dataCube_XsensN.NIHSSScore)).*(1+(rand(length(dataCube_XsensN.NIHSSScore))-0.7)/15);
f1=gscatter(x(:,1),dataCube_apple.NIHSSScore,group1,groupColors1,'.',15);%f1.MarkerFaceAlpha = 0.4; hold on 
f2=gscatter(x1(:,2).*2,dataCube_XsensC.NIHSSScore,group2,groupColors2,'.',15);%f2.MarkerFaceAlpha = f1.MarkerFaceAlpha; hold on
f3=gscatter(x2(:,3).*3,dataCube_XsensN.NIHSSScore,group3,groupColors3,'.',15);%f3.MarkerFaceAlpha = f1.MarkerFaceAlpha; hold off

hFig=findall(0,'type','figure');
hLeg=findobj(hFig(1,1),'type','legend');
set(hLeg,'visible','off')

clear group* f* x*


%%
%DYNAMOMETER
%change zeros into NaNs
dataCube_apple.Dynamometer_LH_Max(dataCube_apple.Dynamometer_LH_Max == 0) = NaN;
dataCube_XsensC.Dynamometer_LH_Max(dataCube_XsensC.Dynamometer_LH_Max == 0) = NaN;
dataCube_XsensN.Dynamometer_LH_Max(dataCube_XsensN.Dynamometer_LH_Max == 0) = NaN;
dataCube_apple.Dynamometer_RH_Max(dataCube_apple.Dynamometer_RH_Max == 0) = NaN;
dataCube_XsensC.Dynamometer_RH_Max(dataCube_XsensC.Dynamometer_RH_Max == 0) = NaN;
dataCube_XsensN.Dynamometer_RH_Max(dataCube_XsensN.Dynamometer_RH_Max == 0) = NaN;


%predefine apple, xsens controls and natural column space for plotting
group = [ones(size(dataCube_apple.Dynamometer_LH_Max)); 2 * ones(size(dataCube_apple.Dynamometer_RH_Max));...
    3 * ones(size(dataCube_XsensC.Dynamometer_LH_Max)); 4 * ones(size(dataCube_XsensC.Dynamometer_RH_Max));...
    5 * ones(size(dataCube_XsensN.Dynamometer_LH_Max)); 6 * ones(size(dataCube_XsensN.Dynamometer_RH_Max))];

figure(3)
%generate boxplot figure
boxplot([dataCube_apple.Dynamometer_LH_Max; dataCube_apple.Dynamometer_RH_Max;...
    dataCube_XsensC.Dynamometer_LH_Max; dataCube_XsensC.Dynamometer_RH_Max;...
    dataCube_XsensN.Dynamometer_LH_Max; dataCube_XsensN.Dynamometer_RH_Max],group,'Whisker',1,'Notch','off')  %'Notch','on'
set(gca,'XTickLabel',{'Left','Right','Left','Right','Left','Right'})
ylabel('Kilograms')
title('Dynamometer Scores')
hold on

%add scatter plot for displaying individual data points
group1a= zeros(length(dataCube_apple.Dynamometer_LH_Max),1).*2;
group1a(dataCube_apple.Gender_1M_2F_ == 1) = 1;
group1a(dataCube_apple.Gender_1M_2F_ == 2) = 2;
group1a(isnan(dataCube_apple.Gender_1M_2F_)) = NaN;

group1b= zeros(length(dataCube_apple.Dynamometer_RH_Max),1).*2;
group1b(dataCube_apple.Gender_1M_2F_ == 1) = 1;
group1b(dataCube_apple.Gender_1M_2F_ == 2) = 2;
group1b(isnan(dataCube_apple.Gender_1M_2F_)) = NaN;

group2a= zeros(length(dataCube_XsensC.Dynamometer_LH_Max),1).*2;
group2a(dataCube_XsensC.Gender_1M_2F_ == 1) = 1;
group2a(dataCube_XsensC.Gender_1M_2F_ == 2) = 2;
group2a(isnan(dataCube_XsensC.Gender_1M_2F_)) = NaN;

group2b= zeros(length(dataCube_XsensC.Dynamometer_RH_Max),1).*2;
group2b(dataCube_XsensC.Gender_1M_2F_ == 1) = 1;
group2b(dataCube_XsensC.Gender_1M_2F_ == 2) = 2;
group2b(isnan(dataCube_XsensC.Gender_1M_2F_)) = NaN;

group3a= zeros(length(dataCube_XsensN.Dynamometer_LH_Max),1).*2;
group3a(dataCube_XsensN.Gender_1M_2F_ == 1) = 1;
group3a(dataCube_XsensN.Gender_1M_2F_ == 2) = 2;
group3a(isnan(dataCube_XsensN.Gender_1M_2F_)) = NaN;

group3b= zeros(length(dataCube_XsensN.Dynamometer_LH_Max),1).*2;
group3b(dataCube_XsensN.Gender_1M_2F_ == 1) = 1;
group3b(dataCube_XsensN.Gender_1M_2F_ == 2) = 2;
group3b(isnan(dataCube_XsensN.Gender_1M_2F_)) = NaN;

groupColors1 = [0 0 1; 1 0 0];  %render male as blue, female as red
groupColors2 = [1 0 0; 0 0 1];
groupColors3 = [0 0 1; 1 0 0];

x=ones(length(dataCube_apple.Dynamometer_LH_Max)).*(1+(rand(length(dataCube_apple.Dynamometer_LH_Max))-0.7)/5);
x1=ones(length(dataCube_apple.Dynamometer_RH_Max)).*(1+(rand(length(dataCube_apple.Dynamometer_RH_Max))-0.7)/10);
x2=ones(length(dataCube_XsensC.Dynamometer_LH_Max)).*(1+(rand(length(dataCube_XsensC.Dynamometer_LH_Max))-0.7)/15);
x3=ones(length(dataCube_XsensC.Dynamometer_RH_Max)).*(1+(rand(length(dataCube_XsensC.Dynamometer_RH_Max))-0.7)/20);
x4=ones(length(dataCube_XsensN.Dynamometer_LH_Max)).*(1+(rand(length(dataCube_XsensN.Dynamometer_LH_Max))-0.7)/25);
x5=ones(length(dataCube_XsensN.Dynamometer_RH_Max)).*(1+(rand(length(dataCube_XsensN.Dynamometer_RH_Max))-0.7)/30);
f1=gscatter(x(:,1),dataCube_apple.Dynamometer_LH_Max,group1a,groupColors1,'.',15);
f2=gscatter(x1(:,2).*2,dataCube_apple.Dynamometer_RH_Max,group1b,groupColors1,'.',15);
f3=gscatter(x2(:,3).*3,dataCube_XsensC.Dynamometer_LH_Max,group2a,groupColors2,'.',15);
f4=gscatter(x3(:,4).*4,dataCube_XsensC.Dynamometer_RH_Max,group2b,groupColors2,'.',15);
f5=gscatter(x4(:,5).*5,dataCube_XsensN.Dynamometer_LH_Max,group3a,groupColors3,'.',15);
f6=gscatter(x5(:,6).*6,dataCube_XsensN.Dynamometer_RH_Max,group3b,groupColors3,'.',15);

hold on
legend('Male','Female');

annotation('textbox', [0.5, 0.05, 0.1, 1.0], 'String', "Apple                      Xsens Control                Xsens Natural")


hold off
clear group* f* x*


%%

%
%SAS  --> ASK WHETHER 'A' = agidated / alert.

%
%EH
%import EH score from datacube


%%  Histogram 

Demographics(1).Age = dataCube_apple.Age;
Demographics(2).Age = dataCube_XsensC.Age;
Demographics(3).Age = dataCube_XsensN.Age;


Demographics(1).Age(find(isnan(Demographics(1).Age)))=[];
Demographics(1).Age(find(isnan(Demographics(2).Age)))=[];
Demographics(3).Age(find(isnan(Demographics(3).Age)))=[];
Demographics(1).Age(Demographics(1).Age== 0) = [];
Demographics(2).Age(Demographics(2).Age == 0) = [];
Demographics(3).Age(Demographics(3).Age == 0) = [];

figure(2)

subplot(3,1,1)
histogram(Demographics(1).Age,'BinWidth',10)
title('Apple - Ages')
%h1.BinWidth = 1;
subplot(3,1,2)
histogram(Demographics(2).Age,'BinWidth',10)
title('Xsens Control - Ages')
%h2.BinWidth = 1;
subplot(3,1,3)
histogram(Demographics(3).Age,'BinWidth',10)
title('Xsens Natural - Ages')

figure(3)
subplot(3,1,1)
histogram(dataCube_apple.Weight,'BinWidth',10)
title('Apple - Weight')
%h1.BinWidth = 1;
subplot(3,1,2)
histogram(dataCube_XsensC.Weight,'BinWidth',10)
title('Xsens Control - Weight')
%h2.BinWidth = 1;
subplot(3,1,3)
histogram(dataCube_XsensN.Weight,'BinWidth',10)
title('Xsens Natural - Weight')
%h3.BinWidth = 1;

figure(4)
subplot(3,1,1)
histogram(dataCube_apple.Height,'BinWidth',10)
title('Apple - Height')
%h1.BinWidth = 1;
subplot(3,1,2)
histogram(dataCube_XsensC.Height,'BinWidth',10)
title('Xsens Control - Height')
%h2.BinWidth = 1;
subplot(3,1,3)
histogram(dataCube_XsensN.Height,'BinWidth',10)
title('Xsens Natural - Height')

%% Statistics - Demographics
%%
%AGE
%switch all zeros into NaNs
dataCube_apple.Age(dataCube_apple.Age == 0) = NaN;
dataCube_XsensC.Age(dataCube_XsensC.Age == 0) = NaN;
dataCube_XsensN.Age(dataCube_XsensN.Age == 0) = NaN;
[h1,p1,ci1,stats1] = ttest2(dataCube_apple.Age,dataCube_XsensC.Age);
[h2,p2,ci2,stats2] = ttest2(dataCube_apple.Age,dataCube_XsensN.Age);
[h3,p3,ci3,stats3] = ttest2(dataCube_XsensC.Age,dataCube_XsensN.Age);

%anova AGE
ANOVAAge = vertcat(dataCube_apple.Age,dataCube_XsensC.Age,dataCube_XsensN.Age);
%assign group numbers for the concatenated number (due to unequal number of
%entries per group)
group =  [ones(size(dataCube_apple.Age)); 2 * ones(size(dataCube_XsensC.Age)); 3 * ones(size(dataCube_XsensN.Age))];
[p,tbl,stats] = anova1(ANOVAAge,group);

%Write into table for output
STAT(1).name = 'Age'
STAT(1).anova_f = cell2mat(tbl(2,5));
STAT(1).anova_p = p;
STAT(1).t_apple_XsensC = stats1.tstat;
STAT(1).p_apple_XsensC = p1;
STAT(1).t_apple_XsensN = stats2.tstat;
STAT(1).p_apple_XsensN = p2;
STAT(1).t_XsensC_XsensN = stats3.tstat;
STAT(1).p_XsensC_XsensN = p3;

clear stats* p* h* ci* tbl group ANOVAAge


%Height
%switch all zeros into NaNs
dataCube_apple.Height(dataCube_apple.Height == 0) = NaN;
dataCube_XsensC.Height(dataCube_XsensC.Height == 0) = NaN;
dataCube_XsensN.Height(dataCube_XsensN.Height == 0) = NaN;
[h1,p1,ci1,stats1] = ttest2(dataCube_apple.Height,dataCube_XsensC.Height);
[h2,p2,ci2,stats2] = ttest2(dataCube_apple.Height,dataCube_XsensN.Height);
[h3,p3,ci3,stats3] = ttest2(dataCube_XsensC.Height,dataCube_XsensN.Height);

%anova AGE
ANOVAHeight = vertcat(dataCube_apple.Height,dataCube_XsensC.Height,dataCube_XsensN.Height);
group =  [ones(size(dataCube_apple.Height)); 2 * ones(size(dataCube_XsensC.Height)); 3 * ones(size(dataCube_XsensN.Height))];
[p,tbl,stats] = anova1(ANOVAHeight,group);

%Write into table for output
STAT(2).name = 'Height'
STAT(2).anova_f = cell2mat(tbl(2,5));
STAT(2).anova_p = p;
STAT(2).t_apple_XsensC = stats1.tstat;
STAT(2).p_apple_XsensC = p1;
STAT(2).t_apple_XsensN = stats2.tstat;
STAT(2).p_apple_XsensN = p2;
STAT(2).t_XsensC_XsensN = stats3.tstat;
STAT(2).p_XsensC_XsensN = p3;

clear stats* p* h* ci* tbl group ANOVAHeight


%Weight
%switch all zeros into NaNs
dataCube_apple.Weight(dataCube_apple.Weight == 0) = NaN;
dataCube_XsensC.Weight(dataCube_XsensC.Weight == 0) = NaN;
dataCube_XsensN.Weight(dataCube_XsensN.Weight == 0) = NaN;
[h1,p1,ci1,stats1] = ttest2(dataCube_apple.Weight,dataCube_XsensC.Weight);
[h2,p2,ci2,stats2] = ttest2(dataCube_apple.Weight,dataCube_XsensN.Weight);
[h3,p3,ci3,stats3] = ttest2(dataCube_XsensC.Weight,dataCube_XsensN.Weight);

%anova Weight
ANOVAWeight = vertcat(dataCube_apple.Weight,dataCube_XsensC.Weight,dataCube_XsensN.Weight);
group =  [ones(size(dataCube_apple.Weight)); 2 * ones(size(dataCube_XsensC.Weight)); 3 * ones(size(dataCube_XsensN.Weight))];
[p,tbl,stats] = anova1(ANOVAWeight,group);

%Write into table for output
STAT(3).name = 'Weight'
STAT(3).anova_f = cell2mat(tbl(2,5));
STAT(3).anova_p = p;
STAT(3).t_apple_XsensC = stats1.tstat;
STAT(3).p_apple_XsensC = p1;
STAT(3).t_apple_XsensN = stats2.tstat;
STAT(3).p_apple_XsensN = p2;
STAT(3).t_XsensC_XsensN = stats3.tstat;
STAT(3).p_XsensC_XsensN = p3;

clear stats* p* h* ci* tbl group ANOVAWeight

%% Statistics - Clinical Scores

%Dynamometer (t-test within)
[h1,p1,ci1,stats1] = ttest2(dataCube_apple.Dynamometer_RH_Max,dataCube_apple.Dynamometer_LH_Max);
[h2,p2,ci2,stats2] = ttest2(dataCube_XsensC.Dynamometer_RH_Max,dataCube_XsensC.Dynamometer_LH_Max);
[h3,p3,ci3,stats3] = ttest2(dataCube_XsensN.Dynamometer_RH_Max,dataCube_XsensN.Dynamometer_LH_Max);


%Dynamometer (t-test between)
[h4,p4,ci4,stats4] = ttest2(dataCube_apple.Dynamometer_LH_Max,dataCube_XsensC.Dynamometer_LH_Max);
[h5,p5,ci5,stats5] = ttest2(dataCube_apple.Dynamometer_RH_Max,dataCube_XsensC.Dynamometer_RH_Max);
[h6,p6,ci6,stats6] = ttest2(dataCube_apple.Dynamometer_LH_Max,dataCube_XsensN.Dynamometer_LH_Max);
[h7,p7,ci7,stats7] = ttest2(dataCube_apple.Dynamometer_RH_Max,dataCube_XsensN.Dynamometer_RH_Max);
[h8,p8,ci8,stats8] = ttest2(dataCube_XsensC.Dynamometer_LH_Max,dataCube_XsensN.Dynamometer_LH_Max);
[h9,p9,ci9,stats9] = ttest2(dataCube_XsensC.Dynamometer_RH_Max,dataCube_XsensN.Dynamometer_RH_Max);

%anova dynamometer
ANOVADyn = vertcat(dataCube_apple.Dynamometer_LH_Max,dataCube_apple.Dynamometer_RH_Max,...
                      dataCube_XsensC.Dynamometer_LH_Max,dataCube_XsensC.Dynamometer_RH_Max,...
                      dataCube_XsensN.Dynamometer_LH_Max,dataCube_XsensN.Dynamometer_RH_Max);
                 
group =  [ones(size(dataCube_apple.Dynamometer_LH_Max)); 2 * ones(size(dataCube_apple.Dynamometer_RH_Max));...
          3 * ones(size(dataCube_XsensC.Dynamometer_LH_Max)); 4 * ones(size(dataCube_XsensC.Dynamometer_RH_Max));...
          5 * ones(size(dataCube_XsensN.Dynamometer_LH_Max)); 6 * ones(size(dataCube_XsensN.Dynamometer_LH_Max))];
[p,tbl,stats] = anova1(ANOVADyn,group);

%Write into table for output
STAT(4).name = 'Dynamometer'
STAT(4).anova_f = cell2mat(tbl(2,5));
STAT(4).anova_p = p;

STAT(4).t_apple_LR_within = stats1.tstat;
STAT(4).p_apple_LR_within = p1;
STAT(4).t_XsensC_LR_within = stats2.tstat;
STAT(4).p_XsensC_LR_within = p2;
STAT(4).t_XsensN_LR_within = stats3.tstat;
STAT(4).p_XsensN_LR_within = p3;

STAT(4).t_apple_XsensC_L_bt = stats4.tstat;
STAT(4).p_apple_XsensC_L_bt = p4;
STAT(4).t_apple_XsensC_R_bt = stats5.tstat;
STAT(4).p_apple_XsensC_R_bt = p5;
STAT(4).t_apple_XsensN_L_bt = stats6.tstat;
STAT(4).p_apple_XsensN_L_bt = p6;
STAT(4).t_apple_XsensN_R_bt = stats7.tstat;
STAT(4).p_apple_XsensN_R_bt = p7;
STAT(4).t_XsensC_XsensN_L_bt = stats8.tstat;
STAT(4).p_XsensC_XsensN_L_bt = p8;
STAT(4).t_XsensC_XsensN_R_bt = stats9.tstat;
STAT(4).p_XsensC_XsensN_R_bt = p9;

clear stats* p* h* ci* tbl group ANOVADyn



%NIHSS
[h1,p1,ci1,stats1] = ttest2(dataCube_apple.NIHSSScore,dataCube_XsensC.NIHSSScore);
[h2,p2,ci2,stats2] = ttest2(dataCube_apple.NIHSSScore,dataCube_XsensN.NIHSSScore);
[h3,p3,ci3,stats3] = ttest2(dataCube_XsensC.NIHSSScore,dataCube_XsensN.NIHSSScore);

%anova NIHSS
ANOVANIHSS = vertcat(dataCube_apple.NIHSSScore,dataCube_XsensC.NIHSSScore,dataCube_XsensN.NIHSSScore);
group =  [ones(size(dataCube_apple.NIHSSScore)); 2 * ones(size(dataCube_XsensC.NIHSSScore)); 3 * ones(size(dataCube_XsensN.NIHSSScore))];
[p,tbl,stats] = anova1(ANOVANIHSS,group);

%Write into table for output
STAT(5).name = 'NIHSS'
STAT(5).anova_f = cell2mat(tbl(2,5));
STAT(5).anova_p = p;
STAT(5).t_apple_XsensC = stats1.tstat;
STAT(5).p_apple_XsensC = p1;
STAT(5).t_apple_XsensN = stats2.tstat;
STAT(5).p_apple_XsensN = p2;
STAT(5).t_XsensC_XsensN = stats3.tstat;
STAT(5).p_XsensC_XsensN = p3;

clear stats* p* h* ci* tbl group ANOVANIHSS



%mRS
[h1,p1,ci1,stats1] = ttest2(dataCube_apple.mRSPostAdmission,dataCube_XsensC.mRSPostAdmission);
[h2,p2,ci2,stats2] = ttest2(dataCube_apple.mRSPostAdmission,dataCube_XsensN.mRSPostAdmission);
[h3,p3,ci3,stats3] = ttest2(dataCube_XsensC.mRSPostAdmission,dataCube_XsensN.mRSPostAdmission);

%anova mRS
ANOVAmRS = vertcat(dataCube_apple.mRSPostAdmission,dataCube_XsensC.mRSPostAdmission,dataCube_XsensN.mRSPostAdmission);
group =  [ones(size(dataCube_apple.mRSPostAdmission)); 2 * ones(size(dataCube_XsensC.mRSPostAdmission)); 3 * ones(size(dataCube_XsensN.mRSPostAdmission))];
[p,tbl,stats] = anova1(ANOVAmRS,group);

%Write into table for output
STAT(6).name = 'mRS Post-admission';
STAT(6).anova_f = cell2mat(tbl(2,5));
STAT(6).anova_p = p;
STAT(6).t_apple_XsensC = stats1.tstat;
STAT(6).p_apple_XsensC = p1;
STAT(6).t_apple_XsensN = stats2.tstat;
STAT(6).p_apple_XsensN = p2;
STAT(6).t_XsensC_XsensN = stats3.tstat;
STAT(6).p_XsensC_XsensN = p3;

clear stats* p* h* ci* tbl group ANOVAmRS



%GCS
[h1,p1,ci1,stats1] = ttest2(dataCube_apple.GCS,dataCube_XsensC.GCS);
[h2,p2,ci2,stats2] = ttest2(dataCube_apple.GCS,dataCube_XsensN.GCS);
[h3,p3,ci3,stats3] = ttest2(dataCube_XsensC.GCS,dataCube_XsensN.GCS);

%anova GCS
ANOVAGCS = vertcat(dataCube_apple.GCS,dataCube_XsensC.GCS,dataCube_XsensN.GCS);
group =  [ones(size(dataCube_apple.GCS)); 2 * ones(size(dataCube_XsensC.GCS)); 3 * ones(size(dataCube_XsensN.GCS))];
[p,tbl,stats] = anova1(ANOVAGCS,group);

%Write into table for output
STAT(8).name = 'GCS';
STAT(8).anova_f = cell2mat(tbl(2,5));
STAT(8).anova_p = p;
STAT(8).t_apple_XsensC = stats1.tstat;
STAT(8).p_apple_XsensC = p1;
STAT(8).t_apple_XsensN = stats2.tstat;
STAT(8).p_apple_XsensN = p2;
STAT(8).t_XsensC_XsensN = stats3.tstat;
STAT(8).p_XsensC_XsensN = p3;

clear stats* p* h* ci* tbl group ANOVAGCS



%% Statistics - Others

%Days since hospital admission
[h1,p1,ci1,stats1] = ttest2(dataCube_apple.DaySinceHospitalAdmission,dataCube_XsensC.DaySinceHospitalAdmission);
[h2,p2,ci2,stats2] = ttest2(dataCube_apple.DaySinceHospitalAdmission,dataCube_XsensN.DaySinceHospitalAdmission);
[h3,p3,ci3,stats3] = ttest2(dataCube_XsensC.DaySinceHospitalAdmission,dataCube_XsensN.DaySinceHospitalAdmission);

%anova mRS
ANOVAdays = vertcat(dataCube_apple.DaySinceHospitalAdmission,dataCube_XsensC.DaySinceHospitalAdmission,dataCube_XsensN.DaySinceHospitalAdmission);
group =  [ones(size(dataCube_apple.DaySinceHospitalAdmission)); 2 * ones(size(dataCube_XsensC.DaySinceHospitalAdmission)); 3 * ones(size(dataCube_XsensN.DaySinceHospitalAdmission))];
[p,tbl,stats] = anova1(ANOVAdays,group);

%Write into table for output
STAT(7).name = 'Day Since Hospital Admission';
STAT(7).anova_f = cell2mat(tbl(2,5));
STAT(7).anova_p = p;
STAT(7).t_apple_XsensC = stats1.tstat;
STAT(7).p_apple_XsensC = p1;
STAT(7).t_apple_XsensN = stats2.tstat;
STAT(7).p_apple_XsensN = p2;
STAT(7).t_XsensC_XsensN = stats3.tstat;
STAT(7).p_XsensC_XsensN = p3;

clear stats* p* h* ci* tbl group ANOVAdays




%% Save descriptive stats into excel document
STAT = struct2table(STAT);
writetable(STAT,'Descriptive stats.xlsx');
fprintf('Descriptive stats saved')
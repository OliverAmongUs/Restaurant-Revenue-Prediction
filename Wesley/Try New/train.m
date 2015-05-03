
trainData = csvread('str_num_train.csv',1,0);
trainFeatures = [trainData(:,2),trainData(:,4:end-1)];
trainRevenue = trainData(:, end:end);

testData = csvread('str_num_test.csv',1,0);
testFeatures=[testData(:,2),testData(:,4:end)];

%% Handle Outline

for i = 1:length(trainRevenue)
    
    if trainRevenue(i)>1e7
        trainRevenue(i)=1e7;
    end
    
end


trainFeatures(:,4:end)=log(trainFeatures(:,4:end));
testFeatures(:,4:end)=log(testFeatures(:,4:end));

%%
%kfold=5;
%err=zeros([1,10]);
%for m=1:10
Ensemble = fitensemble(trainFeatures, trainRevenue,'Bag', 600, 'Tree', 'Type', 'Regression','FResample', 1/2);
%CVensembler = crossval(Ensemble, 'KFold', kfold);
%err=kfoldLoss(CVensembler);
%end
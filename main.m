clear;
%Reading both the training and testing data and also the label of the test
%and train data
data=csvread('train.csv',1,0);
testData=csvread('test.csv',1,0);
label_test=csvread('label_test.csv',0,0);
label=data(:,1);

%Getting the PCA reduced training and testing data
[TrainData, TestData] = pca(data,testData);

%Comment the previous line and uncomment the following two lines to
%calculate without PCA

%TrainData=data(:,2:785);
%TestData = testData;

%converting the label for class 0 to 10 because matlab can't access 0th
%position in array
label(label==0)=10;
label_test(label_test==0)=10;

%Selecting the distance measurement we want to use
dist = 'euclidean';
%dist = 'cityblock';
disp(dist);

%Setting the value for K
k = 5;

%Keeping count for the total number of true positives
count=0;
%label_count=1;

tic
for i=1:101
    %Calling the KNN function to get the highest prediction for the i th
    %data
    [result] = KNN(TestData(i,:),TrainData(1:42000,:),label,k,dist);
    if result==label_test(i)
        count=count+1;
    end
end
toc
%Displaying the accuracy
fprintf('for k = %i, accuracy = %i with PCA\n ', k,count)

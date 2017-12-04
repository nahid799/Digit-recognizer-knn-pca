function [PCATrain,PCATest] = pca(train_data, test_data)

data = train_data;
testData = test_data;
%data=csvread('train.csv',1,0);
%testData=csvread('test.csv',1,0);
train=data(:,2:785);

%Concatenate both the training and testing data in one matrix to compute
%the PCA
train(42001:70000,:)=testData;
label=data(:,1);
[r c] = size(train);


%The mean_vector is a vector which holds the mean of each data. 
mean_vector = mean(train,2);

%Removing the mean from the data to have a data set of zero mean. The
%data_mremoved matrix holds the mean removed data
for i=1:c
    data_mremoved(:,i) = train(:,i) - mean_vector(i);
end

%Calculating the Covariance matrix for the data.
cov_mat =(1/c)* data_mremoved'*data_mremoved;

%Finding the Eigen value and eigen vector of the covariance matrix
[v,e] = eig(cov_mat);
e = diag(e);

%Selecting the number of Eigen vectors. Here we have selected 10 Feature
%vector so we could get 10 features.
selectedVector = v(:,1:10);

%PCAData holds the reduced feature data.
PCAData = data_mremoved*selectedVector;

%Dividing the training and testing data
PCATrain = PCAData(1:42000,:);
PCATest = PCAData(42001:70000,:);
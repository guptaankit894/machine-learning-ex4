load('ex4data1.mat');
load('ex4weights.mat');
num_labels=10;



% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
labmda=1;
X=[ones(m,1) X];
z=sigmoid(X*Theta1');
z=[ones(m,1) z];
predictor=sigmoid(z*Theta2');
 
 
 
J=0;

for i=1:num_labels
 
 delta_output(:,i)=predictor(:,i)-(y==i);
 
 %J(i)=-(((y==i)'*log(predictor(:,i)))+((1-(y==i))'*log(1-predictor(:,i))));
 
 end 
 delta_2=(delta_output*Theta2).*sigmoidGradient(z);
 delta_2=delta_2(:,2:end);
 
 D_1=zeros(size(Theta1));
 D_2=zeros(size(Theta2));
 D_1=D_1+delta_2'*X;
 D_2=D_2+delta_output'*z;
%J=sum(J)/m;
%z1=0;
%for j=1:size(Theta1,1)
%z1=z1+sum(Theta1(j,2:end).^2);
%end

%z2=0;
%for j=1:size(Theta2,1)
%z2=z2+sum(Theta2(j,2:end).^2);
%end


%z=(z1+z2)*(lambda/(2*m));


%J=J+z;
%___________________________________________________________________%
%  Ant Lion Optimizer (ALO) source codes demo version 1.0           %
%                                                                   %
%  Developed in MATLAB R2011b(7.13)                                 %
%                                                                   %
%  Author and programmer: Seyedali Mirjalili                        %
%                                                                   %
%         e-Mail: ali.mirjalili@gmail.com                           %
%                 seyedali.mirjalili@griffithuni.edu.au             %
%                                                                   %
%       Homepage: http://www.alimirjalili.com                       %
%                                                                   %
%   Main paper:                                                     %
%                                                                   %
%   S. Mirjalili, The Ant Lion Optimizer                            %
%   Advances in Engineering Software , in press,2015                %
%   DOI: http://dx.doi.org/10.1016/j.advengsoft.2015.01.010         %
%                                                                   %
%___________________________________________________________________%

% This function creates random walks % 随机移动函数

function [RWs]=Random_walk_around_antlion(Dim,max_iter,lb,ub,antlion,current_iter)
if size(lb,1) ==1 && size(lb,2)==1 %Check if the bounds are scalar检测边界是不是标量
    lb=ones(1,Dim)*lb;
    ub=ones(1,Dim)*ub;
end

if size(lb,1) > size(lb,2) %Check if boundary vectors are horizontal or vertical 检查边界向量是水平的还是垂直的
    lb=lb';
    ub=ub';
end

I=1; % I is the ratio in Equations (2.10) and (2.11)  比率

if current_iter>max_iter/10
    I=1+100*(current_iter/max_iter);%w=2
end

if current_iter>max_iter/2
    I=1+1000*(current_iter/max_iter);%w=3
end

if current_iter>max_iter*(3/4)
    I=1+10000*(current_iter/max_iter);%w=4
end

if current_iter>max_iter*(0.9)
    I=1+100000*(current_iter/max_iter);%w=5
end

if current_iter>max_iter*(0.95)
    I=1+1000000*(current_iter/max_iter);%w=6
end


% Decrease boundaries to converge towards antlion    缩小边界以收敛到蚁狮附近
lb=lb/(I); % Equation (2.10) in the paper     t次迭代所有变量的最小值
ub=ub/(I); % Equation (2.11) in the paper     t次迭代包含所有变量最大值的向量

% Move the interval of [lb ub] around the antlion [lb+anlion ub+antlion]  将[lb ub]的间隔移动到蚁狮[lb+anlion ub+antlion]
if rand<0.5          %r(t)=0
    lb=lb+antlion; % Equation (2.8) in the paper第i只蚂蚁变量最小值
else
    lb=-lb+antlion;
end

if rand>=0.5         %r(t)=1
    ub=ub+antlion; % Equation (2.9) in the paper第i只蚂蚁变量最大值
else
    ub=-ub+antlion;
end

% This function creates n random walks and normalize accroding to lb and ub
% vectors 创建n个随机移动、lb和ub向量规范化
for i=1:Dim
    X = [0 cumsum(2*(rand(max_iter,1)>0.5)-1)']; % Equation (2.1) in the paper
    %[a b]--->[c d]
    a=min(X);
    b=max(X);
    c=lb;
    d=ub;      
    X_norm=((X-a).*(d-c))./(b-a)+c; % Equation (2.7) in the paper   ant标准随机位置
    RWs(:,i)=X_norm;%输出Rws
end


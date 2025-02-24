clc
clear all
close all

%% 设置参数
N = 30; %定义种群的数量
T = 10000; %定义最大迭代次数
MaxA =2; %定义需要运行多少个算法
b=20;    %需要运行的CEC
runs = 30; %运行次数
MAX_runs = 1;  %最大的运行次数
%% 调用函数，获得参数
[Function_name,F_num] = get_CECname(b);
Best = zeros(F_num,MaxA);  %存储最优适应度值
Mean = zeros(F_num,MaxA);  %存储平均适应度值
Std = zeros(F_num,MaxA);   %存储适应度方差
F_sum = zeros(F_num*3,MaxA); %最优值，平均值和方差过渡
next_sum = zeros(F_num*3,MaxA); %存储最优值，平均值和方差

%% MaxA运行的算法，F_num*runs是独立运行得出的数据
all_data = zeros(MaxA*F_num,runs);
%% 运行主函数
for a = 1:F_num    %运行函数
    f_name = get_F_name(a);  %获得函数的序号
    [lb,ub,dim,fobj] = Function_name(f_name); %获得函数的边界
    lb = repmat(lb,1,dim);
    ub = repmat(ub,1,dim);
    BestList = zeros(MaxA,runs);  %获得适应度值
    for p =1:MAX_runs
        for i = 1:MaxA  %运行优化算法
            Aobj = get_Name(i); %  取得对于的算法名称
            best_Fitness=zeros(1,runs);  % 用于存储最优的适应度值
            for j = 1%运行次数
                disp("运行的函数为："+f_name+"第 "+num2str(p)+" 运行。 运行第 "+num2str(i)+"算法。 正在独立运行第"+num2str(j)+"次") %打印相关的数据
                [best_Fitness(j),best_Position,Cov] = Aobj(N,T,lb,ub,dim,fobj); %获得运行后的数据
            end
            %% 计算最优值，平均数，方差
            BestList(i,:)=sort(best_Fitness);  %排序存储
            Best(a,i) = BestList(i,1);   %求最优值
            Mean(a,i) = mean(BestList(i,:));  %求平均数
            Std(a,i) = std(BestList(i,:));   %求方差
        end
        %% 存储数据
        F_sum(3*a-2,:)=Best(a,:);
        F_sum(3*a-1,:) =Mean(a,:);
        F_sum(3*a,:) = Std(a,:);
        %% 获得更优的数据
        if p==1 %当p等于1时，直接将数据输入到next_sum
            next_sum(3*a-2,:) =F_sum(3*a-2,:);
            next_sum(3*a-1,:) =F_sum(3*a-1,:);
            next_sum(3*a,:) =F_sum(3*a,:);
            %% 用于输出独立运行runs的所有数据，其中列表示算法，行表示算法运行的次数加函数的数量
            for j = 1:MaxA
                all_data((a-1)*MaxA+j,:)= BestList(j,:);
            end
        else
            %% 更新数据
            for i = 1:MaxA
                if i==1 && F_sum(3*a-2,1)<next_sum(3*a-2,1) && F_sum(3*a-1,1)<next_sum(3*a-1,1) &&  F_sum(3*a,1)<next_sum(3*a,1)
                    next_sum(3*a-2,i) =F_sum(3*a-2,i);
                    next_sum(3*a-1,i) =F_sum(3*a-1,i);
                    next_sum(3*a,i) =F_sum(3*a,i);
                    all_data((a-1)*MaxA+i,:)= BestList(i,:); 
                elseif i~=1
                    if F_sum(3*a-1,i)>next_sum(3*a-1,i) &&  F_sum(3*a,i)>next_sum(3*a,i) &&  F_sum(3*a-2,i)>next_sum(3*a-2,i)
                        next_sum(3*a-2,i) =F_sum(3*a-2,i);
                        next_sum(3*a-1,i) =F_sum(3*a-1,i);
                        next_sum(3*a,i) =F_sum(3*a,i);
                            all_data((a-1)*MaxA+i,:)= BestList(i,:);
                    end
                end
            end
        end
        %如果改进算法最低，者直接输出,如果备注则全部跑RUN_MAX次
        %         if min(next_sum(3*a-2,:))==next_sum(3*a-2,1) && min(next_sum(3*a-1,:))==next_sum(3*a-1,1) && min(next_sum(3*a,:))==next_sum(3*a,1)
        %             break;
        %         end
    end
end
all_next_data = all_data';
%% 计算弗里德曼
RawData = all_next_data;
%% Finding Rank of the problems
for j = 1:F_num
    for i = 1:runs
        RankOfTheProblems(i,:) = tiedrank(RawData(i,1+(j-1)*MaxA:j*MaxA));
    end
    %% Taking average of the rank of the problems
    AvgOfRankOfProblems = mean(RankOfTheProblems);
    SquareOfTheAvgs = AvgOfRankOfProblems .* AvgOfRankOfProblems;
    SumOfTheSquares = sum(SquareOfTheAvgs);
    FfStats = (12*runs/(MaxA*(MaxA+1))) * (SumOfTheSquares - ((MaxA*(MaxA+1)^2)/4));
    %% Display the results
    %formatSpec = 'Friedman statistic is %4.2f and \n ';
    %fprintf(formatSpec,FfStats);
    %disp('Average of the ranks obtained in all problems');
    %disp(AvgOfRankOfProblems)
    y_one(j,:) = AvgOfRankOfProblems;
    %y(j,:)= tiedrank(AvgOfRankOfProblems);
end
m_y_one = mean(y_one);
[a,b]=sort(m_y_one);
for i = 1:size(b,2)
    final_mean(b(i)) = i;
end
disp("%%%%%%%%%%%%%%%%输出的值为%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
disp("各个算法在不同函数的排名：");
disp(y_one)
disp("平均排名：");
disp(m_y_one);
disp("最终平均排名：");
disp(final_mean);
disp("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");








%_________________________________________________________________________________
%  Heap-based optimizer inspired by corporate rank hierarchy for global
%  optimization source codes version 1.0
%
%  Developed in MATLAB R2015a
%
%  Author and programmer: Qamar Askari
%
%         e-Mail: l165502@lhr.nu.edu.pk
%                 syedqamar@gift.edu.pk
%
%
%   Main paper:
%   Askari, Q., Saeed, M., & Younas, I. (2020). Heap-based optimizer
%   inspired by corporate rank hierarchy for global optimization.
%   Expert Systems with Applications, 2020,
%____________________________________________________________________________________

function [lb,ub,dim,fobj] = CEC2020(F)


switch F
    %CEC2020 - 1 
    case 'F1'
        fobj = @F1;
        lb=-100;
        ub=100;
        dim=10;
        
    %CEC2020 - 2
    case 'F2'
        fobj = @F2;
        lb=-100;
        ub=100;
        dim=10;
        
    %CEC2020 - 3
    case 'F3'
        fobj = @F3;
        lb=-100;
        ub=100;
        dim=10;
        
    %CEC2020 - 4
    case 'F4'
        fobj = @F4;
        lb=-100;
        ub=100;
        dim=10;
        
    %CEC2020 - 5
    case 'F5'
        fobj = @F5;
        lb=-100;
        ub=100;
        dim=10;
        
    %CEC2020 - 6
    case 'F6'
        fobj = @F6;
        lb=-100;
        ub=100;
        dim=10;
        
    %CEC2020 - 7
    case 'F7'
        fobj = @F7;
        lb=-100;
        ub=100;
        dim=10;
        
    %CEC2020 - 8
    case 'F8'
        fobj = @F8;
        lb=-100;
        ub=100;
        dim=10;
        
    %CEC2020 - 9
    case 'F9'
        fobj = @F9;
        lb=-100;
        ub=100;
        dim=10;
        
    %CEC2020 - 10
    case 'F10'
        fobj = @F10;
        lb=-100;
        ub=100;
        dim=10;
end

end

% F1
function o = F1(x) 
    o = cec20_func(x',1);
end

% F2
function o = F2(x) 
    o = cec20_func(x',2);
end

% F3
function o = F3(x) 
    o = cec20_func(x',3);
end

% F4
function o = F4(x) 
    o = cec20_func(x',4);
end

% F5
function o = F5(x) 
    o = cec20_func(x',5);
end

% F6
function o = F6(x) 
    o = cec20_func(x',6);
end

% F7
function o = F7(x) 
    o = cec20_func(x',7);
end

% F8
function o = F8(x) 
    o = cec20_func(x',8);
end

% F9
function o = F9(x) 
    o = cec20_func(x',9);
end

% F10
function o = F10(x) 
    o = cec20_func(x',10);
end


% F11
function o = F11(x) 
    o = cec20_func(x',11);
end

% F12
function o = F12(x) 
    o = cec20_func(x',12);
end


% F13
function o = F13(x) 
    o = cec20_func(x',13);
end

% F20
function o = F14(x) 
    o = cec20_func(x',14);
end

% F15
function o = F15(x) 
    o = cec20_func(x',15);
end

% F16
function o = F16(x) 
    o = cec20_func(x',16);
end


% F17
function o = F17(x) 
    o = cec20_func(x',17);
end

% F18
function o = F18(x) 
    o = cec20_func(x',18);
end

% F19
function o = F19(x) 
    o = cec20_func(x',19);
end

% F20
function o = F20(x) 
    o = cec20_func(x',20);
end

% F21
function o = F21(x) 
    o = cec20_func(x',21);
end

% F22
function o = F22(x) 
    o = cec20_func(x',22);
end

% F23
function o = F23(x) 
    o = cec20_func(x',23);
end

% F24
function o = F24(x) 
    o = cec20_func(x',24);
end


% F25
function o = F25(x) 
    o = cec20_func(x',25);
end

% F26
function o = F26(x) 
    o = cec20_func(x',26);
end

% F27
function o = F27(x) 
    o = cec20_func(x',27);
end

% F28
function o = F28(x) 
    o = cec20_func(x',28);
end

% F29
function o = F29(x) 
    o = cec20_func(x',29);
end

% F30
function o = F30(x) 
    o = cec20_func(x',30);
end

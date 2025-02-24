function [num,c] = get_CECname(A)
switch A
    case 0
        num = @Get_Functions_details0;
        c=0;
    case 14
        num = @CEC2014;
        c=30;
    case 17
        num = @CEC2017;
        c=30;
    case 19
        num = @CEC2019;
        c=10;
    case 20
        num = @CEC2020;
        c=10;
    case 21
        num = @CEC2021;
        c=10;
    case 22
        num = @CEC2022;
        c=12;
    case 30
        num = @Get_Functions_details30;
        c=23;
    case 50
        num = @Get_Functions_details50;
        c=23;
    case 100
        num = @Get_Functions_details100;
        c=23;
    case 200
        num = @Get_Functions_details200;
        c=23;
    case 500
        num = @Get_Functions_details500;
        c=23;
    case 1000
        num = @Get_Functions_details1000;
        c=23;
end
end


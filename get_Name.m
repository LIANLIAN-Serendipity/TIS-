function [Aobj] = get_Name(A)
switch A
    case 1
        Aobj = @TIS_LSHADE_SPACMA;
    case 2
        Aobj =@LSHADE_SPACMA
end
end


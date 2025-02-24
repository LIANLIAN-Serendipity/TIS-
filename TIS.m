function [m,person,personf,pop,popf,FES]=TIS(pmax,m,person,personf,pop,fobj,FES,lu,maxFEs)
i=1;
C=0.5;
    pop(pop>lu(2,:))=rand.*(lu(2,pop>lu(2,:)) - lu(1,pop>lu(2,:))) + lu(1,pop>lu(2,:));
    pop(pop<lu(1,:))=rand.*(lu(2,pop<lu(1,:)) - lu(1,pop<lu(1,:))) + lu(1,pop<lu(1,:));%召回
    popf=feval(fobj,pop(i,:));
    DOK1=C+(FES/maxFEs)^C;
    DOK2=FES^10;
    DOK=DOK1+DOK2;
    IE=person(1,:);
    IM=pi.*IE*rand;
    popnew(i,:)=tan(IM-0.5)*pi+(pop(i,:)./DOK+IE);   
    popnew(popnew>lu(2,:))=rand.*(lu(2,popnew>lu(2,:)) - lu(1,popnew>lu(2,:))) + lu(1,popnew>lu(2,:));
    popnew(popnew<lu(1,:))=rand.*(lu(2,popnew<lu(1,:)) - lu(1,popnew<lu(1,:))) + lu(1,popnew<lu(1,:));%召回
    popnewf=feval(fobj,popnew(i,:));
    FES=FES+1; 
if popnewf(i,1)<popf
    pop=popnew(i,:);
    popf=popnewf(i,1);
end
    person(m,:)=pop(1,:);
    personf(m,1)=popf(1,1);
end


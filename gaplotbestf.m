%%%%%%%%%%%%%%%%%%%%%%%%函数gaplotbestf%%%%%%%%%%%%%%%%%%%%%%%%%%
function state = gaplotbestf(options,state,flag)
    if size(state.Score,2)>1
        title('Best Fitness Plot:not avaliable','interp','none')
        return
end
switch flag
case 'init'
    hold on
    set(gca,'xlim',[0,options.Generations])
    xlabel('Generation','interp','none')
    ylabel('Fitness value','interp','none')
    plotBest=plot(state.Generation, min(state.Score),'.k')
    set(plotBest,'Tag','gaplotbestf')
    plotMean=plot(state.Generation,meanf(state.Score),'.b')
    set(plotMean,'Tag','gaplotmean')
    title(['Best:','Mean:'],'interp','none')
    case 'iter'
        best=min(state.Score)
        m=meanf(state.Score)
        plotBest=findobj(get(gca,'Children'),'Tag','gaplotbestf')
        plotMean=findobj(get(gca,'Children'),'Tag','gaplotmean')
        newX=[get(plotBest,'Xdata') state.Generation]
        newY=[get(plotBest,'Ydata') best]
        set(plotBest,'Xdata',newX,'Ydata',newY)
        newY=[get(plotMean,'Ydata') m]
        set(plotMean,'Xdata',newX,'Ydata',newY)
        set(get(gca,'Title'),'String',sprintf('Best: %g Mean: %g',best,m))
    case 'done'
        LegnD=legend('Best fitness','Mean fitness')
        set(LegnD,'FontSize',8)
        hold off
    end
    function m=meanf(x)
        nans=isnan(x)
        x(nans)=0
        n=sum(~nans)
        n(n==0)=NaN                  %告警
        m=sum(x)./n                  %求平均
%%%%%%%%%%%%%%%%%%%%%%%%%函数gaplotstopping%%%%%%%%%%%%%%%%%%%%%%%
function state =gaplotstopping(options,state,flag)
    CurrentGen=state.Generation
    stopCriteria(1)=CurrentGen/options.Generations
    stopString{1}='Generation'
    stopCriteria(2)=(cuptime-state.StartTime)/options.TimeLimit
    stopString{2}='Time'
    if isfield(state, 'LastImprovement')
        stopCriteria(3)=(CurrentGen-state.LastImprovement)/options.StallGenLimit
        stopString{3}='Stall(G)'
    end
    if isfield(state, 'LastImprovementTime')
        stopCriteria(4)=(cuptime-state.LastImprovementTime)/options.StallGenLimit
        stopString{4}='Stall(T)'
    end
    Ydata=100*stopCriteria
    switch flag
    case 'init'
        barh(Ydata,'Tag','gaplotstopping')
        set(gca,'xlim',[1,100],'yticklabel',stopString,'climmode','manual')
        xlabel('% of criteria met','interp','none')
        title('Stopping Criteria','interp','none')
    case 'iter'
        ch=findobj(get(gca,'Children'),'Tag','gaplotstopping')
        set(ch,'YData',ydata)
    end
        

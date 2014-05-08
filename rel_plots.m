% -------------------------------------------------------------------------
%
%   Plot changes.
%
% -------------------------------------------------------------------------



basechoice = qq(whichbase,1);
basechoicelabel = num2str(whichbase);

rangetmp = qq(whichstart,1):qq(whichend,4);


if(annual==1)
    basechoice = yy(whichbase);
    rangetmp =yy(whichstart):yy(whichend);
end



cpitmp_rel = 100*cpits/cpits(basechoice);

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% GDP
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if(annual==1)
    gdptmp = annualgdpts;
else
    gdptmp = gdpts;
end

basegdp=gdptmp{basechoice};
gdp_rel=100*gdptmp(rangetmp)/basegdp;
gdptmp_rel = tseries(rangetmp,gdp_rel);

figure;
plot(gdptmp_rel{rangetmp});
title('GDP')
saveas(gcf, strcat(picdirectory,whichdata,'-gdp-rel'), 'pdf')

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Consumption
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if(annual==1)
    constmp = annualconsts;
else
    constmp = consts;
end

basecons=constmp{basechoice};
cons_rel=100*constmp(rangetmp)/basecons;
constmp_rel = tseries(rangetmp,cons_rel);

figure;
plot(constmp_rel{rangetmp});
title('cons')
saveas(gcf, strcat(picdirectory,whichdata,'-cons-rel'), 'pdf')

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Investment
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if(annual==1)
    invtmp = annualinvts;
else
    invtmp = invts;
end

baseinv=invtmp{basechoice};
inv_rel=100*invtmp(rangetmp)/baseinv;
invtmp_rel = tseries(rangetmp,inv_rel);

figure;
plot(invtmp_rel{rangetmp});
title('inv')
saveas(gcf, strcat(picdirectory,whichdata,'-inv-rel'), 'pdf')

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Government consumption
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if(annual==1)
    govtmp = annualgovts;
else
    govtmp = govts;
end

basegov=govtmp{basechoice};
gov_rel=100*govtmp(rangetmp)/basegov;
govtmp_rel = tseries(rangetmp,gov_rel);

figure;
plot(govtmp_rel{rangetmp});
title('gov')
saveas(gcf, strcat(picdirectory,whichdata,'-gov-rel'), 'pdf')

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Employment
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


if(annual==1)
    empltmp = annualemplts;
    
else
    empltmp = emplts;
end

baseempl=empltmp{basechoice};
empl_rel=100*empltmp(rangetmp)/baseempl;
empltmp_rel = tseries(rangetmp,empl_rel);

figure;
plot(empltmp_rel{rangetmp});
title('empl')
saveas(gcf, strcat(picdirectory,whichdata,'-empl-rel'), 'pdf')





% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% GDP, Cons, Inv, Empl.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

figure;
plot(rangetmp,gdptmp_rel{rangetmp},'LineStyle','-','Color','b','LineWidth',1.75,'MarkerFaceColor','auto');
hold on
plot(rangetmp,constmp_rel{rangetmp},'LineStyle','-','Color','r','LineWidth',1.75,'Marker','o','MarkerFaceColor','r');
plot(rangetmp,invtmp_rel{rangetmp},'LineStyle','-','Color','g','LineWidth',1.75,'Marker','^','MarkerFaceColor','g');
plot(rangetmp,empltmp_rel{rangetmp},'LineStyle','-','Color','k','LineWidth',1.75,'Marker','x','MarkerFaceColor','k');

leg = legend('GDP','Consumption','Investment','Employment');
% set(leg,'Location','Best')
set(leg,'Location','SouthWest','FontSize',18);


% grid on
box off
set(gca,'XGrid','off','YGrid','on','ZGrid','off','FontSize',16);
%,'XTick',(round(rangetmp(1)):2:round(rangetmp(end))));
%set(gca,'XTickLabel',num2str(round(rangetmp(1)):2:round(rangetmp(end))));
ylabel(strcat(basechoicelabel,' = 100'))%,'FontSize',16)


saveas(gcf, strcat(picdirectory,whichdata,'-gdp-cons-inv-empl-rel'), 'pdf')
saveas(gcf, strcat(picdirectory,whichdata,'-gdp-cons-inv-empl-rel'), 'epsc')



% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% GDP, Cons, Gov, Inv, Empl.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

figure;
plot(rangetmp,gdptmp_rel{rangetmp},'LineStyle','-','Color','b','LineWidth',1.75,'MarkerFaceColor','auto');
hold on
plot(rangetmp,constmp_rel{rangetmp},'LineStyle','-','Color','r','LineWidth',1.75,'Marker','o','MarkerFaceColor','r');
plot(rangetmp,govtmp_rel{rangetmp},'LineStyle','--','Color','c','LineWidth',1.75,'Marker','d','MarkerFaceColor','c');
plot(rangetmp,invtmp_rel{rangetmp},'LineStyle','-','Color','g','LineWidth',1.75,'Marker','^','MarkerFaceColor','g');
plot(rangetmp,empltmp_rel{rangetmp},'LineStyle','-','Color','k','LineWidth',1.75,'Marker','x','MarkerFaceColor','k');

leg = legend('GDP','Consumption','Government Cons','Investment','Employment');
%set(leg,'Location','Best')

if(strcmp(which,'kp')==1)
    set(leg,'Location','Best','FontSize',18);

else
    set(leg,'Location','SouthWest','FontSize',18);
end

% grid on
box off
set(gca,'XGrid','off','YGrid','on','ZGrid','off','FontSize',16);
ylabel(strcat(basechoicelabel,' = 100'))%,'FontSize',16)
saveas(gcf, strcat(picdirectory,whichdata,'-gdp-cons-gov-inv-empl-rel'), 'pdf')
saveas(gcf, strcat(picdirectory,whichdata,'-gdp-cons-gov-inv-empl-rel'), 'epsc')



% % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% % CPI
% % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%
% cpits = tseries(rangetmp,cpi);
% figure;
% plot(cpits);
% title('CPI (2005=100)')
% saveas(gcf, strcat(picdirectory,'antti-cpi'), 'pdf')

% -------------------------------------------------------------------------
% 
%   Plot changes.
%
% -------------------------------------------------------------------------

basechoice = qq(1990,1);
basechoicelabel = '1990';

plotrangetmp = qq(1985,1):qq(1997,4);
rangetmp =range;

annual = 1;

if(annual==1)
    basechoice = yy(1990);
    plotrangetmp = yy(1985):yy(1997);
    rangetmp =yy(1975):yy(2011);
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
plot(gdptmp_rel{plotrangetmp});
title('GDP')
saveas(gcf, strcat(picdirectory,'antti-gdp-rel'), 'pdf')

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
plot(constmp_rel{plotrangetmp});
title('cons')
saveas(gcf, strcat(picdirectory,'antti-cons-rel'), 'pdf')

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
plot(invtmp_rel{plotrangetmp});
title('inv')
saveas(gcf, strcat(picdirectory,'antti-inv-rel'), 'pdf')

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
plot(govtmp_rel{plotrangetmp});
title('gov')
saveas(gcf, strcat(picdirectory,'antti-gov-rel'), 'pdf')

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
plot(empltmp_rel{plotrangetmp});
title('empl')
saveas(gcf, strcat(picdirectory,'antti-empl-rel'), 'pdf')



% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Bankruptcies.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if(annual==1)
    busttmp = annualbustts;

else
    busttmp = bustts;
end

basebust=busttmp{basechoice};
bust_rel=100*busttmp(rangetmp)/basebust;
busttmp_rel = tseries(rangetmp,bust_rel);

figure;
plot(plotrangetmp,busttmp_rel{plotrangetmp},'LineStyle','-','Color','b','LineWidth',1.75,'MarkerFaceColor','auto');
leg = legend('Bankruptcies');
% set(leg,'Location','Best')
set(leg,'Location','NorthWest','FontSize',18);% grid on
box off
set(gca,'XGrid','off','YGrid','on','ZGrid','off','FontSize',16);
ylabel(strcat(basechoicelabel,' = 100'))



saveas(gcf, strcat(picdirectory,'antti-bust-rel'), 'pdf')
saveas(gcf, strcat(picdirectory,'antti-bust-rel'), 'epsc')



% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% GDP, Cons, Inv, Empl.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

figure;
plot(plotrangetmp,gdptmp_rel{plotrangetmp},'LineStyle','-','Color','b','LineWidth',1.75,'MarkerFaceColor','auto');
hold on
plot(plotrangetmp,constmp_rel{plotrangetmp},'LineStyle','-','Color','r','LineWidth',1.75,'Marker','o','MarkerFaceColor','r');
plot(plotrangetmp,invtmp_rel{plotrangetmp},'LineStyle','-','Color','g','LineWidth',1.75,'Marker','^','MarkerFaceColor','g');
plot(plotrangetmp,empltmp_rel{plotrangetmp},'LineStyle','-','Color','k','LineWidth',1.75,'Marker','x','MarkerFaceColor','k');

leg = legend('GDP','Consumption','Investment','Employment');
% set(leg,'Location','Best')
set(leg,'Location','SouthWest','FontSize',18);


% grid on
box off
set(gca,'XGrid','off','YGrid','on','ZGrid','off','FontSize',16,'XTick',...
    (round(plotrangetmp(1)):2:round(plotrangetmp(end))));
%set(gca,'XTickLabel',num2str(round(plotrangetmp(1)):2:round(plotrangetmp(end)))); 
ylabel(strcat(basechoicelabel,' = 100'))%,'FontSize',16)


saveas(gcf, strcat(picdirectory,'antti-gdp-cons-inv-empl-rel'), 'pdf')
saveas(gcf, strcat(picdirectory,'antti-gdp-cons-inv-empl-rel'), 'epsc')



% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% GDP, Cons, Gov, Inv, Empl.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

figure;
plot(plotrangetmp,gdptmp_rel{plotrangetmp},'LineStyle','-','Color','b','LineWidth',1.75,'MarkerFaceColor','auto');
hold on
plot(plotrangetmp,constmp_rel{plotrangetmp},'LineStyle','-','Color','r','LineWidth',1.75,'Marker','o','MarkerFaceColor','r');
plot(plotrangetmp,govtmp_rel{plotrangetmp},'LineStyle','--','Color','c','LineWidth',1.75,'Marker','d','MarkerFaceColor','c');
plot(plotrangetmp,invtmp_rel{plotrangetmp},'LineStyle','-','Color','g','LineWidth',1.75,'Marker','^','MarkerFaceColor','g');
plot(plotrangetmp,empltmp_rel{plotrangetmp},'LineStyle','-','Color','k','LineWidth',1.75,'Marker','x','MarkerFaceColor','k');

leg = legend('GDP','Consumption','Government Cons','Investment','Employment');
% set(leg,'Location','Best')
set(leg,'Location','SouthWest','FontSize',18);


% grid on
box off
set(gca,'XGrid','off','YGrid','on','ZGrid','off','FontSize',16);
ylabel(strcat(basechoicelabel,' = 100'))%,'FontSize',16)
saveas(gcf, strcat(picdirectory,'antti-gdp-cons-gov-inv-empl-rel'), 'pdf')
saveas(gcf, strcat(picdirectory,'antti-gdp-cons-gov-inv-empl-rel'), 'epsc')



% % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% % CPI
% % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% 
% cpits = tseries(rangetmp,cpi);
% figure;
% plot(cpits);
% title('CPI (2005=100)')
% saveas(gcf, strcat(picdirectory,'antti-cpi'), 'pdf')

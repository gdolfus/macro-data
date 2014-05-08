% -------------------------------------------------------------------------
% 
%   HP-filter the series.
%
% -------------------------------------------------------------------------

hpzeroline = tseries(range,zeros(length(range)));


tmpgdp = gdpts;
tmpcons = consts;
tmpgov = govts;
tmpinv = invts;


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% GDP
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[hpgdp,hptrend] = hpfast(log(tmpgdp),1600);
hpgdpts = tseries(range,hpgdp);
figure;
plot(hpgdpts);
hold on;
plot(hpzeroline,'k-');
title('GDP');
saveas(gcf, strcat(picdirectory,whichdata,'-gdp-hp'), 'pdf');

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Consumption
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
[hpcons,hptrend] = hpfast(log(tmpcons),1600);
hpconsts = tseries(range,hpcons);
figure;
plot(hpconsts,'r');
hold on
plot(hpzeroline,'k-');
title('Private Consumption');
saveas(gcf, strcat(picdirectory,whichdata,'-cons-hp'), 'pdf');

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Investment
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
[hpinv,hptrend] = hpfast(log(tmpinv),1600);
hpinvts = tseries(range,hpinv);
hpinvts = hpinvts{range};
figure;
plot(hpinvts,'k');hold on;
plot(hpzeroline,'k-');
title('Investment');
saveas(gcf, strcat(picdirectory,whichdata,'-inv-hp'), 'pdf');

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Government expenditure
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
[hpgov,hptrend] = hpfast(log(tmpgov),1600);
hpgovts = tseries(range,hpgov);
figure;
plot(hpgovts,'g');
hold on;
plot(hpzeroline,'k-');
title('Government Consumption');
saveas(gcf, strcat(picdirectory,whichdata,'-gov-hp'), 'pdf');

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Employment
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% emplts = tseries(range,empl);
% figure;
% plot(emplts);
% title(' Employment (Thousands of Persons)')
% % saveas(gcf, 'pics/6C-second'), 'pdf')
% 



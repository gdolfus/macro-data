% -------------------------------------------------------------------------
% 
%   Plot the raw data.
%
% -------------------------------------------------------------------------


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% GDP
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


figure;
plot(gdpts);
title('GDP')
saveas(gcf, strcat(picdirectory,'antti-gdp'), 'pdf')

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Consumption
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
figure;
plot(consts,'r');
title('Private Consumption')
saveas(gcf, strcat(picdirectory,'antti-cons'), 'pdf')



% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% GDP and Consumption
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

figure;
plot(gdpts);
hold on
plot(consts,'r--');
leg = legend('GDP','Private Consumption');
% set(leg,'Location','Best')
set(leg,'Location','NorthWest')
grid on
set(gca,'XGrid','off','YGrid','on','ZGrid','off')
saveas(gcf, strcat(picdirectory,'antti-gdp-cons'), 'pdf')
saveas(gcf, strcat(picdirectory,'antti-gdp-cons'), 'epsc')


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Investment
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

figure;
plot(invts,'k');
title('Investment')
saveas(gcf, strcat(picdirectory,'antti-inv'), 'pdf')

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Government consumption
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
figure;
plot(govts,'g');
title('Government Consumption')
saveas(gcf, strcat(picdirectory,'antti-gov'), 'pdf')

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Investment and government consumption
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
figure;
plot(invts);
hold on
plot(govts,'r--');
leg = legend('Investment','Government Consumption');
set(leg,'Location','Best')
grid on
set(gca,'XGrid','off','YGrid','on','ZGrid','off')
saveas(gcf, strcat(picdirectory,'antti-inv-gov'), 'pdf')
saveas(gcf, strcat(picdirectory,'antti-inv-gov'), 'epsc')


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Employment
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

figure;
plot(emplts);
title('Employment (Thousands of Persons)')
grid on
set(gca,'XGrid','off','YGrid','on','ZGrid','off')
saveas(gcf, strcat(picdirectory,'antti-empl'), 'pdf')
saveas(gcf, strcat(picdirectory,'antti-empl'), 'epsc')


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% CPI
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

figure;
plot(cpits);
title('CPI (2005=100)')
saveas(gcf, strcat(picdirectory,'antti-cpi'), 'pdf')

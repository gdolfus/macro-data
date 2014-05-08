

% -------------------------------------------------------------------------
% 
%   Split the series into a (log)linear trend and the residuals.
%
%   Split the sample to pre and post 1990s depression.
%
% -------------------------------------------------------------------------


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%   Estimate ln(X_t) = a_x + g_x*t + x_tilde_t.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


logy = log(tmp_raw_series);

N = length(logy);
x = 1:N;
x = x';
X = [ones(N,1) x];

b = X\logy;

lintrend = b(2).*x;
lintrend_ts = tseries(range,lintrend);

residuals = logy-b(1)-lintrend;
residuals_ts = tseries(range,residuals);

zeroline = zeros(length(range),1);
zerots = tseries(range,zeroline);

logy_ts = tseries(range,logy); 

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Plot the linear trend along with the (log of the) original series.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


figure;
% plot(logy_ts,'b--');
% hold on;
% plot(b(1)+lintrend_ts,'r');
% legend('Log of Original Series','Linear Trend');
% title('GDP')
% saveas(gcf, strcat(picdirectory,'antti-gdp-trend'), 'pdf')
% 

plot(range,logy_ts,'LineStyle','-','Color','b','LineWidth',1.75,'MarkerFaceColor','auto');
hold on
plot(range,b(1)+lintrend_ts,'LineStyle','-','Color','r','LineWidth',1.75);%,'Marker','o','MarkerFaceColor','r');

leg = legend('Log of GDP','Linear Trend');
% set(leg,'Location','Best')
set(leg,'Location','NorthWest','FontSize',18);
% grid on
box off
set(gca,'XGrid','off','YGrid','on','ZGrid','off','FontSize',16)
saveas(gcf, strcat(picdirectory,whichdata,'-gdp-trend'), 'pdf')
saveas(gcf, strcat(picdirectory,whichdata,'-gdp-trend'), 'epsc')




% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Plot the residuals.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

figure;
plot(range,residuals_ts);
legend('Residuals');
title('GDP')
hold on;
plot(zerots,'k--');
saveas(gcf, strcat(picdirectory,whichdata,'-gdp-res'), 'pdf')

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Split it into the time before and after the recession.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


range_pre_1990s = qq(1975,1):qq(1991,1);

logy_ts = tseries(range,logy);
logy_ts_pre = logy_ts{range_pre_1990s};

N = length(logy_ts_pre);
x = 1:N;
x = x';
X = [ones(N,1) x];

b = X\logy_ts_pre;


lintrend = b(2).*x;
lintrend_ts = tseries(range_pre_1990s,lintrend);

residuals = logy_ts_pre-b(1)-lintrend_ts;

zeroline = zeros(length(range_pre_1990s),1);
zerots = tseries(range_pre_1990s,zeroline);

figure;
plot(logy_ts_pre,'b--');
hold on;
plot(b(1)+lintrend_ts,'r');
legend('Log of Original Series','Linear Time Trend');
saveas(gcf, strcat(picdirectory,whichdata,'-gdp-trend-pres'), 'pdf')

figure;
plot(range_pre_1990s,residuals);
legend('Residuals');
hold on;
plot(zerots,'k--');
saveas(gcf, strcat(picdirectory,whichdata,'-gdp-res-pre'), 'pdf')


range_post_1990s = qq(1991,2):qq(2011,1);

logy_ts = tseries(range,logy);
logy_ts_post = logy_ts{range_post_1990s};

N = length(logy_ts_post);
x = 1:N;
x = x';
X = [ones(N,1) x];

b = X\logy_ts_post;

lintrend = b(2).*x;
lintrend_ts = tseries(range_post_1990s,lintrend);

residuals = logy_ts_post-b(1)-lintrend_ts;

zeroline = zeros(length(range_post_1990s),1);
zerots = tseries(range_post_1990s,zeroline);

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Plot the linear trend.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

figure;
plot(logy_ts_post,'b--');
hold on;
plot(b(1)+lintrend_ts,'r');
legend('Log of Original Series','Linear Time Trend');
saveas(gcf, strcat(picdirectory,whichdata,'-gdp-trend-pre'), 'pdf')

figure;
plot(range_post_1990s,residuals);
legend('Residuals');
hold on;
plot(zerots,'k--');
saveas(gcf, strcat(picdirectory,whichdata,'-gdp-trend-post'), 'pdf')



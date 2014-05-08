%   Gero Dolfus
%   University of Helsinki, HECER
%   Start: May 2013.
%
%   Based on homework 6 for Econ 8185 Quantitative Macro, Fall of 2012,
%   Rios-Rull.
%

% =========================================================================



clear;clc;close all;

picdirectory = '~/RRR_finn/pics/';

which = 'us';

if(strcmp(which,'fin')==1)
    
    datadirectory = '~/RRR_finn/data/antti/';
    datadirectory2 = '~/RRR_finn/data/statfin/national/';
    
    % Set the name of the pictures.
    whichdata = 'antti';
    
    
    % Choose options for relative plots.
    
    % Base year for plots.
    whichbase = 1990;
    % Time range for plots.
    whichstartplot = 1985;
    whichendplot = 1997;
    % Time range for data.
    whichstart = 1975;
    whichend =2011;
    % Flag for using annual data.
    annual = 1;
    
end

if(strcmp(which,'us')==1)
    
    datadirectory = '~/RRR_finn/data/fred/';
    
    
    % Set the name of the pictures.
    whichdata = 'fred';
    
    
    % Choose options for relative plots.
    
    % Base year for plots.
    whichbase = 2007;
    % Time range for plots.
    whichstartplot = 2003;
    whichendplot = 2014;
    % Time range for data.
    whichstart = 1975;
    whichend =2011;
    % Flag for using annual data.
    annual = 1;
    
end



if(strcmp(which,'us-vintage')==1)
    
    datadirectory = '~/RRR_finn/data/kehoeprescott/';
    
    
    % Set the name of the pictures.
    whichdata = 'kp';
    
    
    % Choose options for relative plots.
    
    % Base year for plots.
    whichbase = 2007;
    % Time range for plots.
    whichstartplot = 2003;
    whichendplot = 2014;
    % Time range for data.
    whichstart = 1975;
    whichend =2011;
    % Flag for using annual data.
    annual = 1;
    
end

% -------------------------------------------------------------------------
%
%   Use Iristoolbox to create nice pictures.
%
% -------------------------------------------------------------------------

irisstartup;

% -------------------------------------------------------------------------
%
%   Read data.
%
% -------------------------------------------------------------------------

if(strcmp(which,'fin')==1)
    
    % Finnish data.
    data = csvread(strcat(datadirectory,'Data2Gero.csv'),1,4);
    gdp = data(:,1);
    cons = data(:,2);
    % Antti on the difference b/w this series and the series that e.g.
    % Gorodnichenko et al. (2012) use.
    % The consumption difference might bue due to the updated consumption figures.
    % They added consumption of financial services, called FISIM.
    % It is based on the interest rate spreads that were high in early 1990s.
    % The reference series is probably old vintage.
    gov = data(:,3);
    empl = data(:,4);
    cpi = data(:,5);
    
    data2 = csvread(strcat(datadirectory,'Data2Gero_2nd_sheet.csv'),1,1);
    inv = data2(7,:);
    
end

if(strcmp(which,'us')==1)
    
    % US data.
    % The FRED xls sheets need to be converted to Excel 95 format for
    % xlsread to work. See
    % http://www.mathworks.com/matlabcentral/newsreader/view_thread/30158
    
    gdp = xlsread(strcat(datadirectory,'fredgraph_us_gdp.xls'));
    cons = xlsread(strcat(datadirectory,'fredgraph_us_con.xls'));
    inv = xlsread(strcat(datadirectory,'fredgraph_us_inv.xls'));
    empl = xlsread(strcat(datadirectory,'fredgraph_us_emp.xls'));
    cpi = xlsread(strcat(datadirectory,'fredgraph_us_cpi.xls'));
    gov = xlsread(strcat(datadirectory,'fredgraph_us_gov.xls'));
    
    
    gdp=gdp(:,2);
    cons=cons(:,2);
    inv=inv(:,2);
    empl=empl(:,2);
    cpi=cpi(:,2);
    gov=gov(:,2);
end

% -------------------------------------------------------------------------
%
%   Make them time series objects with Iristoolbox.
%
% -------------------------------------------------------------------------



if(strcmp(which,'fin')==1)
    % Define the ranges.
    range = qq(1975,1):qq(2011,1);
    % The range for the investment is longer.
    range2 = qq(1960,1):qq(2011,3);
    % The range for the bankruptcy data.
    range3 = mm(1986,1):mm(2013,4);
    
end

if(strcmp(which,'us')==1)
    
    
    range = qq(1947,1):qq(2014,1);
    
    
end




gdpts = tseries(range,gdp);
consts = tseries(range,cons);
govts = tseries(range,gov);
cpits = tseries(range,cpi);

if(strcmp(which,'fin')==1)
    invts = tseries(range2,inv);
    invts = invts{range};
    emplts = tseries(range,empl);

else
    invts = tseries(range,inv);
    emplts = tseries(qq(1939,1):qq(2014,1),empl);
    emplts = emplts{range};
end





annualgdpts = convert(gdpts,'y',range,'method',@mean);
annualconsts = convert(consts,'y',range,'method',@mean);
annualinvts=convert(invts,'y',range,'method',@mean);
annualgovts=convert(govts,'y',range,'method',@mean);
annualemplts=convert(emplts,'y',range,'method',@mean);


% -------------------------------------------------------------------------
%
%   Plot the raw data.
%
% -------------------------------------------------------------------------

close all;

run raw_plots



% -------------------------------------------------------------------------
%
%   Relative to year X.
%
% -------------------------------------------------------------------------

close all;

run rel_plots


% -------------------------------------------------------------------------
%
%   Split the a series into a (log)linear trend and the residuals.
%
% -------------------------------------------------------------------------

tmp_raw_series = gdp;

close all;

run trend_plots


% -------------------------------------------------------------------------
%
%   HP filter series.
%
% -------------------------------------------------------------------------

% Add the path where the function for the HP filter is located.
addpath ~/stuffialwaysneed/matlab



close all;

run hp_plots




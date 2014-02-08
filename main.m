clc
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
datadirectory = '~/RRR_finn/data/antti/';
datadirectory2 = '~/RRR_finn/data/statfin/national/';


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

data = csvread(strcat(datadirectory,'Data2Gero.csv'),1,4);
gdp = data(:,1);
cons = data(:,2);
% Antti on the difference b/w this series and the series that e.g.
% Gorodnichenko et al. (2012) use.
% The consumption difference might bue due to the updated consumption figures.
% They added consumption of financial services, called FISIM. 
% It is based on the interst rate sprads that were high in early 1990s. 
% The reference series is probably old vintage.
gov = data(:,3);
empl = data(:,4);
cpi = data(:,5);

data2 = csvread(strcat(datadirectory,'Data2Gero_2nd_sheet.csv'),1,1);
inv = data2(7,:);

data3 = csvread(strcat(datadirectory2,'fin_bankruptcies.csv'),1,0);
bust = data3(:,2);


% -------------------------------------------------------------------------
% 
%   Make them time series objects with Iristoolbox.
%
% -------------------------------------------------------------------------

% Define the ranges.
range = qq(1975,1):qq(2011,1);
% The range for the investment is longer.
range2 = qq(1960,1):qq(2011,3);
% The range for the bankruptcy data.
range3 = mm(1986,1):mm(2013,4);


gdpts = tseries(range,gdp);
consts = tseries(range,cons);
invts = tseries(range2,inv);
invts = invts{range};
govts = tseries(range,gov);
emplts = tseries(range,empl);
cpits = tseries(range,cpi);
bustts = tseries(range3,bust);
bustts = convert(bustts,'q');
bustts = bustts{range};



annualgdpts = convert(gdpts,'y',range,'method',@mean);
annualconsts = convert(consts,'y',range,'method',@mean);
annualinvts=convert(invts,'y',range,'method',@mean);
annualgovts=convert(govts,'y',range,'method',@mean);
annualemplts=convert(emplts,'y',range,'method',@mean);
annualbustts=convert(bustts,'y',range,'method',@mean);


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




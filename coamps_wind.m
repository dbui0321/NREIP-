function [jd_wind, u_wind, v_wind]=coamps_wind
% coamps_wind.m  A function to load wind data from the COAMPS model.

% C. Sullivan 11/29/04, this mfile calls julian.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use of this program is described in:
%
% Sullivan, C.M., Warner, J.C., Martini, M.A., Voulgaris, G., 
% Work, P.A., Haas, K.A., and Hanes, D.H. (2006) 
% South Carolina Coastal Erosion Study Data Report for Observations
% October 2003 - April 2004., USGS Open-File Report 2005-1429.
%
% Program written in Matlab v7.1.0 SP3
% Program ran on PC with Windows XP Professional OS.
%
% "Although this program has been used by the USGS, no warranty, 
% expressed or implied, is made by the USGS or the United States 
% Government as to the accuracy and functioning of the program 
% and related program material nor shall the fact of distribution 
% constitute any such warranty, and no responsibility is assumed 
% by the USGS in connection therewith."
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

windDirectory='E:\CSULLIVAN\SOUTH_CAROLINA\DATAFILES\WIND\COAMPS';
%plotDirectory='E:\CSULLIVAN\SOUTH_CAROLINA\PLOTS\MET';

% load the data
data=load(fullfile(windDirectory,'v2roms.dat'));

YYYY=floor(data(:,1)/10000);
MM=floor((data(:,1)-YYYY*10000)/100);
DD=floor(data(:,1)-YYYY*10000-MM*100);
hh=data(:,2);
mm=zeros(size(hh));
ss=zeros(size(hh));

jd_wind = julian([YYYY,MM,DD,hh,mm,ss]); %time in datenum format

u_wind=data(:,3);
v_wind=data(:,4);


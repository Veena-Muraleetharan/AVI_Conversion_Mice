%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% README
%
% author: Jantine Broek, Veena Muraleetharan
% e-mail: jantine.broek@yale.edu
% date: May 2017
% for: McCormick lab, Yale University, New Haven, USA
%
%
% Pre-req:
%           ffmpeg        - converts video files
%
% Experimental set-up:
%            mice         - The mice are head-fixed and run on a wheel
%                           while recordings are taken.
%
%            camera       - Frame rate of the camera is 30Hz.
%
%            calibration  - An image of a ruler is taken with the camera in
%                           order to know the mm/pixel conversion. 
%
%            normalization- For every session, pupil measurements are normalized
%                           to the frame when the pupil is maximally
%                           dilated, which is always when the mouse is
%                           running. Pupil size = 1 correspond to its
%                           maximaly dilated state.
%
%            eye movement - This is minimal in head-fixed mice. 
%
% Goal:
%           
%
%
% Input:
%           .avi file
%
%
% Manual input:
%           filepath - indicated in "Load Data" section
%           vidfilename - entered in the load data section, name of the avi
%                       video data
%           matfilename - entered in the load data section, specifies name
%                       of the mat file that contains the channel data
%           channel - specifies the channel that contains the times of each
%                     frame
%
%
% Output:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load data
cd D:\Jantine\06_15_b
yourFolder = 'D:\Jantine\06_15_b';
addpath(yourFolder);
vidfilename = 'pjs_06_15_b.avi0.avi';
matfilename = '06_15_b.mat';
channel = pjs_06_15_b_Ch5;

ffmpegFolder = 'D:\Jantine\ffmpeg-r8';
outputfile = 'pjs_06_15_b.mp4'



%load the channel data
load(matfilename);
times = channel.times;

%calculate total frames
total_frames = channel.length;
total_time_diff = 0;

%calculate total time difference
for x = 1:total_frames-1
    total_time_diff = total_time_diff + times(x+1) - times(x);  
end
%gives time per frame
avg_timediff = total_time_diff/x;

%calculates frame rate in frames per second
fs = 1/avg_timediff;

%change to directory to that of ffmpeg
addpath(ffmpegFolder);

%convert avi to mp4 file
ffmpegtranscode(vidfilename, outputfile , 'InputFrameRate', fs); 

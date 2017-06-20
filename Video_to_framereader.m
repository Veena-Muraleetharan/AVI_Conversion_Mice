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
%           AVI_to_mp4    - avi files must be converted to mp4 files using
%                           this script
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
%           .mp4 file
%
%
% Manual input:
%           filepath - indicated in "Load Data" section
%           filename - entered in the load data section
%
%
% Output:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load data
cd D:\Jantine\06_15_b
yourFolder = 'D:\Jantine\06_15_b';
addpath(yourFolder);
filename = 'pjs_06_15_b.mp4';
outputfile = 'pjs_06_15_b.mat';

%loads the video file
v = VideoReader(filename);
%calculates frame height and width 
h = v.Height;
w = v.Width;

%counter for frames
k = 1;
%constructs array for frame data
mov = struct('cdata',zeros(h,w,3,'uint8'),...
    'colormap',[]);

%works through video file, reading each file into the array, mov.
while hasFrame(v)
    mov(k).cdata= readFrame(v);
    k = k+1; 
end

frame_total = k;

save(outputfile, 'mov');



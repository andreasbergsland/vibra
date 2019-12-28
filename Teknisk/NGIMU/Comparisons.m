% Load data from QTM-files
load('/Users/andber/Desktop/VIBRA/Teknisk/NGIMU/MATLAB/NGIMU-test/6DOF-OptiTrack_circles_1.mat');
load('/Users/andber/Desktop/VIBRA/Teknisk/NGIMU/MATLAB/NGIMU-test/6DOF-OptiTrack_circles_2.mat');
load('/Users/andber/Desktop/VIBRA/Teknisk/NGIMU/MATLAB/NGIMU-test/6DOF-OptiTrack_circles3.mat');
load('/Users/andber/Desktop/VIBRA/Teknisk/NGIMU/MATLAB/NGIMU-test/6DOF-OptiTrack_free_1.mat');
load('/Users/andber/Desktop/VIBRA/Teknisk/NGIMU/MATLAB/NGIMU-test/6DOF-OptiTrack_free_2.mat');
%Load data from NGIMU-recordings
NGIMU_Circles1 = dlmread("/Users/andber/Desktop/VIBRA/Teknisk/NGIMU/NGIMU_recordings/NGIMU_take1_circles.txt");
NGIMU_Circles2 = dlmread("/Users/andber/Desktop/VIBRA/Teknisk/NGIMU/NGIMU_recordings/NGIMU_take2_circles.txt");
NGIMU_Circles3 = dlmread("/Users/andber/Desktop/VIBRA/Teknisk/NGIMU/NGIMU_recordings/NGIMU_take3_circles.txt");
NGIMU_Free1 = dlmread("/Users/andber/Desktop/VIBRA/Teknisk/NGIMU/NGIMU_recordings/NGIMU_free_1.txt");
NGIMU_Free2 = dlmread("/Users/andber/Desktop/VIBRA/Teknisk/NGIMU/NGIMU_recordings/NGIMU_free_2.txt");
%Get rid of unused dimensions
Circles3_Roll= squeeze(qtm_6DOF_OptiTrack_circles3.RigidBodies.RPYs(2,1,:));
Circles3_Pitch= squeeze(qtm_6DOF_OptiTrack_circles3.RigidBodies.RPYs(2,2,:));
Circles3_Yaw= squeeze(qtm_6DOF_OptiTrack_circles3.RigidBodies.RPYs(2,3,:));  




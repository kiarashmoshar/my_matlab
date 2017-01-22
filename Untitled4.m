%% Face Detection and Tracking Using the KLT Algorithm
% This example shows how to automatically detect and track a face using
% feature points. The approach in this example keeps track of the face even
% when the person tilts his or her head, or moves toward or away from the
% camera.
%
%   Copyright 2014 The MathWorks, Inc.

%% Introduction
% Object detection and tracking are important in many computer vision
% applications including activity recognition, automotive safety, and
% surveillance. In this example, you will develop a simple face tracking
% system by dividing the tracking problem into three parts:   
% 
% # Detect a face
% # Identify facial features to track 
% # Track the face

%% Detect a Face
% First, you must detect the face. Use the |vision.CascadeObjectDetector|
% System object(TM) to detect the location of a face in a video frame. The
% cascade object detector uses the Viola-Jones detection algorithm and a
% trained classification model for detection. By default, the detector is
% configured to detect faces, but it can be used to detect other types of
% objects. 

% Create a cascade detector object.
faceDetector = vision.CascadeObjectDetector();

% Read a video frame and run the face detector.
videoFileReader = vision.VideoFileReader('tilted_face.avi');
videoFrame      = step(videoFileReader);
bbox            = step(faceDetector, videoFrame);

% Draw the returned bounding box around the detected face.
videoFrame = insertShape(videoFrame, 'Rectangle', bbox);
figure; imshow(videoFrame); title('Detected face');

% Convert the first box into a list of 4 points
% This is needed to be able to visualize the rotation of the object.
bboxPoints = bbox2points(bbox(1, :));
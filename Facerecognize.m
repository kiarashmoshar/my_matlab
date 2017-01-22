function Facerecognize(x)
   faceDetector = vision.CascadeObjectDetector;
%     I = imread('D:\MATLAB\toolbox\vision\visiondata\kia1.jpg');
%         bboxes = step(faceDetector, I);
%          IFaces = insertObjectAnnotation(I, 'rectangle', bboxes, 'Face');
%    figure, imshow(IFaces), title('Detected faces');

 dataDir = fullfile(toolboxdir('vision'),'visiondata','facescrop');
  facescrop = imageSet(dataDir);
   thumbnailGallery = [];
    for i = 1:facescrop.Count
        I = read(facescrop, i);
          bboxes = step(faceDetector, I);
          IFaces = insertObjectAnnotation(I, 'rectangle', bboxes, 'Face');
        %  figure, imshow(IFaces), title('Detected faces');
        thumbnail = imresize(IFaces, [300 300]);
        thumbnailGallery = cat(4, thumbnailGallery, thumbnail);
    end

    figure
    montage(thumbnailGallery);
     imageIndex = indexImages(facescrop,'Verbose',false);
     queryDir = fullfile(dataDir,'queries',filesep);
     
  queryImage = imread([queryDir x]);
  bboxes1 = step(faceDetector,queryImage);
  IFaces1 = insertObjectAnnotation(queryImage, 'rectangle', bboxes1, 'Face');
  imageIDs = retrieveImages(queryImage, imageIndex);
  bestMatch = imageIDs(1);
  bestImage = imread(imageIndex.ImageLocation{bestMatch});
   bboxes2 = step(faceDetector,bestImage);
   IFaces2 = insertObjectAnnotation(bestImage, 'rectangle', bboxes2, 'Face');
  figure
  imshowpair(IFaces1,IFaces2,'montage')
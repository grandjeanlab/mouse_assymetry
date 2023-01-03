## function that takes values and project them toa 3d atlas
project2atlas <- function(roi_set,AI_g,AI_sign,atlas='/groupshare/traaffneu/preclinimg/templates/DSURQE/DSURQE_40micron_labels.nii.gz'){

  library(RNifti) 
  atlas_img<-readNifti(atlas)
  atlas_empty<-atlas_img
  atlas_empty[,,]<-0
  roi_set<-roi_set %>% as_tibble
  
  if(any(AI_sign)){
    roi_set$g<-AI_g
    roi_set$sign<-AI_sign
    roi_set<-roi_set[roi_set$sign==1,] 
    
    #for every sign=True roi, we find the index of the ROI in the atlas and give the voxels the value of g
    for(i in 1:dim(roi_set)[1]){
      vox_id<-which(atlas_img==roi_set$value[i])
      atlas_empty[vox_id]<-roi_set$g[i]
    }
  } 
  
  return(atlas_empty)
  
  # for unit test 
  #roi_set <- roi_merge[right_select,]
  #AI_g<-AI_hedges_g[right_select]
  #AI_sign<-AI_hedges_sign[right_select]
  
  
}
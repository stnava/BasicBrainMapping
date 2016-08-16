#!/bin/bash
dim=3 # image dimensionality
AP="" # /home/yourself/code/ANTS/bin/bin/  # path to ANTs binaries
ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=4  # controls multi-threading
export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS
nm=BBM_Lesion
echo Users should consider doing affine registration without the mask
echo and deformable registration with the mask
ImageMath 3 data/neg_lesion2.nii.gz Neg data/LesionMap.nii.gz
antsRegistrationSyNQuick.sh -d 3 -m data/IXI/T_template2.nii.gz \
  -f data/T1_with_lesion.nii.gz -t s -o ${nm}_diff -x data/neg_lesion2.nii.gz
CreateJacobianDeterminantImage 3 ${nm}_diff1Warp.nii.gz jacobian.nii.gz 1
CreateWarpedGridImage 3 ${nm}_diff1Warp.nii.gz grid.nii.gz 1x0x1 10x10x10 3x3x3

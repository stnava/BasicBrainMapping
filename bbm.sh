#!/bin/bash
dim=3 # image dimensionality
AP="" # /home/yourself/code/ANTS/bin/bin/  # path to ANTs binaries
ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=4  # controls multi-threading
export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS
nm=BBM_Lesion
echo Users should consider doing affine registration without the mask
echo and deformable registration with the mask
MultiplyImages 3 data/IXI594-Guys-1089-T1.nii.gz data/neg_lesion.nii.gz  data/T1_lesioned.nii.gz
antsRegistrationSyNQuick.sh -d 3 -f data/IXI/T_template2.nii.gz \
  -m data/T1_lesioned.nii.gz -t s -o ${nm}_diff -x data/neg_lesion.nii.gz
rm grid.nii.gz jacobian.nii.gz
CreateJacobianDeterminantImage 3 ${nm}_diff1Warp.nii.gz jacobian.nii.gz 1
CreateWarpedGridImage 3 ${nm}_diff1Warp.nii.gz grid.nii.gz 1x0x1 10x10x10 3x3x3

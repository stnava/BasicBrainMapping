#!/usr/bin/env Rscript
library( ANTsR )
lesion = antsImageRead( "data/LesionMap.nii.gz") %>%
  iMath( "MD", 15 ) # make it larger for more dramatic effect
negLesion = -lesion
f = antsImageRead( "data/T1_with_lesion.nii.gz" )
m = antsImageRead( "data/IXI/T_template2.nii.gz" )
areg = antsRegistration( f, m, mask=negLesion, typeofTransform="SyN",
  regIterations = c(100,100,40,0), verbose=T ) # change iterations
jac = createJacobianDeterminantImage( f, areg$fwdtransforms[1] )
grid = createWarpedGrid( m, gridStep = 10, gridWidth = 2,
  gridDirections = c(T,F,T), fixedReferenceImage = f,
  transform = areg$fwdtransforms )
antsImageWrite( jac , '/tmp/jac.nii.gz' )
antsImageWrite( grid , '/tmp/grid.nii.gz' )
# CreateJacobianDeterminantImage 3 ${nm}_diff1Warp.nii.gz jacobian.nii.gz 1
# CreateWarpedGridImage 3 ${nm}_diff1Warp.nii.gz grid.nii.gz 1x0x1 10x10x10 3x3x3

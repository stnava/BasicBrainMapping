BasicBrainMapping
=================

A simple and "fast" brain registration example

We use a brain mask to restrict the registration focus

Similar strategies may be used for brains with missing data e.g. lesions

Both cases are illustrated in this [example script](https://github.com/stnava/BasicBrainMapping/blob/master/bbm.sh).

From within the directory, do:

```sh
 bash bbm.sh data/IXI/T_template2.nii.gz data/IXI594-Guys-1089-T1.nii.gz data/neg_lesion.nii.gz 
```

![T1_lesioned](https://raw.github.com/stnava/BasicBrainMapping/master/T1_lesioned.jpg?raw=true)
![Template2T1_lesioned](https://raw.github.com/stnava/BasicBrainMapping/master/Template2T1_lesioned.jpg?raw=true)

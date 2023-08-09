template='/home/gjoanes/code/mouse_assymetry/asset/DSURQE_40micron_brain.nii.gz'
overlay='/home/gjoanes/code/mouse_assymetry/asset/nifti/relative_Cluster2_right.nii.gz'
outputdir='/home/gjoanes/code/mouse_assymetry/asset/figure/'
filename='Fig_Cluster_2_vox'
color='cassatt2'

import gl

gl.resetdefaults()
gl.loadimage(template)
gl.minmax(0, 500, 1500)
gl.overlayload(overlay)
gl.overlayloadsmooth(1)
gl.minmax(1, -0.5, 0.5)
gl.colorname (1,color)
gl.colorbarposition(0)
gl.shadername('Standard')
gl.shaderadjust('surfaceColor', 0.5)
gl.backcolor(255, 255,255)
gl.shaderadjust('overlayDepth', 0.3)
gl.shaderadjust('overlayFuzzy', 0.4)
gl.zerointensityinvisible(1,1)
gl.cutout(0.5,0,0,0,1,1)

gl.azimuthelevation(-110, 5)
gl.savebmp(outputdir+'/'+filename+'_r.png')

gl.azimuthelevation(90, 5)
gl.savebmp(outputdir+'/'+filename+'_l.png')

gl.azimuthelevation(90, 90)
gl.savebmp(outputdir+'/'+filename+'_s.png')


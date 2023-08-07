#ugly and quick bash script to get center of gravity for the DSURQE rois
labels='/project/4180000.34/DSURQE_40micron_labels.nii.gz'

for i in $(seq 1 357); do
    echo $i
    fslmaths ${labels} -thr $i -uthr $i -bin tmp.nii.gz
    tmp=$(cluster -i tmp.nii.gz -t 1 --mm)
    echo $tmp | tr "(mm)" "\n" >> tmp1
    IFS=' ' read -ra ADDR <<< $(tail -n 1 tmp1)
    echo "${ADDR[7]}" >> COG_y
    rm tmp1
    rm tmp.nii.gz
done





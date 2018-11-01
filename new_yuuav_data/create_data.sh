root_dir=$CAFFEROOT

dir="/Users/mason/Desktop/new_yuuav_data"

redo=1
data_root_dir="$dir/devkit"
dataset_name="yuuav"
#mapfile="$root_dir/data/$dataset_name/labelmap_voc.prototxt"
mapfile="$dir/labelmap_yuuav.prototxt"
echo $mapfile
anno_type="detection"
db="lmdb"
min_dim=0
max_dim=0
width=0
height=0

extra_cmd="--encode-type=png --encoded"
if [ $redo ]
then
	extra_cmd="$extra_cmd --redo"
fi
for subset in test trainval
do
	echo $root_dir/scripts/
	python $root_dir/scripts/create_annoset.py --anno-type=$anno_type --label-map-file=$mapfile --min-dim=$min_dim --max-dim=$max_dim --resize-width=$width --resize-height=$height --check-label $extra_cmd $dir $dir/$subset.txt $data_root_dir/$db/$dataset_name"_"$subset"_"$db $dir/lmdb
done

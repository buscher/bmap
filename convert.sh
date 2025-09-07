#/bin/bash

set -e

source config/env.sh

OUTDIR=$(pwd)/out
mkdir -p ${OUTDIR}
OUTNAME=$OUTDIR/map.html

${GPX2JS_RS} -i gpx_all -o $OUTDIR/ -s config/ignorelist.txt -c config/custom_group.txt

cat template/header.tmp > $OUTNAME

coords_array=("coords_walking" "coords_running" "coords_cycling" "coords_hwn1")

pushd $OUTDIR

for str in ${coords_array[@]}; do
    for f in $str/*.js;
    do
        echo "Adding script $f file..";
        echo "<script src=\"${f}\"></script>" >> $OUTNAME
    done
done

popd

cat template/mid.tmp >> $OUTNAME

myArray=("red" "green" "blue" "magenta" "darkorange")
i=0
SIZE=${#myArray[@]}
echo $SIZE

pushd $OUTDIR


arr_array=("walk" "run" "cycle" "hwn1")
coords_i=0
for str in ${arr_array[@]}; do
    i=0
    echo "${str}Arr = []" >> $OUTNAME
    for f in ${coords_array[$coords_i]}/*.js;
    do
        echo "polyline script $f file..";
        BASENAME=$(basename $f .js)
        echo "${str}Arr[${i}] = L.polyline(${BASENAME}, {color: \""${myArray[$((i % SIZE))]}"\"})" >> $OUTNAME
        i=$((i+1))
    done
    echo "var ${str}Group = L.layerGroup(${str}Arr);" >> $OUTNAME
    coords_i=$((coords_i+1))
done

popd

cat template/end.tmp >> $OUTNAME

uglifyjs points/*.js --output $OUTDIR/points.js

cp -R images $OUTDIR

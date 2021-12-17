#!/bin/bash

for i in /datasets/ShapeNetCore.v2/*/;
do
    x=`basename $i`;
    find $i -name *.obj -print0 | xargs -0 -n1 -P12 -I {} blender --background --python render_blender.py -- --output_folder /datasets/tmp/$x/ --views 12 --device=cuda --resolution 256 --engine CYCLES {};
done
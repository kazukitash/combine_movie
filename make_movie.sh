#! /bin/sh

echo 'claen up.'
rm -f combine_movie.avi
rm -rf left_images
rm -rf images
mkdir left_images
mkdir images

echo 'output graph images for each frame.'
for i in `seq 0 23`
do
  gnuplot -e "data='left_graph'; frame='`printf "%04d" $i`'" left_images.plt
done

echo 'convert and resize graph images.'
for file in `ls left_images | sed -e 's/\.eps$//'`
do
  convert -density 144 left_images/${file}.eps left_images/${file}.jpg
  mogrify -resize x1000 left_images/${file}.jpg
done

echo 'append images.'
for file in `ls right_images`
do
  convert +append left_images/${file} right_images/${file} images/${file}
done

echo 'make movie.'
ffmpeg -r 2 -i images/frame_%04d.jpg -r 2 -an -vcodec mjpeg -q:v 0 combine_movie.avi

#! /usr/bin/gnuplot -persist
# gnuplot -e "data='example'; frame='0'" left_images.plt

set format y '%1.1f'
set format x '%2.0f'
set ylabel 'hip position [cm]'
set xlabel 'step [-]'
set xrange [0:23]
set yrange [-40:40]

set style line 1

plot data.".dat" u 1:2 w l t '' linestyle 1
replot data.".dat" every ::frame::frame u 1:2 w p t '' linestyle 2

set terminal postscript color eps enhanced font "Helvetica,36" size 20cm,15cm
set output "left_images/frame_".frame.".eps"

set style line 1 linecolor rgbcolor 'red' linetype 1 linewidth 2 pointtype 6 pointsize 1
set style line 2 linecolor rgbcolor 'blue' linetype 1 linewidth 2 pointtype 7 pointsize 3

replot
q
#EOF

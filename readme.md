# 同じフレーム数の画像を結合して一つの動画を作る

right\_images の画像（計算結果の可視化を想定）と left\_images の画像（計算結果のグラフを想定）を結合する。グラフのその時点での値にポイントを表示することで現在の可視化状態が計算のどの位置なのかわかる。

## 依存関係

`gnuplot` と `convert` 、 `ffmpeg` コマンドを使うので `gnuplot` と `imagemagick` 、 `ffmpeg` が必要。 homebrew で入れておこう。

## 実行方法

```
sh make_movie.sh
open combine_movie.avi
```

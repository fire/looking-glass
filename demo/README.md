# Demo Instructions

Standard Quilt to Native.

```
python ../make_quilt.py ./three_vrm_girl_quilt.png 5 9 raw/three_vrm_girl.%02d.png 00 44
python ../quilt2native.py ../visual.default.json  ./three_vrm_girl_quilt.png 5 9 three_vrm_girl_native.png
```

Linear quilt to Native.

```
python ../frames2native.py ../visual.default.json raw/three_vrm_girl.%02d.png 00 44 three_vrm_girl_frames_to_native.png
```
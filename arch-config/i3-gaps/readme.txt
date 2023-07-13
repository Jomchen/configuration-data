


Place the file into ~/.config/i3

# switch wall paper for feh
```
   #!/bin/sh
   while true; do
   	find ~/图片 -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
   		shuf -n1 -z | xargs -0 feh --bg-scale
   	sleep 15m
   done
```


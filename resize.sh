# remove previous resizes
find . -name "*.resized.jpg" | xargs rm
find . -name "*.resized.png" | xargs rm

# resize
for f in `find ./images/posts/ -name "*.jpg"`
do
    convert $f -quality 90% -geometry 630x $f
done

for f in `find ./images/posts/ -name "*.png"`
do
    convert $f -quality 90% -geometry 630x $f
done

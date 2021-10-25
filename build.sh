#!/bin/sh
npm install
rm -rf ./assets/fonts/font-awesome/
mkdir -p ./assets/fonts/font-awesome/
cp ./node_modules/jquery/dist/jquery.min.js ./node_modules/slick-carousel/slick/slick.min.js ./node_modules/sticky-sidebar/dist/jquery.sticky-sidebar.min.js ./assets/js/
cp -a ./node_modules/@fortawesome/fontawesome-free/webfonts/* "./assets/fonts/font-awesome/"
rm -rf ./assets/css/main.css
rm -rf ./assets/css/persian.css
./node_modules/.bin/node-sass ./_sass/main.scss -o ./assets/css/
./node_modules/.bin/node-sass ./_sass/persian.scss -o ./assets/css/
docker run --rm -v "$PWD:/srv/jekyll" --net "host" --volume="$HOME/jekyll-gems:/usr/gem" -it jekyll/builder:4.0 jekyll build
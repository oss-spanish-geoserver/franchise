#! /bin/sh

# More info -> https://github.com/CartoDB/solutions/blob/master/doc/source/technical/deploying-to-cartoio.rst

APP_NAME="franchise"
BRANCH_NAME="add_cartodbjs_support"

git remote remove dokku
git remote add dokku dokku@carto.io:$APP_NAME
ssh dokku@carto.io app:destroy $APP_NAME https:443:5000
git push dokku $BRANCH_NAME:master
ssh dokku@carto.io certs:add $APP_NAME /home/dokku/tls/server.crt /home/dokku/tls/server.key
ssh dokku@carto.io proxy:ports-add $APP_NAME https:443:5000

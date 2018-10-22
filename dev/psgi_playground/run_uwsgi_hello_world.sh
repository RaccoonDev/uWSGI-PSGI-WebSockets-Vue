#!/bin/bash

#~/bin/uwsgi --http :8080 --http-modifier1 5 --psgi MyWeb-App/bin/app.psgi --master

#~/bin/uwsgi --http :8080 --http-websockets --psgi-enable-psgix-io --http-modifier1 5 --psgi MyWeb-App/bin/app.psgi --master --coroae 1000
~/bin/uwsgi --http :8080 --http-websockets --psgi-enable-psgix-io --http-modifier1 5 --psgi hello-world.psgi --coroae 1000 --master --thunder-lock

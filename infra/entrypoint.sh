#!/bin/sh

if [ -d "var" ]; then
    chmod -R 777 var
else 
    mkdir var && chmod -R 777 var
fi;

composer update

apachectl -D FOREGROUND
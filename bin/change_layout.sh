#!/bin/bash

# this script is meant to refactor the layout of
# the repository from a flask-based layout to a
# github-pages layout


# turn into a github pages layout
to_github () {

    # move `app` to `tmp`
    mv app.py tmp

    # bring the .html files out of the templates
    mv templates/* .

    echo "[github-pages layout]"
}


# turn into a flask layout
to_flask () {

    # move the .html files into the templates
    mv *.html templates

    # bring `app` back
    mv tmp/app.py .

    echo "[flask layout]"
}


# user
use_selection () {
    echo "Select the layout you want to use:"
    echo "1. github-pages"
    echo "2. flask"
    echo " "
    echo "Enter the number:"

    read -p "> " selection

    if [ $selection -eq 1 ]; then
        to_github
    elif [ $selection -eq 2 ]; then
        to_flask
    else
        echo "!ERROR: invalid selection"
    fi
}

use_selection




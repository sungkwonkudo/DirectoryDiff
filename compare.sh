#!/bin/bash -xv

function add_commit(){
    git add *
    git commit -m "comparison commit $1"
}

if [[ -z "/compare" ]] rm -rf compare
mkdir -p compare

cp $1 compare

cd compare

git checkout -b $1
git init 
add_commit $1
git checkout -b $2
rm -rf *

cp ../$2 compare

add_commit $2

git diff


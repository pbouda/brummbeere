#!/bin/bash

../scripts/common/postbuild.sh $1

echo "Install apps..."
install -m 755 ../userland/target/raspi2/brummbeere $1/usr/bin/
install -m 755 ../userland/target/raspi2/fbcp $1/usr/bin/



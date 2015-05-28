#!/bin/bash

../scripts/common/postbuild.sh $1

echo "Install apps..."
install -m 755 ../userland/target/raspi/brummbeere $1/usr/bin/
install -m 755 ../userland/target/raspi/fbcp $1/usr/bin/



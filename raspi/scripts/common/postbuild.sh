#!/bin/bash

echo "Netzwerk starten..."
install -m 755 ../userland/target/S41udhcpc $1/etc/init.d/
install -m 755 ../userland/target/S52ntp $1/etc/init.d/
install -m 755 ../userland/target/S90fbcp $1/etc/init.d/
install -m 755 ../userland/target/S99brummbeere $1/etc/init.d/

echo "Apps kopieren..."
mkdir -p $1/root/.config/Brummbeere/
install ../userland/target/Brummbeere.conf $1/root/.config/Brummbeere/


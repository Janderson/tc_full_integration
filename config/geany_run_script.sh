#!/bin/sh

rm $0

ruby "routes.rb"

echo "

------------------
(program exited with code: $?)" 		



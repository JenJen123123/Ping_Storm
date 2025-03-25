#!/bin/bash

echo 'Web Site -- Avg speed'
echo '---------------------------'
awk 'NR>1{print $1, $3}' data.txt | sort -k2 -n 


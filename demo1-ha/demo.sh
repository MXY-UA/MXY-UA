#!/bin/bash
# just curl in cycle to see HTTP response
for i in {1..20}
do
echo -n "Try number $i: "
curl -s 192.168.1.210 | grep -oE ">.+ Web server n.[0-9]"
done

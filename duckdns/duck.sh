#!/bin/bash

echo url="https://www.duckdns.org/update?domains=<YOUR_DOMAIN>&token=<YOUR_DOMAIN_TOKEN>&ip=" | curl -k -o ~/duckdns/duck.log -K -

#!/bin/bash
cd /db/
ulimit -c unlimited
/db/tzgs -c /db/tzgs.ini

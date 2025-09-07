#!/bin/bash

set -e

source config/env.sh

OUTDIR="gpx_all"
mkdir -p ${OUTDIR}

python ${GARMIN_CONNECT_EXPORT} -c 30 -f gpx -d ${OUTDIR} --username ${GARMIN_USER} --password ${GARMIN_PW}

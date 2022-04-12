#!/usr/bin/env bash
set -e

source env.sh

if [ -z "${MG_DIR}" ]; then echo "ERROR: environment variable MG_DIR is not set"; exit 1; fi

pushd ${MG_DIR}/models

MODEL_FILENAME="SMEFTsim_U35_MwScheme_UFO.tar.gz"
wget https://feynrules.irmp.ucl.ac.be/raw-attachment/wiki/SMEFT/${MODEL_FILENAME}
tar -zxf ${MODEL_FILENAME}
rm ${MODEL_FILENAME}
popd

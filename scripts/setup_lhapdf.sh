set -e

IWD=${PWD}
source env.sh

if [ -z "${LHAPDF_CONFIG_PATH}" ]; then echo "ERROR: environment variable LHAPDF_CONFIG_PATH is not set"; exit 1; fi
if [ -z "${MG_DIR}" ]; then echo "ERROR: environment variable MG_DIR is not set"; exit 1; fi
if [ -z "${MG_TARBALL}" ]; then echo "ERROR: environment variable MG_TARBALL is not set"; exit 1; fi

LHAPDF_VERSION="LHAPDF-6.2.1"
wget "https://lhapdf.hepforge.org/downloads/?f=${LHAPDF_VERSION}.tar.gz" -O "${LHAPDF_VERSION}.tar.gz" --no-check-certificate
tar xf "${LHAPDF_VERSION}.tar.gz"
rm "${LHAPDF_VERSION}.tar.gz"
mkdir lhapdf
pushd "${LHAPDF_VERSION}"
        ./configure --prefix="${IWD}/lhapdf/"
        make
        make install
popd
rm -r "${LHAPDF_VERSION}"




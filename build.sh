#!/bin/bash

set -e

NJOBS="$(getconf _NPROCESSORS_ONLN)"
UPLOAD_PACKAGE=0

parse_cmd_line()
{
    for i in "$@"
    do
    case $i in
        -u|--u)
        UPLOAD_PACKAGE=0;;
        *)
        ;;
    esac
    done
}

parse_cmd_line $@

rm -rf build && mkdir build
rm -rf install && mkdir install

cd build

cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=../install/opencv4 -DINSTALL_C_EXAMPLES=OFF \
    -DINSTALL_PYTHON_EXAMPLES=OFF -DBUILD_EXAMPLES=OFF -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ \
    -DBUILD_SHARED_LIBS=OFF -DWITH_TBB=OFF -DWITH_IPP=OFF -DWITH_IPP_A=OFF -DWITH_CUDA=OFF -DWITH_EIGEN=OFF -DWITH_CLP=OFF  \
    -DWITH_CSTRIPES=OFF -DWITH_OPENMP=OFF -DWITH_PTHREADS_PF=OFF -DWITH_OPENCL=OFF \
    -DWITH_GSTREAMER=OFF -DWITH_AVFOUNDATION=OFF -DWITH_FFMPEG=ON -DWITH_WEBP=OFF ..

make -j${NJOBS}
make install

cd ..
cp conanfile.py install/opencv4
cd install/opencv4

CONAN_PRISM_PACKAGE_REFERENCE=opencv/4.2.0@bvnp43/stable

conan export-pkg . ${CONAN_PRISM_PACKAGE_REFERENCE} -f

if (( ${UPLOAD_PACKAGE} != 0 )); then
    conan remote add conan_prism ${CONAN_REMOTE_URL_CONAN_PRISM}
    conan upload ${CONAN_PRISM_PACKAGE_REFERENCE} --all -r=conan_prism
fi

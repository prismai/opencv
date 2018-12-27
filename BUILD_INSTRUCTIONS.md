# OpenCV

## Mac OS Build Instructions

Install ffmpeg, you can do this by running `brew install ffmpeg`. Then run:

```
cd opencv
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=~/Desktop/opencv4 -DINSTALL_C_EXAMPLES=OFF \
    -DINSTALL_PYTHON_EXAMPLES=OFF -DBUILD_EXAMPLES=OFF -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ \
    -DBUILD_SHARED_LIBS=OFF -DWITH_TBB=OFF -DWITH_IPP=OFF -DWITH_IPP_A=OFF -DWITH_CUDA=OFF -DWITH_EIGEN=OFF -DWITH_CLP=OFF  \
    -DWITH_CSTRIPES=OFF -DWITH_OPENMP=OFF -DWITH_PTHREADS_PF=OFF -DWITH_OPENCL=OFF \
    -DWITH_GSTREAMER=OFF -DWITH_AVFOUNDATION=OFF -DWITH_FFMPEG=ON -DWITH_WEBP=OFF ..
make -j8
make install
```

You will get opencv installed in `~/Desktop/opencv4`, navigate to that folder and create artifact by running:

```
tar -czvf opencv_4.0.1_macos.Release.tar.gz include/ lib/ share/
```

## Ubuntu Build Instructions

Install ffmpeg. Then run:

```
cd opencv
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=~/Desktop/opencv4 -D INSTALL_C_EXAMPLES=OFF \
    -DINSTALL_PYTHON_EXAMPLES=OFF -DBUILD_EXAMPLES=OFF -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ -DBUILD_SHARED_LIBS=OFF \
    -DWITH_TBB=OFF -DWITH_IPP=OFF -DWITH_IPP_A=OFF -DWITH_CUDA=OFF -DWITH_EIGEN=OFF -DWITH_CLP=OFF -DWITH_CSTRIPES=OFF -DWITH_OPENMP=OFF \
    -DWITH_PTHREADS_PF=OFF -DWITH_OPENCL=OFF -DWITH_GSTREAMER=OFF -DWITH_FFMPEG=ON -DWITH_WEBP=OFF ..
make -j8
make install
```

## iOS Build Instructions

```
BUILD_PRECOMMIT=1 python opencv/platforms/ios/build_framework.py ios --iphoneos_archs arm64 --contrib opencv_contrib/
```

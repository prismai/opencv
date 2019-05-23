# OpenCV

For successful build you need to define environment variables in your .bash_profile:

```
export CONAN_REMOTE_URL_CONAN_PRISM=http://18.237.155.206:9300
export CONAN_LOGIN_USERNAME_CONAN_PRISM=bvnp43
export CONAN_PASSWORD_CONAN_PRISM=**password**
```

## Build Instructions

Install ffmpeg, pkg-config and conan, you can do this by running - `brew install ffmpeg pkg-config` and `pip3 install conan`. Then run:

```
./build.sh
```

or

```
./build.sh -u
```

if you want to upload created packege to prism conan server.

## iOS Build Instructions (Obsolete, we don't support ios atm)

```
BUILD_PRECOMMIT=1 python opencv/platforms/ios/build_framework.py ios --iphoneos_archs arm64 --contrib opencv_contrib/
```

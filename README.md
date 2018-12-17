# Android Port for Spixel Library

## Original Source
* https://bitbucket.org/mboben/spixel.git

### Requirements
* OpenCV Android SDK (3.4.3): [Download](https://github.com/opencv/opencv/releases/tag/3.4.3)
* Android NDK, Revision 14b: [Download](https://developer.android.com/ndk/downloads/older_releases)

#### Step by Step Build Configurations
* Install Android NDK and add its installed directory to the environment path.
* Extract `opencv-3.4.3-android-sdk.zip` to the `libs/opencv` directory
* Build libpng library. Simply run `libs/libPNG-1.5.27/build-libpng.bat`
* Finally, Run `build-spixel-android.bat` batch file.

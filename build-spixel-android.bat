@ECHO OFF

setlocal

ndk-build NDK_PROJECT_PATH=./

rem create directories for libraries
mkdir dist\ARMv7
mkdir dist\ARM64
mkdir dist\x86
mkdir dist\x64

rem copy .so files to dist
copy obj\local\armeabi-v7a\*.so dist\ARMv7
copy obj\local\arm64-v8a\*.so dist\ARM64
copy obj\local\x86\*.so dist\x86
copy obj\local\x86_64\*.so dist\x64

endlocal

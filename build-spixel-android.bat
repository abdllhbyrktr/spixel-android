@ECHO OFF

setlocal

ndk-build NDK_PROJECT_PATH=./

rem create directories for libraries
mkdir dist\ARMv7
mkdir dist\ARM64
mkdir dist\x86
mkdir dist\x64
mkdir dist\libs\armeabi-v7a
mkdir dist\libs\arm64-v8a
mkdir dist\libs\x86
mkdir dist\libs\x86_64

rem copy library files to dist
copy obj\local\armeabi-v7a\*.so dist\ARMv7
copy obj\local\arm64-v8a\*.so dist\ARM64
copy obj\local\x86\*.so dist\x86
copy obj\local\x86_64\*.so dist\x64
copy libs\armeabi-v7a\*.so dist\libs\armeabi-v7a
copy libs\arm64-v8a\*.so dist\libs\arm64-v8a
copy libs\x86\*.so dist\libs\x86
copy libs\x86_64\*.so dist\libs\x86_64

rmdir obj /s/q
rmdir libs\armeabi-v7a /s/q
rmdir libs\arm64-v8a /s/q
rmdir libs\x86 /s/q
rmdir libs\x86_64 /s/q

endlocal

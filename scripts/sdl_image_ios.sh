#!/bin/bash

LIBS=../../libs
TEMPLIBS=../../templibs

#rm -rf templibs
mkdir -p $LIBS
mkdir -p $TEMPLIBS

#rm -rf build

xcodebuild -configuration Release -target libSDL_image -arch i386 -sdk iphonesimulator clean build 
cp build/Release-iphonesimulator/libSDL2_image.a $TEMPLIBS/libSDL2_image_i386.a
xcodebuild -configuration Release -target libSDL_image -arch x86_64 -sdk iphonesimulator clean build 
cp build/Release-iphonesimulator/libSDL2_image.a $TEMPLIBS/libSDL2_image_x86_64.a
xcodebuild -configuration Release -target libSDL_image -arch armv7 -sdk iphoneos clean build 
cp build/Release-iphoneos/libSDL2_image.a $TEMPLIBS/libSDL2_image_armv7.a
xcodebuild -configuration Release -target libSDL_image -arch armv7s -sdk iphoneos clean build 
cp build/Release-iphoneos/libSDL2_image.a $TEMPLIBS/libSDL2_image_armv7s.a
xcodebuild -configuration Release -target libSDL_image -arch arm64 -sdk iphoneos clean build 
cp build/Release-iphoneos/libSDL2_image.a $TEMPLIBS/libSDL2_image_arm64.a


lipo $TEMPLIBS/libSDL2_image*.a -create -output $LIBS/libSDL2_image.a

#rm -rf templibs
#rm -rf build

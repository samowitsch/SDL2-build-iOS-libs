#!/bin/bash

LIBS=../../../libs
TEMPLIBS=../../../templibs

#rm -rf templibs
mkdir -p $LIBS
mkdir -p $TEMPLIBS

#rm -rf build

xcodebuild -configuration Release -target libSDL -arch i386 -sdk iphonesimulator clean build 
cp build/Release-iphonesimulator/libSDL2.a $TEMPLIBS/libSDL2_i386.a
xcodebuild -configuration Release -target libSDL -arch x86_64 -sdk iphonesimulator clean build 
cp build/Release-iphonesimulator/libSDL2.a $TEMPLIBS/libSDL2_x86_64.a
xcodebuild -configuration Release -target libSDL -arch armv7 -sdk iphoneos clean build 
cp build/Release-iphoneos/libSDL2.a $TEMPLIBS/libSDL2_armv7.a
xcodebuild -configuration Release -target libSDL -arch armv7s -sdk iphoneos clean build 
cp build/Release-iphoneos/libSDL2.a $TEMPLIBS/libSDL2_armv7s.a
xcodebuild -configuration Release -target libSDL -arch arm64 -sdk iphoneos clean build 
cp build/Release-iphoneos/libSDL2.a $TEMPLIBS/libSDL2_arm64.a


lipo $TEMPLIBS/libSDL2*.a -create -output $LIBS/libSDL2.a

#rm -rf templibs
#rm -rf build

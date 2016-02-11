#!/bin/bash

LIBS=../../libs
TEMPLIBS=../../templibs

#rm -rf templibs
mkdir -p $LIBS
mkdir -p $TEMPLIBS

#rm -rf build

xcodebuild -configuration Release -target "Static Library" -arch i386 -sdk iphonesimulator clean build 
cp build/Release-iphonesimulator/libSDL2_net.a $TEMPLIBS/libSDL2_net_i386.a
xcodebuild -configuration Release -target "Static Library" -arch x86_64 -sdk iphonesimulator clean build 
cp build/Release-iphonesimulator/libSDL2_net.a $TEMPLIBS/libSDL2_net_x86_64.a
xcodebuild -configuration Release -target "Static Library" -arch armv7 -sdk iphoneos clean build 
cp build/Release-iphoneos/libSDL2_net.a $TEMPLIBS/libSDL2_net_armv7.a
xcodebuild -configuration Release -target "Static Library" -arch armv7s -sdk iphoneos clean build 
cp build/Release-iphoneos/libSDL2_net.a $TEMPLIBS/libSDL2_net_armv7s.a
xcodebuild -configuration Release -target "Static Library" -arch arm64 -sdk iphoneos clean build 
cp build/Release-iphoneos/libSDL2_net.a $TEMPLIBS/libSDL2_net_arm64.a


lipo $TEMPLIBS/libSDL2_net*.a -create -output $LIBS/libSDL2_net.a

#rm -rf templibs
#rm -rf build

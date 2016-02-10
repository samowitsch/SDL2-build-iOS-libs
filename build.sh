#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function mkdirs {
	if [ ! -d "libs" ]; then
		echo "*** mkdir libs"
		mkdir libs
	fi
	if [ ! -d "templibs" ]; then
		echo "*** mkdir templibs"
		mkdir templibs
	fi
}


function get_source {
	if [ ! -d "SDL" ]; then
		echo "*** clone SDL2 source"
		hg clone https://hg.libsdl.org/SDL SDL
	else 
		echo "*** SDL2 sources exists ***"
	fi

	if [ ! -d "SDL_image" ]; then
		echo "*** clone SDL2_image source"
		hg clone https://hg.libsdl.org/SDL_image SDL_image
	else 
		echo "*** SDL2_image sources exists ***"
	fi

	if [ ! -d "SDL_mixer" ]; then
		echo "*** clone SDL2_mixer source"
		hg clone https://hg.libsdl.org/SDL_mixer SDL_mixer
	else 
		echo "*** SDL2_mixer sources exists ***"
	fi

	if [ ! -d "SDL_net" ]; then
		echo "*** clone SDL2_net source"
		hg clone https://hg.libsdl.org/SDL_net SDL_net
	else 
		echo "*** SDL2_net sources exists ***"
	fi

	if [ ! -d "SDL_ttf" ]; then
		echo "*** clone SDL2_ttf source"
		hg clone https://hg.libsdl.org/SDL_ttf SDL_ttf
	else 
		echo "*** SDL2_ttf sources exists ***"
	fi
}

function clear_libs {
	echo "*** empty libs/templibs folders ***"
	rm $DIR/libs/*
	rm $DIR/templibs/*
}

function build_libs {
echo "*** Build SDL2 libs"
if [ ! -f $DIR/SDL/Xcode-iOS/SDL/sdl_ios.sh ]; then
	cp $DIR/scripts/sdl_ios.sh $DIR/SDL/Xcode-iOS/SDL/
fi
cd $DIR/SDL/Xcode-iOS/SDL
./sdl_ios.sh


echo "*** Build SDL2_image libs ***"
if [ ! -f $DIR/SDL_image/Xcode-iOS/sdl_image_ios.sh ]; then
	cp $DIR/scripts/sdl_image_ios.sh $DIR/SDL_image/Xcode-iOS/
fi
cd $DIR/SDL_image/Xcode-iOS
./sdl_image_ios.sh


echo "*** Build SDL2_mixer libs ***"
if [ ! -f $DIR/SDL_mixer/Xcode-iOS/sdl_mixer_ios.sh ]; then
	cp $DIR/scripts/sdl_mixer_ios.sh $DIR/SDL_mixer/Xcode-iOS/
fi
cd $DIR/SDL_mixer/Xcode-iOS
./sdl_mixer_ios.sh


echo "*** Build SDL2_ttf libs ***"
if [ ! -f $DIR/SDL_ttf/Xcode-iOS/sdl_ttf_ios.sh ]; then
	cp $DIR/scripts/sdl_ttf_ios.sh $DIR/SDL_ttf/Xcode-iOS/
fi
cd $DIR/SDL_ttf/Xcode-iOS
./sdl_ttf_ios.sh


echo "*** Build SDL2_net libs ***"
if [ ! -f $DIR/SDL_net/Xcode-iOS/sdl_net_ios.sh ]; then
	cp $DIR/scripts/sdl_net_ios.sh $DIR/SDL_net/Xcode-iOS/
fi
cd $DIR/SDL_net/Xcode-iOS
./sdl_net_ios.sh

}

function check_archs {
	echo "*** Check libs (fat) ***"
	find $DIR/libs -name "*.a" -print0 | xargs -0 lipo -info

	echo "*** Check templibs ***"
	find $DIR/templibs -name "*.a" -print0 | xargs -0 lipo -info
}

mkdirs
get_source
clear_libs
build_libs
check_archs

echo "*** Finished! ***"
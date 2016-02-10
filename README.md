# Build iOS SDL2 libs on OS X with Xcode

Compiling the source of SDL2, SDL2_image, SDL2_mixer, SDL2_net and SDL2_ttf to libSDL2*.a files.
In the libs folder will be build fat binaries (with arches armv7 armv7s i386 x86_64 arm64). In the templibs folder are the separate libs for each arch.

### requirements

* installed Xcode
* installed Xcode commandline tools
* installed mercurial (to clone the sources of SDL2)
* other stuff i forgott ;o)

### compiling the libs

Open a terminal. Change into the directory of this repository and start the build script.

```bash
./build.sh
```

### files after compilation

* libs folder (fat multi arch libs)
 * libSDL2_image.a
 * libSDL2_mixer.a
 * libSDL2_net.a
 * libSDL2_ttf.a
 * libSDL2.a
* templibs folder
 * libSDL2_arm64.a
 * libSDL2_armv7.a
 * libSDL2_armv7s.a
 * libSDL2_i386.a
 * libSDL2_image_arm64.a
 * libSDL2_image_armv7.a
 * libSDL2_image_armv7s.a
 * libSDL2_image_i386.a
 * libSDL2_image_x86_64.a
 * libSDL2_mixer_arm64.a
 * libSDL2_mixer_armv7.a
 * libSDL2_mixer_armv7s.a
 * libSDL2_mixer_i386.a
 * libSDL2_mixer_x86_64.a
 * libSDL2_net_arm64.a
 * libSDL2_net_armv7.a
 * libSDL2_net_armv7s.a
 * libSDL2_net_i386.a
 * libSDL2_net_x86_64.a
 * libSDL2_ttf_arm64.a
 * libSDL2_ttf_armv7.a
 * libSDL2_ttf_armv7s.a
 * libSDL2_ttf_i386.a
 * libSDL2_ttf_x86_64.a
 * libSDL2_x86_64.a
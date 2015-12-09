#!/bin/bash
NAME=$1
APKNAME=$PWD/releases/$2
APKPATH=$PWD/platforms/android/build/outputs/apk/android-armv7-release-unsigned.apk
PASS="" # Optionally hard-code your .keystore password here, else it'll propmt every run

# Building APK
echo "Building APK..."
/usr/local/bin/cordova build android --release
echo "DONE."

# ZIP align
echo "ZIP-aligning..."
$ANDROID_HOME/build-tools/23.0.1/zipalign -v 4 $APKPATH $APKNAME
echo "DONE."

# Jar sign
echo "Jar-signing..."
# If password was hard-coded
if [ $PASS ]
then
	echo $PASS | /usr/bin/jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $NAME-key.keystore $APKNAME $NAME
else
	/usr/bin/jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $NAME-key.keystore $APKNAME $NAME	
fi
echo "DONE."

echo "\n\n\nRelease APK is now at: $PWD/$APKNAME"
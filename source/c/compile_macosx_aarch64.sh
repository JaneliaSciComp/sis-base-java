#! /bin/bash

if [ -z "$JAVA_HOME" ]; then
  #JAVA_HOME=`java -XshowSettings:properties -version 2>&1 | grep "java.home" | cut -d"=" -f2`
  JAVA_HOME=`/usr/libexec/java_home`
fi
echo $JAVA_HOME

gcc -m64 -mmacosx-version-min=10.11 -dynamiclib -D_DARWIN_USE_64_BIT_INODE -O3 unix.c -I${JAVA_HOME}/include -I${JAVA_HOME}/include/darwin -o libunix.jnilib

# MACHINE_BYTE_ORDER=1 corresponds to 'little endian'
gcc -m64 -mmacosx-version-min=10.11 -dynamiclib -O3 -DMACHINE_BYTE_ORDER=1 copy*.c -I${JAVA_HOME}/include -I${JAVA_HOME}/include/darwin -o libnativedata.jnilib

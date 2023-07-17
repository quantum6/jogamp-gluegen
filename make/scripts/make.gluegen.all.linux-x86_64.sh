#! /bin/sh

SDIR=`dirname $0` 

# export J2RE_HOME=/usr/lib/jvm/java-11-openjdk-amd64
# export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

if [ -e $SDIR/setenv-build-jogamp-x86_64.sh ] ; then
    . $SDIR/setenv-build-jogamp-x86_64.sh
fi

#    -Dc.compiler.debug=true 
#    -Dgluegen.cpptasks.detected.os=true \
#    -DisUnix=true \
#    -DisLinux=true \
#    -DisLinuxAMD64=true \
#    -DisX11=true \
#
#    -Dc.compiler.debug=true  \
#    -Djavacdebuglevel="source,lines,vars" \

export SOURCE_LEVEL=1.8
export TARGET_LEVEL=1.8
export TARGET_RT_JAR=/opt-share/jre1.8.0_212/lib/rt.jar

#export JOGAMP_JAR_CODEBASE="Codebase: *.jogamp.org"
export JOGAMP_JAR_CODEBASE="Codebase: *.goethel.localnet"

BUILD_ARCHIVE=true \
ant \
    -Drootrel.build=build-x86_64 \
    $* 2>&1 | tee make.gluegen.all.linux-x86_64.log

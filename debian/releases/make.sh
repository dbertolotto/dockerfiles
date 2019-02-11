#!/bin/bash

# user variables
#VERSION=""
#ARCHITECTURE=""
#VARIANT=""
#DOCKREPO=""
#EXCLUDE=""

# handling input
if [ -z $VARIANT ]
then
	VARFLAG=""
	IMGSUFFIX=""
else
	VARFLAG="--variant=$VARIANT"
	IMGSUFFIX="-$VARIANT"
fi

if [ -z $EXCLUDE ]
then
	EXCLFLAG=""
else
        EXCLFLAG="--exclude=$EXCLUDE"
fi

TEMPCHROOT="$VERSION-chroot"

# prepare image
sudo rm -rf $TEMPCHROOT
sudo apt-get -y install debootstrap
sudo mkdir $TEMPCHROOT
sudo debootstrap --arch=$ARCHITECTURE $EXCLFLAG $VARFLAG $VERSION $TEMPCHROOT http://deb.debian.org/debian/
# clean up space
sudo chroot $TEMPCHROOT apt-get clean
sudo chroot $TEMPCHROOT rm -rf /var/lib/apt/lists
# create image
sudo tar -C $TEMPCHROOT -c . | docker import - debian-$VERSION$IMGSUFFIX
docker tag debian-$VERSION$IMGSUFFIX ${DOCKREPO}:$VERSION$IMGSUFFIX
#docker push ${DOCKREPO}:$VERSION$IMGSUFFIX

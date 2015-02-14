#!/bin/bash
FOLDER="Sensors"

echo "Packaging $FOLDER"

VERSIONTAG=`git describe --abbrev=0 --tags`
SVERSIONTAG=${VERSIONTAG//./_}
SVERSIONTAG=${VERSIONTAG//v/_}
RVERSIONTAG=`echo $VERSIONTAG | sed -e "s/v//"`

echo "Updating version number"
sed -e "s/\(\"version\": \"\).*\(\",\)/\1$RVERSIONTAG\2/" $FOLDER/info.json > $FOLDER/info.json_temp
mv $FOLDER/info.json_temp $FOLDER/info.json

echo "Creating zip file"
cp -rf $FOLDER $FOLDER$SVERSIONTAG
zip -rq $FOLDER$SVERSIONTAG.zip $FOLDER$SVERSIONTAG -x "*/\.*"
rm -rf $FOLDER$SVERSIONTAG
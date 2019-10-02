#!/usr/bin/env bash

VERSION=$1
ZIPFILE="${VERSION}.zip"
RELEASE_DIR="Device-Detection-${VERSION#?}" # the directory with "v" removed from the tag
DEVICE_DETECTION_ZIP_URL="https://github.com/51Degrees/Device-Detection/archive/${ZIPFILE}"

echo "Removing existing files"
rm -r 51Degrees
rm composer.json LICENSE

echo "Version: ${VERSION}";
echo "ZIP File: ${ZIPFILE}"

echo "Downloading release"
curl -L --output $ZIPFILE $DEVICE_DETECTION_ZIP_URL

echo "Unzipping release"
unzip $ZIPFILE

echo "Gathering php/common-api from release (${RELEASE_DIR})"
mv "${RELEASE_DIR}/LICENSE" .
mv "${RELEASE_DIR}/php/common-api/51Degrees" .
mv "${RELEASE_DIR}/php/common-api/composer.json" .

echo "Removing examples"
rm -r ./51Degrees/examples

echo "Removing zip and release"
rm -r ${RELEASE_DIR} $ZIPFILE

# cat the current composer
# remove the extra `,` on line 14
# add an autoload property
# write to a temporary file
cat composer.json | sed '14 s/,//' | jq '. + {autoload: {files : ["51Degrees/51degrees.php"]}}' > composer-tmp.json

# override with temp file
mv composer-tmp.json composer.json

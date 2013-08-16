#!/bin/sh

SDK="iphoneos"

CONFIGURATION="Release"

PRODUCT_NAME="CITest"

PROJ_FILE_PATH="CITest.xcodeproj"

TARGET="CITest"

OUTPUT_DIR="${PWD}/build"

PROVISIONING_PATH="All_Devices.mobileprovision"

if [ -d ${OUTPUT_DIR} ]; then
  rm -rf "${OUTPUT_DIR}"
  mkdir "${OUTPUT_DIR}"
fi

xcodebuild clean -project "${PROJ_FILE_PATH}"

xcodebuild -project "${PROJ_FILE_PATH}" -configuration "${CONFIGURATION}" -sdk "${SDK}" -target "${TARGET}"

xcrun -sdk "${SDK}" PackageApplication -v "${OUTPUT_DIR}/${CONFIGURATION}-iphoneos/${PRODUCT_NAME}.app" -o "${OUTPUT_DIR}/${CONFIGURATION}-iphoneos/${PRODUCT_NAME}.ipa" -embed "${PROVISIONING_PATH}"

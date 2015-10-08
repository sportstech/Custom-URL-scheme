#!/bin/sh
if [ -f platforms/android/AndroidManifest.xml ]; then
    echo "platforms/android/AndroidManifest.xml exists."
    found_text=`grep -i "android:alwaysRetainTaskState" platforms/android/AndroidManifest.xml`
    echo "search: $found_text"
    if [[ -z "$found_text" ]]; then
      echo "NOT part of file: $found_text"
      sed -i .bak 's/android:name="MainActivity" /android:name="MainActivity" android:alwaysRetainTaskState="true" /g' platforms/android/AndroidManifest.xml && rm platforms/android/AndroidManifest.xml.bak
    else
      echo "PART of file: $found_text"
    fi
    
    echo "platforms/android/AndroidManifest.xml exists."
    found_text=`grep -i "android:launchMode" platforms/android/AndroidManifest.xml`
    echo "search: $found_text"
    if [[ -z "$found_text" ]]; then
      echo "NOT part of file: $found_text"
      sed -i .bak 's/android:name="MainActivity" /android:name="MainActivity" android:launchMode="singleTask" /g' platforms/android/AndroidManifest.xml && rm platforms/android/AndroidManifest.xml.bak
    else
      echo "PART of file: $found_text"
    fi
    
else
  echo "platforms/android/AndroidManifest.xml missing"
fi

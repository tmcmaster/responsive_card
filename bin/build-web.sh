#!/bin/bash

flutter clean
flutter pub get
flutter packages pub get;
flutter build web
sed -i 's/base href="\/"/base href="\/responsive_card\/"/g' build/web/index.html || exit 1
echo "Web build completed successfully"
exit 0
#!/bin/bash

flutter clean
flutter pub get
flutter build web -t app/main.dart
sed -i 's/base href="\/"/base href="\/responsive_card\/"/g' build/web/index.html
echo "Web build completed successfully"
exit 0
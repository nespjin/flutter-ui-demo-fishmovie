// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:fish_movie/pages/android/main_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  switch (defaultTargetPlatform) {
    case TargetPlatform.iOS:
      runApp(AndroidApp());
      break;
    case TargetPlatform.fuchsia:
    case TargetPlatform.android:
      runApp(AndroidApp());
      break;
  }
}

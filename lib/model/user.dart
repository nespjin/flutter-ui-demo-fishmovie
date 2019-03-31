import 'package:flutter/widgets.dart';

class User {
  const User({
    this.name,
    this.email,
    this.drawerBackgroundImage,
    this.avatarImage,
  });

  final String name;
  final String email;
  final ImageProvider drawerBackgroundImage;
  final ImageProvider avatarImage;
}

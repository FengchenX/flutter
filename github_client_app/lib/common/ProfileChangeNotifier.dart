import 'package:flutter/material.dart';
import 'package:github_client_app/models/profile.dart';

import 'Global.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get profile => Global.profile;

  String get asd => "222";
  num get count =>10;

  @override
  void notifyListeners() {
    Global.saveProfile();
    super.notifyListeners();
  }
}

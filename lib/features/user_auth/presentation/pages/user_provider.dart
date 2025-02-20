import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String _name = "Your Name";
  String _avatar = "";
  String _title = "Select a title";

  String get name => _name;
  String get avatar => _avatar;
  String get title => _title;

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void updateAvatar(String newAvatar) {
    _avatar = newAvatar;
    notifyListeners();
  }

  void updateTitle(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }
}

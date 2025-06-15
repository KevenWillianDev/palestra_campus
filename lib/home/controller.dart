import 'package:flutter/material.dart';
import 'package:palestra_campus/models/user.model.dart';

class HomeController extends ChangeNotifier {
  final List<UserModel> _users = [];

  int get userCount => _users.length;
  List<UserModel> get users => _users;

  bool adicionarUsuario(UserModel newUser) {
    if (_users.any((user) => user.id == newUser.id)) return false;

    _users.add(newUser);
    notifyListeners();
    return true;
  }

  void removerUsuario(UserModel newUser) {
    _users.remove(newUser);
    notifyListeners();
  }
}

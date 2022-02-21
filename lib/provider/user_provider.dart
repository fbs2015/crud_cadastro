import 'package:crud_cadastro/data/dummy_users.dart';
import 'package:crud_cadastro/models/user.dart';
import 'package:flutter/material.dart';

class UsersProvider with ChangeNotifier{
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all{
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }

  
}
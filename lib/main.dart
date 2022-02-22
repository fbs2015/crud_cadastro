import 'package:crud_cadastro/models/user.dart';
import 'package:crud_cadastro/provider/user_provider.dart';
import 'package:crud_cadastro/routes/app_routes.dart';
import 'package:crud_cadastro/views/user_form.dart';
import 'package:crud_cadastro/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(        
          primarySwatch: Colors.blue,
        ),        
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM:(_) => UserForm() ,
        },
      ),
    );
  }
}


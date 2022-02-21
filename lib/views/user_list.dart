import 'package:crud_cadastro/components/user_tile.dart';
import 'package:crud_cadastro/data/dummy_users.dart';
import 'package:crud_cadastro/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UsersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (context, i) => UserTile(users.all.elementAt(i))),
    );
  }
}
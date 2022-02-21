import 'package:crud_cadastro/models/user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {  
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty 
    ? CircleAvatar(child: Icon(Icons.person)) 
    : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: (){}, 
              color: Colors.orange,
              icon: Icon(Icons.edit)
            ),
            IconButton(
              onPressed: (){}, 
              color: Colors.red,
              icon: Icon(Icons.delete)
            ),
          ],
        ),
      ),
    );
  }
}
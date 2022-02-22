import 'package:crud_cadastro/models/user.dart';
import 'package:crud_cadastro/provider/user_provider.dart';
import 'package:crud_cadastro/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              onPressed: (){
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user
                );
              }, 
              color: Colors.orange,
              icon: Icon(Icons.edit)
            ),
            IconButton(
              onPressed: (){
                showDialog(
                  context: context, 
                  builder: (context) => AlertDialog(
                    title: Text('Excluir usuário'),
                    content: Text('Tem certeza?'),
                    actions: [
                      FlatButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        }, 
                        child: Text('Não'),
                      ),
                       FlatButton(
                        onPressed: (){
                          Provider.of<UsersProvider>(context, listen: false).remove(user.id);
                          Navigator.of(context).pop();
                        }, 
                        child: Text('Sim'),
                       ),
                    ],
                  )
                );                          
              }, 
              color: Colors.red,
              icon: Icon(Icons.delete)
            ),
          ],
        ),
      ),
    );
  }
}